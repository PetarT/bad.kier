<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Table
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JLoader::import('helper', JPATH_ROOT . '/administrator/components/com_reditem/helpers');
JLoader::import('fileupload', JPATH_ROOT . '/administrator/components/com_reditem/helpers');
jimport('joomla.filesystem.folder');

/**
 * Category table
 *
 * @package     RedITEM.Backend
 * @subpackage  Table
 * @since       0.9.1
 */
class ReditemTableItem extends RTable
{
	/**
	 * The name of the table with category
	 *
	 * @var string
	 * @since 0.9.1
	 */
	protected $_tableName = 'reditem_items';

	/**
	 * The primary key of the table
	 *
	 * @var string
	 * @since 0.9.1
	 */
	protected $_tableKey = 'id';

	/**
	 * Field name to publish/unpublish table registers. Ex: state
	 *
	 * @var  string
	 */
	protected $_tableFieldState = 'published';

	/**
	 * Categories reference variable
	 *
	 * @var  array
	 */
	public $categories;

	/**
	 * Categories reference variable
	 *
	 * @var  array
	 */
	public $customfield_values;

	/**
	 * Constructor
	 *
	 * @param   JDatabase  &$db  A database connector object
	 *
	 * @throws  UnexpectedValueException
	 */
	public function __construct(&$db)
	{
		parent::__construct($db);

		JObserverMapper::addObserverClassToClass(
			'ReditemTableObserverItemcategoryxref',
			'ReditemTableItem',
			array('typeAlias' => 'com_reditem.item')
		);

		JObserverMapper::addObserverClassToClass(
			'ReditemTableObserverItemcustomfield',
			'ReditemTableItem',
			array('typeAlias' => 'com_reditem.item')
		);

		JObserverMapper::addObserverClassToClass(
			'JTableObserverContenthistory',
			'ReditemTableItem',
			array('typeAlias' => 'com_reditem.item')
		);
	}

	/**
	 * Method to store a node in the database table.
	 *
	 * @param   boolean  $updateNulls  True to update fields even if they are null.
	 *
	 * @return  boolean  True on success.
	 */
	public function store($updateNulls = false)
	{
		$db = $this->getDbo();

		// Re construction for apply tableobserver
		self::__construct($db);

		$date       = ReditemHelperSystem::getDateWithTimezone();
		$user       = ReditemHelperSystem::getUser();
		$app        = RFactory::getApplication();
		$input      = $app->input;
		$dispatcher = RFactory::getDispatcher();
		$isNew      = false;
		$query      = $db->getQuery(true);

		JPluginHelper::importPlugin('reditem');

		if (!$this->id)
		{
			$isNew = true;
		}

		// Get item object before storing
		$itemBefore = RTable::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');
		$itemBefore->load($this->id);

		// Run event 'onBeforeItemSave'
		$dispatcher->trigger('onBeforeItemSave', array($this, $input));

		$cform = $input->get_Array('cform', null);
		$jform = $input->get_Array('jform', null);
		$imageFiles             = $input->files->get('jform');
		$customFieldUploadFiles = $input->files->get('cform');

		if (!empty($jform))
		{
			// Tell the observer to update categories
			$this->categories = isset($jform['categories']) ? $jform['categories'] : array();
		}

		$saveAsCopy = false;
		$oldItemId  = null;

		if ($input->getCmd('task', '') == 'save2copy')
		{
			$saveAsCopy = true;
			$oldItemId  = $input->getInt('id', 0);
		}

		// Prepare for publish_up & publish_down fields
		if ($this->published == 1 && (int) $this->publish_up == 0)
		{
			$this->publish_up = $date->toSql();
		}

		if ($this->published == 1 && intval($this->publish_down) == 0)
		{
			$this->publish_down = $db->getNullDate();
		}

		$imageFolder  = '';
		$oldItemImage = '';
		$result       = true;
		$newAlias     = '';
		$aliasCheck   = true;

		// Remove spaces from alias
		if (!empty($jform['alias']))
		{
			$newAlias = trim($jform['alias']);
		}

		// If alias is empty. Create alias from item's title
		if (empty($newAlias))
		{
			$newAlias = trim($this->title);
		}

		// Make sef URL for alias
		$newAlias = JFilterOutput::stringURLSafe($newAlias);

		if ($isNew)
		{
			// New item
			$this->created_time = $date->toSql();
			$this->created_user_id = $user->get('id');

			// Check new alias exist in database
			if ($this->checkAlias($newAlias))
			{
				$aliasCheck = false;
			}
		}
		else
		{
			// Existing item
			$this->modified_time    = $date->toSql();
			$this->modified_user_id = $user->get('id');

			// If new alias is different with current alias, check new alias exist in database
			if (($this->alias != $newAlias) && ($this->checkAlias($newAlias, $this->id)))
			{
				$aliasCheck = false;
			}
		}

		// If alias is unavailable, put Unix time string for make it unique
		if (!$aliasCheck)
		{
			$this->title = JString::increment($this->title);
			$newAlias = JFilterOutput::stringURLSafe($this->title);
		}

		$this->alias = $newAlias;

		/*
		 * Remove [image] custom field - Checked
		 */
		if (isset($jform['customfield_image_rm']))
		{
			foreach ($jform['customfield_image_rm'] as $customFieldImageRemove)
			{
				$tmpImageName = json_decode($cform['image'][$customFieldImageRemove], true);
				$tmpImageName = $tmpImageName[0];
				$tmpImagePath = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $tmpImageName;

				if (JFile::exists($tmpImagePath))
				{
					JFile::delete($tmpImagePath);
				}

				// Remove this image from values array
				$cform['image'][$customFieldImageRemove] = '';
			}
		}

		/*
		 * Remove [gallery] custom field - Checked
		 */
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
							$tmpImagePath = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $cfImage;

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

		/*
		 * Remove item_image - Checked
		 */
		if (isset($jform['item_image_remove']))
		{
			$imagePath = $imageFolder . $oldItemImage;

			if (JFile::exists($imagePath))
			{
				JFile::delete($imagePath);
			}

			$this->item_image = '';
		}

		/*
		 * Process on Url custom field
		 */
		if (isset($cform['url']) && is_array($cform['url']))
		{
			foreach ($cform['url'] as $fieldName => $linkUrl)
			{
				$linkTitle = htmlspecialchars(JStringPunycode::urlToUTF8($linkUrl), ENT_COMPAT, 'UTF-8');

				if (isset($jform['cform']['url'][$fieldName]) && ($jform['cform']['url'][$fieldName]))
				{
					$linkTitle = $jform['cform']['url'][$fieldName];
				}

				// URL target
				if (isset($jform['cform']['target'][$fieldName]))
				{
					$attributes = $jform['cform']['target'][$fieldName];
				}

				$linkValue = array($linkUrl, $linkTitle, $attributes);

				$cform['url'][$fieldName] = json_encode($linkValue);
			}
		}

		/**
		 * Process on customfield values before store to make it work with Versioning feature
		 */
		if (empty($this->customfield_values) && !empty($cform))
		{
			$tmpCustomfieldValues = array();
			$allowVersionField = array('dragndrop', 'image', 'image_media', 'gallery', 'gallery_media', 'file');

			foreach ($cform as $group => $field)
			{
				// Ignore image alt
				if ($group == 'alt')
				{
					continue;
				}

				if (!in_array($group, $allowVersionField))
				{
					$tmpCustomfieldValues[$group] = $cform[$group];
				}
			}

			$this->customfield_values = $tmpCustomfieldValues;
		}

		/*$_tmpCustomfieldValues = $this->customfield_values;
		unset($this->customfield_values);*/

		// Store data into item table
		if (!parent::store($updateNulls))
		{
			return false;
		}

		/*$this->customfield_values = $_tmpCustomfieldValues;*/

		// Convert customfield values back to array for update on database
		if (!empty($this->customfield_values))
		{
			$this->customfield_values = new JRegistry(stripslashes($this->customfield_values));
			$this->customfield_values = $this->customfield_values->toArray();

			$fieldModel = RModel::getAdminInstance('Field', array('ignore_request' => true), 'com_reditem');
			$tmpCustomfieldValues = array();

			foreach ($this->customfield_values as $group => $tmpField)
			{
				foreach ($tmpField as $fieldcode => $fieldValue)
				{
					$fieldObj = $fieldModel->getItemByFieldcode($fieldcode, $this->type_id);

					if (!$fieldObj)
					{
						continue;
					}

					$group = $fieldObj->type;

					if (!isset($tmpCustomfieldValues[$group]))
					{
						$tmpCustomfieldValues[$group] = array();
					}

					if ($group == 'textbox' || $group == 'textarea')
					{
						$fieldParam = new JRegistry($fieldObj->params);
						$fieldEnableLimitGuide = $fieldParam->get('enable_limit_guide', 0);

						if ($fieldEnableLimitGuide == 1)
						{
							$fieldLimit = $fieldParam->get('limit', 100);
							$fieldValue = substr($fieldValue, 0, $fieldLimit);
						}
					}

					$tmpCustomfieldValues[$group][$fieldcode] = $fieldValue;
				}
			}

			$this->customfield_values = $tmpCustomfieldValues;
		}

		/*
		 * Upload / Save [Image] custom fields
		 */
		// Process on image folder
		$imageFolder = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $this->id . '/';

		if (!JFolder::exists($imageFolder))
		{
			JFolder::create($imageFolder);
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

					$cform['image'][$imageField] = json_encode(array($this->id . '/' . $mediaImageFilename));
				}
			}

			unset($cform['image_media']);
		}

		// Process on upload file
		if (isset($customFieldUploadFiles['image']))
		{
			$imageFilesCustomField = $customFieldUploadFiles['image'];

			foreach ($imageFilesCustomField AS $imageField => $imageData)
			{
				$imageFieldName = substr($imageField, 0, -5);

				// Process dragndrop image
				$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

				if (count($cform['dragndrop'][$imageFieldName]) && JString::trim($cform['dragndrop'][$imageFieldName][0]) && JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0])))
				{
					$cform['image'][$imageFieldName] = json_encode(array($this->id . '/' . JString::trim($cform['dragndrop'][$imageFieldName][0])));

					// Move file from temporary folder to file folder
					JFile::move($temporaryFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]), $imageFolder . JString::trim($cform['dragndrop'][$imageFieldName][0]));
				}

				if (isset($imageData['name']) && $imageData['size'] > 0)
				{
					$fieldObject      = array();
					$fieldConfig      = array();
					$maxFileSize      = 2;
					$allowedExtension = 'jpg,jpeg,gif,png';
					$imageFieldName   = substr($imageField, 0, -5);

					// Get config of field
					$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
					$fieldsModel->setState('filter.types', $this->type_id);
					$fieldsModel->setState('filter.fieldtypes', 'image');
					$fieldsModel->setState('filter.fieldcode', $imageFieldName);
					$result = $fieldsModel->getItems();

					if ($result)
					{
						$fieldObject = $result[0];
						$fieldConfig = new JRegistry($fieldObject->params);

						// Get max file size from config
						$maxFileSize = (int) $fieldConfig->get('upload_max_filesize', 2);

						// Get allowed file type extensions from config
						$allowedExtension = $fieldConfig->get('allowed_file_extension', 'jpg,jpeg,gif,png');
						$allowedMIME      = $fieldConfig->get('allowed_file_mimetype', 'image/jpg,image/jpeg,image/gif,image/png');
					}

					// Clean memory data
					unset($fieldObject);
					unset($fieldConfig);

					// Single image upload for "Image" field
					$resultUpload = ReditemHelpersFileUpload::uploadFile($imageData, $imageFolder, $maxFileSize, $allowedExtension, $allowedMIME);

					if ($resultUpload)
					{
						if (!empty($cform['image'][$imageFieldName]))
						{
							$tmpOldImageFileName = json_decode($cform['image'][$imageFieldName]);

							$tmpOldImageFile = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $tmpOldImageFileName[0];

							if (JFile::exists($tmpOldImageFile))
							{
								JFile::delete($tmpOldImageFile);
							}
						}

						$cform['image'][$imageFieldName] = json_encode(array($this->id . '/' . $resultUpload['mangled_filename']));
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
			$fileFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/' . $this->id . '/';
			$maxFileSize = 2;
			$allowedExtension = null;
			$allowedMIME = null;
			$useCustomFileName = true;

			if (!JFolder::exists($fileFolder))
			{
				JFolder::create($fileFolder);
			}

			foreach ($customFieldUploadFiles['file'] AS $fileField => $fileData)
			{
				$fieldObject		= array();
				$fieldConfig		= array();
				$fileFieldName		= substr($fileField, 0, -5);
				$fileFieldFileName	= $jform['cform']['file'][$fileFieldName];

				// Get config of field
				$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
				$fieldsModel->setState('filter.types', $this->type_id);
				$fieldsModel->setState('filter.fieldtypes', 'file');
				$fieldsModel->setState('filter.fieldcode', $fileFieldName);
				$result = $fieldsModel->getItems();

				// Process dragndrop upload file
				$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

				if (count($cform['dragndrop'][$fileFieldName]) && JString::trim($cform['dragndrop'][$fileFieldName][0]) && JFile::exists($temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0])))
				{
					$cform['file'][$fileFieldName] = json_encode(array($this->id . '/' . JString::trim($cform['dragndrop'][$fileFieldName][0]), $fileFieldFileName));

					// Move file from temporary folder to file folder
					JFile::move($temporaryFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]), $fileFolder . JString::trim($cform['dragndrop'][$fileFieldName][0]));
				}

				if (isset($fileData['name']) && $fileData['size'] > 0)
				{
					if ($result)
					{
						$fieldObject = $result[0];
						$fieldConfig = new JRegistry($fieldObject->params);

						// Get max file size from config
						$maxFileSize = (int) $fieldConfig->get('upload_max_filesize', 2);

						// Get allowed file type extensions from config
						$fieldConfigAllowedExtension = $fieldConfig->get('allowed_file_extension', "zip,doc,xls,pdf");
						$allowedMIME = $fieldConfig->get('allowed_file_mimetype', "application/zip,application/doc,application/xls,application/pdf");

						if ($fieldConfigAllowedExtension)
						{
							$allowedExtension = $fieldConfigAllowedExtension;
						}

						// Get "Use mangled name" from config
						$useCustomFileName = (boolean) $fieldConfig->get('use_mangled_name', true);
					}

					// Clean memory data
					unset($fieldObject);
					unset($fieldConfig);

					// Single File upload for "File" field
					$result = ReditemHelpersFileUpload::uploadFile($fileData, $fileFolder, $maxFileSize, $allowedExtension, $allowedMIME, $useCustomFileName);

					if ($result)
					{
						if (!empty($cform['file'][$fileFieldName]))
						{
							$oldFileName = json_decode($cform['file'][$fileFieldName]);

							$oldFilePath = JPATH_ROOT . '/media/com_reditem/files/customfield/' . $oldFileName[0];

							if (JFile::exists($oldFilePath))
							{
								JFile::delete($oldFilePath);
							}
						}

						$cform['file'][$fileFieldName] = json_encode(array($this->id . '/' . $result['mangled_filename'], $fileFieldFileName));
					}
					else
					{
						$app->enqueueMessage(JText::_('COM_REDITEM_FILE_HELPER_CANTJFILEUPLOAD'), 'error');
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
		 * Process on Gallery custom field
		 */
		$imageFolder = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $this->id . '/';

		if (!JFolder::exists($imageFolder))
		{
			JFolder::create($imageFolder);
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

							$tmpGalleryMediaImages[] = $this->id . '/' . $tmpMediaImageFilename;

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

		// Prepare value string for insert into database

		if (isset($cform['gallery']))
		{
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
									$value[] = $this->id . '/' . $dragValue;
									JFile::move($temporaryFolder . $dragValue, $imageFolder . $dragValue);
								}
							}
						}
					}
				}

				if (!is_array($value))
				{
					$value = array($value);
				}

				if (!empty($value))
				{
					$defaultImageIndex = 0;

					if (isset($jform['customfield_gallery_default'][$col]))
					{
						$defaultImageIndex = $jform['customfield_gallery_default'][$col];
					}

					// Remove empty value
					foreach ($value as $key => $val)
					{
						if (empty($val))
						{
							unset($value[$key]);

							continue;
						}

						// Image text
						$imageAlt = $jform['customfield_gallery'][$col][$key]['alt'];
						$imageValue = array(
							'path' => $val,
							'alt' => $imageAlt,
							'default' => 0
						);

						if ($key == $defaultImageIndex)
						{
							$imageValue['default'] = 1;
						}

						$value[$key] = $imageValue;
					}

					// Reset key for array values
					$value = array_values($value);

					$cform['gallery'][$col] = json_encode($value);
				}
			}
		}

		// Remove not-needed array
		if (isset($cform['dragndrop']))
		{
			unset($cform['dragndrop']);
		}

		// If task is "Save as Copy" need copy files from old item to current item
		if ($saveAsCopy)
		{
			if (!empty($cform['image']))
			{
				foreach ($cform['image'] as $field => $value)
				{
					$tmpValue = json_decode($value);
					$tmpValue = $tmpValue[0];
					$tmpValue = explode('/', $tmpValue);
					$newValue = array($this->id . '/' . $tmpValue[1]);
					$cform['image'][$field] = json_encode($newValue);
				}
			}

			if (!empty($cform['gallery']))
			{
				foreach ($cform['gallery'] as $field => $values)
				{
					$tmpValues = json_decode($values);
					$newValues = array();

					foreach ($tmpValues as $value)
					{
						$tmpValue  = explode('/', $value);
						$newValues[] = $this->id . '/' . $tmpValue[1];
					}

					$cform['gallery'][$field] = json_encode($newValues);
				}
			}

			if (!empty($cform['file']))
			{
				foreach ($cform['file'] as $field => $value)
				{
					$tmpValue = json_decode($value);
					$tmpValue = $tmpValue[0];
					$tmpValue = explode('/', $tmpValue);
					$newValue = array($this->id . '/' . $tmpValue[1]);
					$cform['file'][$field] = json_encode($newValue);
				}
			}

			$this->copyFilesCustomField($oldItemId, $this->id, 'images');
			$this->copyFilesCustomField($oldItemId, $this->id, 'files');
		}

		/**
		 * Add custom fields data
		 */
		$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
		$type      = $typeModel->getItem($this->type_id);
		$typeTable = '#__reditem_types_' . $type->table_name;

		// Merge customfield data from input with current customfield data
		if (!empty($cform))
		{
			foreach ($cform as $group => $value)
			{
				// Ignore image alt
				if ($group == 'alt')
				{
					continue;
				}

				if (!isset($this->customfield_values[$group]))
				{
					$this->customfield_values[$group] = $value;
				}
			}
		}

		if ($isNew)
		{
			$query->clear()
				->insert($db->qn($typeTable))
				->columns($db->qn('id'))
				->values((int) $this->id);
			$db->setQuery($query);
			$db->execute();
		}

		if (!empty($this->customfield_values))
		{
			$columnsQ = 'SHOW COLUMNS FROM ' . $db->qn($typeTable);
			$columns  = $db->setQuery($columnsQ)->loadColumn();
			array_shift($columns);

			$query->clear()
				->update($db->qn($typeTable));

			foreach ($this->customfield_values as $groupType => $group)
			{
				// Ignore image alt
				if ($groupType == 'alt')
				{
					continue;
				}

				foreach ($group AS $column => $value)
				{
					if (($key = array_search($column, $columns)) !== false)
					{
						unset($columns[$key]);
					}

					// Remove empty value in Checkbox custom field
					if (($groupType == 'checkbox' || $groupType == 'itemfromtype' || $groupType == 'user') && (is_array($value)))
					{
						$value = array_filter($value);
					}
					elseif ($groupType == 'date')
					{
						$value = ReditemHelperSystem::getDateWithTimezone($value, true)->toSql();
					}
					elseif ($groupType == 'image' && !empty($value))
					{
						if (!empty($cform['alt'][$column]))
						{
							$tmp = json_decode($value);
							$value = array($tmp[0] . '|' . $cform['alt'][$column]);
						}
						else
						{
							$tmp = json_decode($value);
							$tmp = explode('|', $tmp[0]);
							$value = array($tmp[0]);
						}
					}

					$value = (is_array($value)) ? json_encode($value) : $value;
					$query->set($db->qn($column) . ' = ' . $db->quote($value));
				}
			}

			foreach ($columns as $column)
			{
				$query->set($db->qn($column) . ' = \'\'');
			}

			$query->where($db->qn('id') . ' = ' . $db->quote($this->id));
			$db->setQuery($query);

			$result = false;

			if ($db->execute())
			{
				$result = true;
			}
		}

		if (!$result)
		{
			return false;
		}

		// Run event 'onAfterItemSave'
		$dispatcher->trigger('onAfterItemSave', array($this, $isNew, $itemBefore));

		return $result;
	}

	/**
	 * Deletes this row in database (or if provided, the row of key $pk)
	 *
	 * @param   mixed  $pk  An optional primary key value to delete.  If not set the instance property value is used.
	 *
	 * @return  boolean  True on success.
	 */
	public function delete($pk = null)
	{
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');

		// Run event 'onBeforeItemDelete'
		$dispatcher->trigger('onBeforeItemDelete', array($this));

		$db = RFactory::getDBO();

		// Remove reference with categories
		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_item_category_xref'))
			->where($db->qn('item_id') . ' = ' . $db->quote($this->id));

		$db->setQuery($query);
		$db->execute();

		// Remove customfield data on custom table
		$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
		$type = $typeModel->getItem($this->type_id);

		if (isset($type->table_name))
		{
			$query->clear()
			->delete($db->qn('#__reditem_types_' . $type->table_name))
			->where($db->qn('id') . ' = ' . $db->quote($this->id));

			$db->setQuery($query);
			$db->execute();
		}

		// Remove preview data
		$previewId = md5($this->id . ReditemHelperSystem::getUser()->id);
		$query->clear()
			->delete($db->qn('#__reditem_item_preview'))
			->where($db->qn('id') . ' = ' . $db->quote($previewId));
		$db->setQuery($query);
		$db->execute();

		// Remove cusomfield image folder
		$imageCustomFieldFolder = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $this->id . '/';

		if (JFolder::exists($imageCustomFieldFolder))
		{
			JFolder::delete($imageCustomFieldFolder);
		}

		// Remove comments
		$comments = ReditemHelperComments::getComments($this->id);

		if ($comments)
		{
			$commentTable = JTable::getInstance('Comment', 'ReditemTable', array('ignore_request' => true));

			foreach ($comments as $comment)
			{
				$commentTable->load($comment->id);
				$commentTable->delete();
			}
		}

		// Remove reports
		$reports = ReditemHelperReport::getReportsItem($this->id);

		if ($reports)
		{
			$reportTable = JTable::getInstance('ReportItem', 'ReditemTable', array('ignore_request' => true));

			foreach ($reports as $report)
			{
				$reportTable->load($report->id);
				$reportTable->delete();
			}
		}

		if (!parent::delete($pk))
		{
			return false;
		}

		// Run event 'onAfterItemDelete'
		$dispatcher->trigger('onAfterItemDelete', array($this));

		return true;
	}

	/**
	 * Method to set the publishing state for a row or list of rows in the database
	 * table.  The method respects checked out rows by other users and will attempt
	 * to checkin rows that it can after adjustments are made.
	 *
	 * @param   mixed    $pks     An optional array of primary key values to update.
	 *                            If not set the instance property value is used.
	 * @param   integer  $state   The publishing state. eg. [0 = unpublished, 1 = published]
	 * @param   integer  $userId  The user id of the user performing the operation.
	 *
	 * @return  boolean  True on success; false if $pks is empty.
	 */
	public function publish($pks = null, $state = 1, $userId = 0)
	{
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');

		foreach ($pks as $pk)
		{
			$this->reset();

			// Run event 'onAfterItemPublished'
			if ($this->load($pk) && ($state == 1))
			{
				$dispatcher->trigger('onAfterItemPublished', array($this));
			}

			// Run event 'onAfterItemUnpublished'
			if ($this->load($pk) && ($state == 0))
			{
				$dispatcher->trigger('onAfterItemUnpublished', array($this));
			}
		}

		return parent::publish($pks, $state, $userId);
	}

	/**
	 * Copy categories xref for copied item
	 *
	 * @param   int  $fromId  Source item id
	 * @param   int  $toId    Destination item id
	 *
	 * @return  boolean  True on success.
	 */
	public function copyCategoriesXref($fromId, $toId)
	{
		$db = RFactory::getDbo();

		// Get array of categories' id from source id
		$query = $db->getQuery(true)
			->select($db->qn(array('item_id', 'category_id')))
			->from($db->qn('#__reditem_item_category_xref'))
			->where($db->qn('item_id') . ' = ' . $db->quote($fromId));

		$db->setQuery($query);
		$categoriesXref = $db->loadObjectList();

		// Copy process
		if (count($categoriesXref))
		{
			foreach ($categoriesXref as $categoryXref)
			{
				$query = $db->getQuery(true)
					->insert($db->qn('#__reditem_item_category_xref'))
					->columns($db->qn('item_id') . ',' . $db->qn('category_id'))
					->values($db->quote($toId) . ',' . $db->quote($categoryXref->category_id));
				$db->setQuery($query);
				$db->execute();
			}
		}

		return true;
	}

	/**
	 * create categories xref for the item
	 *
	 * @param   int    $itemId        The item id
	 * @param   array  $categoriesId  List of Categories id
	 *
	 * @return  boolean  True on success.
	 */
	public function createCategoriesXref($itemId, $categoriesId = array())
	{
		$db = RFactory::getDbo();

		if (count($categoriesId))
		{
			foreach ($categoriesId as $catId)
			{
				// Check is category id xref existed?
				$query = $db->getQuery(true)
					->select($db->qn(array('item_id', 'category_id')))
					->from($db->qn('#__reditem_item_category_xref'))
					->where($db->qn('item_id') . ' = ' . $db->q($itemId) . ' AND ' . $db->qn('category_id') . ' = ' . $db->q($catId));

				$db->setQuery($query);
				$result = $db->loadObjectList();

				if (!count($result))
				{
					$query = $db->getQuery(true)
						->insert($db->qn('#__reditem_item_category_xref'))
						->columns($db->qn('item_id') . ',' . $db->qn('category_id'))
						->values($db->quote($itemId) . ',' . $db->quote($catId));

					$db->setQuery($query);
					$db->execute();
				}
			}
		}

		return true;
	}

	/**
	 * create categories xref for the item
	 *
	 * @param   int  $itemId  The item id
	 *
	 * @return  void
	 */
	public function deleteCategoriesXref($itemId)
	{
		$db = RFactory::getDbo();
		$query = $db->getQuery(true);

		$query->delete($db->qn('#__reditem_item_category_xref'))
			->where($db->qn('item_id') . ' = ' . $db->quote($itemId));

		$db->setQuery($query);
		$db->execute();
	}

	/**
	 * Update access level for item
	 *
	 * @param   int  $itemId  The item id
	 *
	 * @param   int  $access  Access level of the item
	 *
	 * @return  void
	 */
	public function updateAccessLevel($itemId, $access = 1)
	{
		$db = RFactory::getDbo();
		$query = $db->getQuery(true);

		$query->update($db->qn("#__reditem_items"))
			->set($db->qn('access') . ' = ' . $db->q($access))
			->where($db->qn("id") . " = " . $db->q($itemId));

		$db->setQuery($query);
		$db->execute();
	}

	/**
	 * Copy customfields function
	 *
	 * @param   int  $typeId  type id based to copy customfields value
	 * @param   int  $fromId  source id
	 * @param   int  $toId    destination id
	 *
	 * @return  void
	 */
	public function copyCustomfields($typeId, $fromId, $toId)
	{
		$db = RFactory::getDbo();

		// Get table name of type based on type id
		$typeTable = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
		$type = $typeTable->getItem($typeId);

		// Get customfields fieldcode of type
		$fieldsTable = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
		$fieldsTable->setState('filter.types', $typeId);

		$fields = $fieldsTable->getItems();

		if (empty($fields))
		{
			return false;
		}

		// Get customfields value of $formId
		$query = $db->getQuery(true)
			->select('*')
			->from($db->qn('#__reditem_types_' . $type->table_name))
			->where($db->qn('id') . ' = ' . $db->quote($fromId));
		$db->setQuery($query);
		$sourceValues = $db->loadObject();

		if (!$sourceValues)
		{
			return false;
		}

		$query->clear()
			->update($db->qn("#__reditem_types_" . $type->table_name))
			->where($db->qn("id") . " = " . $db->quote($toId));

		foreach ($fields as $field)
		{
			$fieldColumn = $field->fieldcode;
			$fieldValue = $sourceValues->$fieldColumn;

			if (in_array($field->type, array('gallery', 'image', 'file')))
			{
				$fieldValue = str_replace('"' . $fromId . '\/', '"' . $toId . '\/', $fieldValue);
			}

			$query->set($db->qn($fieldColumn) . ' = ' . $db->quote($fieldValue));
		}

		$db->setQuery($query);
		$db->execute();

		// Copy files & images into copied items customfields
		$this->copyFilesCustomField($fromId, $toId, 'images');
		$this->copyFilesCustomField($fromId, $toId, 'files');
	}

	/**
	 * Copy files customfields function
	 *
	 * @param   int     $fromId  source id
	 * @param   int     $toId    destination id
	 * @param   string  $type    type of files want to copy
	 *
	 * @return  boolean true if copy successful
	 */
	public function copyFilesCustomField($fromId, $toId, $type)
	{
		if (!in_array($type, array('images', 'files')))
		{
			return false;
		}

		// Copy images from customfields
		$fileCtfPath	= JPATH_ROOT . '/media/com_reditem/' . $type . '/customfield/' . $fromId . '/';
		$fileCopyPath	= JPATH_ROOT . '/media/com_reditem/' . $type . '/customfield/' . $toId . '/';

		// Create folder holds images for copied item if not exist
		if (!JFolder::exists($fileCopyPath))
		{
			try
			{
				JFolder::create($fileCopyPath);
			}
			catch (Exception $e)
			{
			}
		}

		// Copy images
		if (JFolder::exists($fileCtfPath))
		{
			$filesCtf = JFolder::files($fileCtfPath);

			if (count($filesCtf))
			{
				foreach ($filesCtf as $file)
				{
					$fromFilePath 	= $fileCtfPath . $file;
					$toFilePath	= $fileCopyPath . $file;

					if (JFile::exists($fromFilePath))
					{
						JFile::copy($fromFilePath, $toFilePath);
					}
				}
			}
		}
	}

	/**
	 * Check alias exist in database
	 *
	 * @param   string  $alias  Alias string
	 * @param   int     $id     Id of item
	 *
	 * @return  boolean  True if exist. False otherwise.
	 */
	public function checkAlias($alias, $id = null)
	{
		$db = RFactory::getDbo();

		$query = $db->getQuery(true)
			->select('count(*) AS ' . $db->qn('count'))
			->from($db->qn('#__reditem_items', 'i'))
			->where($db->qn('i.alias') . ' = ' . $db->quote($alias));

		if ($id)
		{
			$query->where($db->qn('i.id') . ' <> ' . $db->quote($id));
		}

		$db->setQuery($query);
		$result = $db->loadObject();

		if (($result) && ($result->count))
		{
			return true;
		}

		return false;
	}

	/**
	 * Method to compute the default name of the asset.
	 * The default name is in the form table_name.id
	 * where id is the value of the primary key of the table.
	 *
	 * @return  string
	 *
	 * @since   11.1
	 */
	protected function _getAssetName()
	{
		$key = $this->_tbl_key;

		return 'com_reditem.item.' . (int) $this->$key;
	}

	/**
	 * Method to get the parent asset under which to register this one.
	 * By default, all assets are registered to the ROOT node with ID,
	 * which will default to 1 if none exists.
	 * The extended class can define a table and id to lookup.  If the
	 * asset does not exist it will be created.
	 *
	 * @param   JTable   $table  A JTable object for the asset parent.
	 * @param   integer  $id     Id to look up
	 *
	 * @return  integer
	 *
	 * @since   11.1
	 */
	protected function _getAssetParentId(JTable $table = null, $id = null)
	{
		$input = RFactory::getApplication()->input;
		$jform = $input->get_Array('jform', null);

		if (isset($jform['categories']) && !empty($jform['categories']))
		{
			$categoryId = $jform['categories'][0];

			// Get parent asset from type of this category
			$db = RFactory::getDbo();
			$query = $db->getQuery(true)
				->select($db->qn('id'))
				->from($db->qn('#__assets'))
				->where($db->qn('name') . ' = ' . $db->quote('com_reditem.category.' . $categoryId));
			$db->setQuery($query);
			$result = $db->loadObject();

			if ($result && !empty($result->id))
			{
				return $result->id;
			}
		}
		else
		{
			// Get parent asset from type of this category
			$db = RFactory::getDbo();
			$query = $db->getQuery(true)
				->select($db->qn('id'))
				->from($db->qn('#__assets'))
				->where($db->qn('name') . ' = ' . $db->quote('com_reditem.type.' . $this->type_id));
			$db->setQuery($query);
			$result = $db->loadObject();

			if ($result && !empty($result->id))
			{
				return $result->id;
			}
		}

		// For simple cases, parent to the asset root.
		$assets = self::getInstance('Asset', 'JTable', array('dbo' => $this->getDbo()));
		$rootId = $assets->getRootId();

		if (!empty($rootId))
		{
			return $rootId;
		}

		return 1;
	}

	/**
	 * Get the columns from database table.
	 *
	 * @return  mixed  An array of the field names, or false if an error occurs.
	 *
	 * @since   11.1
	 * @throws  UnexpectedValueException
	 */
	public function getFields()
	{
		$categoriesField = new stdClass;
		$categoriesField->Field = 'categories';
		$categoriesField->Default = '';
		$customfieldValues = new StdClass;
		$customfieldValues->Field = 'customfield_values';
		$customfieldValues->Default = '';

		static $cache = null;

		if ($cache === null)
		{
			// Lookup the fields for this table only once.
			$name   = $this->_tbl;
			$fields = $this->_db->getTableColumns($name, false);

			if (empty($fields))
			{
				throw new UnexpectedValueException(sprintf('No columns found for %s table', $name));
			}

			$fields['categories'] = $categoriesField;
			$fields['customfield_values'] = $customfieldValues;

			$cache = $fields;
		}

		return $cache;
	}

	/**
	 * Method to bind an associative array or object to the JTable instance.This
	 * method only binds properties that are publicly accessible and optionally
	 * takes an array of properties to ignore when binding.
	 *
	 * @param   mixed  $src     An associative array or object to bind to the JTable instance.
	 * @param   mixed  $ignore  An optional array or space separated list of properties to ignore while binding.
	 *
	 * @return  boolean  True on success.
	 *
	 * @throws  InvalidArgumentException
	 */
	public function bind($src, $ignore = array())
	{
		if (isset($src['categories']) && !is_array($src['categories']))
		{
			$src['categories'] = json_decode(stripcslashes($src['categories']));
		}

		if (isset($src['customfield_values']) && !is_array($src['customfield_values']))
		{
			$src['customfield_values'] = json_decode(stripcslashes($src['customfield_values']));
		}

		return parent::bind($src, $ignore);
	}

	/**
	 * Method to load a row from the database by primary key and bind the fields
	 * to the JTable instance properties.
	 *
	 * @param   mixed    $keys   An optional primary key value to load the row by, or an array of fields to match.  If not
	 *                           set the instance property value is used.
	 * @param   boolean  $reset  True to reset the default values before loading the new row.
	 *
	 * @return  boolean  True if successful. False if row not found.
	 */
	public function load($keys = null, $reset = true)
	{
		parent::load($keys, $reset);

		if (empty($this->categories))
		{
			$categories = ReditemHelperItem::getCategories($this->id);

			if (isset($categories[$this->id]))
			{
				$this->categories = $categories[$this->id];
			}
		}

		return true;
	}
}