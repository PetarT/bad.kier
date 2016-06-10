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
 * The template edit controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Field
 * @since       2.0
 */
class ReditemControllerField extends RControllerForm
{
	/**
	 * Add field
	 *
	 * @return void
	 */
	public function add()
	{
		$app = JFactory::getApplication();
		$app->setUserState('com_reditem.global.field.type', '');
		$app->setUserState('com_reditem.global.field.oldtype', '');

		return parent::add();
	}

	/**
	 * Edit field
	 *
	 * @param   int     $key     [description]
	 * @param   string  $urlVar  [description]
	 *
	 * @return void
	 */
	public function edit($key = null, $urlVar = null)
	{
		$app = JFactory::getApplication();
		$fieldModel = RModel::getAdminInstance('Field');

		$field = $fieldModel->getItem();
		$app->setUserState('com_reditem.global.field.type', $field->type);
		$app->setUserState('com_reditem.global.field.oldtype', $field->type);
		$app->setUserState('com_reditem.global.field.oldFieldCode', $field->fieldcode);
		$app->setUserState('com_reditem.global.field.RITypeId', $field->type_id);

		return parent::edit($key, $urlVar);
	}

	/**
	 * For auto-submit form when client choose type
	 *
	 * @return void
	 */
	public function setType()
	{
		$app = JFactory::getApplication();
		$recordId = $app->input->getInt('id', 0);
		$data     = $app->input->get('jform', array(), 'array');

		$app->setUserState('com_reditem.edit.field.data', $data);
		$app->setUserState('com_reditem.global.field.type', $data['type']);

		$redirect = JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false);

		$this->setRedirect($redirect);
	}

	/**
	 * For auto-submit form when client choose field type
	 *
	 * @return void
	 */
	public function setFieldType()
	{
		$app = JFactory::getApplication();
		$recordId = $app->input->getInt('id', 0);
		$data     = $app->input->get('jform', array(), 'array');

		$app->setUserState('com_reditem.edit.field.data', $data);
		$app->setUserState('com_reditem.global.field.type', $data['type']);
		$app->setUserState('com_reditem.global.field.RITypeId', $data['type_id']);

		$redirect = JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false);

		if (!empty($recordId))
		{
			$this->setMessage(JText::_('COM_REDITEM_FIELD_WARNING_CHANGE_FIELD_TYPE_LOST_DATA'), 'warning');
		}

		$this->setRedirect($redirect);
	}
}
