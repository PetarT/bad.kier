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
 * Renders a Image Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Image
 * @since       2.1.13
 *
 */
class ReditemCustomfieldImage extends ReditemCustomfieldGeneric
{
	/**
	 * returns the html code for the form element
	 *
	 * @param   array   $attributes  Attributes for render this field
	 * @param   string  $basePath    Base path for render image
	 *
	 * @return string
	 */
	public function render($attributes = '', $basePath = 'customfield')
	{
		$imageConfig = new JRegistry($this->params);
		$required = (boolean) $imageConfig->get('required');

		if ($required)
		{
			$attributes .= ' class="required"';
		}

		$layoutData = array(
			'id'           => $this->id,
			'fieldcode'    => $this->fieldcode,
			'basepath'     => $basePath,
			'value'        => $this->value,
			'attributes'   => $attributes,
			'imagePreview' => '',
			'alt'          => '',
			'config'       => $imageConfig
		);

		if (!empty($this->value))
		{
			$imageJSON = json_decode($this->value, true);

			if (!empty($imageJSON))
			{
				$tmp  = explode('|', $imageJSON[0]);
				$path = $tmp[0];

				if (!empty($tmp[1]))
				{
					$alt = $tmp[1];
				}
				else
				{
					$alt = '';
				}

				$layoutData['imagePreview'] = JURI::root() . 'media/com_reditem/images/' . $basePath . '/' . $path;
				$layoutData['alt']          = $alt;
			}
		}

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.image', $layoutData, array('component' => 'com_reditem'));
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

		// Prepare data for this item
		$this->prepareData($item);

		$customFieldValues = $item->customfield_values;

		$matches = $matches[0];
		$value = '';

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$value = $customFieldValues[$field->fieldcode];
		}

		foreach ($matches as $match)
		{
			$width     = '';
			$height    = '';
			$tagParams = explode('|', $match);

			// Get "Width" parameter
			if (isset($tagParams[1]))
			{
				$width = (int) $tagParams[1];
			}

			// Get "Height" parameter
			if (isset($tagParams[2]))
			{
				$height = (int) $tagParams[2];
			}

			$imageValue = json_decode($value, true);
			$imageValue = $imageValue[0];
			$tmp        = explode('|', $imageValue);
			$imageValue = $tmp[0];

			if (!empty($tmp[1]))
			{
				$alt = $tmp[1];
			}
			else
			{
				$alt = '';
			}

			$imagePath     = '';
			$thumbnailPath = '';

			if (!empty($imageValue))
			{
				$imagePath = JUri::root() . 'media/com_reditem/images/customfield/' . $imageValue;
			}

			if (($width) || ($height))
			{
				// Auto create thumbnail file
				$tmp = explode('/', $imageValue);
				$fileName = array_pop($tmp);
				$thumbnailPath = ReditemHelperImage::getImageLink($item, 'customfield', $fileName, 'thumbnail', $width, $height, true);
			}

			$layoutData    = array('tag' => $field, 'value' => $imagePath, 'thumb' => $thumbnailPath, 'item' => $item, 'alt' => $alt);
			$layoutFile    = 'customfield_image';
			$layoutOptions = array('component' => 'com_reditem', 'debug' => false);
			$contentHtml   = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
			$content       = str_replace($match, $contentHtml, $content);
		}

		return true;
	}
}
