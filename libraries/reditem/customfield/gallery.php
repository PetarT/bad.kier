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
 * Renders a Gallery Custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.Gallery
 * @since       2.1.13
 *
 */
class ReditemCustomfieldGallery extends ReditemCustomfieldGeneric
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
		$divId             = 'imgfield_' . $this->fieldcode . '_' . $this->id;
		$fieldName         = 'cform[gallery][' . $this->fieldcode . '_file]';
		$value             = $this->value;
		$imageData         = array();
		$index             = 0;
		$config            = array();
		$defaultImageIndex = 0;
		$layoutOptions     = array('component' => 'com_reditem');
		$config            = new JRegistry($this->params);

		$required = (boolean) $config->get('required');
		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		if ($required)
		{
			$attributes['class'] = ' required';
		}

		if ($value)
		{
			$imageArray = json_decode($value, true);

			if (!empty($imageArray))
			{
				foreach ($imageArray as $imageIndex => $image)
				{
					if (!empty($image))
					{
						$imagePath = $image;

						if (is_array($image))
						{
							$imagePath = $image['path'];

							if ($image['default'])
							{
								$defaultImageIndex = (int) $imageIndex;
							}

							// Image alt
							if (isset($image['alt']))
							{
								$imageAlt = $image['alt'];
							}
						}

						$layoutData = array(
							'basepath' 	=> $basePath,
							'fieldcode' => $this->fieldcode,
							'image' 	=> $imagePath,
							'index' 	=> $index,
							'default'   => (boolean) $image['default'],
							'config' 	=> $config,
							'imageAlt'  => (isset($imageAlt)) ? $imageAlt : null
						);

						$imageData[] = ReditemHelperLayout::render($type, 'customfields.gallery_item', $layoutData, $layoutOptions);
						$index++;
					}
				}
			}
		}

		$layoutData = array(
			'fieldcode'    => $this->fieldcode,
			'index'        => $index,
			'divId'        => $divId,
			'imageData'    => $imageData,
			'config'       => $config,
			'defaultImage' => $defaultImageIndex
		);

		return ReditemHelperLayout::render($type, 'customfields.gallery', $layoutData, $layoutOptions);
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
		$index   = 0;

		if (isset($customFieldValues[$field->fieldcode]))
		{
			$value = $customFieldValues[$field->fieldcode];
		}

		foreach ($matches as $match)
		{
			$width       = '';
			$height      = '';
			$displayType = '';
			$contentHtml = '';
			$tmpMatch    = str_replace('{', '', $match);
			$tmpMatch    = str_replace('}', '', $tmpMatch);
			$params      = explode('|', $tmpMatch);

			// Get "Width" parameter
			if (isset($params[1]))
			{
				$width = (int) $params[1];
			}

			// Get "Height" parameter
			if (isset($params[2]))
			{
				$height = (int) $params[2];
			}

			// Get "Display Type" parameter
			if (isset($params[3]))
			{
				$displayType = $params[3];
			}

			$images = json_decode($value, true);

			if ($displayType == 'slider')
			{
				$contentHtml = $this->generateSlider($index, $images, $content, $field, $item, $width, $height);
			}
			else
			{
				$contentHtml = $this->generateColorBox($index, $images, $content, $field, $item, $width, $height);
			}

			$content = str_replace($match, $contentHtml, $content);
			$index++;
		}

		return true;
	}

	/**
	 * Method for generate slider for customfield gallery
	 *
	 * @param   int     $index      Index
	 * @param   array   $imageList  Array of images
	 * @param   string  $content    HTML content
	 * @param   object  $field      Field object data
	 * @param   object  $item       Item object data
	 * @param   int     $width      Thumbnail width
	 * @param   int     $height     Thumbnail height
	 *
	 * @return  string              Generated HTML content
	 */
	private function generateSlider($index, $imageList, $content, $field, $item, $width = 0, $height = 0)
	{
		$html = '';

		if (empty($imageList) || empty($content) || !$field || !$item)
		{
			return $html;
		}

		$width  = (int) $width;
		$height = (int) $height;
		$images = array();

		foreach ($imageList as $image)
		{
			if (empty($image) && ($width || $height))
			{
				$imagePath = ReditemHelperImage::getImageLink($item, 'customfield', $fileName, 'thumbnail', $width, $height, false);
			}
			elseif (!empty($image))
			{
				$imagePath = $image;

				if (is_array($image))
				{
					$imagePath = $image['path'];
				}

				$imagePath = JURI::base() . 'media/com_reditem/images/customfield/' . $imagePath;

				if ($width || $height)
				{
					$tmp      = explode('/', $imagePath);
					$fileName = array_pop($tmp);
					$imagePath = ReditemHelperImage::getImageLink($item, 'customfield', $fileName, 'thumbnail', $width, $height, false);
				}
				else
				{
					$imagePath = '<img src="' . $imagePath . '" />';
				}
			}
			else
			{
				continue;
			}

			$images[] = $imagePath;
		}

		$layoutData = array(
			'tag'       => $field,
			'value'     => $images,
			'reditemId' => $item->id,
			'index'     => $index,
			'width'     => $width,
			'item'      => $item
		);
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		$html = ReditemHelperLayout::render($item->type, 'customfield_gallery_slider', $layoutData, $layoutOptions);

		return $html;
	}

	/**
	 * Method for generate colorbox for customfield gallery
	 *
	 * @param   int     $index      Index
	 * @param   array   $imageList  Array of images
	 * @param   string  $content    HTML content
	 * @param   object  $field      Field object data
	 * @param   object  $item       Item object data
	 * @param   int     $width      Thumbnail width
	 * @param   int     $height     Thumbnail height
	 *
	 * @return  string              Generated HTML content
	 */
	private function generateColorBox($index, $imageList, $content, $field, $item, $width = 0, $height = 0)
	{
		$html = '';

		if (empty($imageList) || empty($content) || !$field || !$item)
		{
			return $html;
		}

		$width      = (int) $width;
		$height     = (int) $height;
		$imagesPath = array();
		$firstImage = array();
		$imagePath  = JURI::base() . 'media/com_reditem/images/customfield/';

		foreach ($imageList as $key => $image)
		{
			if (empty($image))
			{
				unset($imageList[$key]);

				continue;
			}

			// Image value is array, since 2.1.3
			if (is_array($image) && !empty($image['path']))
			{
				if ($image['default'])
				{
					$firstImage['original'] = $imagePath . $image['path'];
					if (isset($image['alt']))
					{
						$firstImage['alt'] = $image['alt'];
					}
				}
				else
				{
					$imagesPath[] = $imagePath . $image['path'];
				}

				# Alt
				if (isset($image['alt']))
				{
					$imagesAlt[$key] = $image['alt'];
				}
			}
			else
			{
				$imagesPath[] = $imagePath . $image;						
			}
		}

		// If default image has not been set. Make the first image in gallery become default image.
		if (empty($firstImage))
		{
			$firstImage['original'] = $imagesPath[0];
			unset($imagesPath[0]);
		}

		// Create thumbnail file for first image
		if ($width || $height)
		{
			$tmp      = explode('/', $firstImage['original']);
			$fileName = array_pop($tmp);
			$firstImage['thumbnail'] = ReditemHelperImage::getImageLink($item, 'customfield', $fileName, 'thumbnail', $width, $height, true);
		}
		else
		{
			$firstImage['thumbnail'] = $firstImage['original'];
		}

		$layoutData = array(
			'tag'        => $field,
			'value'      => $imagesPath,
			'alts'		 => (isset($imagesAlt)) ? $imagesAlt : '',
			'firstImage' => $firstImage,
			'reditemId'  => $item->id,
			'index'      => $index,
			'item'       => $item
		);
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		return ReditemHelperLayout::render($item->type, 'customfield_gallery', $layoutData, $layoutOptions);
	}
}