<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  CustomField
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_BASE') or die;

/**
 * Renders a Task custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Task
 * @since       2.1.13
 *
 */
class ReditemCustomfieldTasklist extends ReditemCustomfieldGeneric
{
	/**
	 * returns the html code for the form element
	 *
	 * @param   array  $attributes  [description]
	 *
	 * @return string
	 */
	public function render($attributes = array())
	{
		$data          = array();
		$values        = array();
		$attributeHtml = '';
		$params        = new JRegistry($this->params);
		$required      = (boolean) $params->get('required');

		if (!empty($this->value))
		{
			$values = json_decode($this->value);
		}

		if (!empty($values))
		{
			foreach ($values as $value)
			{
				$task      = explode('|', trim($value));
				$taskTitle = $task[0];
				$taskDesc  = $task[1];
				$taskDone  = $task[2];
				$taskPaid  = $task[3];

				$data[] = array(
					'title' => $taskTitle,
					'desc'  => $taskDesc,
					'done'  => $taskDone,
					'paid'  => $taskPaid
				);
			}
		}

		// Prepare attributes
		if (!empty($attributes))
		{
			foreach ($attributes as $attribute => $attributeValue)
			{
				$attributeHtml .= ' ' . $attribute . '="' . $attributeValue . '"';
			}
		}

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		$layoutData = array(
			'fieldcode'  => $this->fieldcode,
			'data'       => $data,
			'attributes' => $attributeHtml,
			'name'       => $this->name,
			'type'       => $type,
			'value'      => $this->value,
			'required'   => $required
		);

		return ReditemHelperLayout::render($type, 'customfields.tasklist.view', $layoutData, array('component' => 'com_reditem'));
	}
}
