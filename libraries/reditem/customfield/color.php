<?php
/**
 * @package     RedITEM.Libarries
 * @subpackage  CustomField
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_BASE') or die;

/**
 * Renders a Text Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Color
 * @since       2.1.13
 *
 */
class ReditemCustomfieldColor extends ReditemCustomfieldGeneric
{
	/**
	 * Returns the html code for the form element
	 *
	 * @param   array  $attributes  [description]
	 *
	 * @return string
	 */
	public function render($attributes = '')
	{
		$params = new JRegistry($this->params);
		$required = (boolean) $params->get('required');
		$attributes = array();
		$attributes['autofocus'] = (boolean) $params->get('autofocus');
		$attributes['autocomplete'] = (boolean) $params->get('autocomplete');
		$attributes['readonly'] = (boolean) $params->get('readonly');
		$attributes['class'] = $params->get('class');

		$layoutData = array(
			'id'        => $this->divId,
			'name'      => $this->name,
			'fieldcode' => $this->fieldcode,
			'value'     => $this->value,
			'element'   => $attributes,
			'required'  => $required,
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.color', $layoutData, array('component' => 'com_reditem'));
	}
}
