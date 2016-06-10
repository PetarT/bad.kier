<?php
/**
 * @package     RedITEM.Frontend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Category detail model
 *
 * @package     RedITEM.Frontend
 * @subpackage  Model
 * @since       2.1
 */
class ReditemModelCategoryDetailGmap extends RModel
{
	/**
	 * Get data of item
	 *
	 * @return  boolean/array
	 */
	public function getData()
	{
		$app        = JFactory::getApplication();
		$input      = $app->input;
		$id         = $input->getInt('id', 0);
		$params     = $app->getParams();
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem_categories');

		if (!$id)
		{
			return false;
		}

		$categoryModel = RModel::getAdminInstance('Category', array('ignore_request' => true), 'com_reditem');
		$category = $categoryModel->getItem($id);

		if (!$category || empty($category))
		{
			return false;
		}

		// Assigned template
		$templatemodel = RModel::getAdminInstance('Template', array('ignore_request' => true));

		// If menu set a template, get this template Id
		$templateId = $input->getInt('templateId', 0);

		if (!$templateId)
		{
			$templateId = $category->template_id;
		}

		$category->template = $templatemodel->getItem($templateId);

		// Prepare type object
		$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
		$category->type = $typeModel->getItem($category->type_id);

		// Items
		if (strrpos($category->template->content, '{items_loop_start}') !== false)
		{
			// Has tag {items_loop_start}
			$itemsOrdering = 'i.' . $params->get('items_ordering', 'alias');
			$itemsDestination = $params->get('items_destination', 'asc');

			$itemsModel = RModel::getAdminInstance('Items', array('ignore_request' => true), 'com_reditem');

			$limitstart = $input->getInt($itemsModel->getPagination()->prefix . 'limitstart', 0);
			$limit = 0;

			$app->setUserState('com_reditem.items_pagination.limit', $limit);

			$itemsModel->setState('filter.catid', $category->id);
			$itemsModel->setState('filter.published', 1);
			$itemsModel->setState('list.select', 'DISTINCT (i.id)');
			$itemsModel->setState('list.ordering', $itemsOrdering);
			$itemsModel->setState('list.direction', $itemsDestination);
			$itemsModel->setState('list.limit', $limit);
			$itemsModel->setState('list.start', $limitstart);

			// Check if tag {include_sub_category_items} has exists
			if (strrpos($category->template->content, '{include_sub_category_items}') !== false)
			{
				// If current category has sub categories
				$subCategories = ReditemHelper::getSubCategories($id);

				// Add parent category into array
				array_unshift($subCategories, $category->id);

				$itemsModel->setState('filter.catid', $subCategories);
				$itemsModel->setState('filter.item_ids', $this->getItemFilter());

				$category->template->content = str_replace('{include_sub_category_items}', '', $category->template->content);
			}

			/*
			 * Add filter by item's title
			 */
			$filterTitle = $input->getRaw('filter_title', null);

			if ($filterTitle)
			{
				$itemsModel->setState('filter.plgSearchItem', $filterTitle);
			}

			/*
			 * Add filter by custom field value
			 */
			$filterFields = $input->get_Array('filter_customfield', null);

			if ($filterFields)
			{
				$itemsModel->setState('filter.cfTable', '#__reditem_types_' . $category->type->table_name);

				// Remove unused filter custom value
				foreach ($filterFields as $field => $value)
				{
					if (empty($value))
					{
						unset($filterFields[$field]);
					}
					else
					{
						$filterFields[$field] = base64_decode($value);
					}
				}

				$filterFields = new JRegistry($filterFields);

				$itemsModel->setState('filter.cfSearch', $filterFields->toString());
			}

			/*
			 * Add filter by custom field with ranges value
			 */
			$filterFieldsRange = $input->get_Array('filter_ranges', null);

			if ($filterFieldsRange)
			{
				$itemsModel->setState('filter.cfTableRanges', '#__reditem_types_' . $category->type->table_name);

				foreach ($filterFieldsRange as $field => $value)
				{
					if (empty($value))
					{
						unset($filterFieldsRange[$field]);
					}
				}

				$itemsModel->setState('filter.cfSearchRanges', json_encode($filterFieldsRange));
			}

			/**
			 * Add filter by rating value
			 */
			$filterRatingValue = $input->getFloat('filter_rating', null);

			if ($filterRatingValue)
			{
				$itemsModel->setState('filter.rating', (float) $filterRatingValue);
			}

			// Get items list
			$items = $itemsModel->getItems();
			$category->items = array();

			// Prepare data and custom field values for items list
			$itemModel = RModel::getAdminInstance('Item', array('ignore_request' => true), 'com_reditem');
			$itemIds = ReditemHelperItem::getItemIds($items);
			$cfValues = ReditemHelperItem::getCustomFieldValues($itemIds);

			foreach ($items as $itemId)
			{
				$item = $itemModel->getItem($itemId->id);

				if (isset($cfValues[$category->type_id][$itemId->id]))
				{
					$item->customfield_values = $cfValues[$category->type_id][$itemId->id];
				}

				$item->type = $category->type;

				$category->items[] = $item;
			}

			// Process check view permission for sub-categories list.
			ReditemHelperACL::processItemACL($category->items);
		}

		return $category;
	}

	/**
	 * Get items data from filter
	 *
	 * @return  array
	 */
	private function getItemFilter()
	{
		$input = JFactory::getApplication()->input;
		$db    = JFactory::getDBO();

		/*Array ( [category] => Array ( [0] => 40 [1] => ) ) */
		$categoryFilters = $input->get_Array('filter_category', array());
		$categoryFilters = array_filter($categoryFilters);

		// Return empty array for show all items if the filters is "show all"
		if (empty($categoryFilters))
		{
			return array();
		}

		$query = $db->getQuery(true);
		$index = 0;

		foreach ($categoryFilters as $categoryFilter)
		{
			$categories = array();

			if (is_array($categoryFilter))
			{
				foreach ($categoryFilter as $categoryFilterTmpId)
				{
					// Add it's category Id
					$categories[] = $categoryFilterTmpId;

					$tmpSubCategories = ReditemHelper::getSubCategories($categoryFilterTmpId);
					$categories = array_merge($categories, $tmpSubCategories);
				}
			}
			else
			{
				$categories = ReditemHelper::getSubCategories($categoryFilter);

				// Add it's category Id
				$categories[] = $categoryFilter;
			}

			if ($index == 0)
			{
				$query->select('DISTINCT (x.item_id)')
					->from($db->qn('#__reditem_item_category_xref', 'x'))
					->where($db->qn('x.category_id') . ' IN (' . implode(',', $categories) . ')');
			}
			else
			{
				$table = $db->qn('#__reditem_item_category_xref', 'x' . $index);

				$query->innerjoin($table . ' ON ' . $db->qn('x.item_id') . ' = ' . $db->qn('x' . $index . '.item_id'))
					->where($db->qn('x' . $index . '.category_id') . ' IN (' . implode(',', $categories) . ')');
			}

			$index++;
		}

		$db->setQuery($query);
		$itemIds = $db->loadColumn();

		if (empty($itemIds))
		{
			return array(-1);
		}

		return $itemIds;
	}
}
