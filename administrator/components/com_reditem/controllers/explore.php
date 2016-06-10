<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

/**
 * The explore controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Explore
 * @since       2.1.19
 */
class ReditemControllerExplore extends RControllerAdmin
{
	/**
	 * Constructor.
	 *
	 * @param   array  $config  An optional associative array of configuration settings.
	 *
	 * @throws  Exception
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);

		// Write this to make two tasks use the same method (in this example the add method uses the edit method)
		$this->registerTask('add', 'edit');

		// Move function use the same method with copy function
		$this->registerTask('move', 'copy');

		// Register items convert task
		$this->registerTask('convert', 'convert');
	}

	/**
	 * Method for clear state of Explore
	 *
	 * @return  void
	 */
	public function clear()
	{
		$app = JFactory::getApplication();
		$app->setUserState('com_reditem.explore.parent_id', 0);

		$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore', false));
	}

	/**
	 * This method will redirect edit item or categories item
	 *
	 * @return void
	 */
	public function edit()
	{
		$app      = JFactory::getApplication();
		$input    = $app->input;
		$catIds   = array();
		$itemIds  = array();
		$parentId = $input->get('parent_id', 0, 'int');
		$post     = $input->get('ritem', array(), 'array');

		// Get item Categories id
		if (isset($post['catIds']))
		{
			$catIds = $post['catIds'];
		}

		// Get item items id
		if (isset($post['itemIds']))
		{
			$itemIds = $post['itemIds'];
		}

		$countCategories = count($catIds);

		if ((int) $countCategories == 0)
		{
			$edit = $itemIds[0];
			$task = 'item.edit';
		}
		else
		{
			$edit = $catIds[0];
			$task = 'category.edit';
		}

		$this->setRedirect(
			JRoute::_(
				'index.php?option=com_reditem&task=' . $task . '&id=' . $edit . '&fromExplore=1&parent_id=' . $parentId,
				false
			)
		);
	}

	/**
	 * Get limit from request
	 *
	 * @return int
	 */
	public function getLimit()
	{
		$app   = JFactory::getApplication();
		$input = $app->input;
		$list  = $input->get('list', array(), 'array');
		$limit = $list['items_limit'];

		if (empty($list))
		{
			$limit = $input->get('limit');
		}

		return (int) $limit;
	}

	/**
	 * Delete item in lists
	 *
	 * @return void
	 */
	public function delete()
	{
		$app     = JFactory::getApplication();
		$input   = $app->input;
		$catIds  = array();
		$itemIds = array();
		$post    = $input->get('ritem', array(), 'array');
		$typeId  = $post['typeId'];

		$limit = $this->getLimit();

		if ($typeId == null)
		{
			$typeId = $app->input->get('typeId', null);
		}

		$current = $post['parentId'];

		if (isset($post['catIds']))
		{
			$catIds = $post['catIds'];
		}

		if (isset($post['itemIds']))
		{
			$itemIds = $post['itemIds'];
		}

		$modelCategory = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$modelItem     = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');
		$countDeleted  = (int) count($catIds) + (int) count($itemIds);

		if (count($catIds) > 0)
		{
			// Delete categories item id
			if (!is_array($catIds) || count($catIds) < 1)
			{
				JLog::add(JText::_($this->text_prefix . '_NO_ITEM_SELECTED'), JLog::WARNING, 'jerror');
			}
			else
			{
				// Remove the Categories
				if ($modelCategory->delete($catIds))
				{
					$this->setMessage(JText::plural($this->text_prefix . '_N_ITEMS_DELETED', count($catIds)));
				}
				else
				{
					$this->setMessage($modelCategory->getError(), 'error');
				}
			}
		}

		if (count($itemIds) > 0)
		{
			// Delete items id
			if (!is_array($itemIds) || count($itemIds) < 1)
			{
				JLog::add(JText::_($this->text_prefix . '_NO_ITEM_SELECTED'), JLog::WARNING, 'jerror');
			}
			else
			{
				// Remove the items.
				if ($modelItem->delete($itemIds))
				{
					$this->setMessage($this->setMessage(JText::plural($this->text_prefix . '_N_ITEMS_DELETED', $countDeleted)));
				}
				else
				{
					$this->setMessage($modelItem->getError(), 'error');
				}
			}
		}

		if ($current != 0)
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId . '&cid=' . $current, false));
		}
		else
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explorelimit=' . $limit . '&typeId=' . $typeId, false));
		}
	}

	/**
	 * This method will sort Categories or items list
	 *
	 * @return string
	 */
	public function ajaxSaveOrder()
	{
		// Get the input
		$pks     = $this->input->get('ritem', array(), 'array');
		$order   = $this->input->get('order', array(), 'array');
		$sort    = null;
		$catIds  = array();
		$itemIds = array();

		if (isset($pks['catIds']))
		{
			$catIds = $pks['catIds'];
		}

		if (isset($pks['itemIds']))
		{
			$itemIds = $pks['itemIds'];
		}

		// Sanitize the input
		JArrayHelper::toInteger($order);

		if (count($itemIds) > 0)
		{
			$sort = 'items';
		}

		if (count($catIds) > 0)
		{
			$sort = 'categories';
		}

		switch ($sort)
		{
			case 'items':

				JArrayHelper::toInteger($itemIds);

				// Get model categories
				$model = RModel::getAdminInstance('item', array('ignore_request' => true), 'com_reditem');

				// Save the ordering
				$return = $model->saveorder($itemIds, $order);

				if ($return)
				{
					echo '1';
				}
				else
				{
					echo '0';
				}

				break;
			case 'categories':

				JArrayHelper::toInteger($catIds);

				// Get model categories
				$model = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');

				// Save the ordering
				$return = $model->saveorder($catIds, $order);

				if ($return)
				{
					echo '1';
				}
				else
				{
					echo '0';
				}

				break;
			default:

				echo '0';
				break;
		}

		// Close the application
		JFactory::getApplication()->close();
	}

	/**
	 * Checkin method for categories and items
	 *
	 * @return void|boolean
	 */
	public function checkIn()
	{
		$app     = JFactory::getApplication();
		$input   = $app->input;
		$catIds  = array();
		$itemIds = array();
		$post    = $input->get('ritem', array(), 'array');
		$typeId  = $post['typeId'];
		$limit   = $this->getLimit();
		$message = '';

		if ($typeId == null || !isset($typeId))
		{
			$typeId = $app->input->getInt('typeId', 0);
		}

		$current = $post['parentId'];

		if (isset($post['catIds']))
		{
			$catIds = $post['catIds'];
		}

		if (isset($post['itemIds']))
		{
			$itemIds = $post['itemIds'];
		}

		// Get model categories
		$modelCategories = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');

		// Get model items
		$modelItems = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');

		$countCheckin = (int) count($catIds) + (int) count($itemIds);

		if (count($catIds) > 0)
		{
			$return = $modelCategories->checkin($catIds);

			if ($return === false)
			{
				// Checkin failed.
				$message = JText::sprintf('JLIB_APPLICATION_ERROR_CHECKIN_FAILED', $modelCategories->getError());

				// Set redirect
				$this->setRedirect($this->getRedirectToListRoute(), $message, 'error');

				return false;
			}
			else
			{
				// Checkin succeeded.
				$message = JText::plural($this->text_prefix . '_N_ITEMS_CHECKED_IN', count($catIds));
			}
		}

		if (count($itemIds) > 0)
		{
			$return = $modelItems->checkin($itemIds);

			if ($return === false)
			{
				// Checkin failed.
				$message = JText::sprintf('JLIB_APPLICATION_ERROR_CHECKIN_FAILED', $modelItems->getError());

				if ($current)
				{
					$this->setRedirect(
						JRoute::_(
							'index.php?option=com_reditem&view=explore&limit='
							. $limit
							. '&typeId='
							. $typeId
							. '&cid='
							. $current, false
						),
						$message
					);
				}
				else
				{
					$this->setRedirect(JRoute::_('index.php?option=com_reditem&limit=' . $limit . '&typeId=' . $typeId . '&view=explore', false), $message);
				}

				return false;
			}
			else
			{
				// Checkin succeeded.
				$message = JText::plural($this->text_prefix . '_N_ITEMS_CHECKED_IN', $countCheckin);
			}
		}

		if ($current != 0)
		{
			$this->setRedirect(
				JRoute::_(
					'index.php?option=com_reditem&view=explore&limit='
					. $limit
					. '&typeId='
					. $typeId
					. '&cid='
					. $current, false
				),
				$message
			);
		}
		else
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId, false), $message);
		}
	}

	/**
	 * This is publish and unpublish method for both items and categories
	 *
	 * @return void
	 */
	public function publish()
	{
		$app     = JFactory::getApplication();
		$input   = $app->input;
		$catIds  = array();
		$itemIds = array();
		$post    = $input->get('ritem', array(), 'array');
		$typeId  = $post['typeId'];
		$limit   = $this->getLimit();

		if ($typeId == null || !isset($typeId))
		{
			$typeId = $app->input->getInt('typeId', 0);
		}

		$current = $post['parentId'];

		// Get item Categories id
		if (isset($post['catIds']))
		{
			$catIds = $post['catIds'];
		}

		// Get item items id
		if (isset($post['itemIds']))
		{
			$itemIds = $post['itemIds'];
		}

		// Get model categories
		$modelCategory = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');

		// Get model items
		$modelItem = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');

		$value = JArrayHelper::getValue($this->states, $this->getTask(), 0, 'int');

		$countCheckin = (int) count($catIds) + (int) count($itemIds);

		$task = $this->getTask();

		if (count($catIds) > 0)
		{
			// Make sure the item ids are integers
			JArrayHelper::toInteger($catIds);

			if ($modelCategory->publish($catIds, $value))
			{
				if ($task === 'publish')
				{
					$ntext = $this->text_prefix . '_N_ITEMS_PUBLISHED';
				}
				else
				{
					$ntext = $this->text_prefix . '_N_ITEMS_UNPUBLISHED';
				}

				$this->setMessage(JText::plural($ntext, count($catIds)));
			}
		}

		if (count($itemIds) > 0)
		{
			// Make sure the item ids are integers
			JArrayHelper::toInteger($itemIds);

			if ($modelItem->publish($itemIds, $value))
			{
				if ($task === 'publish')
				{
					$ntext = $this->text_prefix . '_N_ITEMS_PUBLISHED';
				}
				else
				{
					$ntext = $this->text_prefix . '_N_ITEMS_UNPUBLISHED';
				}

				$this->setMessage(JText::plural($ntext, $countCheckin));
			}
		}

		if ($current != 0)
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId . '&cid=' . $current, false));
		}
		else
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId, false));
		}
	}

	/**
	 * This copy function will copy and move both items and categories in the same type by ajax
	 *
	 * @return void
	 */
	public function copy()
	{
		// Process save item copy to global variable
		$app     = JFactory::getApplication();
		$input   = $app->input;
		$catIds  = array();
		$itemIds = array();
		$post    = $input->get('ritem', array(), 'array');
		$task    = $this->getTask();

		// Get item Categories id
		if (isset($post['catIds']))
		{
			$catIds = $post['catIds'];
		}

		// Get item items id
		if (isset($post['itemIds']))
		{
			$itemIds = $post['itemIds'];
		}

		// Count item and categories
		$total = count($catIds) + count($itemIds);

		if ($task == 'copy')
		{
			$message = JText::sprintf('COM_REDITEM_EXPLORE_CONTROLER_COPY_ITEMS_CATEGORIES', $total);
		}
		else
		{
			$message = JText::sprintf('COM_REDITEM_EXPLORE_CONTROLER_MOVE_ITEMS_CATEGORIES', $total);
		}

		$data = array(
			'task'       => $task,
			'categories' => $catIds,
			'items'      => $itemIds,
			'typeId'     => $post['typeId'],
			'message'    => $message
		);

		// Set category to system
		JFactory::getApplication()->setUserState('ItemsMoved', $data);

		echo json_encode($data);

		// Close the application
		JFactory::getApplication()->close();
	}

	/**
	 * This method paste items or categories in the same type
	 *
	 * @return void
	 */
	public function paste()
	{
		// Process save item coppy to global varible
		$app    = JFactory::getApplication();
		$input  = $app->input;
		$post   = $input->get('ritem', array(), 'array');
		$typeId = $post['typeId'];
		$limit  = $this->getLimit();

		if ($typeId == null)
		{
			$typeId = $app->input->get('typeId', null);
		}

		// Target category
		$parentCategoryId = $post['parentId'];

		if ((int) $parentCategoryId == 0)
		{
			$parentCategoryId = 1;
		}

		// Copy or move item
		$dataSession   = JFactory::getApplication()->getUserState('ItemsMoved');
		$sessionTypeId = $dataSession['typeId'];
		$current       = $post['parentId'];

		if ($typeId == null || !isset($typeId))
		{
			$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&parent_id=' . $current, false));
		}

		// Check if session is empty array show warning message that no item copy or move
		if (count($dataSession) == 0)
		{
			$this->setMessage(JText::_('COM_REDITEM_EXPLORE_CONTROLER_PAST_ITEMS_CATEGORIES_NO_ITEMS'), 'warning');

			if ($current != 0)
			{
				$this->setRedirect(
					JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId . '&parent_id=' . $current, false)
				);
			}
			else
			{
				$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId, false));
			}
		}
		else
		{
			// If they have difference type show warning message
			if ($typeId !== $sessionTypeId)
			{
				$this->setMessage(JText::_('COM_REDITEM_EXPLORE_CONTROLER_PAST_ITEMS_CATEGORIES_WRONG_TYPE'), 'warning');

				// Set null data session
				JFactory::getApplication()->setUserState('ItemsMoved', array());

				if ($current != 0)
				{
					$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId . '&cid=' . $current, false));
				}
				else
				{
					$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit, false));
				}
			}
			else
			{
				$task = $dataSession['task'];

				switch ($task)
				{
					case 'copy':
						// Clone categories in list
						$catIds = $dataSession['categories'];
						$this->copyCategoriesProcess($catIds, $parentCategoryId);

						// Clone items in list
						$itemIds = $dataSession['items'];
						$this->copyItemsProcess($itemIds, $parentCategoryId);

						break;
					case 'move':
						// Clone categories in list
						$catIds = $dataSession['categories'];
						$this->moveCategoriesProcess($catIds, $parentCategoryId);

						// Clone items in list
						$itemIds = $dataSession['items'];
						$this->moveItemsProcess($itemIds, $parentCategoryId);
						break;
					default:
						$catIds  = array();
						$itemIds = array();
						break;
				}

				// After past action completed, clear session to make sure it will be clear
				JFactory::getApplication()->setUserState('ItemsMoved', array());

				// Redirect back to explore view
				$countItems = count($catIds) + count($itemIds);

				$textItem = JText::sprintf('COM_REDITEM_EXPLORE_CONTROLER_PAST_ITEM_COMPLETED', 1);

				if ($countItems > 1)
				{
					$textItem = JText::sprintf('COM_REDITEM_EXPLORE_CONTROLER_PAST_ITEMS_COMPLETED', $countItems);
				}

				if ($current != 0)
				{
					$this->setRedirect(
						JRoute::_(
							'index.php?option=com_reditem&view=explore&limit='
							. $limit
							. '&typeId='
							. $typeId
							. '&cid='
							. $current, false
						),
						$textItem
					);
				}
				else
				{
					$this->setRedirect(JRoute::_('index.php?option=com_reditem&view=explore&limit=' . $limit, false), $textItem);
				}
			}
		}
	}

	/**
	 * This is copy process of categories from paste action
	 *
	 * @param   array  $catIds            This value include array id
	 * @param   int    $parentCategoryId  This value only have parent id
	 *
	 * @return void
	 */
	public function copyCategoriesProcess($catIds, $parentCategoryId)
	{
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem_categories');

		// Load parent category
		$categoryModel  = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$parentCategory = $categoryModel->getItem($parentCategoryId);

		if (count($catIds))
		{
			$i = 0;

			foreach ($catIds as $catId)
			{
				$category = $categoryModel->getItem($catId);

				if ((int) $parentCategoryId == 1)
				{
					$parentCategory->type_id     = $category->type_id;
					$parentCategory->template_id = $category->template_id;
				}

				$category->id            = null;
				$category->title         = JString::increment($category->title);
				$category->parent_id     = $parentCategoryId;
				$category->type_id       = $parentCategory->type_id;
				$category->template_id   = $parentCategory->template_id;
				$category->new_level     = $category->level;
				$category->new_parent_id = $parentCategoryId;
				unset($category->alias);
				unset($category->asset_id);

				$categoryTable = RTable::getAdminInstance('Category', array('ignore_request' => true));
				$categoryTable->bind((array) $category);
				$categoryTable->setLocation($parentCategoryId, 'last-child');

				if (!$categoryTable->check())
				{
					continue;
				}

				if ($categoryTable->store(false))
				{
					// Copy custom field values
					$dispatcher->trigger('onAfterCopy', array($catId, $categoryTable->id));

					// Copy category's image
					$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/';

					if (JFile::exists($imageFolder . $catId . '/' . $category->category_image))
					{
						JFile::copy($imageFolder . $catId . '/' . $category->category_image, $imageFolder . $categoryTable->id . '/' . $category->category_image);
					}

					// Update related categories for copied one.
					$categoryTable->copyRelatedCategories($catId, $categoryTable->id);

					$i++;
				}
			}
		}
	}

	/**
	 * This is copy items process from paste action
	 *
	 * @param   array  $itemIds           this is array items id
	 * @param   int    $parentCategoryId  this is int value
	 *
	 * @return void
	 */
	public function copyItemsProcess($itemIds, $parentCategoryId)
	{
		// Load parent category
		$categoryModel  = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$parentCategory = $categoryModel->getItem($parentCategoryId);
		$itemTable      = RTable::getAdminInstance('Item', array('ignore_request' => true));

		$itemModel = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');

		if (count($itemIds))
		{
			$i = 0;

			foreach ($itemIds as $itemid)
			{
				$item = $itemModel->getItem($itemid);

				$item->id          = null;
				$item->alias       = '';
				$item->title       = JString::increment($item->title);
				$item->type_id     = $parentCategory->type_id;
				$item->template_id = $parentCategory->template_id;

				unset($item->categories);
				unset($item->customfield_values);

				$itemTable->bind((array) $item);

				if (!$itemTable->check())
				{
					continue;
				}

				if ($itemTable->store(false))
				{
					// Copy customfields
					$itemTable->copyCustomfields($itemTable->type_id, $itemid, $itemTable->id);

					// Copy categories Xref
					$batchCategories = array($parentCategoryId);
					$itemTable->createCategoriesXref($itemTable->id, $batchCategories);

					$i++;
				}
			}
		}
	}

	/**
	 * This is move process of categories from paste action
	 *
	 * @param   array  $catIds            this is array categories id
	 * @param   int    $parentCategoryId  this is id of paretn category
	 *
	 * @return void
	 */
	public function moveCategoriesProcess($catIds, $parentCategoryId)
	{
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem_categories');

		// Load parent category
		$categoryModel  = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$categoryTable  = RTable::getAdminInstance('Category', array('ignore_request' => true));
		$parentCategory = $categoryModel->getItem($parentCategoryId);

		if (count($catIds))
		{
			$i = 0;

			foreach ($catIds as $catId)
			{
				$category = $categoryModel->getItem($catId);

				$category->parent_id   = $parentCategoryId;
				$category->type_id     = $parentCategory->type_id;
				$category->template_id = $parentCategory->template_id;

				$categoryTable->bind((array) $category);
				$categoryTable->setLocation($parentCategoryId, 'last-child');

				if (!$categoryTable->check())
				{
					continue;
				}

				if ($categoryTable->store(false))
				{
					// Copy custom field values
					$dispatcher->trigger('onAfterCopy', array($catId, $categoryTable->id));

					// Copy category's image
					$imageFolder = JPATH_ROOT . '/media/com_reditem/images/category/';

					if (JFile::exists($imageFolder . $catId . '/' . $category->category_image))
					{
						JFile::copy($imageFolder . $catId . '/' . $category->category_image, $imageFolder . $categoryTable->id . '/' . $category->category_image);
					}

					// Update related categories for copied one.
					$categoryTable->copyRelatedCategories($catId, $categoryTable->id);

					$i++;
				}
			}
		}
	}

	/**
	 * This is move process of items from paste action
	 *
	 * @param   array  $itemIds           this is array item id
	 * @param   int    $parentCategoryId  this is parent category id
	 *
	 * @return void
	 */
	public function moveItemsProcess($itemIds, $parentCategoryId)
	{
		// Load parent category
		$categoryModel  = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$parentCategory = $categoryModel->getItem($parentCategoryId);

		if (count($itemIds))
		{
			$i = 0;

			foreach ($itemIds as $itemid)
			{
				$itemModel         = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');
				$item              = $itemModel->getItem($itemid);
				$item->type_id     = $parentCategory->type_id;
				$item->template_id = $parentCategory->template_id;

				// Move item to chosen categories of batch process
				$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true));
				$itemTable->bind((array) $item);
				$itemTable->store(false);

				// Delete xref categories
				$itemTable->deleteCategoriesXref($itemid);

				// Copy categories Xref
				$batchCategories = array($parentCategoryId);

				// Update
				$itemTable->createCategoriesXref($itemid, $batchCategories);

				$i++;
			}
		}
	}

	/**
	 * Controller function for preforming items/categories convert operation.
	 * It converts items/categories from one type to another, migrating fields
	 * in that process.
	 *
	 * @return void Redirect page to list view.
	 */
	public function convert()
	{
		$input      = JFactory::getApplication()->input;
		$itemIds    = array();
		$selections = $input->get('ritem', array(), 'array');
		$convert    = $input->get('convert', array(), 'array');
		$model      = $this->getModel('Items');
		$limit      = $this->getLimit();
		$parentId   = $input->getInt('parent_id', 0);
		$typeId     = $input->getInt('type_id', 0);

		// Get item items id
		if (isset($selections['itemIds']))
		{
			$itemIds = $selections['itemIds'];
		}

		if (!empty($itemIds))
		{
			if ($model->convert($itemIds, $typeId, $convert['type'], $convert['template'], $convert['fields'], $convert['categories'], $convert['keeporg']))
			{
				$msg     = JText::_('COM_REDITEM_ITEMS_CONVERT_SUCCESS');
				$msgType = 'message';
			}
			else
			{
				$msg     = JText::_('COM_REDITEM_ITEMS_CONVERT_FAILURE');
				$msgType = 'warning';
			}
		}
		else
		{
			$msg     = JText::_('COM_REDITEM_ITEMS_CONVERT_ONLY_ITEMS');
			$msgType = 'warning';
		}

		$this->setRedirect(
			JRoute::_(
				'index.php?option=com_reditem&view=explore&limit=' . $limit . '&typeId=' . $typeId . '&parent_id=' . $parentId,
				false
			),
			$msg,
			$msgType
		);
	}
}
