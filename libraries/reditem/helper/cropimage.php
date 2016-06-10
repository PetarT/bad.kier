<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Helpers
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;
include_once JPATH_LIBRARIES . '/redcore/joomla/image/image.php';

/**
 * RedITEM Cropping Image Feature Helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helpers.CropImage
 * @since       2.1
 *
 */
class ReditemHelperCropimage
{
	/**
	 * cropImage function
	 *
	 * @param   string  $imageFile      Image filename
	 * @param   string  $path           Path of image
	 * @param   int     $top            Top position
	 * @param   int     $left           Left position
	 * @param   int     $width          Width of image
	 * @param   int     $height         Height of image
	 * @param   int     $previewWidth   Width of preview image
	 * @param   int     $previewHeight  Height of preview image
	 *
	 * @return  bool
	 */
	public static function cropImage($imageFile, $path, $top, $left, $width, $height, $previewWidth = 300, $previewHeight = 300)
	{
		list($realWidth, $realHeight, $type, $attr) = getimagesize($path . $imageFile);

		$rate = $realWidth / $previewWidth;

		$top  = (int) $top * $rate;
		$left = (int) $left * $rate;

		$width  = (int) ($width * $rate);
		$height = (int) ($height * $rate);

		$image         = new JImage($path . $imageFile);
		$fileExtension = JFile::getExt($path . $imageFile);

		$result = $image->crop($width, $height, $left, $top, false);

		// Process on image mime
		$imageProperties = JImage::getImageFileProperties($path . $imageFile);
		$imageMime       = strtolower($imageProperties->mime);
		$imageType       = null;
		$imageOptions    = array();

		if (($imageMime == 'image/jpeg') || ($imageMime == 'image/jpg'))
		{
			$imageType = IMAGETYPE_JPEG;
			$imageOptions['quality'] = 100;
		}
		elseif ($imageMime == 'image/png')
		{
			$imageType = IMAGETYPE_PNG;

			// 1-9 for compression. 0 is not compression. 1 is fastest but larger file, 9 is slowest but smaller file
			$imageOptions['quality'] = 0;
		}
		elseif ($imageMime == 'image/gif')
		{
			$imageType = IMAGETYPE_GIF;
		}

		return $result->toFile($path . $imageFile, $imageType, $imageOptions);
	}
}
