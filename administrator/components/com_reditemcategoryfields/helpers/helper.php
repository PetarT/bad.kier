<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Helpers
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * RedITEM CustomFields Helper
 *
 * @package     RedITEM.Component
 * @subpackage  Helpers.CusomHelper
 * @since       2.0
 *
 */
class ReditemCategoryFieldsHelper
{
	/**
	 * Get extra field value of category
	 *
	 * @param   int  $categoryId  Category Id
	 *
	 * @return  array  Array of custom fields data
	 */
	public static function getFieldsData($categoryId)
	{
		$db         = JFactory::getDBO();
		$categoryId = (int) $categoryId;

		if ($categoryId)
		{
			$query = $db->getQuery(true)
				->select('d.*')
				->from($db->qn('#__reditem_category_fields_value', 'd'))
				->where($db->qn('d.cat_id') . ' = ' . $db->quote($categoryId));
			$db->setQuery($query);

			return $db->loadObjectList();
		}

		return false;
	}

	/**
	 * Get list extra value of extra field
	 *
	 * @param   int    $extraFieldId   Extra field ID
	 * @param   array  $categoriesIds  Array of categories which get values from
	 *
	 * @return  array  Array of extra fields data
	 */
	public static function getAllFieldsData($extraFieldId, $categoriesIds = array())
	{
		$db				= JFactory::getDBO();
		$extraFieldId	= (int) $extraFieldId;

		if ($extraFieldId)
		{
			// Get field code of extra field
			$query = $db->getQuery(true)
				->select($db->qn('e.fieldcode'))
				->from($db->qn('#__reditem_category_fields', 'e'))
				->where($db->qn('e.id') . ' = ' . $extraFieldId);
			$db->setQuery($query);
			$result = $db->loadResult();

			// Field code is avaiable
			if ($result)
			{
				// Get list datas of field code
				$query->clear()
					->select('DISTINCT (' . $db->qn('v.' . $result) . ')')
					->from($db->qn('#__reditem_category_fields_value', 'v'))
					->where($db->qn('v.' . $result) . ' <> ' . $db->quote(''))
					->order($db->qn('v.' . $result));

				if (($categoriesIds) && !empty($categoriesIds))
				{
					$query->where($db->qn('v.cat_id') . ' IN (' . implode(',', $categoriesIds) . ')');
				}

				$db->setQuery($query);

				return $db->loadColumn();
			}
		}

		return false;
	}
}
