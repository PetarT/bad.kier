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
 * Renders a Date Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Date
 * @since       2.1.13
 *
 */
class ReditemCustomfieldDate extends ReditemCustomfieldGeneric
{
	public $sqlColumnData = ' DATETIME NULL DEFAULT NULL';

	/**
	 * Returns the html code for the form element
	 *
	 * @param   array  $attributes  Attributes list
	 *
	 * @return string
	 */
	public function render($attributes = array())
	{
		// Add params into attributes array
		$params   = new JRegistry($this->params);
		$required = (boolean) $params->get('required');
		$params   = $params->toArray();

		foreach ($params as $key => $value)
		{
			$attributes[$key] = $value;
		}

		if (!isset($attributes['showTimePicker']))
		{
			$attributes['showTimePicker'] = true;
		}

		if (!isset($attributes['class']))
		{
			$attributes['class'] = '';
		}

		if (!isset($attributes['altFormat']))
		{
			$attributes['altFormat'] = 'yy-mm-dd';
		}

		if ($required)
		{
			$attributes['class'] .= ' required';
		}

		$layoutData = array(
			'fieldcode'  => $this->fieldcode,
			'value'      => $this->value,
			'attributes' => $attributes
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.date', $layoutData, array('component' => 'com_reditem'));
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
		$fieldParams       = new JRegistry($field->params);
		$value = '';

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$dateValue	= ReditemHelperSystem::getDateWithTimezone($customFieldValues[$field->fieldcode]);
			$dateFormat	= $fieldParams->get('dateFormat', 'Y - m - d');
			$value		= $dateValue->format($dateFormat, true);
		}

		$layoutData    = array('tag' => $field, 'value' => $value, 'item' => $item);
		$layoutFile    = 'customfield_date';
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
		$content     = str_replace($tagString, $contentHtml, $content);

		return true;
	}
}
