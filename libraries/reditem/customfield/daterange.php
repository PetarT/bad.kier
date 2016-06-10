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
class ReditemCustomfieldDateRange extends ReditemCustomfieldGeneric
{
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

		if (!isset($attributes['class']))
		{
			$attributes['class'] = '';
		}

		if ($required)
		{
			$attributes['class'] .= ' required';
		}

		$value = array('start' => '', 'end' => '');

		if (!empty($this->value))
		{
			$tmpValue = json_decode($this->value);

			if (isset($tmpValue->start))
			{
				$value['start'] = $tmpValue->start;
			}

			if (isset($tmpValue->end))
			{
				$value['end'] = $tmpValue->end;
			}
		}

		$layoutData = array(
			'fieldcode'  => $this->fieldcode,
			'attributes' => $attributes,
			'value'      => $value
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.daterange', $layoutData, array('component' => 'com_reditem'));
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

		$startTag = '{' . $field->fieldcode . '_start}';
		$endTag   = '{' . $field->fieldcode . '_end}';

		if ((strpos($content, $startTag) === false) && (strpos($content, $endTag) === false))
		{
			return false;
		}

		// Prepare data for this item
		$this->prepareData($item);
		$customFieldValues = $item->customfield_values;
		$startDateValue = '';
		$endDateValue   = '';

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$value = new JRegistry($customFieldValues[$field->fieldcode]);
			$startDateValue = $value->get('start');
			$endDateValue   = $value->get('end');
		}

		// Start date value
		if (strpos($content, $startTag) !== false)
		{
			$layoutData    = array('tag' => $field, 'value' => $startDateValue, 'item' => $item);
			$layoutOptions = array('component' => 'com_reditem', 'debug' => false);
			$contentHtml   = ReditemHelperLayout::render($item->type, 'customfield_daterange_start', $layoutData, $layoutOptions);
			$content       = str_replace($startTag, $contentHtml, $content);
		}

		// End date value
		if (strpos($content, $endTag) !== false)
		{
			$layoutData    = array('tag' => $field, 'value' => $endDateValue, 'item' => $item);
			$layoutOptions = array('component' => 'com_reditem', 'debug' => false);
			$contentHtml   = ReditemHelperLayout::render($item->type, 'customfield_daterange_end', $layoutData, $layoutOptions);
			$content       = str_replace($endTag, $contentHtml, $content);
		}

		return true;
	}
}
