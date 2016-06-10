<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  CustomField
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_BASE') or die;

/**
 * Renders a Upload file Custom field
 *
 * @package     RedITEM.Component
 * @subpackage  CustomField.File
 * @since       2.0
 *
 */
class ReditemCustomfieldFile extends ReditemCustomfieldGeneric
{
	/**
	 * List of Audio file types
	 *
	 * @var  array
	 */
	protected $audioTypes = ['mp3', 'wav', 'ogg'];

	/**
	 * List of Audio file types
	 *
	 * @var  array
	 */
	protected $videoTypes = ['mp4', 'webm', 'flv', 'wmv'];

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
		$filePreview = [];
		$fileConfig  = new JRegistry($this->params);
		$required    = (boolean) $fileConfig->get('required');

		if ($required)
		{
			$attributes['class'] = ' required';
		}

		if (!empty($this->value))
		{
			$fileJSON = json_decode($this->value, true);

			if ($fileJSON)
			{
				$fileValue = $fileJSON[0];
				$fileName  = JFile::getName($fileValue);

				if (isset($fileJSON[1]))
				{
					$fileName = $fileJSON[1];
				}

				$filePath = JUri::root() . 'media/com_reditem/files/customfield/' . $fileValue;

				$filePreview['filePath'] = $filePath;
				$filePreview['fileName'] = $fileName;
			}
		}

		$layoutData = [
			'fieldcode'   => $this->fieldcode,
			'id'          => $this->id,
			'basepath'    => $basePath,
			'value'       => $this->value,
			'attributes'  => $attributes,
			'filepreview' => $filePreview,
			'config'      => $fileConfig
		];

		$type = RModel::getAdminInstance('Type', ['ignore_request' => true], 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.file', $layoutData, ['component' => 'com_reditem']);
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

		$linkTag  = '{' . $field->fieldcode . '_link}';
		$valueTag = '{' . $field->fieldcode . '_value}';

		if ((strpos($content, $linkTag) === false) && (strpos($content, $valueTag) === false))
		{
			return false;
		}

		// Prepare data for this item
		$this->prepareData($item);

		$customFieldValues = $item->customfield_values;
		$value = ['filePath' => '', 'fileName' => ''];

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$fileJSON = json_decode($customFieldValues[$field->fieldcode], true);

			// Get file path
			if (!empty($fileJSON))
			{
				$value['filePath'] = JURI::root() . 'media/com_reditem/files/customfield/' . $fileJSON[0];
				$value['fileName'] = JFile::getName($value['filePath']);
			}

			// Get file custom name
			if (isset($fileJSON[1]))
			{
				$value['fileName'] = $fileJSON[1];
			}
		}

		// Replace value link
		if (strpos($content, $linkTag) !== false)
		{
			$content = str_replace($linkTag, $value['filePath'], $content);
		}

		// Default layout for file
		$layoutFile = 'customfield_file';

		// Field config params
		$config = new JRegistry($field->params);

		if ($config->get('preview', 1))
		{
			// Check file extension for supported media file type
			$fileExtension = strtolower(JFile::getExt($value['filePath']));

			if (in_array($fileExtension, $this->audioTypes))
			{
				$layoutFile = 'customfield_file_audio';
			}
			elseif (in_array($fileExtension, $this->videoTypes))
			{
				$layoutFile = 'customfield_file_video';
			}
		}

		// Replace value tag
		if (strpos($content, $valueTag) !== false)
		{
			$layoutData    = ['tag' => $field, 'value' => $value, 'item' => $item];
			$layoutOptions = ['component' => 'com_reditem', 'debug' => false];
			$contentHtml   = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);
			$content       = str_replace($valueTag, $contentHtml, $content);
		}

		return true;
	}
}
