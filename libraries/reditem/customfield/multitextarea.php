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
 * Renders a Multi Textarea field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Task
 * @since       2.1.13
 *
 */
class ReditemCustomfieldMultitextarea extends ReditemCustomfieldGeneric
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
				$textarea   = explode('|', trim($value));
				$userId 	= $textarea[0];
				$content  	= $textarea[1];

				$data[] = array(
					'userId'  => $userId,
					'content' => $content
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

		return ReditemHelperLayout::render($type, 'customfields.multitextarea.view', $layoutData, array('component' => 'com_reditem'));
	}
}
