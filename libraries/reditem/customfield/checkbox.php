<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Checkbox
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_BASE') or die;

/**
 * Renders a Checkbox Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Checkbox
 * @since       2.1.13
 *
 */
class ReditemCustomfieldCheckbox extends ReditemCustomfieldGeneric
{
	/**
	 * Returns the html code for the form element.
	 *
	 * @param   array  $attributes  Element attributes array.
	 *
	 * @return  string  HTML representation.
	 */
	public function render($attributes = array())
	{
		$values      = array();
		$data        = array();
		$fieldConfig = new JRegistry($this->params);
		$checkAll    = false;
		$type        = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		// Process on value
		if (!empty($this->value))
		{
			$values = json_decode($this->value, true);
		}

		$fieldOption = trim($this->options);

		// Process on option list
		if (!empty($fieldOption))
		{
			$options = explode("\n", $fieldOption);

			// Sort options if needed
			if ($fieldConfig->get('sort_options', 1))
			{
				sort($options);
			}

			$all = 0;

			foreach ($options as $option)
			{
				$option      = explode('|', trim($option));
				$optionValue = $option[0];
				$optionText  = $optionValue;

				if (isset($option[1]))
				{
					$optionText = $option[1];
				}

				$checked = false;

				if (is_array($values) && in_array($optionValue, $values))
				{
					$checked = true;

					$all++;
				}

				$data[] = array('text' => $optionText, 'value' => $optionValue, 'checked' => $checked);
			}

			$checkAll = (boolean) ($all == count($options));
		}

		$attributes['required']      = (boolean) $fieldConfig->get('required');
		$attributes['show_checkall'] = (boolean) $fieldConfig->get('show_checkall');
		$renderStyle                 = $fieldConfig->get('renderStyle', '');

		$layoutData = array(
			'name'        => $this->name,
			'fieldcode'   => $this->fieldcode,
			'data'        => $data,
			'attributes'  => $attributes,
			'renderStyle' => $renderStyle,
			'checkAll'    => $checkAll
		);

		return ReditemHelperLayout::render($type, 'customfields.checkbox', $layoutData, array('component' => 'com_reditem'));
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

		$optionsData  = array();
		$fieldOptions = array();

		// Prepare for options list of field
		$temporaryFieldOptions = trim($field->options);
		$temporaryFieldOptions = explode("\n", $temporaryFieldOptions);

		foreach ($temporaryFieldOptions as $temporaryOption)
		{
			if (is_string($temporaryOption) && !empty($temporaryOption))
			{
				$temporaryOption = explode('|', trim($temporaryOption));
				$option          = new stdClass;
				$option->value   = trim($temporaryOption[0]);
				$option->text    = $option->value;

				if (isset($temporaryOption[1]) && !empty($temporaryOption[1]))
				{
					$option->text = trim($temporaryOption[1]);
				}

				$fieldOptions[$option->value] = $option;
			}
		}

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$itemValues = json_decode($customFieldValues[$field->fieldcode], true);

			if (is_array($itemValues) && count($itemValues))
			{
				foreach ($itemValues as $value)
				{
					if (isset($fieldOptions[$value]) && !empty($fieldOptions[$value]))
					{
						$optionsData[] = $fieldOptions[$value];
					}
				}
			}
		}

		$layoutData    = array('tag' => $field, 'value' => $optionsData, 'item' => $item);
		$layoutFile    = 'customfield_checkbox';
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
		$content     = str_replace($tagString, $contentHtml, $content);

		return true;
	}
}
