<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JLoader::import('helper', JPATH_ROOT . '/administrator/components/com_reditem/helpers');
JLoader::import('fileupload', JPATH_ROOT . '/administrator/components/com_reditem/helpers');
jimport('joomla.filesystem.folder');

/**
 * RedITEM Item Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Item
 * @since       0.9.1
 *
 */
class ReditemModelItem extends RModelAdmin
{
	public $item = null;

	protected $typeAlias = 'com_reditem.item';

	/**
	 * Method to get the row form.
	 *
	 * @param   int  $pk  Primary key
	 *
	 * @return	mixed	A JForm object on success, false on failure
	 *
	 * @since	1.6
	 */
	public function getItem($pk = null)
	{
		$app  = JFactory::getApplication();
		$this->item = parent::getItem($pk);

		if (isset($this->item->id) && $app->isAdmin())
		{
			$categories = ReditemHelperItem::getCategories($this->item->id);

			if (isset($categories[$this->item->id]))
			{
				$this->item->categories = $categories[$this->item->id];
			}

			if (empty($this->item->customfield_values))
			{
				$cfValues = ReditemHelperItem::getCustomFieldValues($this->item->id);

				if (isset($cfValues[$this->item->type_id][$this->item->id]))
				{
					$this->item->customfield_values = $cfValues[$this->item->type_id][$this->item->id];
				}
			}
		}

		return $this->item;
	}

	/**
	 * Method to get custom field.
	 *
	 * @return  array
	 */
	public function getCustomFields()
	{
		$app    = RFactory::getApplication();
		$typeId = $app->input->getInt('tid', 0);

		if (!$typeId)
		{
			$typeId = $app->getUserState('com_reditem.global.tid', 0);
		}

		if (!$typeId)
		{
			return false;
		}

		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
		$fieldsModel->setState('filter.types', $typeId);
		$fieldsModel->setState('filter.published', 1);
		$fieldsModel->setState('list.ordering', 'f.ordering');
		$fieldsModel->setState('list.direction', 'asc');
		$rows = $fieldsModel->getItems();

		$fields = array();

		foreach ($rows AS $row)
		{
			if ($row->published == 1)
			{
				$field = ReditemHelperCustomfield::getCustomField($row->type);
				$field->bind($row);

				if ((isset($this->item->customfield_values)) && isset($this->item->customfield_values[$row->fieldcode]))
				{
					$field->value = $this->item->customfield_values[$row->fieldcode];
				}

				$fields[] = $field;
			}
		}

		return $fields;
	}

	/**
	 * Method to set featured of item.
	 *
	 * @param   int  $id     Id of item
	 * @param   int  $state  featured state of item
	 *
	 * @return  boolean
	 */
	public function featured($id = null, $state = 0)
	{
		$db = JFactory::getDbo();

		if ($id)
		{
			$query = $db->getQuery(true);

			$query->update($db->qn('#__reditem_items', 'i'))
				->set($db->qn('i.featured') . ' = ' . (int) $state)
				->where($db->qn('i.id') . ' = ' . (int) $id);

			$db->setQuery($query);

			if (!$db->execute())
			{
				return false;
			}

			return true;
		}

		return false;
	}

	/**
	 * Method for getting the form from the model.
	 *
	 * @param   array    $data      Data for the form.
	 * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
	 *
	 * @return  mixed  A JForm object on success, false on failure
	 */
	public function getForm($data = array(), $loadData = true)
	{
		$form = parent::getForm($data, $loadData);
		$user = ReditemHelperSystem::getUser();

		if (!$user->authorise('core.edit.state', 'com_reditem'))
		{
			// Disable change publish state
			$form->setFieldAttribute('published', 'readonly', true);
			$form->setFieldAttribute('published', 'class', 'btn-group disabled');

			// Disable change feature state
			$form->setFieldAttribute('featured', 'readonly', true);
			$form->setFieldAttribute('featured', 'class', 'btn-group disabled');

			// Disable change access state
			$form->setFieldAttribute('access', 'disabled', true);
		}

		return $form;
	}

	/**
	 * Function serve for upload from dragndrop ajax
	 *
	 * @param   array   $file          File posted
	 * @param   string  $uploadType    type of files posted [file/image/gallery]
	 * @param   string  $uploadTarget  fieldcode
	 *
	 * @return  string  path of uploaded files, '' if not in types [file/image/gallery]
	 */
	public function dragndropUpload($file, $uploadType, $uploadTarget)
	{
		$path = '';

		// Prepare filename
		$fileExtension = JFile::getExt($file['name']);
		$fileName      = JFilterOutput::stringURLSafe(JFile::stripExt($file['name']));

		$file['name'] = $fileName . '.' . $fileExtension;
		$fileFolder   = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		$typeId = JFactory::getApplication()->getUserState('com_reditem.global.tid', '0');

		// Get global configuration
		$redItemConfig = JComponentHelper::getParams('com_reditem');

		// Get config of field
		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');

		switch ($uploadType)
		{
			case 'file':
				$maxFileSize       = $redItemConfig->get('customfieldFileUploadMaxSize', 2);
				$extensions        = $redItemConfig->get('customfieldFileUploadExtensions', "zip,doc,xls,pdf");
				$mimes             = $redItemConfig->get('customfieldFileUploadMimes', "application/zip,application/doc,application/xls,application/pdf");
				$useCustomFileName = (boolean) $redItemConfig->get('customfieldFileUploadUseCustomName', true);

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'file');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig   = new JRegistry($fieldInstance->params);
					$extensions    = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes         = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize   = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes, $useCustomFileName);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'image':
				$maxFileSize = $redItemConfig->get('customfieldImageUploadMaxSize', 2);
				$extensions  = $redItemConfig->get('customfieldImageUploadExtensions', 'jpg,jpeg,gif,png');
				$mimes = $redItemConfig->get('customfieldImageUploadMimes', 'image/jpg,image/jpeg,image/gif,image/png');

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'image');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig   = new JRegistry($fieldInstance->params);
					$extensions    = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes         = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize   = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			case 'gallery':
				$maxFileSize = $redItemConfig->get('customfieldGalleryUploadMaxSize', 2);
				$extensions  = $redItemConfig->get('customfieldGalleryUploadExtensions', 'jpg,jpeg,gif,png');
				$mimes = $redItemConfig->get('customfieldGalleryUploadMimes', 'image/jpg,image/jpeg,image/gif,image/png');

				$fieldsModel->setState('filter.types', $typeId);
				$fieldsModel->setState('filter.fieldtypes', 'gallery');
				$fieldsModel->setState('filter.fieldcode', $uploadTarget);
				$fieldInstance = $fieldsModel->getItems();

				if (count($fieldInstance))
				{
					$fieldInstance = $fieldInstance[0];
					$fieldConfig = new JRegistry($fieldInstance->params);
					$extensions = $fieldConfig->get('allowed_file_extension', $extensions);
					$mimes = $fieldConfig->get('allowed_file_mimetype', $mimes);
					$maxFileSize = (int) $fieldConfig->get('upload_max_filesize', $maxFileSize);
				}

				$result = ReditemHelpersFileUpload::uploadFile($file, $fileFolder, $maxFileSize, $extensions, $mimes);

				if ($result && isset($result['mangled_filename']))
				{
					$path = $result['mangled_filename'];
				}

				break;

			default:
				break;
		}

		return $path;
	}

	/**
	 * Method for save Preview data
	 *
	 * @return  void
	 */
	public function savePreviewData()
	{
		$app   = JFactory::getApplication();
		$db    = JFactory::getDbo();
		$input = $app->input;
		$cform = $input->get_Array('cform', null);
		$jform = $input->get_Array('jform', null);
		$id    = $input->getRaw('previewId', '');

		$imageFiles             = $input->files->get('jform');
		$customFieldUploadFiles = $input->files->get('cform');

		// Remove [Image] customfield
		if (isset($jform['customfield_image_rm']))
		{
			foreach ($jform['customfield_image_rm'] as $customFieldImageRemove)
			{
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
							// Remove this image from values array
							$key = array_search($cfImage, $cform['gallery'][$cfGallery]);
							unset($cform['gallery'][$cfGallery][$key]);
						}
					}
				}
			}
		}

		// [Image] custom field - Folder process
		$imageFolder = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $id . '/preview/';

		if (!JFolder::exists($imageFolder))
		{
			JFolder::create($imageFolder);
		}

		// [Image] custom field - Media field process
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

					JFile::copy($mediaImageSource, $mediaImageDestination);

					if (isset($imageFilesCustomField['image'][$imageField]))
					{
						unset($imageFilesCustomField['image'][$imageField]);
					}

					$cform['image'][$imageField] = json_encode(array($id . '/preview/' . $mediaImageFilename));
				}
			}

			unset($cform['image_media']);
		}

		// [Image] custom field - Drag & Drop function
		if (!empty($cform['image']))
		{
			$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

			foreach ($cform['image'] as $imageFieldName => $imageFieldData)
			{
				if (count($cform['dragndrop'][$imageFieldName])
					&& JString::trim($cform['dragndrop'][$imageFieldName][0])
					&& JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0])))
				{
					$imagePathValue = $id . '/preview/' . JString::trim($cform['dragndrop'][$imageFieldName][0]);
					$cform['image'][$imageFieldName] = json_encode(array($imagePathValue));

					// Move file from temporary folder to file folder
					$sourceFile = $temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]);
					$destinationFile = $imageFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]);
					JFile::copy($sourceFile, $destinationFile);
				}
			}
		}

		// [File] custom field - Folder process
		$fileFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/' . $this->id . '/';

		if (!JFolder::exists($fileFolder))
		{
			JFolder::create($fileFolder);
		}

		// [File] custom field - Drag & Drop function
		if (!empty($cform['file']))
		{
			$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

			foreach ($cform['file'] as $fileFieldName => $fileFieldData)
			{
				$fileFieldFileName	= $jform['cform']['file'][$fileFieldName];

				if (count($cform['dragndrop'][$fileFieldName])
					&& JString::trim($cform['dragndrop'][$fileFieldName][0])
					&& JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0])))
				{
					$filePath = $id . '/preview/' . JString::trim($cform['dragndrop'][$fileFieldName][0]);
					$cform['file'][$fileFieldName] = json_encode(array($filePath, $fileFieldFileName));

					// Move file from temporary folder to file folder
					$sourceFile = $temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]);
					$destFile = $fileFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]);
					JFile::move($sourceFile, $destFile);
				}
			}
		}

		// [Gallery] custom field - Remove images
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
							// Remove this image from values array
							$key = array_search($cfImage, $cform['gallery'][$cfGallery]);
							unset($cform['gallery'][$cfGallery][$key]);
						}
					}
				}
			}
		}

		// [Gallery] custom field - On use Media field
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

							$tmpGalleryMediaImages[] = $id . '/preview/' . $tmpMediaImageFilename;

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

		// [Gallery] custom field - Prepare value
		foreach ($cform['gallery'] as $col => $value)
		{
			if (count($cform['dragndrop'][$col]) && JString::trim($cform['dragndrop'][$col][0]))
			{
				$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';
				$dragndropData = explode(',', JString::trim($cform['dragndrop'][$col][0]));

				if (count($dragndropData))
				{
					foreach ($dragndropData as $dragKey => $dragValue)
					{
						if (JString::trim($dragValue))
						{
							if (JFile::exists($temporaryFolder . $dragValue))
							{
								$value[] = $id . '/preview/' . $dragValue;
								JFile::move($temporaryFolder . $dragValue, $imageFolder . $dragValue);
							}
						}
					}
				}
			}

			if (is_array($value))
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

		// [Url] custom field - Process
		if (isset($cform['url']) && is_array($cform['url']))
		{
			foreach ($cform['url'] as $fieldName => $linkUrl)
			{
				$linkTitle = htmlspecialchars(JStringPunycode::urlToUTF8($linkUrl), ENT_COMPAT, 'UTF-8');

				if (isset($jform['cform']['url'][$fieldName]) && ($jform['cform']['url'][$fieldName]))
				{
					$linkTitle = $jform['cform']['url'][$fieldName];
				}

				$linkValue = array($linkUrl, $linkTitle);

				$cform['url'][$fieldName] = json_encode($linkValue);
			}
		}

		unset($cform['dragndrop']);

		// Prepare custom fields value
		$customfieldValues = array();

		foreach ($cform AS $groupType => $group)
		{
			foreach ($group AS $column => $value)
			{
				// Remove empty value in Checkbox custom field
				if ($groupType == 'checkbox')
				{
					$val = array_filter($value);
				}

				$value = (is_array($value)) ? json_encode($value) : $value;
				$customfieldValues[$column] = $value;
			}
		}

		$jform['customfield_values'] = $customfieldValues;

		$data = new JRegistry($jform);

		// Delete old preview data
		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_item_preview'))
			->where($db->qn('id') . ' = ' . $db->quote($id));
		$db->setQuery($query);
		$db->execute();

		// Insert new preview data
		$query->clear()
			->insert($db->qn('#__reditem_item_preview'))
			->columns($db->qn(array('id', 'data')))
			->values($db->quote($id) . ', ' . $db->quote($data->toString()));
		$db->setQuery($query);
		$db->execute();
	}

	/**
	 * Method to save the form data.
	 *
	 * @param   array  $data  The form data.
	 *
	 * @return  boolean  True on success, False on error.
	 *
	 * @since   12.2
	 */
	public function save($data)
	{
		if (parent::save($data))
		{
			$previewId = md5($data['id'] . ReditemHelperSystem::getUser()->id);

			// Remove preview data
			$db = $this->_db;
			$query = $db->getQuery(true)
				->delete($db->qn('#__reditem_item_preview'))
				->where($db->qn('id') . ' = ' . $db->quote($previewId));
			$db->setQuery($query);
			$db->execute();

			return true;
		}

		return false;
	}
}
