<?php
/**
 * @package     RedITEM
 * @subpackage  Plugin
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

jimport('joomla.plugin.plugin');

// Load redCORE library
$redcoreLoader = JPATH_LIBRARIES . '/redcore/bootstrap.php';

if (!file_exists($redcoreLoader) || !JPluginHelper::isEnabled('system', 'redcore'))
{
	throw new Exception(JText::_('COM_REDITEM_REDCORE_INIT_FAILED'), 404);
}

include_once $redcoreLoader;

RBootstrap::bootstrap();

require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/helper.php';
require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/fileupload.php';
require_once JPATH_ADMINISTRATOR . '/components/com_reditemcategoryfields/helpers/helper.php';

/**
 * Plugins RedITEM Category Fields
 *
 * @since  2.0
 */
class PlgReditem_CategoriesCategory_Fields extends JPlugin
{
	/**
	 * Constructor - note in Joomla 2.5 PHP4.x is no longer supported so we can use this.
	 *
	 * @param   object  &$subject  The object to observe
	 * @param   array   $config    An array that holds the plugin configuration
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);
		$this->loadLanguage();
	}

	/**
	 * Event before edit an category
	 *
	 * @param   object  $category  Category object
	 *
	 * @return  boolean/array
	 */
	public function prepareCategoryEdit($category)
	{
		$typeId = $category->type_id;

		if ((!$typeId))
		{
			return false;
		}

		$categoryFieldsModel = RModel::getAdminInstance('CategoryFields', array('ignore_request' => true), 'com_reditemcategoryfields');
		$categoryFieldsModel->setState('filter.published', 1);
		$categoryFieldsModel->setState('filter.itemtypes', $typeId);
		$rows = $categoryFieldsModel->getItems();

		if (!$rows)
		{
			return false;
		}

		$categoryData = ReditemCategoryFieldsHelper::getFieldsData($category->id);

		if (!empty($categoryData))
		{
			$categoryData = $categoryData[0];
		}

		$categoryData = (array) $categoryData;

		$fields = array();

		foreach ($rows AS $row)
		{
			$field = ReditemHelperCustomfield::getCustomField($row->type);
			$field->bind($row);

			if (($categoryData) && isset($categoryData[$row->fieldcode]))
			{
				$field->value = $categoryData[$row->fieldcode];
			}

			$fieldRenderHTML = '';

			switch ($field->type)
			{
				case 'image':
				case 'gallery':
					$fieldRenderHTML = $field->render('', 'categoryfield');
					break;

				default:
					$fieldRenderHTML = $field->render();
					break;
			}

			$renderHTML = '<div class="control-group">
				<div class="control-label">' . $field->getLabel() . '</div>
				<div class="controls">' . $fieldRenderHTML . '</div>
				</div>';

			$fields[] = $renderHTML;
		}

		return $fields;
	}

	/**
	 * Event before edit an category
	 *
	 * @param   object   $category  Category object
	 * @param   object   $input     An input oject JInput
	 * @param   boolean  $isNew     True on create new, False on edit.
	 *
	 * @return  void
	 */
	public function onAfterCategorySave($category, $input, $isNew)
	{
		$typeId = $category->type_id;
		$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		if ((!$typeId))
		{
			return;
		}

		$db = JFactory::getDBO();
		$cform = $input->get_Array('cform', null);
		$jform = $input->get_Array('jform', null);
		$imageFilesCustomField = $input->files->get('cform');
		$imageFolder = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $category->id . '/';
		$cfDataTable = $db->quoteName('#__reditem_category_fields_value');

		$customFieldUploadFiles = $input->files->get('cform');

		// Create folder if not exists
		if (!JFolder::exists($imageFolder))
		{
			JFolder::create($imageFolder);
		}

		// Remove [image] custom field - Checked
		if (isset($jform['customfield_image_rm']))
		{
			foreach ($jform['customfield_image_rm'] as $customFieldImageRemove)
			{
				$tmpImageName = json_decode($cform['image'][$customFieldImageRemove], true);
				$tmpImageName = $tmpImageName[0];
				$tmpImagePath = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $tmpImageName;

				echo $tmpImagePath;

				if (JFile::exists($tmpImagePath))
				{
					JFile::delete($tmpImagePath);
				}

				// Remove this image from values array
				$cform['image'][$customFieldImageRemove] = '';
			}
		}

		// Remove [gallery] custom field - Checked
		if (isset($jform['customfield_gallery_rm']))
		{
			foreach ($jform['customfield_gallery_rm'] as $cfGallery => $cfImagesRemove)
			{
				$tmpImages = $cform['gallery'][$cfGallery];

				if ($cfImagesRemove)
				{
					foreach ($cfImagesRemove as $cfImage)
					{
						if ($cfImage)
						{
							$tmpImagePath = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $cfImage;

							// Remove this image from values array
							$key = array_search($cfImage, $cform['gallery'][$cfGallery]);
							unset($cform['gallery'][$cfGallery][$key]);

							if (JFile::exists($tmpImagePath))
							{
								JFile::delete($tmpImagePath);
							}
						}
					}
				}
			}
		}

		// Process on Media field
		if (isset($cform['image_media']))
		{
			foreach ($cform['image_media'] as $imageField => $imageLink)
			{
				if (!empty($imageLink))
				{
					// Choose from media manager
					$mediaImageSource = JPATH_SITE . '/' . $imageLink;
					$mediaTmp = explode("/", $imageLink);
					$mediaTmp = array_reverse($mediaTmp);
					$mediaImageFilename = array_shift($mediaTmp);
					$mediaImageDestination = $imageFolder . $mediaImageFilename;

					// Remove old item image
					if ($mediaImageDestination && JFile::exists($mediaImageDestination))
					{
						JFile::delete($mediaImageDestination);
					}

					JFile::copy($mediaImageSource, $mediaImageDestination);

					if (isset($imageFilesCustomField['image'][$imageField]))
					{
						unset($imageFilesCustomField['image'][$imageField]);
					}

					$cform['image'][$imageField] = json_encode(array($category->id . '/' . $mediaImageFilename));
				}
			}

			unset($cform['image_media']);
		}

		// Upload / Save [Image] custom fields
		if (isset($customFieldUploadFiles['image']))
		{
			$imageFilesCustomField = $customFieldUploadFiles['image'];

			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $category->id . '/';

			if (!JFolder::exists($imageFolder))
			{
				JFolder::create($imageFolder);
			}

			foreach ($imageFilesCustomField AS $imageField => $imageData)
			{
				$imageFieldName = substr($imageField, 0, -5);

				// Process dragndrop image
				if (count($cform['dragndrop'][$imageFieldName])
					&& JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0])))
				{
					$cform['image'][$imageFieldName] = json_encode(array($category->id . '/' . JString::trim($cform['dragndrop'][$imageFieldName][0])));

					// Move file from temporary folder to file folder
					$sourceFile = $temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]);
					$destinationFile = $imageFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]);
					JFile::move($sourceFile, $destinationFile);
				}

				if (isset($imageData['name']) && $imageData['size'] > 0)
				{
					// Single image upload for "Image" field
					$result = ReditemHelpersFileUpload::uploadFile($imageData, $imageFolder, 2, 'jpg,jpeg,gif,png');

					if ($result)
					{
						if (!empty($cform['image'][$imageFieldName]))
						{
							$tmpOldImageFileName = json_decode($cform['image'][$imageFieldName]);

							$tmpOldImageFile = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $tmpOldImageFileName[0];

							if (JFile::exists($tmpOldImageFile))
							{
								JFile::delete($tmpOldImageFile);
							}
						}

						$cform['image'][$imageFieldName] = json_encode(array($category->id . '/' . $result['mangled_filename']));
					}

					unset($cform['image'][$imageField]);
				}
				else
				{
					unset($cform['image'][$imageField]);
				}
			}
		}

		// Upload / Save [File] custom fields
		if (isset($customFieldUploadFiles['file']))
		{
			$fileFolder = JPATH_ROOT . '/media/com_reditem/files/categoryfield/' . $category->id . '/';
			$maxFileSize = 5;
			$allowedExtension = null;
			$allowedMIME = null;
			$useCustomFileName = true;

			if (!JFolder::exists($fileFolder))
			{
				JFolder::create($fileFolder);
			}

			foreach ($customFieldUploadFiles['file'] AS $fileField => $fileData)
			{
				$fileFieldName = substr($fileField, 0, -5);
				$fileFieldFileName = $jform['cform']['file'][$fileFieldName];

				// Process dragndrop upload file
				if (count($cform['dragndrop'][$fileFieldName])
					&& JString::trim($cform['dragndrop'][$fileFieldName][0])
					&& JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0])))
				{
					$customFieldUploadValue = array(
						$category->id . '/' . JString::trim($cform['dragndrop'][$fileFieldName][0]),
						$fileFieldFileName
					);
					$cform['file'][$fileFieldName] = json_encode($customFieldUploadValue);

					// Move file from temporary folder to file folder
					$sourceFile = $temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]);
					$destinationFile = $fileFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]);
					JFile::move($sourceFile, $destinationFile);
				}

				if (isset($fileData['name']) && $fileData['size'] > 0)
				{
					// Single image upload for "Image" field
					$result = ReditemHelpersFileUpload::uploadFile($fileData, $fileFolder, $maxFileSize, $allowedExtension, $allowedMIME, $useCustomFileName);

					if ($result)
					{
						if (!empty($cform['file'][$fileFieldName]))
						{
							$oldFileName = json_decode($cform['file'][$fileFieldName]);

							$oldFilePath = JPATH_ROOT . '/media/com_reditem/files/categoryfield/' . $oldFileName[0];

							if (JFile::exists($oldFilePath))
							{
								JFile::delete($oldFilePath);
							}
						}

						$cform['file'][$fileFieldName] = json_encode(array($category->id . '/' . $result['mangled_filename']));
					}

					unset($cform['file'][$fileField]);
				}
				else
				{
					unset($cform['file'][$fileField]);
				}
			}
		}

		/*
		 * Process on [Url] custom field
		 */
		if (isset($cform['url']) && is_array($cform['url']))
		{
			foreach ($cform['url'] as $fieldName => $linkUrl)
			{
				$linkTitle = $linkUrl;

				if (isset($jform['cform']['url'][$fieldName]) && ($jform['cform']['url'][$fieldName]))
				{
					$linkTitle = $jform['cform']['url'][$fieldName];
				}

				$linkValue = array($linkUrl, $linkTitle);

				$cform['url'][$fieldName] = json_encode($linkValue);
			}
		}

		// Process on use media file for [Gallery] custom fields
		if (isset($cform['gallery_media']))
		{
			foreach ($cform['gallery_media'] as $galleryMediaField => $galleryMediaData)
			{
				$galleryMediaFieldName = substr($galleryMediaField, 0, -5);

				if (is_array($galleryMediaData) && !empty($galleryMediaData))
				{
					$tmpGalleryMediaImages = array();

					foreach ($galleryMediaData as $key => $galleryMediaImage)
					{
						if (!empty($galleryMediaImage))
						{
							$tmpMediaSource = explode("/", $galleryMediaImage);
							$tmpMediaSource = array_reverse($tmpMediaSource);
							$tmpMediaImageFilename = array_shift($tmpMediaSource);

							$oldImageMedia = JPATH_SITE . '/' . $galleryMediaImage;
							$newImageMedia = $imageFolder . $tmpMediaImageFilename;

							// Remove old file if exist
							if (JFile::exists($newImageMedia))
							{
								JFile::delete($newImageMedia);
							}

							JFile::copy($oldImageMedia, $newImageMedia);

							$tmpGalleryMediaImages[] = $category->id . '/' . $tmpMediaImageFilename;

							// Remove field
							if (isset($customFieldUploadFiles['gallery'][$galleryMediaField][$key]))
							{
								unset($customFieldUploadFiles['gallery'][$galleryMediaField][$key]);
							}
						}

						unset($galleryMediaData[$key]);
					}
				}

				// Check if there are any images exist in this gallery.
				$oldGalleryImages = $cform['gallery'][$galleryMediaFieldName];

				if (is_array($oldGalleryImages) && !empty($oldGalleryImages))
				{
					// Merge old image with new upload images.
					$tmpGalleryMediaImages = array_merge($oldGalleryImages, $tmpGalleryMediaImages);
				}

				$cform['gallery'][$galleryMediaFieldName] = $tmpGalleryMediaImages;

				unset($cform['gallery_media'][$galleryMediaField]);
			}

			unset($cform['gallery_media']);
		}

		// Upload / Save [Gallery] custom fields
		if (isset($customFieldUploadFiles['gallery']))
		{
			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $category->id . '/';

			if (!JFolder::exists($imageFolder))
			{
				JFolder::create($imageFolder);
			}

			foreach ($customFieldUploadFiles['gallery'] AS $galleryField => $galleryData)
			{
				$galleryFieldName = substr($galleryField, 0, -5);

				foreach ($galleryData AS $imageData)
				{
					if (isset($imageData['name']) && $imageData['size'] > 0)
					{
						$result = ReditemHelpersFileUpload::uploadFile($imageData, $imageFolder, 2, 'jpg,jpeg,gif,png');

						if ($result)
						{
							$cform['gallery'][$galleryFieldName][] = $category->id . '/' . $result['mangled_filename'];
						}
					}
				}

				// Clean empty string
				foreach ($cform['gallery'][$galleryFieldName] as $index => $galleryFieldValue)
				{
					if (empty($cform['gallery'][$galleryFieldName][$index]))
					{
						unset($cform['gallery'][$galleryFieldName][$index]);
					}
				}

				$cform['gallery'][$galleryFieldName] = json_encode($cform['gallery'][$galleryFieldName]);

				if (isset($cform['gallery'][$galleryField]))
				{
					unset($cform['gallery'][$galleryField]);
				}
			}
		}

		// Prepare value string for insert into database
		foreach ($cform['gallery'] as $col => $value)
		{
			if (!is_array($value))
			{
				$value = array($value);
			}

			if (count($cform['dragndrop'][$col]) && JString::trim($cform['dragndrop'][$col][0]))
			{
				$dragndropData = explode(',', JString::trim($cform['dragndrop'][$col][0]));

				if (count($dragndropData))
				{
					foreach ($dragndropData as $dragKey => $dragValue)
					{
						if (JString::trim($dragValue))
						{
							if (JFile::exists($temporaryFolder . $dragValue))
							{
								$value[] = $category->id . '/' . $dragValue;
								JFile::move($temporaryFolder . $dragValue, $imageFolder . $dragValue);
							}
						}
					}
				}
			}

			if (!empty($value))
			{
				// Remove empty value
				foreach ($value as $key => $val)
				{
					if (empty($val))
					{
						unset($value[$key]);
					}
				}

				// Reset key for array values
				$value = array_values($value);

				$cform['gallery'][$col] = json_encode($value);
			}
		}

		unset($cform['dragndrop']);

		// Insert custom field value
		if (count($cform))
		{
			// Remove current custom field value of this category
			$query = $db->getQuery(true)
				->delete($cfDataTable)
				->where($db->quoteName('cat_id') . ' = ' . $db->quote($category->id));
			$db->setQuery($query);
			$db->execute();

			// Insert new data row for this category
			$query = $db->getQuery(true)
				->insert($cfDataTable)
				->columns($db->quoteName('cat_id'))
				->values($db->quote($category->id));
			$db->setQuery($query);
			$db->execute();

			$query = $db->getQuery(true)
				->update($cfDataTable);

			foreach ($cform AS $group)
			{
				foreach ($group AS $col => $val)
				{
					$val = (is_array($val)) ? json_encode($val) : $val;
					$query->set($db->quoteName($col) . ' = ' . $db->quote($val));
				}
			}

			$query->where($db->quoteName('cat_id') . ' = ' . $db->quote($category->id));

			$db->setQuery($query);

			if ($db->execute())
			{
				$result = true;
			}
			else
			{
				$result = false;
			}
		}
	}

	/**
	 * Event before edit an category, add extra tags.
	 *
	 * @param   array   &$categoryTags  Category tags list
	 * @param   object  $template       Template object
	 * @param   string  $prefix         Prefix of tags
	 *
	 * @return  void
	 */
	public function prepareCategoryTemplateTag(&$categoryTags, $template, $prefix = '')
	{
		$typeId = $template->type_id;

		if (($typeId))
		{
			$categoryFieldsModel = RModel::getAdminInstance('CategoryFields', array('ignore_request' => true), 'com_reditemcategoryfields');
			$categoryFieldsModel->setState('filter.published', 1);
			$categoryFieldsModel->setState('filter.itemtypes', $typeId);
			$fields = $categoryFieldsModel->getItems();

			if ($fields)
			{
				foreach ($fields as $field)
				{
					$tag = '{' . $prefix . 'category_extra_' . $field->fieldcode . '_text}';
					$tagDesc = JText::sprintf('COM_REDITEM_TEMPLATE_TAG_FIELD_' . strtoupper($field->type) . '_TITLE', $field->name);
					$categoryTags[$tag] = $tagDesc;

					$tagParams = JText::_('COM_REDITEM_TEMPLATE_TAG_FIELD_' . strtoupper($field->type) . '_PARAMS');
					$tag = '{' . $prefix . 'category_extra_' . $field->fieldcode . '_value' . $tagParams . '}';
					$tagDesc = JText::sprintf('COM_REDITEM_TEMPLATE_TAG_FIELD_' . strtoupper($field->type) . '_VALUE', $field->name);
					$categoryTags[$tag] = $tagDesc;

					if (($field->type == 'file') || ($field->type == 'url'))
					{
						$tagLink = JText::_('COM_REDITEM_TEMPLATE_TAG_FIELD_' . strtoupper($field->type) . '_LINK');
						$tag = '{' . $prefix . 'category_extra_' . $field->fieldcode . '_link}';
						$tagDesc = JText::sprintf('COM_REDITEM_TEMPLATE_TAG_FIELD_' . strtoupper($field->type) . '_LINK_VALUE', $field->name);
						$categoryTags[$tag] = $tagDesc;
					}
				}
			}
		}
	}

	/**
	 * Front-site. Event run when replace tag of template
	 *
	 * @param   string  &$content  Content template
	 * @param   array   $category  Category data array
	 * @param   string  $prefix    Prefix of tags
	 *
	 * @return  void
	 */
	public function onReplaceCategoryTag(&$content, $category, $prefix = '')
	{
		$typeId = $category->type_id;

		if ((!$typeId))
		{
			return;
		}

		if (!isset($category->type))
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$category->type = $typeModel->getItem($category->type_id);
		}

		$tagReplaces = array();

		// Get list of custom fields
		$categoryFieldsModel = RModel::getAdminInstance('CategoryFields', array('ignore_request' => true), 'com_reditemcategoryfields');
		$categoryFieldsModel->setState('filter.published', 1);
		$categoryFieldsModel->setState('filter.itemtypes', $typeId);
		$fields = $categoryFieldsModel->getItems();

		if (empty($fields))
		{
			return;
		}

		// Get custom field values
		$customFieldValues = ReditemCategoryFieldsHelper::getFieldsData($category->id);

		if (isset($customFieldValues[0]))
		{
			$customFieldValues = (array) $customFieldValues[0];
		}

		foreach ($fields as $tag)
		{
			// Replace the title tag
			$tagString = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_text}';
			$content   = str_replace($tagString, $tag->name, $content);

			// Replace the value tag
			$layoutFile    = 'customfield_' . $tag->type;
			$tagString     = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value}';
			$layoutOptions = array('component' => 'com_reditemcategoryfields');

			switch ($tag->type)
			{
				case 'checkbox':
					$fieldOptionsTmp	= trim($tag->options);
					$fieldOptionsTmp	= explode("\n", $fieldOptionsTmp);
					$optionsData		= array();
					$fieldOptions		= array();

					if ($fieldOptionsTmp)
					{
						foreach ($fieldOptionsTmp as $option)
						{
							$option     = explode('|', trim($option));
							$opt        = new stdClass;
							$opt->text  = (isset($option[1])) ? $option[1] : $option[0];
							$opt->value = $option[0];
							$fieldOptions[$opt->value] = $opt;
						}
					}

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$itemValues = json_decode($customFieldValues[$tag->fieldcode], true);

						if (is_array($itemValues) && count($itemValues))
						{
							foreach ($itemValues as $value)
							{
								if (isset($fieldOptions[$value]))
								{
									$optionsData[] = $fieldOptions[$value];
								}
							}
						}
					}

					$layoutData  = array('tag' => $tag, 'value' => $optionsData);
					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);

					$tagReplaces[$tagString] = $contentHtml;
					break;

				case 'date':
					$value = '';

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$dateValue  = new JDate($customFieldValues[$tag->fieldcode]);
						$tagParams  = new JRegistry($tag->params);
						$dateFormat = $tagParams->get('dateFormat', 'Y - m - d');
						$value      = $dateValue->format($dateFormat);
					}

					$layoutData = array('tag' => $tag, 'value' => $value);
					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);

					$tagReplaces[$tagString] = $contentHtml;
					break;

				case 'editor':
				case 'text':
				case 'textarea':
					$matches = array();
					$preg = '/{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value[^}]*}/i';

					if (preg_match_all($preg, $content, $matches) > 0)
					{
						$matches = $matches[0];

						foreach ($matches as $match)
						{
							$textParams = explode('|', $match);
							$value = '';

							if (isset($customFieldValues[$tag->fieldcode]))
							{
								$value = $customFieldValues[$tag->fieldcode];
							}

							if (isset($textParams[1]))
							{
								$value = JHTML::_('string.truncate', $value, (int) $textParams[1], true, false);
							}

							$layoutData = array('tag' => $tag, 'value' => $value);
							$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
							$tagReplaces[$match] = $contentHtml;
						}
					}
					break;

				case 'file':
					$value = array('filePath' => '', 'fileName' => '');

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$fileJSON = json_decode($customFieldValues[$tag->fieldcode], true);

						// Get file path
						if (!empty($fileJSON))
						{
							$value['filePath'] = JURI::root() . 'media/com_reditem/files/categoryfield/' . $fileJSON[0];
							$value['fileName'] = JFile::getName($value['filePath']);
						}

						// Get file custom name
						if (isset($fileJSON[1]))
						{
							$value['fileName'] = $fileJSON[1];
						}
					}

					// Replace value link
					$tagString = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_link}';
					$tagReplaces[$tagString] = $value['filePath'];

					// Replace value tag
					$tagString = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value}';
					$layoutData = array('tag' => $tag, 'value' => $value);
					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);

					$tagReplaces[$tagString] = $contentHtml;
					break;

				case 'image':
					$preg = '/{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value[^}]*}/i';
					$value = '';
					$matches = array();

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
					}

					if (preg_match_all($preg, $content, $matches) > 0)
					{
						$matches = $matches[0];

						foreach ($matches as $match)
						{
							$width       = '';
							$height      = '';
							$contentHtml = '';
							$fieldParams = explode('|', $match);

							// Get "Width" parameter
							if (isset($fieldParams[1]))
							{
								$width = (int) $fieldParams[1] . 'px';
							}

							// Get "Height" parameter
							if (isset($fieldParams[2]))
							{
								$height = (int) $fieldParams[2] . 'px';
							}

							$imageValue = json_decode($value, true);
							$imageValue = $imageValue[0];

							if (!empty($imageValue))
							{
								$imagePath     = JURI::base() . 'media/com_reditem/images/categoryfield/' . $imageValue;
								$thumbnailPath = '';

								if (($width) || ($height))
								{
									// Auto create thumbnail file
									$tmp = explode('/', $imageValue);
									$fileName = array_pop($tmp);
									$thumbnailPath = ReditemHelperImage::getImageLink($category, 'categoryfield', $fileName, 'thumbnail', $width, $height, true);
								}

								$layoutData = array('tag' => $tag, 'value' => $imagePath, 'thumb' => $thumbnailPath);
								$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
							}

							$tagReplaces[$match] = $contentHtml;
						}
					}
					break;

				case 'gallery':
					$preg		= '/{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value[^}]*}/i';
					$value		= '';
					$matches	= array();

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
					}

					if (preg_match_all($preg, $content, $matches) > 0)
					{
						$matches = $matches[0];
						$index   = 0;

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

							$imageList = json_decode($value, true);

							if (!empty($imageList))
							{
								// For "Slider"
								if ($displayType == 'slider')
								{
									$images = array();

									foreach ($imageList as $image)
									{
										if (!empty($image))
										{
											$imagePath = '<img src="' . JURI::base() . 'media/com_reditem/images/categoryfield/' . $image . '" />';

											if (($width) || ($height))
											{
												$tmp = explode('/', $image);
												$fileName = array_pop($tmp);
												$imagePath = ReditemHelperImage::getImageLink(
													$category,
													'categoryfield',
													$fileName,
													'thumbnail',
													$width,
													$height,
													false
												);
											}

											$images[] = $imagePath;
										}
									}

									$layoutData = array(
										'tag'       => $tag,
										'value'     => $images,
										'reditemId' => $category->id,
										'index'     => $index,
										'width'     => $width
									);

									$contentHtml = ReditemHelperLayout::render(
										$category->type,
										$layoutFile . '_slider',
										$layoutData,
										$layoutOptions
									);
								}
								// Default is "Colorbox"
								else
								{
									$first      = true;
									$firstImage = '';
									$images     = array();

									foreach ($imageList as $image)
									{
										if (!empty($image))
										{
											$imagePath = JURI::base() . 'media/com_reditem/images/categoryfield/' . $image;

											if ($first)
											{
												// Create thumbnail file for first image
												if (($width) || ($height))
												{
													$tmp = explode('/', $image);
													$fileName = array_pop($tmp);

													$imagePath = ReditemHelperImage::getImageLink(
														$category,
														'categoryfield',
														$fileName,
														'thumbnail',
														$width,
														$height,
														false
													);
												}

												$firstImage = $imagePath;
												$first = false;
											}
											else
											{
												$images[] = $imagePath;
											}
										}
									}

									$layoutData = array(
										'tag'        => $tag,
										'value'      => $images,
										'firstImage' => $firstImage,
										'reditemId'  => $category->id,
										'index'      => $index
									);
									$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
								}
							}

							$tagReplaces[$match] = $contentHtml;
							$index++;
						}

						// Load color box
						RHelperAsset::load('jquery.colorbox.min.js', 'com_reditem');
						RHelperAsset::load('colorbox.min.css', 'com_reditem');
					}
					break;

				case 'youtube':
					$value		= '';
					$preg		= '/{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value[^}]*}/i';
					$matches	= array();

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
					}

					if (preg_match_all($preg, $content, $matches) > 0)
					{
						$matches = $matches[0];
						$index   = 0;

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
								'tag'       => $tag,
								'value'     => $value,
								'width'     => $width,
								'height'    => $height,
								'reditemId' => $category->id,
								'index'     => $index
							);
							$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
							$tagReplaces[$match] = $contentHtml;
							$index++;
						}
					}
					break;

				case 'number':
					$value      = '';
					$typeParams = new JRegistry($category->type->params);

					$decimalSepatator	= $typeParams->get('customfield_number_decimal_sepatator', '.');
					$thousandSeparator	= $typeParams->get('customfield_number_thousand_separator', ',');
					$numberDecimals		= $typeParams->get('customfield_number_number_decimals', 2);

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
						$value = number_format(floatval($value), $numberDecimals, $decimalSepatator, $thousandSeparator);
					}

					$layoutData = array('tag' => $tag, 'value' => $value);
					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
					$tagReplaces[$tagString] = $contentHtml;
					break;

				case 'googlemaps':
					$value = '';

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
					}

					$layoutData = array(
						'tag'          => $tag,
						'value'        => $value,
						'reditemId'    => $category->id,
						'reditemTitle' => $category->title
					);

					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);
					$tagReplaces[$tagString] = $contentHtml;
					break;

				case 'url':
					$value = array('link' => '', 'title' => '');

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$urlJSON = json_decode($customFieldValues[$tag->fieldcode], true);

						// Get file path
						if (!empty($urlJSON))
						{
							$value['link'] = $urlJSON[0];
							$value['title'] = $urlJSON[0];
						}

						// Get file custom name
						if (isset($urlJSON[1]))
						{
							$value['title'] = $urlJSON[1];
						}
					}

					// Replace value link
					$tagString = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_link}';
					$tagReplaces[$tagString] = $value['link'];

					// Replace value tag
					$tagString = '{' . $prefix . 'category_extra_' . $tag->fieldcode . '_value}';
					$layoutData = array('tag' => $tag, 'value' => $value);
					$contentHtml = ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, array('component' => 'com_reditem'));

					$tagReplaces[$tagString] = $contentHtml;
					$content = str_replace($tagString, $contentHtml, $content);
					break;

				default:
					$value = '';

					if (isset($customFieldValues[$tag->fieldcode]))
					{
						$value = $customFieldValues[$tag->fieldcode];
					}

					$layoutData = array('tag' => $tag, 'value' => $value);
					ReditemHelperLayout::render($category->type, $layoutFile, $layoutData, $layoutOptions);

					$tagReplaces[$tagString] = $contentHtml;
					break;
			}
		}

		foreach ($tagReplaces as $tag => $value)
		{
			$content = str_replace($tag, $value, $content);
		}
	}

	/**
	 * Method for generate filter tag base on extra fields of categories
	 *
	 * @param   array   &$filterTags  Array of tags
	 * @param   object  $object       Categories / Template object
	 *
	 * @return void
	 */
	public function prepareCategoryFilterExtraTag(&$filterTags, $object)
	{
		$typeId = $object->type_id;

		if ((!$typeId))
		{
			return;
		}

		$filterExtrasTags = array(
			'{filter_catextrafield|<em>cfId</em>|<em>cfType</em>}' => JText::_('COM_REDITEM_TEMPLATE_TAG_FILTER_BY_CATEGORYEXTRAFIELD_DATA')
		);

		$filterTags = array_merge($filterTags, $filterExtrasTags);
	}

	/**
	 * Front-side. Event run when replace filter tag of template
	 *
	 * @param   array   &$content  Array of tags
	 * @param   object  $category  Categories / Template object
	 *
	 * @return void
	 */
	public function onReplaceCategoryFilterExtrasFieldTag(&$content, $category)
	{
		$typeId = $category->type_id;

		if ((!$typeId))
		{
			return;
		}

		// {filter_catextrafield|<extraFieldId>|<generatedFilterHTML>}
		$preg = '/{filter_catextrafield[^}]*}/i';

		if (preg_match_all($preg, $content, $matches) > 0)
		{
			$matches = $matches[0];

			foreach ($matches as $match)
			{
				$extraFieldId			= 0;
				$generatedFilterType	= "select";
				$extraField				= null;
				$extraFieldDatas		= array();

				$params = explode('|', $match);
				$params = str_replace('{', '', $params);
				$params = str_replace('}', '', $params);

				// Get extra field
				if (isset($params[1]))
				{
					$extraFieldId = (int) $params[1];
				}

				// Get generated HTML filter type
				if (isset($params[2]))
				{
					$generatedFilterType = $params[2];
				}

				$extraFieldModel = RModel::getAdminInstance('CategoryField', array('ignore_request' => true), 'com_reditemcategoryfields');
				$extraField = $extraFieldModel->getItem($extraFieldId);

				if ($extraField)
				{
					$categoriesModel = RModel::getAdminInstance('Categories', array('ignore_request' => true), 'com_reditem');
					$categoriesModel->setState('list.select', 'c.id');
					$categoriesModel->setState('filter.parentid', $category->id);
					$categoriesModel->setState('filter.published', 1);

					$subCategories = $categoriesModel->getItems();
					$subCategoriesIds = array();

					foreach ($subCategories As $subCategory)
					{
						$subCategoriesIds[] = $subCategory->id;
					}

					$extraFieldDatas = ReditemCategoryFieldsHelper::getAllFieldsData($extraFieldId, $subCategoriesIds);

					switch ($generatedFilterType)
					{
						case 'select':
						default:
							$options = array();
							$value = '';

							$options[] = JHTML::_('select.option', '', JText::_('JALL') . ' ' . $extraField->name);

							foreach ($extraFieldDatas as $extraFieldValue)
							{
								$options[] = JHTML::_('select.option', $extraFieldValue, $extraFieldValue);
							}

							$attribs = ' class="chosen" onChange="javascript:reditemCatExtraFilterAjax();"';
							$filters = JFactory::getApplication()->input->get_Array('filter_catextrafield', null);

							if ($filters)
							{
								if (isset($filters[$extraField->id]))
								{
									$value = $filters[$extraField->id];
								}
							}

							$selectHTML = JHTML::_('select.genericlist', $options, 'filter_catextrafield[' . $extraField->id . ']', $attribs, 'value', 'text', $value);

							$content = str_replace($match, $selectHTML, $content);
							break;
					}
				}
			}
		}
	}

	/**
	 * Event on filter category ids
	 *
	 * @return array  List of categories Id
	 */
	public function onFilterCategoryIds()
	{
		$input		= JFactory::getApplication()->input;
		$db			= JFactory::getDBO();

		// Filter by extra values
		$filters = $input->get_Array('filter_catextrafield', null);

		if (!$filters)
		{
			return array();
		}

		$extraFieldModel = RModel::getAdminInstance('CategoryField', array('ignore_request' => false), 'com_reditemcategoryfields');
		$first = true;
		$index = 0;

		$query = $db->getQuery(true);

		foreach ($filters as $extraFieldId => $extraFieldValue)
		{
			if ($extraFieldValue)
			{
				$extraField = $extraFieldModel->getItem($extraFieldId);

				if ($first)
				{
					$first = false;

					$query->select('DISTINCT (' . $db->qn('v.cat_id') . ')')
						->from($db->qn('#__reditem_category_fields_value', 'v'))
						->where($db->qn('v.' . $extraField->fieldcode) . ' = ' . $db->quote($extraFieldValue));
				}
				else
				{
					$tableName = $db->qn('#__reditem_category_fields_value', 'v' . $index);

					$query->innerjoin($tableName . ' ON ' . $db->qn('v.cat_id') . ' = ' . $db->qn('v' . $index . '.cat_id'))
						->where($db->qn('v' . $index . '.' . $extraField->fieldcode) . ' = ' . $db->quote($extraFieldValue));
				}

				$index++;
			}
		}

		if (!$first)
		{
			$db->setQuery($query);
			$categoryIds = $db->loadColumn();

			if ($categoryIds)
			{
				return $categoryIds;
			}
		}

		return array();
	}

	/**
	 * Event after clean thumbnail of category
	 *
	 * @param   object  $category  Category object
	 *
	 * @return  void
	 */
	public function onAfterCleanThumb($category)
	{
		$typeId             = $typeId = $category->type_id;
		$imageValues        = array();
		$deletedImagesCount = 0;

		if ((!$typeId))
		{
			return;
		}

		// Get custom fields of category
		$categoryFieldsModel = RModel::getAdminInstance('CategoryFields', array('ignore_request' => true), 'com_reditemcategoryfields');
		$categoryFieldsModel->setState('filter.published', 1);
		$categoryFieldsModel->setState('filter.itemtypes', $typeId);
		$fields = $categoryFieldsModel->getItems();

		if (empty($fields))
		{
			return;
		}

		// Get values of custom fields
		$customFieldValues = ReditemCategoryFieldsHelper::getFieldsData($category->id);

		if (!$customFieldValues)
		{
			return;
		}

		if (isset($customFieldValues[0]))
		{
			$customFieldValues = $customFieldValues[0];
		}

		foreach ($fields as $field)
		{
			if ($field->type == 'image')
			{
				$fieldcode = $field->fieldcode;

				if (isset($customFieldValues->$fieldcode) && !empty($customFieldValues->$fieldcode))
				{
					$imageValue = json_decode($customFieldValues->$fieldcode);
					$imageValues[] = $imageValue[0];
				}
			}
			elseif ($field->type == 'gallery')
			{
				$fieldcode = $field->fieldcode;

				if (isset($customFieldValues->$fieldcode) && !empty($customFieldValues->$fieldcode))
				{
					$galleryValue = json_decode($customFieldValues->$fieldcode);

					if (!empty($galleryValue))
					{
						foreach ($galleryValue as $imageInGallery)
						{
							$imageValues[] = $imageInGallery;
						}
					}
				}
			}
		}

		$imageFolder = JPATH_ROOT . '/media/com_reditem/images/categoryfield/' . $category->id;

		if (JFolder::exists($imageFolder))
		{
			$files = JFolder::files($imageFolder);

			if (count($files))
			{
				// Get all files in image folder
				foreach ($files as $file)
				{
					$tmpFileName = $category->id . '/' . $file;

					// Check if file is not in Image Values (this is generated image)
					if (!in_array($tmpFileName, $imageValues))
					{
						JFile::delete($imageFolder . '/' . $file);
						$deletedImagesCount++;
					}
				}
			}
		}
	}

	/**
	 * Event after copy a category
	 *
	 * @param   object  $oldCategoryId  Old category object
	 * @param   object  $newCategoryId  New category id
	 *
	 * @return  bool
	 */
	public function onAfterCopy($oldCategoryId, $newCategoryId)
	{
		$categoryModel = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$oldCategory = $categoryModel->getItem($oldCategoryId);
		$typeId = $oldCategory->type_id;

		if ((!$typeId) || ($oldCategory->type_id != $typeId))
		{
			return false;
		}

		$categoryFieldsModel = RModel::getAdminInstance('CategoryFields', array('ignore_request' => true), 'com_reditemcategoryfields');
		$categoryFieldsModel->setState('filter.published', 1);
		$categoryFieldsModel->setState('filter.itemtypes', $typeId);
		$rows = $categoryFieldsModel->getItems();

		if (!$rows)
		{
			return false;
		}

		$categoryData = ReditemCategoryFieldsHelper::getFieldsData($oldCategory->id);
		$categoryData = $categoryData[0];
		$categoryData = (array) $categoryData;

		$fields = array();

		foreach ($rows AS $row)
		{
			$field = ReditemHelperCustomfield::getCustomField($row->type);
			$field->bind($row);

			if (($categoryData) && isset($categoryData[$row->fieldcode]))
			{
				$field->value = $categoryData[$row->fieldcode];
			}

			switch ($field->type)
			{
				case 'file':
				case 'image':
				case 'gallery':
					if (!empty($field->value))
					{
						$values = json_decode($field->value);
						$array = array();

						foreach ($values as $value)
						{
							$arr = explode('/', $value);
							$array[] = $newCategoryId . '/' . $arr[1];
						}

						$field->value = json_encode($array);
					}

					break;
			}

			// Copy images folder
			JFolder::copy($oldCategoryId, $newCategoryId, JPATH_ROOT . '/media/com_reditem/images/categoryfield/', true);

			// Copy files folder
			JFolder::copy($oldCategoryId, $newCategoryId, JPATH_ROOT . '/media/com_reditem/files/categoryfield/', true);

			$fields[] = $field;
		}

		// Insert new data row for this category
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$cfDataTable = $db->quoteName('#__reditem_category_fields_value');

		$query = $db->getQuery(true)
			->insert($cfDataTable)
			->columns($db->quoteName('cat_id'))
			->values($db->quote($newCategoryId));
		$db->setQuery($query);
		$db->execute();

		$query = $db->getQuery(true)
			->update($cfDataTable);

		foreach ($fields AS $field)
		{
			$query->set($db->quoteName($field->fieldcode) . ' = ' . $db->quote($field->value));
		}

		$query->where($db->quoteName('cat_id') . ' = ' . $db->quote($newCategoryId));

		$db->setQuery($query);
		$db->execute();

		return true;
	}

	/**
	 * Method to load category fields after load category
	 *
	 * @param   object  $category  category object
	 *
	 * @return bool
	 */
	public function onAfterLoadCategory($category)
	{
		if (empty($category) || empty($category->id))
		{
			return false;
		}

		$fields = ReditemCategoryFieldsHelper::getFieldsData($category->id);
		$category->fields = array();

		if (empty($fields))
		{
			return false;
		}

		$category->fields = $fields[0];

		return true;
	}
}
