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
jimport('joomla.filesystem.folder');

/**
 * RedITEM Item Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Item
 * @since       2.0.19
 *
 */
class ReditemModelItem extends RModelAdmin
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
		$app = JFactory::getApplication();
		$item = parent::getItem($pk);

		if ($item->blocked || $item->published != 1)
		{
			$app->enqueueMessage(JText::_('COM_REDITEM_ERROR_NO_ITEM_FOUND'), 'error');
			$app->redirect(JRoute::_('index.php?option=com_reditem&view=items'));
		}

		$published = $this->getState('filter.published');

		if (isset($item->id))
		{
			$db = JFactory::getDBO();

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

		return $item;
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

		if (!$type_id)
		{
			return false;
		}

		$customfields = RModel::getAdminInstance('Fields', array('ignore_request' => true));
		$customfields->setState('filter.types', $type_id);
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
	 * @param   array   $file          File posted
	 * @param   string  $uploadType    type of files posted [file/image/gallery]
	 * @param   string  $uploadTarget  fieldcode
	 *
	 * @return  string  path of uploaded files, '' if not in types [file/image/gallery]
	 */
	public function dragndropUpload($file, $uploadType, $uploadTarget)
	{
		$path = '';

		// Prepare filename
		$fileExtension = JFile::getExt($file['name']);
		$fileName      = JFilterOutput::stringURLSafe(JFile::stripExt($file['name']));

		$file['name'] = $fileName . '.' . $fileExtension;
		$fileFolder   = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		$typeId = JFactory::getApplication()->getUserState('com_reditem.global.tid', '0');

		// Get global configuration
		$redItemConfig = JComponentHelper::getParams('com_reditem');

		// Get config of field
		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');

		switch ($uploadType)
		{
			case 'file':
				$maxFileSize       = $redItemConfig->get('customfieldFileUploadMaxSize', 2);
				$extensions        = $redItemConfig->get('customfieldFileUploadExtensions', "zip,doc,xls,pdf");
				$mimes             = $redItemConfig->get('customfieldFileUploadMimes', "application/zip,application/doc,application/xls,application/pdf");
				$useCustomFileName = (boolean) $redItemConfig->get('customfieldFileUploadUseCustomName', true);

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'file');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig   = new JRegistry($fieldInstance->params);
					$extensions    = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes         = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize   = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes, $useCustomFileName);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'image':
				$maxFileSize = $redItemConfig->get('customfieldImageUploadMaxSize', 2);
				$extensions  = $redItemConfig->get('customfieldImageUploadExtensions', 'jpg,jpeg,gif,png');
				$mimes = $redItemConfig->get('customfieldImageUploadMimes', 'image/jpg,image/jpeg,image/gif,image/png');

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'image');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig   = new JRegistry($fieldInstance->params);
					$extensions    = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes         = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize   = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'gallery':
				$maxFileSize = $redItemConfig->get('customfieldGalleryUploadMaxSize', 2);
				$extensions  = $redItemConfig->get('customfieldGalleryUploadExtensions', 'jpg,jpeg,gif,png');
				$mimes = $redItemConfig->get('customfieldGalleryUploadMimes', 'image/jpg,image/jpeg,image/gif,image/png');

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'gallery');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig = new JRegistry($fieldInstance->params);
					$extensions = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes);

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

		$query = $db->getQuery(true)
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
			$dispatcher->trigger('onAfterItemRated', array($itemId, $value, $user));

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

		// Run plugin group
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();

		$dispatcher->trigger('onBeforeItemReport', array($itemId, $user->id, $reason));

		$query = $db->getQuery()->clear()
			->delete($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId))
			->where($db->qn('user_id') . ' = ' . $db->quote($user->id));
		$db->setQuery($query);
		$db->execute();

		// Insert new report
		$query->clear()
			->insert($db->qn('#__reditem_item_reports'))
			->columns($db->qn(array('item_id', 'reason', 'user_id', 'created')))
			->values($db->quote($itemId) . ',' . $db->quote($reason) . ',' . $db->quote($user->id) . ',' . $db->quote(RFactory::getDate()->toSql()));
		$db->setQuery($query);

		if ($db->execute())
		{
			$reportId = $db->insertid();

			// Run event "OnAfterReportItem"
			$dispatcher->trigger('onAfterItemReported', array($itemId, $reportId, $user->id, $reason));

			return $reportId;
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

		// Run plugin group
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onBeforeItemUnReport', array($itemId, $user->id));

		$query = $db->getQuery()->clear()
			->delete($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId))
			->where($db->qn('user_id') . ' = ' . $db->quote($user->id));
		$db->setQuery($query);

		if ($db->execute())
		{
			$dispatcher->trigger('onAfterItemUnReported', array($itemId, $user->id));

			return true;
		}

		return false;
	}

	/**
	 * Method for watch an item
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  boolean       True on success. False otherwise.
	 */
	public function watchItem($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		return ReditemHelperWatch::watchItem($itemId);
	}

	/**
	 * Method for unwatch an item
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  boolean       True on success. False otherwise.
	 */
	public function unwatchItem($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		return ReditemHelperWatch::unwatchItem($itemId);
	}

	/**
	 * Method for get rating value of specific item
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  object/boolean   Object of rating value. False otherwise.
	 */
	public function getRating($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		return ReditemHelperRating::getRatingValue($itemId);
	}

	/**
	 * Method for share item using service
	 *
	 * @param   int     $itemId        ID of item
	 * @param   string  $shareService  Name of shared service
	 *
	 * @return  boolean                True on success. False otherwise.
	 */
	public function itemShare($itemId, $shareService)
	{
		$itemId = (int) $itemId;

		if (!$itemId || empty($shareService))
		{
			return false;
		}

		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemShared', array($itemId, $shareService));

		return true;
	}

	/**
	 * Method for archive an item by owner
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  boolean       True on success. False otherwise.
	 */
	public function archiveItem($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		$user = ReditemHelperSystem::getUser();

		if ($user->guest)
		{
			return false;
		}

		// Check archive a card permission
		$itemModel = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');
		$item      = $itemModel->getItem($itemId);

		if (!$item->id || ($user->id != $item->created_user_id))
		{
			return false;
		}

		// Add include path
		$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');

		if (!$itemTable->load($itemId))
		{
			return false;
		}

		$itemTable->published = 2;
		$itemTable->categories = $item->categories;

		if (!$itemTable->store())
		{
			return false;
		}

		// Email after item archived by owner
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemArchivedByOwner', array($itemId));

		return true;
	}
}
