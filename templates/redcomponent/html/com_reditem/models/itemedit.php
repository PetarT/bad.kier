<?php
/**
 * @package     RedITEM.Front
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/helper.php';
require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/fileupload.php';
JLoader::import('watch', JPATH_ROOT . '/components/com_reditem/helpers');
jimport('joomla.filesystem.folder');

/**
 * RedITEM ItemEdit Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Item
 * @since       2.0.19
 *
 */
class ReditemModelItemEdit extends RModelAdmin
{
	public $item = null;
	/**
	 * Method to get the row form.
	 *
	 * @param   int  $pk  Primary key
	 *
	 * @return	mixed	A JForm object on success, false on failure
	 *
	 * @since	1.6
	 */
	public function getItem($pk = null)
	{
		$db = JFactory::getDBO();
		$app = JFactory::getApplication();
		$input = $app->input;
		$item = parent::getItem($pk);
		$published = $this->getState('filter.published');

		if (isset($item->id))
		{
			if ($item->blocked || $item->published != 1)
			{
				$app->enqueueMessage(JText::_('COM_REDITEM_ERROR_NO_ITEM_FOUND'), 'error');
				$app->redirect(JRoute::_('index.php?option=com_reditem&view=items'));
			}

			// Get categories of item
			$query = $db->getQuery(true);
			$query->select($db->qn('category_id'));
			$query->from($db->qn('#__reditem_item_category_xref'));
			$query->where($db->qn('item_id') . ' = ' . $db->quote($item->id));

			if ($published)
			{
				$query->where($db->qn('published') . ' = ' . (int) $published);
			}
			elseif ($published === '')
			{
				$query->where($db->qn('published') . ' IN (0, 1)');
			}

			$db->setQuery($query);
			$result = $db->loadObjectList();

			if ($result)
			{
				$item->categories = array();

				foreach ($result as $category)
				{
					$item->categories[] = $category->category_id;
				}
			}

			// Get custom field values
			$query = $db->getQuery(true);
			$query->select($db->qn('table_name'))
				->from('#__reditem_types')
				->where($db->qn('id') . ' = ' . $db->quote($item->type_id));
			$db->setQuery($query);
			$rs = $db->loadObject();
			$tb = '#__reditem_types_' . $rs->table_name;

			$query = $db->getQuery(true);
			$query->select('cf.*');
			$query->from($db->qn($tb, 'cf'));
			$query->where($db->qn('cf.id') . ' = ' . $db->quote($item->id));
			$db->setQuery($query);

			$item->customfield_values = (array) $db->loadObject();

			// Remove the id column of custom fields value
			array_shift($item->customfield_values);
		}

		$this->item = $item;

		return $this->item;
	}

	/**
	 * Method to get template
	 *
	 * @return mixed
	 */
	public function getTemplate()
	{
		$app    = JFactory::getApplication();
		$input  = $app->input;

		$typeModel  = RModel::getAdminInstance('Type', array('ignore_request' => true));
		$typeId     = $input->getInt('typeId', 0);

		$templateModel  = RModel::getAdminInstance('Template', array('ignore_request' => true));
		$templateId     = $input->getInt('templateId', 0);

		if (!$templateId)
		{
			$type = $typeModel->getItem($typeId);
			$templateId = $type->params['default_itemedit_template'];
		}

		return $templateModel->getItem($templateId);
	}

	/**
	 * Method to get custom field.
	 *
	 * @return  array
	 */
	public function getCustomFields()
	{
		$app = RFactory::getApplication();
		$typeId = $app->input->getInt('tid', null);

		if (!$typeId)
		{
			$typeId = JFactory::getApplication()->getUserState('com_reditem.global.tid', '0');
		}

		if (!$typeId)
		{
			return false;
		}

		$customfields = RModel::getAdminInstance('Fields', array('ignore_request' => true));
		$customfields->setState('filter.types', $typeId);
		$customfields->setState('filter.published', 1);
		$rows = $customfields->getItems();

		$fields = array();

		foreach ($rows AS $row)
		{
			if ($row->published == 1)
			{
				$field = ReditemHelperCustomfield::getCustomField($row->type);
				$field->bind($row);

				if ((isset($this->item->customfield_values)) && isset($this->item->customfield_values[$row->fieldcode]))
				{
					$field->value = $this->item->customfield_values[$row->fieldcode];
				}

				$fields[] = $field;
			}
		}

		return $fields;
	}

	/**
	 * Method to set featured of item.
	 *
	 * @param   int  $id     Id of item
	 * @param   int  $state  featured state of item
	 *
	 * @return  boolean
	 */
	public function featured($id = null, $state = 0)
	{
		$db = JFactory::getDbo();

		if ($id)
		{
			$query = $db->getQuery(true);

			$query->update($db->qn('#__reditem_items', 'i'))
				->set($db->qn('i.featured') . ' = ' . (int) $state)
				->where($db->qn('i.id') . ' = ' . (int) $id);

			$db->setQuery($query);

			if (!$db->execute())
			{
				return false;
			}

			return true;
		}

		return false;
	}

	/**
	 * Method for getting the form from the model.
	 *
	 * @param   array    $data      Data for the form.
	 * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
	 *
	 * @return  mixed  A JForm object on success, false on failure
	 */
	public function getForm($data = array(), $loadData = true)
	{
		$form = parent::getForm($data, $loadData);
		$user = ReditemHelperSystem::getUser();

		if (!$user->authorise('core.edit.state', 'com_reditem'))
		{
			// Disable change publish state
			$form->setFieldAttribute('published', 'readonly', true);
			$form->setFieldAttribute('published', 'class', 'btn-group disabled');

			// Disable change feature state
			$form->setFieldAttribute('featured', 'readonly', true);
			$form->setFieldAttribute('featured', 'class', 'btn-group disabled');

			// Disable change access state
			$form->setFieldAttribute('access', 'disabled', true);
		}

		return $form;
	}

	/**
	 * Function serve for upload from dragndrop ajax
	 *
	 * @param   array   $files         array of files posted
	 * @param   string  $uploadType    type of files posted [file/image/gallery]
	 * @param   string  $uploadTarget  fieldcode
	 *
	 * @return  string  path of uploaded files, '' if not in types [file/image/gallery]
	 */
	public function dragndropUpload($files, $uploadType, $uploadTarget)
	{
		$path = '';

		// Prepare params for upload
		$fileData =& $files;
		$fileFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		$typeId = JFactory::getApplication()->getUserState('com_reditem.global.tid', '0');

		// Get config of field
		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');

		switch ($uploadType)
		{
			case 'file':

				$maxFileSize		= 2;
				$allowedExtension	= "zip,doc,xls,pdf";
				$allowedMIME		= "application/zip,application/doc,application/xls,application/pdf";
				$useCustomFileName	= true;

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'file');
				$fieldsModel->setState('filter.fieldcode', $uploadType);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance		= $fieldInstance[0];
					$fieldConfig		= new JRegistry($fieldInstance->params);
					$allowedExtension	= $fieldConfig->get('allowed_file_extension', 'zip,doc,xls,pdf');
					$allowedMIME		= $fieldConfig->get('allowed_file_mimetype', 'application/zip,application/doc,application/xls,application/pdf');
					$maxFileSize		= (int) $fieldConfig->get('upload_max_filesize', 2);
				}

				$result = ReditemHelpersFileUpload::uploadFile($fileData, $fileFolder, $maxFileSize, $allowedExtension, $allowedMIME, $useCustomFileName);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'image':

				$maxFileSize      = 2;
				$allowedExtension = 'jpg,jpeg,gif,png';
				$allowedMIME      = 'image/jpg,image/jpeg,image/gif,image/png';

				if ($typeId)
				{
					$fieldsModel->setState('filter.types', $typeId);
					$fieldsModel->setState('filter.fieldtypes', 'image');
					$fieldsModel->setState('filter.fieldcode', $uploadType);
					$fieldInstance = $fieldsModel->getItems();

					if (!empty($fields))
					{
						$fieldInstance    = $fieldInstance[0];
						$fieldConfig      = new JRegistry($fieldInstance->params);
						$allowedExtension = $fieldConfig->get('allowed_file_extension', 'jpg,jpeg,gif,png');
						$allowedMIME      = $fieldConfig->get('allowed_file_mimetype', 'image/jpg,image/jpeg,image/gif,image/png');
						$maxFileSize      = (int) $fieldConfig->get('upload_max_filesize', 2);
					}
				}

				$result = ReditemHelpersFileUpload::uploadFile($fileData, $fileFolder, $maxFileSize, $allowedExtension, $allowedMIME);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'gallery':

				$maxFileSize		= 2;
				$allowedExtension	= "jpg,jpeg,gif,png";
				$allowedMIME		= "image/jpg,image/jpeg,image/gif,image/png";

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'gallery');
				$fieldsModel->setState('filter.fieldcode', $uploadType);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance		= $fieldInstance[0];
					$fieldConfig		= new JRegistry($fieldInstance->params);
					$allowedExtension	= $fieldConfig->get('allowed_file_extension', 'jpg,jpeg,gif,png');
					$allowedMIME		= $fieldConfig->get('allowed_file_mimetype', 'image/jpg,image/jpeg,image/gif,image/png');
					$maxFileSize		= (int) $fieldConfig->get('upload_max_filesize', 2);
				}

				$result = ReditemHelpersFileUpload::uploadFile($fileData, $fileFolder, $maxFileSize, $allowedExtension, $allowedMIME);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			default:
				break;
		}

		return $path;
	}

	/**
	 * Method for rating item
	 *
	 * @param   int    $itemId  Id of item
	 * @param   float  $value   Value of rating
	 *
	 * @return  boolean  True on success
	 */
	public function ratingItem($itemId, $value)
	{
		$db   = JFactory::getDbo();
		$user = ReditemHelperSystem::getUser();
		$itemId = (int) $itemId;
		$value  = (float) $value;

		if (!$itemId || $user->guest)
		{
			return false;
		}

		$query = $db->getQuery()->clear()
			->delete($db->qn('#__reditem_item_rating'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId))
			->where($db->qn('user_id') . ' = ' . $db->quote($user->id));
		$db->setQuery($query);
		$db->execute();

		// Insert new rating
		$currentTime = ReditemHelperSystem::getDateWithTimezone();
		$query->clear()
			->insert($db->qn('#__reditem_item_rating'))
			->columns($db->qn(array('item_id', 'rating', 'user_id', 'rating_date')))
			->values($db->quote($itemId) . ',' . $db->quote($value) . ',' . $db->quote($user->id) . ',' . $db->quote($currentTime->toSql()));
		$db->setQuery($query);

		if ($db->execute())
		{
			// Event after item rated
			JPluginHelper::importPlugin('reditem');
			$dispatcher = RFactory::getDispatcher();
			$dispatcher->trigger('onAfterItemRated', array($itemId, $value));

			return true;
		}

		return false;
	}

	/**
	 * Method for report an item
	 *
	 * @param   int     $itemId  ID of item
	 * @param   reason  $reason  Reason why user report this item
	 *
	 * @return  boolean  True on success
	 */
	public function reportItem($itemId, $reason)
	{
		$db     = JFactory::getDbo();
		$user   = ReditemHelperSystem::getUser();
		$itemId = (int) $itemId;

		if (!$itemId || $user->guest)
		{
			return false;
		}

		$query = $db->getQuery()->clear()
			->delete($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId))
			->where($db->qn('user_id') . ' = ' . $db->quote($user->id));
		$db->setQuery($query);
		$db->execute();

		$values = array(
			$db->quote($itemId),
			$db->quote($reason),
			$db->quote($user->id),
			$db->quote(ReditemHelperSystem::getDateWithTimezone()->toSql())
		);

		// Insert new report
		$query->clear()
			->insert($db->qn('#__reditem_item_reports'))
			->columns($db->qn(array('item_id', 'reason', 'user_id', 'created')))
			->values(implode(',', $values));
		$db->setQuery($query);

		if ($db->execute())
		{
			$this->onReportItemProcess($itemId, $reason);

			return true;
		}

		return false;
	}

	/**
	 * Method for remove report of an item for this user
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  boolean  True on success
	 */
	public function unReportItem($itemId)
	{
		$db     = JFactory::getDbo();
		$user   = ReditemHelperSystem::getUser();
		$itemId = (int) $itemId;

		if (!$itemId || $user->guest)
		{
			return false;
		}

		$query = $db->getQuery()->clear()
			->delete($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId))
			->where($db->qn('user_id') . ' = ' . $db->quote($user->id));
		$db->setQuery($query);

		return $db->execute();
	}

	/**
	 * Method for block item if it's reports has match the configuration
	 *
	 * @param   int     $itemId  Item ID
	 * @param   string  $reason  Report reason
	 *
	 * @return  void
	 */
	public function onReportItemProcess($itemId, $reason)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return;
		}

		$db = JFactory::getDbo();
		$redItemConfig = JComponentHelper::getParams('com_reditem');
		$itemReportBlockCount = (int) $redItemConfig->get('reportItemBlockCount', 5);

		// Get number of reports on this item
		$query = $db->getQuery(true)
			->select('COUNT(*) as ' . $db->qn('count'))
			->from($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $itemId);
		$db->setQuery($query);
		$result = $db->loadObject();

		if (!$result)
		{
			return;
		}

		// If reports not enough, do nothing
		if ($result->count < $itemReportBlockCount)
		{
			return;
		}

		// Number of reports is match the configuration, block this item
		$query->clear()
			->update($db->qn('#__reditem_items'))
			->set($db->qn('blocked') . ' = 1')
			->where($db->qn('id') . ' = ' . $itemId);
		$db->setQuery($query);
		$db->execute();

		// Email item blocked by reported
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemBlockedByReport', array($itemId, $reason));

		if (ReditemHelperWatch::isWatchFeatureEnabled())
		{
			$model  = RModel::getAdminInstance('Item', array("ignore_request" => true), "com_reditem");
			$item 	= $model->getItem($itemId);

			ReditemHelperWatch::onItemWatching('block', $item);
		}

		// Get owner of this item
		$query->clear()
			->select($db->qn('created_user_id'))
			->from($db->qn('#__reditem_items'))
			->where($db->qn('id') . ' = ' . $itemId);
		$db->setQuery($query);
		$result = $db->loadObject();

		ReditemHelperReport::processOnUserReported($result->created_user_id);
	}

	/**
	 * Get the associated JTable
	 *
	 * @param   string  $name    Table name
	 * @param   string  $prefix  Table prefix
	 * @param   array   $config  Configuration array
	 *
	 * @return  JTable
	 */
	public function getTable($name = 'Item', $prefix = '', $config = array())
	{
		$class = get_class($this);

		if (empty($prefix))
		{
			$prefix = strstr($class, 'Model', true) . 'Table';
		}

		return parent::getTable($name, $prefix, $config);
	}
}
