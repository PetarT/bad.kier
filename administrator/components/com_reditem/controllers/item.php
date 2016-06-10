<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

/**
 * The item edit controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Item
 * @since       2.0
 */

class ReditemControllerItem extends RControllerForm
{
	/**
	 * Add an item
	 *
	 * @return mixed
	 */
	public function add()
	{
		$app    = JFactory::getApplication();
		$wizard = $app->input->get('wizard', array(), 'array');

		$app->setUserState('com_reditem.global.tid', '');
		$app->setUserState('com_reditem.global.cid', array());
		$app->setUserState('com_reditem.global.itemId', '');
		$app->setUserState('com_reditem.global.templateEdit', '');

		if (!empty($wizard))
		{
			if (isset($wizard['type']) && !empty($wizard['type']))
			{
				$app->setUserState('com_reditem.global.tid', (int) $wizard['type']);
			}

			if (isset($wizard['template']) && !empty($wizard['template']))
			{
				$app->setUserState('com_reditem.global.templateEdit', (int) $wizard['template']);
			}

			$app->setUserState('com_reditem.global.parentId', $app->input->get('parent_id', 0, 'int'));
			$app->setUserState('com_reditem.global.fromExplore', $app->input->get('fromExplore', 0, 'int'));
		}
		else
		{
			$app->setUserState('com_reditem.global.parentId', 0);
			$app->setUserState('com_reditem.global.fromExplore', 0);
		}

		return parent::add();
	}

	/**
	 * Edit an item
	 *
	 * @param   int     $key     [description]
	 * @param   string  $urlVar  [description]
	 *
	 * @return boolean
	 */
	public function edit($key = null, $urlVar = null)
	{
		$app         = JFactory::getApplication();
		$itemmodel   = RModel::getAdminInstance('Item');
		$fromExplore = $app->input->get('fromExplore', 0, 'int');
		$parentId    = $app->input->get('parent_id', 0, 'int');
		$item        = $itemmodel->getItem();

		$app->setUserState('com_reditem.global.tid', $item->type_id);
		$app->setUserState('com_reditem.global.cid', array());
		$app->setUserState('com_reditem.global.itemId', $item->id);
		$app->setUserState('com_reditem.global.parentId', $parentId);
		$app->setUserState('com_reditem.global.fromExplore', $fromExplore);

		return parent::edit($key, $urlVar);
	}

	/**
	 * For auto-submit form when client choose type
	 *
	 * @return void
	 */
	public function setType()
	{
		$app      = JFactory::getApplication();
		$recordId = $app->input->getInt('id', 0);
		$data     = $app->input->get('jform', array(), 'array');

		// Get default template from type configuration
		$typemodel = RModel::getAdminInstance('Type', array('ignore_request' => true));
		$typemodel->setState('list.select', 'params');
		$params = $typemodel->getItem($data['type_id'])->params;
		$data['template_id'] = $params['default_itemdetail_template'];

		// Check if default template has exist
		$templatemodel = RModel::getAdminInstance('Template', array('ignore_request' => true));
		$templatemodel->setState('list.select', 'id');
		$defaultTemplate = $templatemodel->getItem($params['default_itemdetail_template']);

		$data['template_id'] = ($defaultTemplate) ? $defaultTemplate->id : null;

		$app->setUserState('com_reditem.edit.item.data', $data);

		$app->setUserState('com_reditem.global.tid', $data['type_id']);
		$app->setUserState('com_reditem.global.cid', array());

		$redirect = JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false);

		$this->setRedirect($redirect);
	}

	/**
	 * Method for upload an image using AJAX method
	 *
	 * @return void
	 */
	public function ajaxUpload()
	{
		$app        = JFactory::getApplication();
		$files      = $app->input->files->get('dragFile');
		$uploadType = $app->input->getString('uploadType', '');

		if (!in_array($uploadType, array('file', 'image', 'gallery')))
		{
			$app->close();
		}

		$uploadTarget = $app->input->getString('uploadTarget', '');

		if (trim($uploadTarget) == '')
		{
			$app->close();
		}

		$model = $this->getModel();
		echo $model->dragndropUpload($files, $uploadType, $uploadTarget);

		$app->close();
	}

	/**
	 * ajaxCropImage crop image ajax
	 *
	 * @return  void
	 */
	public function ajaxCropImage()
	{
		$result        = false;
		$app           = RFactory::getApplication();
		$imageName     = $app->input->getString('image_name');
		$top           = $app->input->getInt('top');
		$left          = $app->input->getInt('left');
		$width         = $app->input->getInt('width');
		$height        = $app->input->getInt('height');
		$previewWidth  = $app->input->getInt('previewWidth');
		$previewHeight = $app->input->getInt('previewHeight');
		$path          = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		if ($previewWidth < $width)
		{
			$width  = $previewWidth;
			$height = $previewHeight;
		}

		if (JFile::exists($path . $imageName))
		{
			$result = ReditemHelperCropimage::cropImage($imageName, $path, $top, $left, $width, $height, $previewWidth, $previewHeight);
		}

		echo (int) $result;

		$app->close();
	}

	/**
	 * Method for preview item
	 *
	 * @return  void
	 */
	public function preview()
	{
		$app   = JFactory::getApplication();
		$model = $this->getModel();

		$model->savePreviewData();
		$app->close();
	}

	/**
	 * Ajax function for adding task row in task list custom field.
	 *
	 * @return void
	 */
	public function ajaxCustomfieldTasklistAddTask()
	{
		$app      = JFactory::getApplication();
		$input    = $app->input;
		$typeId   = $input->getInt('typeId', 0);
		$rowNo    = $input->getInt('rowNo', 0);
		$addTable = $input->getInt('addTable', 0);
		$type     = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($typeId);

		if ($addTable)
		{
			$html = '<table class="table table-bordered tasks"><thead><tr>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_TASKLIST_TITLE') . '</th>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_TASKLIST_DESCRIPTION') . '</th>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_TASKLIST_ACTIONS') . '</th></tr></thead><tbody>' .
				ReditemHelperLayout::render($type, 'customfields.tasklist.task', array('taskNo' => 1), array('component' => 'com_reditem')) .
				'</tbody></table>';
		}
		else
		{
			$html = ReditemHelperLayout::render($type, 'customfields.tasklist.task', array('taskNo' => $rowNo), array('component' => 'com_reditem'));
		}

		echo $html;
		$app->close();
	}

	/**
	 * Ajax function for adding text row in multitextarea custom field.
	 *
	 * @return void
	 */
	public function ajaxCustomfieldMultitextareaAddTextarea()
	{
		$app      = JFactory::getApplication();
		$input    = $app->input;
		$typeId   = $input->getInt('typeId', 0);
		$rowNo    = $input->getInt('rowNo', 0);
		$addTable = $input->getInt('addTable', 0);
		$type     = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($typeId);

		if ($addTable)
		{
			$html = '<table class="table table-bordered texts"><thead><tr>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_MULTITEXTAREA_USER') . '</th>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_MULTITEXTAREA_CONTENT') . '</th>' .
				'<th>' . JText::_('COM_REDITEM_FIELD_MULTITEXTAREA_ACTIONS') . '</th></tr></thead><tbody>' .
				ReditemHelperLayout::render($type, 'customfields.multitextarea.textarea', array('textNo' => 1), array('component' => 'com_reditem')) .
				'</tbody></table>';
		}
		else
		{
			$html = ReditemHelperLayout::render($type, 'customfields.multitextarea.textarea', array('textNo' => $rowNo), array('component' => 'com_reditem'));
		}

		echo $html;
		$app->close();
	}

	/**
	 * Method to get list of edit template
	 *
	 * @return  void
	 */
	public function ajaxGetEditTemplates()
	{
		$app       = JFactory::getApplication();
		$type      = $app->input->getInt('id', 0);
		$incDef    = $app->input->getInt('incDef', 1);
		$templates = ReditemHelperSystem::getTemplatesBySection('view_itemdetail', $type);
		$showHtml  = $app->input->getInt('showHtml', 0);

		if ($incDef)
		{
			$options = array(
				JHtml::_('select.option', 0, JText::_('COM_REDITEM_TEMPLATE_DEFAULT'))
			);
			$list    = array(
				(object) array('text' => JText::_('COM_REDITEM_TEMPLATE_DEFAULT'), 'value' => '0')
			);
		}
		else
		{
			$options = array();
			$list    = array();
		}

		if (!empty($templates))
		{
			foreach ($templates as $t)
			{
				$list[]    = (object) array('text' => $t->name, 'value' => (int) $t->id);
				$options[] = JHtml::_('select.option', (int) $t->id, $t->name);
			}
		}

		if ($showHtml)
		{
			echo JHtml::_('select.genericlist', $options, 'editTemplate', null, 'value', 'text', 0, 'editTemplate');
		}
		else
		{
			echo json_encode($list);
		}

		$app->close();
	}

	/**
	 * Method for getting list of edit categories.
	 *
	 * @return  void
	 */
	public function ajaxGetEditCategories()
	{
		$app  = JFactory::getApplication();
		$type = $app->input->getInt('id', 0);
		$cats = ReditemHelperCategory::getCategoriesByType($type);
		$list = array();

		if (!empty($cats))
		{
			foreach ($cats as $c)
			{
				$list[] = (object) array('text' => $c->title, 'value' => (int) $c->id);
			}
		}

		echo json_encode($list);

		$app->close();
	}

	/**
	 * Method for getting list of edit fields.
	 *
	 * @return  void
	 */
	public function ajaxGetEditFields()
	{
		$app        = JFactory::getApplication();
		$fromType   = $app->input->getInt('typeFrom', 0);
		$toType     = $app->input->getInt('typeTo', 0);
		$fromFields = ReditemHelperType::getCustomFieldList($fromType);
		$toFields   = ReditemHelperType::getCustomFieldList($toType);
		$html       = '<table class="table table-striped"><thead><tr><th style="width: 50%;">' . JText::_('COM_REDITEM_ITEMS_CONVERT_FROM_ITEM_FIELDS') .
						'</th><th style="width: 50%;">' . JText::_('COM_REDITEM_ITEMS_CONVERT_TO_ITEM_FIELDS') . '</th></tr></thead><tbody>';

		foreach ($fromFields as $fromField)
		{
			$html   .= '<tr><td>' . $fromField->name . '</td>';
			$fields  = ReditemHelperCustomfield::getPossibleConvertFields($fromField->type, $toFields);
			$options = array(
				JHtml::_('select.option', -1, JText::_('COM_REDITEM_ITEMS_CONVERT_SKIP_FIELD')),
				JHtml::_('select.option', 0, JText::_('COM_REDITEM_ITEMS_CONVERT_CREATE_FIELD_COPY'))
			);

			foreach ($fields as $field)
			{
				$options[] = JHtml::_('select.option', (int) $field->id, $field->name);
			}

			$html .= '<td>' . JHtml::_(
					'select.genericlist',
					$options,
					'convert[fields][' . $fromField->id . ']',
					array (
						'list.attr' => array('class' => 'convert-fields field-' . $fromField->type)
					),
					'value',
					'text',
					0
				) . '</td></tr>';
		}

		$html .= '</tbody></table>';
		echo $html;
		$app->close();
	}

	/**
	 * For auto-submit form when client choose template
	 *
	 * @return void
	 */
	public function setEditTemplate()
	{
		$app      = JFactory::getApplication();
		$recordId = $app->input->getInt('id', 0);
		$data     = $app->input->get('jform', array(), 'array');
		$redirect = JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false);
		$app->setUserState('com_reditem.global.templateEdit', (int) $data['template_id']);

		$this->setRedirect($redirect);
	}

	/**
	 * Get the JRoute object for a redirect to list.
	 *
	 * @param   string  $append  An optionnal string to append to the route
	 *
	 * @return  JRoute  The JRoute object
	 */
	public function getRedirectToListRoute($append = null)
	{
		$returnUrl = $this->input->get('return', '', 'Base64');

		if ($returnUrl)
		{
			$returnUrl = base64_decode($returnUrl);

			return JRoute::_($returnUrl, false);
		}
		else
		{
			return JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $append, false);
		}
	}
}
