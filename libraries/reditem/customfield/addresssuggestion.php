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
 * Renders a Address Suggestion Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.AddressSuggestion
 * @since       2.1.16
 *
 */
class ReditemCustomfieldAddresssuggestion extends ReditemCustomfieldGeneric
{
	/**
	 * SQL script for column data
	 *
	 * @var  string
	 */
	public $sqlColumnData = ' VARCHAR(255) NOT NULL DEFAULT \'\'';

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
		$this->isLimitGuideEnabled = $params->get('enable_limit_guide', '1');
		$this->limit = (int) $params->get('limit', '100');
		$required = (boolean) $params->get('required');

		if ($required)
		{
			$attributes .= ' class="required"';
		}

		if ($this->isLimitGuideEnabled && ($this->type != 'youtube'))
		{
			$attributes .= ' maxlength="' . $this->limit . '"';
		}

		$attributes .= ' placeholder="' . $this->name . '"';

		$layoutData = array(
			'field'      => $this,
			'attributes' => $attributes
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.addresssuggestion.edit', $layoutData, array('component' => 'com_reditem'));
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

		$tag = '{' . $field->fieldcode . '_value}';

		if (strpos($content, $tag) === false)
		{
			return false;
		}

		$this->prepareData($item);
		$value   = '';

		if (isset($item->customfield_values[$field->fieldcode]))
		{
			$value = $item->customfield_values[$field->fieldcode];
		}

		$layoutData    = array('tag' => $field, 'value' => $value, 'item' => $item);
		$layoutFile    = 'customfields.addresssuggestion.view';
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
		$content     = str_replace($tag, $contentHtml, $content);

		return true;
	}
}
