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
jimport('joomla.filesystem.folder');

/**
 * Category table
 *
 * @package     RedITEM.Backend
 * @subpackage  Table
 * @since       0.9.1
 */
class ReditemTableCategory extends RTableNested
{
	/**
	 * The name of the table with category
	 *
	 * @var string
	 * @since 0.9.1
	 */
	protected $_tableName = 'reditem_categories';

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
	 * Method to store a node in the database table.
	 *
	 * @param   boolean  $updateNulls  True to update fields even if they are null.
	 *
	 * @return  boolean  True on success.
	 */
	public function store($updateNulls = false)
	{
		$db         = RFactory::getDbo();
		$dispatcher = RFactory::getDispatcher();
		$date       = ReditemHelperSystem::getDateWithTimezone();
		$user       = ReditemHelperSystem::getUser();
		$input      = RFactory::getApplication()->input;
		$isNew      = false;

		JPluginHelper::importPlugin('reditem_categories');
		JPluginHelper::importPlugin('reditem');

		if (!$this->id)
		{
			$isNew = true;
		}

		$query = $db->getQuery(true);
		$jform = $input->get_Array('jform', null);

		// Run event 'onBeforeCategorySave'
		$dispatcher->trigger('onBeforeCategorySave', array($this, $input));

		// Prepare for publish_up & publish_down fields
		if ($this->published == 1 && (int) $this->publish_up == 0)
		{
			$this->publish_up = ReditemHelperSystem::getDateWithTimezone()->toSql();
		}

		if ($this->published == 1 && intval($this->publish_down) == 0)
		{
			$this->publish_down = $db->getNullDate();
		}

		$itemImageUpload  = false;
		$itemImageMedia   = false;
		$oldCategoryImage = '';
		$imageFolder      = '';
		$aliasCheck       = true;

		// Remove spaces from alias
		if (empty($this->alias))
		{
			$this->alias = trim($this->title);
		}

		// Make alias is safe URL
		$this->alias = JFilterOutput::stringURLSafe(trim($this->alias));

		if ($isNew)
		{
			// New category
			$this->created_time = $date->toSql();
			$this->created_user_id = $user->get('id');

			// Check new alias exist in database
			if ($this->checkAlias($this->alias, $this->parent_id, $this->type_id))
			{
				$aliasCheck = false;
			}
		}
		else
		{
			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/' . $this->id . '/';
			$oldCategoryImage = $this->category_image;

			// Existing category
			$this->modified_time = $date->toSql();
			$this->modified_user_id = $user->get('id');

			// If new alias is different with current alias, check new alias exist in database
			if ($this->checkAlias($this->alias, $this->parent_id, $this->type_id, $this->id))
			{
				$aliasCheck = false;
			}
		}

		if (!$aliasCheck)
		{
			// If alias is unavailable, return error for let user change alias.
			JFactory::getApplication()->enqueueMessage(JText::_('COM_REDITEM_CATEGORY_ERROR_SAVE_DUPLICATE_ALIAS'), 'error');

			return false;
		}

		// Uploading/save images
		$categoryfiles = $input->files->get('jform');

		if ($categoryfiles['category_image_file']['name'] != '')
		{
			$categoryfiles['category_image_file']['name'] = time() . '_' . ReditemHelperHelper::replaceSpecial($categoryfiles['category_image_file']['name']);
			$this->category_image = $categoryfiles['category_image_file']['name'];
			$itemImageUpload = true;
		}

		// Choose image from media
		if ($jform['category_image_media'])
		{
			$tmpStrs = explode('/', $jform['category_image_media']);
			$tmpFileName = $tmpStrs[count($tmpStrs) - 1];
			$this->category_image = time() . '_' . ReditemHelperHelper::replaceSpecial($tmpFileName);
			$itemImageMedia = true;
		}

		/*
		 * Remove category_image - Checked
		 */
		if (isset($jform['category_image_remove']))
		{
			$imagePath = $imageFolder . $oldItemImage;

			if (JFile::exists($imagePath))
			{
				JFile::delete($imagePath);
			}

			$this->category_image = '';
		}

		if (!parent::store($updateNulls))
		{
			return false;
		}

		// Add related categories
		$this->relatedCategoriesProcess($this->id, $jform['related_categories']);

		if ($isNew)
		{
			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/' . $this->id . '/';

			if (!JFolder::exists($imageFolder))
			{
				JFolder::create($imageFolder);
			}
		}

		if ($itemImageUpload)
		{
			JFile::upload($categoryfiles['category_image_file']['tmp_name'], $imageFolder . $categoryfiles['category_image_file']['name']);

			// Remove old item image
			if ($oldCategoryImage)
			{
				if (JFile::exists($imageFolder . $oldCategoryImage))
				{
					JFile::delete($imageFolder . $oldCategoryImage);
				}
			}
		}
		elseif ($itemImageMedia)
		{
			// Choose from media manager
			$imageSrc = JPATH_SITE . '/' . $jform['category_image_media'];
			$imageDest = $imageFolder . $this->category_image;

			// Remove old item image
			if ($oldCategoryImage)
			{
				if (JFile::exists($imageFolder . $oldCategoryImage))
				{
					JFile::delete($imageFolder . $oldCategoryImage);
				}
			}

			JFile::copy($imageSrc, $imageDest);
		}

		// Run event 'onAfterCategorySave'
		$dispatcher->trigger('onAfterCategorySave', array($this, $input, $isNew));

		return true;
	}

	/**
	 * Deletes this row in database (or if provided, the row of key $pk)
	 *
	 * @param   mixed    $pk        An optional primary key value to delete.  If not set the instance property value is used.
	 * @param   boolean  $children  An optional boolean variable for delete it's children category or not
	 *
	 * @return  boolean  True on success.
	 */
	public function delete($pk = null, $children = true)
	{
		$db = RFactory::getDBO();
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');

		// Run event 'onBeforeCategoryDelete'
		$dispatcher->trigger('onBeforeCategoryDelete', array($this));

		$where = array();
		$where[] = $db->qn('related_id') . ' = ' . $db->quote($this->id);
		$where[] = $db->qn('parent_id') . ' = ' . $db->quote($this->id);

		// Remove related categories
		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_category_related'))
			->where('((' . implode(') OR (', $where) . '))');

		$db->setQuery($query);
		$db->execute();

		// Remove category image folder
		if (isset($this->id))
		{
			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/' . $this->id . '/';

			if (JFolder::exists($imageFolder))
			{
				JFolder::delete($imageFolder);
			}
		}

		if (!parent::delete($pk, $children))
		{
			return false;
		}

		// Run event 'onAfterCategoryDelete'
		$dispatcher->trigger('onAfterCategoryDelete', array($this));

		return true;
	}

	/**
	 * Process related categories
	 *
	 * @param   int    $categoryId           Category id need to add related categories
	 * @param   array  $relatedCategoriesId  Array of related categories
	 *
	 * @return  void
	 */
	public function relatedCategoriesProcess($categoryId, $relatedCategoriesId)
	{
		$db = RFactory::getDbo();

		$categoryId = (int) $categoryId;

		if (!$categoryId)
		{
			return;
		}

		// Remove old related reference
		$where = array();
		$where[] = $db->qn('related_id') . ' = ' . $db->quote($categoryId);
		$where[] = $db->qn('parent_id') . ' = ' . $db->quote($categoryId);

		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_category_related'))
			->where('((' . implode(') OR (', $where) . '))');

		$db->setQuery($query);
		$db->execute();

		// Check if related categories is empty
		if (!is_array($relatedCategoriesId) || empty($relatedCategoriesId))
		{
			return;
		}

		// Insert new related categories reference
		$query->clear()
			->insert($db->qn('#__reditem_category_related'))
			->columns($db->qn(array('related_id', 'parent_id')));

		foreach ($relatedCategoriesId as $rid)
		{
			$query->values($db->quote($categoryId) . ',' . $db->quote($rid));
			$query->values($db->quote($rid) . ',' . $db->quote($categoryId));
		}

		$db->setQuery($query);
		$db->execute();
	}

	/**
	 * Copy related categories function
	 *
	 * @param   int  $fromId  Copy from category id
	 * @param   int  $toId    Copy to category id
	 *
	 * @return  boolean  True on success.
	 */
	public function copyRelatedCategories($fromId, $toId)
	{
		$db = RFactory::getDbo();
		$query = $db->getQuery(true);
		$query->select($db->qn(array('related_id', 'parent_id')))
			->from($db->qn('#__reditem_category_related'))
			->where($db->qn('related_id') . '=' . $db->q($fromId));

		$db->setQuery($query);
		$rows = $db->loadRowList();

		// Prepare related categories id
		$relatedCategoriesId = array();

		if (count($rows))
		{
			foreach ($rows as $row)
			{
				$relatedCategoriesId[] = $row[1];
			}

			$this->relatedCategoriesProcess($toId, $relatedCategoriesId);
		}

		return true;
	}

	/**
	 * Check alias exist in database
	 *
	 * @param   string  $alias     Alias string
	 * @param   int     $parentId  Parent ID. Default is 1 (Root ID)
	 * @param   int     $typeId    ID of type
	 * @param   int     $id        Id of category
	 *
	 * @return  boolean  True if exist. False otherwise.
	 */
	public function checkAlias($alias, $parentId = null, $typeId = null, $id = null)
	{
		$db = RFactory::getDbo();

		$parentId = (!$parentId) ? 1 : $parentId;

		$query = $db->getQuery(true)
			->select('count(*) AS ' . $db->qn('count'))
			->from($db->qn('#__reditem_categories', 'c'))
			->where($db->qn('c.alias') . ' = ' . $db->quote($alias))
			->where($db->qn('c.parent_id') . ' = ' . (int) $parentId);

		if ($typeId)
		{
			$query->where($db->qn('c.type_id') . ' = ' . (int) $typeId);
		}

		if ($id)
		{
			$query->where($db->qn('c.id') . ' <> ' . (int) $id);
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

		return 'com_reditem.category.' . (int) $this->$key;
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

		// For simple cases, parent to the asset root.
		$assets = self::getInstance('Asset', 'JTable', array('dbo' => $this->getDbo()));
		$rootId = $assets->getRootId();

		if (!empty($rootId))
		{
			return $rootId;
		}

		return 1;
	}
}
