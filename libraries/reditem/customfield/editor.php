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
 * Renders a Editor Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Editor
 * @since       2.1.13
 *
 */
class ReditemCustomfieldEditor extends ReditemCustomfieldGeneric
{
	/**
	 * returns the html code for the form element
	 *
	 * @param   array  $attributes  [description]
	 *
	 * @return string
	 */
	public function render($attributes = '')
	{
		$options = array('pagebreak', 'readmore');

		$params = new JRegistry($this->params);
		$required = (boolean) $params->get('required');

		if ($required)
		{
			$attributes['class'] = ' required';
		}

		$layoutData = array(
			'fieldcode'	=> $this->fieldcode,
			'value'		=> $this->value,
			'options'	=> $options
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.editor', $layoutData, array('component' => 'com_reditem'));
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

		$matches = array();

		if (preg_match_all('/{' . $field->fieldcode . '_value[^}]*}/i', $content, $matches) <= 0)
		{
			return false;
		}

		$this->prepareData($item);
		$customFieldValues = $item->customfield_values;

		$matches = $matches[0];
		$value   = '';

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$value = $customFieldValues[$field->fieldcode];
		}

		foreach ($matches as $match)
		{
			$textParams = explode('|', $match);
			$tmpValue   = $value;

			if (isset($textParams[1]))
			{
				$tmpValue = JHTML::_('string.truncate', $tmpValue, (int) $textParams[1], true, false);
			}

			$layoutData    = array('tag' => $field, 'value' => $tmpValue, 'item' => $item);
			$layoutFile    = 'customfield_editor';
			$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

			$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
			$content     = str_replace($match, $contentHtml, $content);
		}

		return true;
	}
}
