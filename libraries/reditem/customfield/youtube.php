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
 * @subpackage  CustomField.Youtube
 * @since       2.1.13
 *
 */
class ReditemCustomfieldYoutube extends ReditemCustomfieldGeneric
{
	/**
	 * Returns the html code for the form element
	 *
	 * @param   string  $attributes  Field description
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

		$attributes .= ' placeholder="' . $this->name . '"';

		$layoutData = array(
			'fieldcode'           => $this->fieldcode,
			'value'               => $this->value,
			'attributes'          => $attributes,
			'isLimitGuideEnabled' => $this->isLimitGuideEnabled,
			'limit'               => $this->limit,
			'fieldType'           => $this->type
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.textbox', $layoutData, array('component' => 'com_reditem'));
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

		// Prepare data
		$this->prepareData($item);

		$matches = array();

		if (preg_match_all('/{' . $field->fieldcode . '_value[^}]*}/i', $content, $matches) <= 0)
		{
			return false;
		}

		$matches = $matches[0];
		$value   = '';

		if (isset($item->customfield_values[$field->fieldcode]))
		{
			$value = $item->customfield_values[$field->fieldcode];
		}

		foreach ($matches as $match)
		{
			$width     = 400;
			$height    = 250;
			$tagParams = explode('|', $match);

			// Get 'Width' parameter
			if (isset($tagParams[1]))
			{
				$width = (int) $tagParams[1];
			}

			// Get 'Height' parameter
			if (isset($tagParams[2]))
			{
				$height = (int) $tagParams[2];
			}

			$layoutData = array(
				'tag'       => $field,
				'value'     => $value,
				'width'     => $width,
				'height'    => $height,
				'item'      => $item
			);
			$layoutFile    = 'customfield_youtube';
			$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

			$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
			$content = str_replace($match, $contentHtml, $content);
		}

		return true;
	}
}
