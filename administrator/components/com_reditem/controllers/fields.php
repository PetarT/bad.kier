<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

// No direct access
defined('_JEXEC') or die;

/**
 * The fields controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Fields
 * @since       2.0
 */
class ReditemControllerFields extends RControllerAdmin
{
	/**
	 * constructor (registers additional tasks to methods)
	 *
	 */
	public function __construct()
	{
		parent::__construct();

		// Write this to make two tasks use the same method (in this example the add method uses the edit method)
		$this->registerTask('add', 'edit');
	}

	/**
	 * display the add and the edit form
	 *
	 * @return void
	 */
	public function edit()
	{
		$jInput = JFactory::getApplication()->input;
		$jInput->set('view', 'field');
		$jInput->set('layout', 'default');
		$jInput->set('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * Method for copy fields
	 *
	 * @return void
	 */
	public function copy()
	{
		$input = JFactory::getApplication()->input;
		$cids = $input->get('cid', array(), 'array');

		if (count($cids))
		{
			$i = 0;

			foreach ($cids as $fieldId)
			{
				$fieldModel = RModel::getAdminInstance('Field', array('ignore_request' => true), 'com_reditem');
				$field = $fieldModel->getItem($fieldId);

				$field->id = null;
				$field->name = JString::increment($field->name);

				$fieldTable = RTable::getAdminInstance('Field', array('ignore_request' => true), 'com_reditem');
				$fieldTable->bind((array) $field);

				if (!$fieldTable->check())
				{
					continue;
				}

				if ($fieldTable->store(false))
				{
					$i++;
				}
			}

			JFactory::getApplication()->enqueueMessage($i . " " . JText::_(COM_REDITEM_FIELDS_COPIED_SUCCESSFUL));
		};

		$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=fields', false));
	}

	/**
	 * Method to save the submitted ordering values for records.
	 *
	 * @return  void  Ajax request.
	 */
	public function saveFieldsOrder()
	{
		// Check for request forgeries.
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Get the input
		$pks   = $this->input->post->get('cid', array(), 'array');
		$order = $this->input->post->get('order', array(), 'array');

		// Get the model
		$model = $this->getModel('Fields');

		// Save the ordering
		echo json_encode($model->saveFieldsOrder($pks, $order));

		JFactory::getApplication()->close();
	}
}
