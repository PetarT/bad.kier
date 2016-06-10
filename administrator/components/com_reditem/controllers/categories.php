<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

// No direct access
defined('_JEXEC') or die;

/**
 * The categories controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Categories
 * @since       2.0
 */
class ReditemControllerCategories extends RControllerAdmin
{
	/**
	 * constructor (registers additional tasks to methods)
	 */
	public function __construct()
	{
		parent::__construct();

		// Write this to make two tasks use the same method (in this example the add method uses the edit method)
		$this->registerTask('add', 'edit');
	}

	/**
	 * display the add and the edit form
	 *
	 * @return void
	 */
	public function edit()
	{
		$input = JFactory::getApplication()->input;
		$input->set('view', 'category');
		$input->set('layout', 'default');
		$input->set('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * display the elements form
	 *
	 * @return void
	 */
	public function elements()
	{
		$input = JFactory::getApplication()->input;
		$input->set('view', 'categories');
		$input->set('layout', 'default');
		$input->set('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * Method to save the submitted ordering values for records.
	 *
	 * @return  boolean  True on success
	 */
	public function saveorder()
	{
		// Check for request forgeries.
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Get the input
		$pks = $this->input->post->get('cid', array(), 'array');
		$order = $this->input->post->get('order', array(), 'array');
		$cat = $this->input->getInt('cat', 0);

		// Get the model
		$model = $this->getModel();

		// Save the ordering
		$return = $model->saveorderprod($pks, $order, $cat);

		if ($return)
		{
			echo '1';
		}

		JApplication::close();
	}

	/**
	 * Method to set category to "Featured" category.
	 *
	 * @return  void
	 */
	public function setFeatured()
	{
		$app = JFactory::getApplication();
		$input = $app->input;
		$categoryModel = RModel::getAdminInstance('Category', array('ignore_request' => true));

		$cids = $input->array('cid', array(), 'array');
		$return = $input->getBase64('return', null);
		$cid = 0;

		if (!empty($cids))
		{
			$cid = $cids[0];

			if (!$categoryModel->featured($cid, 1))
			{
				$app->enqueueMessage(JText::_('COM_REDITEM_CATEGORIES_SET_FEATURED_ERROR'), 'error');
			}
			else
			{
				$app->enqueueMessage(JText::_('COM_REDITEM_CATEGORIES_SET_FEATURED_SUCCESS'));
			}
		}

		if ($return)
		{
			$this->setRedirect(base64_decode($return));
		}
		else
		{
			$this->setRedirect(JURI::base() . 'index.php?option=com_reditem&view=categories');
		}

		$this->redirect();
	}

	/**
	 * Method to set "Featured" category to category.
	 *
	 * @return  void
	 */
	public function setUnFeatured()
	{
		$app = JFactory::getApplication();
		$input = $app->input;
		$categoryModel = RModel::getAdminInstance('Category', array('ignore_request' => true));

		$cids = $input->get('cid', array(), 'array');
		$return = $input->getBase64('return', null);
		$cid = 0;

		if (!empty($cids))
		{
			$cid = $cids[0];

			if (!$categoryModel->featured($cid, 0))
			{
				$app->enqueueMessage(JText::_('COM_REDITEM_CATEGORIES_SET_UN_FEATURED_ERROR'), 'error');
			}
			else
			{
				$app->enqueueMessage(JText::_('COM_REDITEM_CATEGORIES_SET_UN_FEATURED_SUCCESS'));
			}
		}

		if ($return)
		{
			$this->setRedirect(base64_decode($return));
		}
		else
		{
			$this->setRedirect(JURI::base() . 'index.php?option=com_reditem&view=categories');
		}

		$this->redirect();
	}

	/**
	 * Method for copy categories
	 *
	 * @return void
	 */
	public function copy()
	{
		$input = JFactory::getApplication()->input;
		$cids = $input->get('cid', array(), 'array');

		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem_categories');

		if (count($cids))
		{
			$i = 0;

			foreach ($cids as $cid)
			{
				$categoryModel = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
				$category = $categoryModel->getItem($cid);

				$category->id = null;
				$category->title = JString::increment($category->title);
				unset($category->alias);
				unset($category->asset_id);
				$category->new_level = $category->level;
				$category->new_parent_id = $category->parent_id;

				$categoryTable = RTable::getAdminInstance('Category', array('ignore_request' => true));
				$categoryTable->bind((array) $category);
				$categoryTable->setLocation($category->parent_id, 'last-child');

				if (!$categoryTable->check())
				{
					continue;
				}

				if ($categoryTable->store(false))
				{
					// Copy custom field values
					$dispatcher->trigger('onAfterCopy', array($cid, $categoryTable->id));

					// Copy category's image
					$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/';

					if (JFile::exists($imageFolder . $cid . "/" . $category->category_image))
					{
						JFile::copy($imageFolder . $cid . "/" . $category->category_image, $imageFolder . $categoryTable->id . "/" . $category->category_image);
					}

					// Update related categories for copied one.
					$categoryTable->copyRelatedCategories($cid, $categoryTable->id);

					$i++;
				}
			}

			JFactory::getApplication()->enqueueMessage($i . " " . JText::_(COM_REDITEM_ITEMS_MOVE_SUCCESSFUL));
		};

		$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=categories', false));
	}

	/**
	 * Clean thumbnail files which has created in custom fields of categories
	 *
	 * @return   void
	 */
	public function cleanThumbnail()
	{
		$dispatcher    = RFactory::getDispatcher();
		$cid           = JFactory::getApplication()->input->get('cid', array(), 'array');
		$categoryModel = RModel::getAdminInstance('Category', array(), 'com_reditem');
		$deletedImagesCount	= 0;

		// Clean temporary folder
		$temporaryFolder = JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';
		JFolder::delete($temporaryFolder);
		JFolder::create($temporaryFolder);

		JPluginHelper::importPlugin('reditem_categories');

		if (!$cid)
		{
			return;
		}

		foreach ($cid as $categoryId)
		{
			$category = $categoryModel->getItem($categoryId);
			$categoryImage = '';

			if (!empty($category->category_image))
			{
				$categoryImage = $category->category_image;
			}

			$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/' . $category->id;

			if (JFolder::exists($imageFolder))
			{
				$files = JFolder::files($imageFolder);

				if (count($files))
				{
					// Get all files in image folder
					foreach ($files as $file)
					{
						// Check if file is not in Image Values (this is generated image)
						if ($categoryImage != $file)
						{
							JFile::delete($imageFolder . '/' . $file);
							$deletedImagesCount++;
						}
					}
				}
			}

			// Run event 'onAfterCleanThumb'
			$dispatcher->trigger('onAfterCleanThumb', array($category));
		}

		JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_REDITEM_CATEGORIES_CLEAN_THUMBNAIL_SUCCESSFUL', count($cid), $deletedImagesCount));

		$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=categories', false));
	}

	/**
	 * Method for rebuild permission of list categories given
	 *
	 * @return  void
	 */
	public function rebuildPermission()
	{
		$user = ReditemHelperSystem::getUser();
		$pks  = $this->input->post->get('cid', array(), 'array');

		if (empty($pks) || (!$user->authorise('core.edit.state', 'com_reditem')))
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=categories', false));
		}

		$successCount = 0;

		foreach ($pks as $categoryId)
		{
			$categoryTable = RTable::getAdminInstance('Category', array('ignore_request' => true));

			if (!$categoryTable->load($categoryId))
			{
				continue;
			}

			if ($categoryTable->store())
			{
				$successCount++;
			}
		}

		$message = JText::sprintf('COM_REDITEM_CATEGORIES_REBUILD_PERMISSION_SUCCESS', $successCount);

		$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=categories', false), $message);
	}
}
