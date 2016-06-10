<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  CustomField
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_BASE') or die;

/**
 * Renders a Item From Type custom field
 *
 * @package     RedITEM.Libraries
 * @subpackage  CustomField.ItemFromType
 * @since       2.1.13
 *
 */
class ReditemCustomfieldItemFromType extends ReditemCustomfieldGeneric
{
	/**
	 * returns the html code for the form element
	 *
	 * @param   array  $attributes  Attributes array for this field
	 *
	 * @return  string
	 */
	public function render($attributes = array())
	{
		$db            = RFactory::getDbo();
		$data          = array();
		$values        = array();
		$attributeHtml = '';
		$fieldConfig   = new JRegistry($this->params);
		$includeCatName = (boolean) $fieldConfig->get('includeCatName', false);

		// Required option
		if ($fieldConfig->get('required', false))
		{
			$attributes['class'] = 'required';
		}

		// Multiple option
		if ($fieldConfig->get('multiple', true))
		{
			$attributes['multiple'] = 'true';
		}

		if (!empty($attributes))
		{
			foreach ($attributes as $attrKey => $attrValue)
			{
				$attributeHtml .= ' ' . $attrKey . '="' . $attrValue . '"';
			}
		}

		// Process on value
		if (!empty($this->value))
		{
			$values = json_decode($this->value, true);
		}

		// Prepare items list from specific type
		$itemType = $fieldConfig->get('type_id');
		$query = $db->getQuery(true)
			->select(
				array (
					$db->qn('id'),
					$db->qn('title')
				)
			)
			->from($db->qn('#__reditem_items'))
			->where($db->qn('type_id') . ' = ' . (int) $itemType)
			->where($db->qn('published') . ' = 1')
			->where($db->qn('blocked') . ' = 0');
		$db->setQuery($query);
		$items = $db->loadObjectList();

		// Process on option list
		if (!empty($items))
		{
			// Get categories
			if ($includeCatName)
			{
				$itemIds = ReditemHelperItem::getItemIds($items);
				$categories = ReditemHelperItem::getCategories($itemIds, false);
			}

			foreach ($items as $item)
			{
				$selected = false;

				if (!empty($values) && in_array($item->id, $values))
				{
					$selected = true;
				}

				$text = $item->title;

				if (isset($categories[$item->id]) && $includeCatName)
				{
					$categoryTitles = array();

					foreach ($categories[$item->id] as $category)
					{
						$categoryTitles[] = $category->title;
					}

					if (!empty($categoryTitles))
					{
						$categoryText = implode(' - ', $categoryTitles);
						$text .= ' (' . $categoryText . ')';
					}
				}

				$data[] = array(
					'text' => $text,
					'value' => $item->id,
					'selected' => $selected
				);
			}
		}

		$layoutData = array(
			'fieldcode'  => $this->fieldcode,
			'data'       => $data,
			'attributes' => $attributeHtml
		);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.itemfromtype', $layoutData, array('component' => 'com_reditem'));
	}
}
