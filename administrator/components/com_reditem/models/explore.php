<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * RedITEM explore Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Explore
 * @since       2.1.19
 *
 */
class ReditemModelExplore extends RModelList
{
	/**
	 * Context for session
	 *
	 * @var  string
	 */
	protected $context = 'com_reditem.explore';

	/**
	 * Name of the filter form to load
	 *
	 * @var  string
	 */
	protected $filterFormName = 'filter_explore';

	/**
	 * Limitstart field used by the pagination
	 *
	 * @var  string
	 */
	protected $limitField = 'explore_limit';

	/**
	 * Limitstart field used by the pagination
	 *
	 * @var  string
	 */
	protected $limitstartField = 'auto';

	/**
	 * Constructor.
	 *
	 * @param   array  $config  [description]
	 *
	 * @see     JController
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$filterFields = array(
				'title',
				'ordering',
				'i.ordering',
				'author',
				'template'
			);

			$config['filter_fields'] = $filterFields;
		}

		parent::__construct($config);
	}

	/**
	 * Method to get items and categories
	 *
	 * @return array
	 */
	public function getItems()
	{
		$app   = JFactory::getApplication();
		$input = $app->input;
		$categoryOrder = 'c.ordering';
		$itemOrder     = 'i.ordering';
		$limit         = 0;

		// Get category ID from url
		$categoryId = $app->getUserState('com_reditem.explore.parent_id', 0);
		$typeId     = $this->getState('filter.typeId', 0);
		$data       = $input->get('filter', array(), 'array');
		$list       = $input->get('list', array(), 'array');
		$ordering   = $input->get('list.ordering', 'title');
		$direction  = $this->getState('list.direction', 'asc');

		switch ($ordering)
		{
			case 'author':
				$categoryOrder = 'c.created_id';
				$itemOrder = 'ua.name';
				break;

			case 'template':
				$categoryOrder = 'template_name';
				$itemOrder = 'template_name';
				break;

			case 'title':
				$categoryOrder = 'c.title';
				$itemOrder = 'i.title';
				break;

			default:
				break;
		}

		if (isset($list['items_limit']))
		{
			$limit = $list['items_limit'];
		}
		else
		{
			$limit = $input->getInt('limit', 0);
		}

		$limitStart = $input->getInt('limitstart', 0);

		if (!$typeId && !$categoryId)
		{
			return array(
				'categories' => array(),
				'items'      => array(),
				'total'      => 0
			);
		}

		// Get model categories
		$modelCategories = RModel::getAdminInstance('Categories', array('ignore_request' => true), 'com_reditem');
		$modelItems      = RModel::getAdminInstance('items', array('ignore_request' => true), 'com_reditem');

		// Set filter for categories
		if (!$categoryId)
		{
			// Get categories that have parent id is root
			$modelCategories->setState('filter.filter_types', $typeId);
			$modelCategories->setState('filter.parentid', '1');
			$modelCategories->setState('list.ordering', $categoryOrder);
			$modelCategories->setState('list.direction', $direction);
			$modelCategories->setState('filter.isOrder', true);
			$countCategories = count($modelCategories->getItems());

			if ((int) $limit != 0)
			{
				$modelCategories->setState('list.limit', $limit);
				$modelCategories->setState('list.start', $limitStart);
			}

			$itemsCategories = $modelCategories->getItems();

			return array(
				'categories' => $itemsCategories,
				'items'      => array(),
				'total'      => $countCategories
			);
		}

		// Filter by categories and count
		$modelCategories->setState('filter.filter_types', $typeId);
		$modelCategories->setState('filter.parentid', $categoryId);
		$modelCategories->setState('list.ordering', $categoryOrder);
		$modelCategories->setState('list.direction', $direction);

		// Filter by items and count
		$modelItems->setState('filter.filter_types', $typeId);
		$modelItems->setState('filter.catid', $categoryId);
		$modelItems->setState('list.ordering', $itemOrder);
		$modelItems->setState('list.direction', $direction);

		// Count categories item
		$countCategories = count($modelCategories->getItems());
		$countItems      = count($modelItems->getItems());

		if ((int) $limit != 0)
		{
			// Begin compare
			$limitCategories = $countCategories - $limitStart;

			if ($limitCategories >= $limit)
			{
				$modelCategories->setState('list.limit', $limit);
				$modelCategories->setState('list.start', $limitStart);

				$itemsCategories = $modelCategories->getItems();
				$itemsItems = array();
			}
			elseif ($limitCategories <= 0)
			{
				$limitT = $countCategories + $countItems - $limitStart;

				if ($limitT < $limit)
				{
					$limit = $limitT;
				}

				// Get only item
				$modelItems->setState('list.limit', $limit);
				$modelItems->setState('list.start', $limitStart - $countCategories);

				$itemsItems = $modelItems->getItems();
				$itemsCategories = array();
			}
			else
			{
				$modelCategories->setState('list.limit', $limitCategories);
				$modelCategories->setState('list.start', $limitStart);

				$itemsCategories = $modelCategories->getItems();

				// Begin items
				$modelItems->setState('list.limit', $limit - $limitCategories);
				$modelItems->setState('list.start', 0);

				$itemsItems = $modelItems->getItems();
			}
		}
		else
		{
			$itemsCategories = $modelCategories->getItems();
			$itemsItems      = $modelItems->getItems();
		}

		return array(
			'categories' => $itemsCategories,
			'items'      => $itemsItems,
			'total'      => (int) $countCategories + (int) $countItems
		);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * @param   string  $ordering   [description]
	 * @param   string  $direction  [description]
	 *
	 * @return  void
	 */
	protected function populateState($ordering = 'ordering', $direction = 'asc')
	{
		$app = JFactory::getApplication();

		$filterSearch = $this->getUserStateFromRequest($this->context . '.filter_search', 'filter_search');
		$this->setState('filter.search', $filterSearch);

		$filterPlgSearchCategory = $this->getUserStateFromRequest($this->context . '.filter_plgSearchCategory', 'filter_plgSearchCategory');
		$this->setState('filter.plgSearchCategory', $filterPlgSearchCategory);

		$filterTypeId = $this->getUserStateFromRequest($this->context . '.filter_typeId', 'filter_typeId');
		$this->setState('filter.typeId', $filterTypeId);

		$filterIds = $this->getUserStateFromRequest($this->context . '.filter_ids', 'filter_ids');
		$this->setState('filter.ids', $filterIds);

		$parent = $this->getUserStateFromRequest($this->context . '.filter_parentid', 'filter_parentid');
		$this->setState('filter.parentid', $parent);

		$value = $app->getUserStateFromRequest('global.list.limit', $this->paginationPrefix . 'limit', $app->getCfg('list_limit'), 'uint');
		$limit = $value;
		$this->setState('list.limit', $limit);

		$value = $app->getUserStateFromRequest($this->context . '.limitstart', $this->paginationPrefix . 'limitstart', 0);
		$limitstart = ($limit != 0 ? (floor($value / $limit) * $limit) : 0);
		$this->setState('list.start', $limitstart);

		parent::populateState($ordering, $direction);
	}
}
