<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/helper.php';

/**
 * RedITEM items Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.items
 * @since       0.9.1
 *
 */
class ReditemModelItems extends RModelList
{
	/**
	 * Name of the filter form to load
	 *
	 * @var  string
	 */
	protected $filterFormName = 'filter_items';

	/**
	 * Limitstart field used by the pagination
	 *
	 * @var  string
	 */
	protected $limitField = 'items_limit';

	/**
	 * Limitstart field used by the pagination
	 *
	 * @var  string
	 */
	protected $limitstartField = 'auto';

	/**
	 * Csv columns per type id.
	 *
	 * @var array $csvColumns
	 */
	private static $csvColumns = array();

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
				'title', 'i.title',
				'ordering', 'i.ordering',
				'published', 'i.published',
				'access', 'i.access', 'access_level',
				'template_name',
				'featured', 'i.featured',
				'type_id', 'i.type_id', 'type_name',
				'i.id', 'filter_types',
				'blocked', 'i.blocked',

				// Allow sort by created & modified time. Please make sure we have this col sortable in template file
				'created_time', 'i.created_time',
				'modified_time', 'i.modified_time',
				// Allow sort by author
				'created_user_id', 'i.created_user_id'
			);

			$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
			$fieldsModel->setState('filter.searchableInBackend', 1);

			$seachInBackendFields = $fieldsModel->getItems();

			if ($seachInBackendFields)
			{
				foreach ($seachInBackendFields as $seachInBackendField)
				{
					$filterFields[] = 'cfv.' . $seachInBackendField->fieldcode;
					$filterFields[] = 'cfv_' . $seachInBackendField->fieldcode;
				}
			}

			$config['filter_fields'] = $filterFields;
		}

		parent::__construct($config);
	}

	/**
	 * Method to cache the last query constructed.
	 *
	 * This method ensures that the query is constructed only once for a given state of the model.
	 *
	 * @return JDatabaseQuery A JDatabaseQuery object
	 */
	public function getListQuery()
	{
		$db     = JFactory::getDbo();
		$user   = ReditemHelperSystem::getUser();
		$groups = $user->getAuthorisedViewLevels();
		$app    = JFactory::getApplication();

		$query = $db->getQuery(true)
			->select(
				$this->getState(
					'list.select',
					'i.*, ty.title AS type_name, tmpl.name AS template_name, ag.title AS access_level, ua.name AS author_name'
				)
			);
		$query->from($db->qn('#__reditem_items', 'i'));
		$query->leftJoin($db->qn('#__reditem_types', 'ty') . ' ON ' . $db->qn('i.type_id') . ' = ' . $db->qn('ty.id'));
		$query->leftJoin($db->qn('#__reditem_templates', 'tmpl') . ' ON ' . $db->qn('i.template_id') . ' = ' . $db->qn('tmpl.id'));

		$query->leftjoin($db->qn('#__users', 'ua') . ' ON ua.id = i.created_user_id');

		$filterType = (int) $this->getState('filter.filter_types');

		if ($filterType)
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$type = $typeModel->getItem($filterType);

			$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
			$fieldsModel->setState('filter.searchableInBackend', 1);
			$fieldsModel->setState('filter.types', $filterType);

			$seachInBackendFields = $fieldsModel->getItems();

			if ($seachInBackendFields)
			{
				$query->leftJoin($db->qn('#__reditem_types_' . $type->table_name, 'cfv') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('cfv.id'));

				foreach ($seachInBackendFields as $seachInBackendField)
				{
					$query->select($db->qn('cfv.' . $seachInBackendField->fieldcode, 'cfv_' . $seachInBackendField->fieldcode));
				}
			}
		}

		// Join over the asset groups.
		$query->leftJoin($db->qn('#__viewlevels', 'ag') . ' ON ' . $db->qn('ag.id') . ' = ' . $db->qn('i.access'));

		// If this is filter on custom value
		$cfTable = $this->getState('filter.cfTable', '');

		if (!empty($cfTable))
		{
			$query->leftJoin($db->qn($cfTable, 'cf') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('cf.id'));

			$cfSearch = $this->getState('filter.cfSearch', '');

			if (!empty($cfSearch))
			{
				$jsonSearch = json_decode($cfSearch, true);

				if ($jsonSearch)
				{
					foreach ($jsonSearch as $column => $value)
					{
						if (is_array($value))
						{
							$where = array();

							foreach ($value as $tmpValue)
							{
								$tmpWhere = array();

								// Check if search value has "%" character
								if (strpos($tmpValue, '%') !== false)
								{
									$where[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote($tmpValue);
								}
								else
								{
									$tmpWhere[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote($db->escape($tmpValue, true));
									$tmpWhere[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote('%' . $db->escape(json_encode($tmpValue), true) . '%');
								}

								$where[] = '(' . implode(') OR (', $tmpWhere) . ')';
							}

							$query->where('((' . implode(') OR (', $where) . '))');
						}
						else
						{
							$where = array();

							// Check if search value has "%" character
							if (strpos($value, '%') !== false)
							{
								$where[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote($value);
							}
							else
							{
								$where[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote($db->escape($value, true));
								$where[] = $db->qn('cf.' . $column) . ' LIKE ' . $db->quote('%' . json_encode($value) . '%');
							}

							$query->where('((' . implode(') OR (', $where) . '))');
						}
					}
				}
			}
		}

		// Filters from module
		$modFilter = $app->getSession()->get('mod_items_filter_customfield', array());

		if (!empty($modFilter))
		{
			$i = 0;

			foreach ($modFilter as $name => $mFilter)
			{
				$query->innerJoin($db->qn($mFilter['table'], 'cfm' . $i) . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('cfm' . $i . '.id'));
				$where = array();

				foreach ($mFilter['values'] as $val)
				{
					$tmpWhere = array();

					$tmpWhere[] = $db->qn('cfm' . $i . '.' . $name) . ' LIKE ' . $db->quote($db->escape($val, true));
					$tmpWhere[] = $db->qn('cfm' . $i . '.' . $name) . ' LIKE ' . $db->quote('%' . json_encode($db->escape($val, true)) . '%');

					$where[] = '(' . implode(') OR (', $tmpWhere) . ')';
				}

				$query->where('((' . implode(') OR (', $where) . '))');
				$i++;
			}
		}

		// If this is filter on custom with ranges value
		$cfTableRanges = $this->getState('filter.cfTableRanges', '');

		if (!empty($cfTableRanges))
		{
			$query->leftJoin($db->qn($cfTableRanges, 'cfr') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('cfr.id'));

			$cfSearchRanges = $this->getState('filter.cfSearchRanges', '');

			if (!empty($cfSearchRanges))
			{
				$jsonSearchRanges = json_decode($cfSearchRanges, true);

				if ($jsonSearchRanges)
				{
					foreach ($jsonSearchRanges as $column => $value)
					{
						$value = explode('-', $value);

						if (is_array($value))
						{
							$query->where($db->qn('cfr.' . $column) . ' BETWEEN ' . (float) $value[0] . ' AND ' . (float) $value[1]);
						}
					}
				}
			}
		}

		// Filter: like / search
		$search = $this->getState('filter.search', '');

		if ($search != '')
		{
			$like = $db->quote('%' . $db->escape($search, true) . '%');

			$where = array();

			// Add search on item's title
			$where[] = $db->qn('i.title') . ' LIKE ' . $like;

			// Add search on item's ID
			$where[] = $db->qn('i.id') . ' LIKE ' . $like;

			// Add search on category's title
			$avaiableItems = ReditemHelperHelper::searchItemsBaseCategoryTitle($like);

			if (!empty($avaiableItems))
			{
				$where[] = $db->qn('i.id') . ' IN (' . implode(',', $avaiableItems) . ')';
			}

			// Add search on custom fields value
			$filterType = $this->getState('filter.filter_types', 0);

			if ($filterType)
			{
				$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
				$fieldsModel->setState('filter.searchableInBackend', 1);
				$fieldsModel->setState('filter.types', $filterType);

				$seachInBackendFields = $fieldsModel->getItems();

				if ($seachInBackendFields)
				{
					$whereCustomValues = array();

					foreach ($seachInBackendFields as $seachInBackendField)
					{
						$whereCustomValues[] = $db->qn('cfv.' . $seachInBackendField->fieldcode) . ' LIKE ' . $like;
					}

					$where[] = '((' . implode(') OR (', $whereCustomValues) . '))';
				}
			}

			$query->where('((' . implode(') OR (', $where) . '))');
		}

		// Filter: like / search in front end
		$searchInFrontend = $this->getState('filter.searchInFrontend', '');
		$typeId = $this->getState('filter.types', 0);

		if ($searchInFrontend != '' && $typeId != 0)
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$type = $typeModel->getItem($typeId);

			$like = $db->quote('%' . $db->escape($searchInFrontend, true) . '%');

			$where = array();

			// Add search on item's title
			$where[] = $db->qn('i.title') . ' LIKE ' . $like;

			$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
			$fieldsModel->setState('filter.searchableInFrontend', 1);
			$fieldsModel->setState('filter.types', $typeId);

			$seachInFrontendFields = $fieldsModel->getItems();

			if ($seachInFrontendFields)
			{
				$query->leftJoin($db->qn('#__reditem_types_' . $type->table_name, 'sifcfv') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('sifcfv.id'));
				$whereCustomValues = array();

				foreach ($seachInFrontendFields as $seachInFrontendField)
				{
					$whereCustomValues[] = $db->qn('sifcfv.' . $seachInFrontendField->fieldcode) . ' LIKE ' . $like;
				}

				$where[] = '((' . implode(') OR (', $whereCustomValues) . '))';
			}

			$query->where('((' . implode(') OR (', $where) . '))');
		}

		// Filter by alphabet
		$alphabetSearch = trim((string) $this->getState('filter.search_alphabet', ''));

		if (!empty($alphabetSearch))
		{
			if (strlen($alphabetSearch) > 1)
			{
				$alphabetSearch = JString::substr($alphabetSearch, 0, 1);
			}

			// If search by number
			if ($alphabetSearch == '#')
			{
				$where = array(
					$db->qn('i.title') . ' REGEXP ' . $db->quote('^[0-9]'),
					$db->qn('i.alias') . ' REGEXP ' . $db->quote('^[0-9]')
				);
			}
			else
			{
				$like = $db->quote($db->escape($alphabetSearch, true) . '%');

				$where = array(
					// Add search on item's title
					$db->qn('i.title') . ' LIKE ' . $like,
					// Add search on item's alias
					$db->qn('i.alias') . ' LIKE ' . $like
				);
			}

			$query->where('((' . implode(') OR (', $where) . '))');
		}

		// Filter: like / plugin Search Item
		$plgSearchItem = $this->getState('filter.plgSearchItem', '');

		if ($plgSearchItem != '')
		{
			$like = $db->quote('%' . $db->escape($plgSearchItem, true) . '%');

			$where = array(
				$db->qn('i.title') . ' LIKE ' . $like
			);

			$query->where('((' . implode(') OR (', $where) . '))');
		}

		// Filter by created_user
		$createdUserId = $this->getState('filter.created_user');

		if (is_numeric($createdUserId))
		{
			$query->where($db->qn('i.created_user_id') . ' = ' . $db->q($createdUserId));
		}

		// Filter by published state
		$published = $this->getState('filter.published');

		// Define null and now dates
		$nullDate = $db->quote($db->getNullDate());
		$nowDate  = $db->quote(JFactory::getDate()->toSql());

		if (is_numeric($published))
		{
			$query->where($db->qn('i.published') . ' = ' . (int) $published);

			if (($published == 1) && (!$user->authorise('core.edit.state', 'com_reditem')) && (!$user->authorise('core.edit', 'com_reditem')))
			{
				$query->where('(' . $db->qn('i.publish_up') . ' = ' . $nullDate . ' OR ' . $db->qn('i.publish_up') . ' <= ' . $nowDate . ')')
					->where('(' . $db->qn('i.publish_down') . ' = ' . $nullDate . ' OR ' . $db->qn('i.publish_down') . ' >= ' . $nowDate . ')');
			}
		}
		elseif (($published === '') || (!isset($published)))
		{
			// Filter by published state
			$archived = (boolean) $this->getState('filter.archived');

			if ($archived)
			{
				$query->where('(' . $db->qn('i.published') . ' IN (0, 1, 2))');
			}
			else
			{
				$query->where('(' . $db->qn('i.published') . ' IN (0, 1))');
			}
		}

		// Filter by Block status
		$block = $this->getState('filter.block');

		if (is_numeric($block))
		{
			$query->where($db->qn('i.blocked') . ' = ' . (int) $block);
		}
		elseif ($block === 'all')
		{
			$query->where($db->qn('i.blocked') . ' IN (0, 1)');
		}
		else
		{
			$query->where($db->qn('i.blocked') . ' = 0');
		}

		// Filter: featured item
		$featured = $this->getState('filter.featured', 0);

		if ($featured)
		{
			$query->where($db->qn('i.featured') . ' = ' . $db->quote(1));
		}

		// Filter: Category Id
		$catId = $this->getState('filter.catid', 0);

		if ($catId)
		{
			$query->leftJoin($db->qn('#__reditem_item_category_xref', 'x') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('x.item_id'));

			if (is_array($catId))
			{
				JArrayHelper::toInteger($catId);
				$query->where($db->qn('x.category_id') . ' IN (' . implode(',', $catId) . ')');
			}
			else
			{
				$query->where($db->qn('x.category_id') . ' = ' . $db->quote($catId));
			}
		}

		// Filter: types
		$filterType = $this->getState('filter.filter_types', 0);

		// Set state of Type
		$app = JFactory::getApplication();
		$app->setUserState('com_reditem.global.tid', $filterType);

		if ($filterType)
		{
			$query->where($db->qn('i.type_id') . ' = ' . $db->quote($filterType));
		}

		// Filter by rating average value of items
		$filterRatingValue = (float) $this->getState('filter.rating', 0);

		if ($filterRatingValue)
		{
			$query->innerJoin($db->qn('#__reditem_item_rating', 'ir') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('ir.item_id'))
				->select('SUM(' . $db->qn('ir.rating') . ') / COUNT(' . $db->qn('ir.rating') . ') AS ' . $db->qn('rating_value'))
				->having($db->qn('rating_value') . ' = ' . $db->quote($filterRatingValue))
				->group($db->qn('i.id'));
		}

		// Filter: ID
		$filterItemIds = $this->getState('filter.item_ids', array());

		if ($filterItemIds)
		{
			JArrayHelper::toInteger($filterItemIds);
			$query->where($db->qn('i.id') . ' IN (' . implode(',', $filterItemIds) . ')');
		}

		// Filter by publish_up start date
		$filterPublishedUpStart = $this->getState('filter.publish_up_start', '');

		if (!empty($filterPublishedUpStart))
		{
			$query->where($db->qn('i.publish_up') . ' >= ' . $db->quote($filterPublishedUpStart));
		}

		// Filter by publish_up start date
		$filterPublishedUpEnd = $this->getState('filter.publish_up_end', '');

		if (!empty($filterPublishedUpEnd))
		{
			$query->where($db->qn('i.publish_up') . ' <= ' . $db->quote($filterPublishedUpEnd));
		}

		// Filter by item params
		$itemParams = $this->getState('filter.params', null);

		if (!empty($itemParams) && is_array($itemParams))
		{
			foreach ($itemParams as $paramKey => $paramValue)
			{
				$query->where($db->qn('i.params') . ' LIKE ' . $db->quote('%"' . $paramKey . '":"' . $paramValue . '"%'));
			}
		}

		// Filter by custom field value
		$fieldFilters = ReditemHelperCustomfield::getFieldFilters();

		if ($fieldFilters)
		{
			$table = ReditemHelperType::getTableName($filterType);

			if ($table)
			{
				$query->leftJoin($db->qn($table, 'cfilter') . ' ON cfilter.id = i.id');

				foreach ($fieldFilters as $field)
				{
					$cFilter = $this->getState('filter.' . $field->fieldcode, 0);

					switch ($field->type)
					{
						case 'user':
							if ($cFilter)
							{
								$val = json_encode(array($cFilter));
								$query->where($db->qn('cfilter.' . $field->fieldcode) . ' = ' . $db->q($val));
							}

							break;

						default:
							break;
					}
				}
			}
		}

		// Check access level
		$query->where($db->qn('i.access') . ' IN (' . implode(',', $groups) . ')');

		// Get the ordering modifiers
		$orderCol  = $this->state->get('list.ordering', 'i.title');
		$orderDirn = $this->state->get('list.direction', 'asc');

		// If we have custom field ordering
		if (!empty($this->state->get('filter.customfield.table')))
		{
			// Which table
			$customFiledTable = $this->state->get('filter.customfield.table');

			// Which field
			$customFieldTableFieldName = $this->state->get('filter.customfield.field');

			// And what is order
			$customFieldTableFieldOrder = $this->state->get('filter.customfield.order');

			// We need inner join this table
			$query->innerJoin($db->quoteName($customFiledTable, 'cf') . ' ON `cf`.`id` = `i`.`id` ');

			// Then
			$query->order($db->quoteName('cf') . '.' . $db->quoteName($customFieldTableFieldName) . ' ' . $customFieldTableFieldOrder);

			// Select that custom field ' field for checking
			$query->select($db->quoteName('cf') . '.' . $db->quoteName($customFieldTableFieldName));
		}
		else
		{
			// These are standard way
			if ($orderCol == 'random')
			{
				$query->order('RAND()');
			}
			else
			{
				// Check if order is custom fields
				if (substr($orderCol, 0, 4) == 'cfv_')
				{
					$displayableFieldcodes = array();

					if ($filterType)
					{
						$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
						$fieldsModel->setState('filter.searchableInBackend', 1);
						$fieldsModel->setState('filter.types', $filterType);

						$seachInBackendFields = $fieldsModel->getItems();

						if ($seachInBackendFields)
						{
							foreach ($seachInBackendFields as $displayableField)
							{
								$displayableFieldcodes[] = 'cfv_' . $displayableField->fieldcode;
							}
						}
					}

					if (!in_array($orderCol, $displayableFieldcodes))
					{
						$orderCol = 'i.title';
					}
				}
				elseif (substr($orderCol, 0, 3) == 'cf.')
				{
					$fieldModel = RModel::getAdminInstance('Field', array('ignore_request' => true), 'com_reditem');

					if (!empty($filterType))
					{
						$field = $fieldModel->getItemByFieldcode(str_replace('cf.', '', $orderCol), $filterType);
					}
					else
					{
						$field = $fieldModel->getItemByFieldcode(str_replace('cf.', '', $orderCol));
					}

					if ($field->type == 'number')
					{
						$fieldParams = new JRegistry($field->params);
						$decimalNumber = (int) $fieldParams->get('number_number_decimals', 0);

						$query->select('CAST(' . $db->qn($orderCol) . ' AS DECIMAL(65, ' . $decimalNumber . ')) AS ' . $db->qn(str_replace('cf.', 'cfv_', $orderCol)));
						$orderCol = str_replace('cf.', 'cfv_', $orderCol);
					}
				}

				$query->order($db->escape($orderCol) . ' ' . $db->escape($orderDirn));
			}
		}

		// Add group by if set
		$groupBy = $this->state->get('list.groupBy', '');

		if (!empty($groupBy))
		{
			// Make sure result return is not duplicate
			$query->group($db->qn($groupBy));
		}

		return $query;
	}

	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param   string  $id  A prefix for the store id.
	 *
	 * @return	string  A store id.
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.
		$id .= ':' . $this->getState('filter.search');
		$id .= ':' . $this->getState('filter.plgSearchItem');
		$id .= ':' . $this->getState('filter.search_alphabet');
		$id .= ':' . $this->getState('filter.published');
		$id .= ':' . $this->getState('filter.featured');
		$id .= ':' . $this->getState('filter.cfTable');
		$id .= ':' . $this->getState('filter.cfSearch');
		$id .= ':' . $this->getState('filter.cfTableRanges');
		$id .= ':' . $this->getState('filter.cfSearchRanges');
		$id .= ':' . $this->getState('list.groupBy');

		$fieldFilters = ReditemHelperCustomfield::getFieldFilters();

		if ($fieldFilters)
		{
			foreach ($fieldFilters as $field)
			{
				$id .= ':' . $this->getState('filter.' . $field->fieldcode);
			}
		}

		$catIds = $this->getState('filter.catid');

		if (is_array($catIds))
		{
			$id .= ':' . implode(',', $catIds);
		}
		else
		{
			$id .= ':' . $catIds;
		}

		return parent::getStoreId($id);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * @param   string  $ordering   [description]
	 * @param   string  $direction  [description]
	 *
	 * @return  void
	 */
	protected function populateState($ordering = 'i.ordering', $direction = 'ASC')
	{
		$app = JFactory::getApplication();

		$filterSearch = $this->getUserStateFromRequest($this->context . '.filter_search', 'filter_search');
		$this->setState('filter.search', $filterSearch);

		$filterPlgSearchItem = $this->getUserStateFromRequest($this->context . '.filter_plgSearchItem', 'filter_plgSearchItem');
		$this->setState('filter.plgSearchItem', $filterPlgSearchItem);

		$filterCatId = $this->getUserStateFromRequest($this->context . '.filter_catid', 'filter_catid');
		$this->setState('filter.catid', $filterCatId);

		$filterTypes = $this->getUserStateFromRequest($this->context . '.filter_types', 'filter_types');
		$this->setState('filter.filter_types', $filterTypes);

		$filterPublished = $this->getUserStateFromRequest($this->context . '.filter_published', 'filter_published');
		$this->setState('filter.published', $filterPublished);

		$filterFeatured = $this->getUserStateFromRequest($this->context . '.filter_featured', 'filter_featured');
		$this->setState('filter.featured', $filterFeatured);

		$filterItemIds = $this->getUserStateFromRequest($this->context . '.filter_item_ids', 'filter_item_ids');
		$this->setState('filter.item_ids', $filterItemIds);

		$filterCfTable = $this->getUserStateFromRequest($this->context . '.filter_cfTable', 'filter_cfTable');
		$this->setState('filter.cfTable', $filterCfTable);

		$filterCfSearch = $this->getUserStateFromRequest($this->context . '.filter_cfSearch', 'filter_cfSearch');
		$this->setState('filter.cfSearch', $filterCfSearch);

		$filterCfTableRanges = $this->getUserStateFromRequest($this->context . '.filter_cfTableRanges', 'filter_cfTableRanges');
		$this->setState('filter.cfTableRanges', $filterCfTableRanges);

		$filterCfSearchRanges = $this->getUserStateFromRequest($this->context . '.filter_cfSearchRanges', 'filter_cfSearchRanges');
		$this->setState('filter.cfSearchRanges', $filterCfSearchRanges);

		$groupBy = $this->getUserStateFromRequest($this->context . '.groupBy', 'groupBy');
		$this->setState('list.groupBy', $groupBy);

		$value = $app->getUserStateFromRequest('global.list.limit', $this->paginationPrefix . 'limit', $app->getCfg('list_limit'), 'uint');
		$limit = $value;
		$this->setState('list.limit', $limit);

		$value = $app->getUserStateFromRequest($this->context . '.limitstart', $this->paginationPrefix . 'limitstart', 0);
		$limitstart = ($limit != 0 ? (floor($value / $limit) * $limit) : 0);
		$this->setState('list.start', $limitstart);

		$fieldFilters = ReditemHelperCustomfield::getFieldFilters();

		if ($fieldFilters)
		{
			foreach ($fieldFilters as $field)
			{
				$cFilter = $this->getUserStateFromRequest($this->context . '.filter_' . $field->fieldcode, 'filter_' . $field->fieldcode);
				$this->setState('filter.' . $field->fieldcode, $cFilter);
			}
		}

		parent::populateState($ordering, $direction);
	}

	/**
	 * Export items in csv format. Items are exported directly to php output stream.
	 *
	 * @param   array   $itemIds    Item ids for export.
	 * @param   string  $delimiter  Csv delimiter.
	 *
	 * @return  void
	 */
	public function exportCsv($itemIds, $delimiter = ',')
	{
		$data       = array();
		$csvColumns = array();
		$tables     = array();
		$db         = $this->getDbo();
		$query      = $db->getQuery(true);
		$header     = array('id');

		foreach ($itemIds as $itemId)
		{
			$typeId = ReditemHelperItem::getTypeIdByItemId($itemId);
			$table  = ReditemHelperType::getTableName($typeId);

			if (!isset($tables[$table]))
			{
				$tables[$table] = array($itemId);
			}
			else
			{
				$tables[$table][] = $itemId;
			}

			if (!isset($csvColumns[$table]))
			{
				$csvColumns[$table] = $this->getCsvColumns($itemId);
				$header             = array_merge($header, $csvColumns[$table]);
			}
		}

		foreach ($tables as $table => $items)
		{
			$columns = array($db->qn('id'));

			foreach ($csvColumns[$table] as $csvC)
			{
				$columns[] = $db->qn($csvC);
			}

			$query->clear()
				->select($columns)
				->from($db->qn($table))
				->where($db->qn('id') . ' IN (' . implode(',', $items) . ')');
			$db->setQuery($query);
			$data = array_merge($data, $db->loadAssocList());
		}

		$outputBuffer = fopen("php://output", 'w');
		fputcsv($outputBuffer, $header, $delimiter);

		foreach ($data as $row)
		{
			$val = array();

			foreach ($header as $h)
			{
				if (isset($row[$h]))
				{
					$val[] = $row[$h];
				}
				else
				{
					$val[] = '';
				}
			}

			fputcsv($outputBuffer, $val, $delimiter);
		}

		fclose($outputBuffer);
	}

	/**
	 * Csv import function for updating items.
	 *
	 * @param   array   $file       Csv file with data for update.
	 * @param   string  $delimiter  Csv delimiter.
	 *
	 * @return  boolean  True on success, false otherwise.
	 */
	public function importCsv($file, $delimiter = ',')
	{
		$db    = $this->getDbo();
		$query = $db->getQuery(true);

		if (($handle = fopen($file['tmp_name'], "r")) !== false)
		{
			// Get headers
			$headers = fgetcsv($handle, null, $delimiter);
			$db->transactionStart();

			while (($data = fgetcsv($handle, null, $delimiter)) !== false)
			{
				$item       = $data;
				$idIndex    = array_search('id', $headers);
				$csvColumns = $this->getCsvColumns($item[$idIndex]);
				$typeId     = ReditemHelperItem::getTypeIdByItemId($item[$idIndex]);
				$table      = ReditemHelperType::getTableName($typeId);
				$query->clear()->update($db->qn($table));

				foreach ($csvColumns as $column)
				{
					$index = array_search($column, $headers);

					if ($index !== false)
					{
						$query->set($db->qn($column) . ' = ' . $db->q($item[$index]));
					}
				}

				$query->where($db->qn('id') . ' = ' . (int) $item[$idIndex]);
				$db->setQuery($query);

				if (!$db->execute())
				{
					$db->transactionRollback();

					return false;
				}
			}

			fclose($handle);
			$db->transactionCommit();

			return true;
		}

		return false;
	}

	/**
	 * Get an array of csv columns for item.
	 *
	 * @param   int  $itemId  Item id.
	 *
	 * @return  array  Array of columns.
	 */
	public function getCsvColumns($itemId)
	{
		$typeId = ReditemHelperItem::getTypeIdByItemId($itemId);
		$db     = $this->getDbo();
		$query  = $db->getQuery(true);

		if (!isset(self::$csvColumns[$typeId]) || empty(self::$csvColumns))
		{
			$allowedTypes = array(
				$db->q('textarea'),
				$db->q('text'),
				$db->q('editor'),
				$db->q('number'),
				$db->q('color'),
				$db->q('url'),
				$db->q('checkbox'),
				$db->q('image')
			);

			$query->select($db->qn('fieldcode'))
				->from($db->qn('#__reditem_fields'))
				->where($db->qn('type_id') . ' = ' . (int) $typeId)
				->where($db->qn('type') . ' IN (' . implode(',', $allowedTypes) . ')')
				->where($db->qn('published') . ' = 1');
			$db->setQuery($query);
			self::$csvColumns[$typeId] = $db->loadColumn();
		}

		return self::$csvColumns[$typeId];
	}

	/**
	 * Saves the manually set order of the items.
	 *
	 * @param   array  $pks    An array of primary key ids.
	 * @param   array  $order  Order position
	 *
	 * @return  boolean  True on order save. False otherwise.
	 */
	public function saveItemsOrder($pks, $order)
	{
		$user = JFactory::getUser();
		$db   = $this->getDbo();

		if (empty($pks))
		{
			return JError::raiseWarning(500, JText::_('COM_USERS_ERROR_LEVELS_NOLEVELS_SELECTED'));
		}

		// Update ordering values
		foreach ($pks as $i => $pk)
		{
			$query = $db->getQuery(true);

			// Access checks.
			$allow = $user->authorise('core.edit.state', 'com_reditem');

			if (!$allow)
			{
				JError::raiseWarning(403, JText::_('JLIB_APPLICATION_ERROR_EDITSTATE_NOT_PERMITTED'));
			}
			else
			{
				$query->update($db->qn('#__reditem_items'));
				$query->set($db->qn('ordering') . ' = ' . (int) $order[$i]);
				$query->where($db->qn('id') . ' = ' . (int) $pks[$i]);

				if (!$db->setQuery($query)->execute())
				{
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * Items method for converting items from one type to another.
	 *
	 * @param   array  $itemIds       Items ids array.
	 * @param   int    $fromType      Type from id.
	 * @param   int    $toType        Type to id.
	 * @param   int    $toTemplate    Template to id.
	 * @param   array  $fromFields    Array of fields and fields to values.
	 * @param   array  $toCategories  Array of categories for resulting items.
	 * @param   int    $keepOrg       Keep original items bit.
	 *
	 * @return  boolean  True on success, false otherwise.
	 */
	public function convert($itemIds, $fromType, $toType, $toTemplate, $fromFields, $toCategories, $keepOrg)
	{
		$fieldTable = RTable::getAdminInstance('field', array(), 'com_reditem');
		$itemTable  = RTable::getAdminInstance('item', array(), 'com_reditem');
		$table      = ReditemHelperType::getTableName($fromType);
		$db         = $this->getDbo();
		$query      = $db->getQuery(true);
		$newItems   = array();

		$query->select(
			array (
				$db->qn('i.id', 'id'),
				$db->qn('i') . '.*',
				$db->qn('cfv') . '.*'
			)
		)
			->from($db->qn($table, 'cfv'))
			->innerJoin($db->qn('#__reditem_items', 'i') . ' ON ' . $db->qn('cfv.id') . ' = ' . $db->qn('i.id'))
			->where($db->qn('cfv.id') . ' IN (' . implode(',', $itemIds) . ')');
		$db->setQuery($query);

		$items          = $db->loadObjectList('id');
		$fromFieldsKeys = ReditemHelperType::getCustomFieldList($fromType, 'id');
		$toFieldsKeys   = ReditemHelperType::getCustomFieldList($toType, 'id');

		foreach ($items as $item)
		{
			$tmp                     = $item;
			$tmp->id                 = null;
			$tmp->asset_id           = null;
			$tmp->alias              = null;
			$tmp->ordering           = null;
			$tmp->publish_up         = null;
			$tmp->publish_down       = null;
			$tmp->created_user_id    = null;
			$tmp->created_time       = null;
			$tmp->type_id            = $toType;
			$tmp->template_id        = $toTemplate;
			$tmp->categories         = $toCategories;
			$tmp->customfield_values = array();
			$newItems[]              = $tmp;
		}

		foreach ($fromFields as $fromFieldId => $toFieldId)
		{
			// Skip this field
			if ($toFieldId == -1)
			{
				continue;
			}
			// Create same copy of this field
			elseif ($toFieldId == 0)
			{
				if ($fieldTable->load($fromFieldId))
				{
					$fieldTable->id      = null;
					$fieldTable->type_id = $toType;

					if ($fieldTable->store())
					{
						$toFieldId = $fieldTable->id;
					}
					else
					{
						return false;
					}
				}
				else
				{
					return false;
				}
			}

			$fromField = $fromFieldsKeys[$fromFieldId];
			$toField   = $toFieldsKeys[$toFieldId];
			$key       = $fromField->fieldcode;

			foreach ($newItems as $item)
			{
				$item->customfield_values[$toField->type][$toField->fieldcode] = $item->$key;
			}
		}

		foreach ($newItems as $newItem)
		{
			foreach ($fromFieldsKeys as $fromFieldKey)
			{
				$key = $fromFieldKey->fieldcode;
				unset($newItem->$key);
			}

			$item = JArrayHelper::fromObject($newItem);

			if (!$itemTable->save($item))
			{
				return false;
			}
		}

		if (!$keepOrg && !$this->delete($itemIds))
		{
			return false;
		}

		return true;
	}
}
