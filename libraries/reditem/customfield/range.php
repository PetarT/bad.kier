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
 * Renders a Range number Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Range
 * @since       2.1.13
 *
 */
class ReditemCustomfieldRange extends ReditemCustomfieldGeneric
{
	/**
	 * Returns the html code for the form element
	 *
	 * @param   string  $attributes  Attributes of element
	 *
	 * @return string
	 */
	public function render($attributes = '')
	{
		$data          = array();
		$class         = 'validate-numeric';
		$config        = new JRegistry($this->params);
		$attributeHtml = '';

		if ($config->get('required', false))
		{
			$attributes['class'] = 'required';
		}

		// Prepare config data
		$config = new JRegistry($this->params);

		$data['min']               = (int) $config->get('min', 1);
		$data['max']               = (int) $config->get('max', 100);
		$data['step']              = (int) $config->get('step', 1);
		$data['tooltip']           = $config->get('tooltipText', '');
		$data['tooltipDisplay']    = $config->get('tooltipDisplay', '');
		$data['pointStyle']        = $config->get('pointStyle', 'round');
		$data['backgroundColor']   = $config->get('backgroundColor', '#f5f5f5');
		$data['selectionColor']    = $config->get('selectionColor', '#da4f49');
		$data['sliderOrientation'] = $config->get('sliderOrientation', '');

		// Prepare value
		$value = (int) $config->get('default', 20);

		if (!empty($this->value))
		{
			$value = (int) $this->value;
		}

		$layoutData = array(
			'fieldcode'  => $this->fieldcode,
			'value'      => $value,
			'data'       => $data,
			'attributes' => $attributeHtml
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.range', $layoutData, array('component' => 'com_reditem'));
	}
}
