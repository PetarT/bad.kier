<?php
/**
 * @package     RedITEMCategoryFields.Backend
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
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Controller.Fields
 * @since       2.0
 */
class ReditemCategoryFieldsControllerCategoryFields extends RControllerAdmin
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
		$jInput->set('view', 'categoryfield');
		$jInput->set('layout', 'default');
		$jInput->set('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * Method to save the submitted ordering values for records.
	 *
	 * @return  boolean  True on success
	 */
	public function saveorder()
	{
		// Check for request forgeries.
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Get the input
		$pks   = $this->input->post->get_Array('cid', array());
		$order = $this->input->post->get_Array('order', array());
		$cat   = $this->input->getInt('cat', 0);

		// Get the model
		$model = $this->getModel();

		// Save the ordering
		$return = $model->saveorderprod($pks, $order, $cat);

		if ($return)
		{
			echo '1';
		}

		JFactory::getApplication()->close();
	}
}
