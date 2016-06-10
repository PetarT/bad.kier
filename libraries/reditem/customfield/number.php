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
 * Renders a Number Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Number
 * @since       2.1.13
 *
 */
class ReditemCustomfieldNumber extends ReditemCustomfieldGeneric
{
	/**
	 * Column data configuration
	 *
	 * @var  string
	 */
	public $sqlColumnData = ' DOUBLE NOT NULL DEFAULT 0.0';

	/**
	 * Returns the html code for the form element
	 *
	 * @param   string  $attributes  Attributes of element
	 *
	 * @return string
	 */
	public function render($attributes = '')
	{
		$class = 'validate-numeric';

		$config = new JRegistry($this->params);
		$required = (boolean) $config->get('required');

		if ($required)
		{
			$class .= ' required';
		}

		$attributes .= ' class="' . $class . '"';
		$attributes .= ' placeholder="' . $this->name . '"';

		$layoutData = array(
			'attributes'	=> $attributes,
			'fieldcode'		=> $this->fieldcode,
			'value'			=> $this->value
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.number', $layoutData, array('component' => 'com_reditem'));
	}

	/**
	 * Method for replace value tag of customfield
	 *
	 * @param   string  &$content  HTML content
	 * @param   object  $field     Field object of customfield
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public function replaceValueTag(&$content, $field, $item)
	{
		if (empty($content) || empty($field) || !is_object($field) || empty($item))
		{
			return false;
		}

		$tagString = '{' . $field->fieldcode . '_value}';

		if (strpos($content, $tagString) === false)
		{
			return false;
		}

		$this->prepareData($item);

		$customFieldValues = $item->customfield_values;
		$fieldParams = new JRegistry($field->params);
		$value = '';

		$decimalSepatator  = $fieldParams->get('number_decimal_sepatator', '.');
		$thousandSeparator = $fieldParams->get('number_thousand_separator', ',');
		$numberDecimals    = $fieldParams->get('number_number_decimals', 2);

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$value = $customFieldValues[$field->fieldcode];
			$value = number_format(floatval($value), $numberDecimals, $decimalSepatator, $thousandSeparator);
		}

		$layoutData    = array('tag' => $field, 'value' => $value, 'item' => $item);
		$layoutFile    = 'customfield_number';
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
		$content     = str_replace($tagString, $contentHtml, $content);

		return true;
	}
}
