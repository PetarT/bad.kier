<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Helper
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_BASE') or die;

/**
 * Category Gmap helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.CategoryGmap
 * @since       2.1
 *
 */
class ReditemHelperCategorygmap
{
	/**
	 * Method for replace tag of template
	 * 
	 * @param   object  $category  Category object
	 * 
	 * @return  string  HTML code after replace tag.
	 */
	public static function prepareTemplate($category)
	{
		// Check if category object is exist
		if (!$category)
		{
			return '';
		}

		$content = '';
		$useGmapField = false;

		// Get type object of this category
		if (!isset($category->type))
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$category->type = $typeModel->getItem($category->type_id);
		}

		$content = $category->template->content;
		ReditemHelperCategorytags::replaceTag($content, $category);

		// Items array
		if ((strpos($content, '{items_loop_start}') !== false) && (strpos($content, '{items_loop_end}') !== false))
		{
			$tempContent = explode('{items_loop_start}', $content);
			$preContent  = (count($tempContent) > 1) ? $tempContent[0] : '';

			$tempContent = $tempContent[count($tempContent) - 1];
			$tempContent = explode('{items_loop_end}', $tempContent);
			$subTemplate = $tempContent[0];

			$postContent = (count($tempContent) > 1) ? $tempContent[count($tempContent) - 1] : '';

			// Get config from type
			$typeConfig   = new JRegistry($category->type->params);
			$useGmapField = (boolean) $typeConfig->get('item_gmap_field', false);

			if ($useGmapField && !empty($category->items))
			{
				$customFieldTags = ReditemHelperItem::getCustomFieldTags($category->type_id);

				foreach ($category->items as $item)
				{
					$itemParams = new JRegistry($item->params);
					$item->itemLatLng = $itemParams->get('itemLatLng', '');

					$subContentSub = $subTemplate;
					$item->type = $category->type;
					ReditemHelperItem::replaceTag($subContentSub, $item, $category->id);
					ReditemHelperItem::replaceCustomfieldsTag($subContentSub, $item, $customFieldTags);
					$item->content = $subContentSub;

					// Clean up unneeded data
					unset($item->type);

					if (isset($item->customfield_values))
					{
						unset($item->customfield_values);
					}
				}
			}

			$content = $preContent . $postContent;

			// Working on setting tag
			self::processSettingTag($content, $category);
		}

		// Filter tag
		ReditemHelperTags::tagReplaceFilter($content, $category, 'reditemGmapFilterAjax');
		ReditemHelperCategorytags::createCategoryFilter($content, $category, 'reditemGmapFilterAjax');

		JPluginHelper::importPlugin('content');
		$content = JHtml::_('content.prepare', $content);

		return $content;
	}

	/**
	 * Process for filter Distance
	 *
	 * @param   string  &$content  Template content
	 * @param   object  $category  Category object
	 *
	 * @return  boolean  True if success. False otherwise.
	 */
	public static function processSettingTag(&$content, $category)
	{
		if (empty($content) || empty($category))
		{
			return false;
		}

		if (preg_match_all('/{setting_distance[^}]*}/i', $content, $matches) > 0)
		{
			$matches = $matches[0];

			// If there are no tag {setting_distance}
			if (empty($matches))
			{
				return false;
			}

			$settingDistance = array('location' => '', 'distance' => 0.0);
			$settingDistanceStatus = false;

			foreach ($matches as $match)
			{
				// Only first {setting_distance} tag has effect, others will replace to empty string
				if ($settingDistanceStatus || (empty($category->items)))
				{
					$content = str_replace($match, '', $content);
				}

				$location   = JText::_('COM_REDITEM_ITEM_LATITUDE_AND_LONGTITUDE_NUMBER_DEFAULT');
				$distance   = 10;
				$latitude   = 0.0;
				$longtitude = 0.0;

				// Remove tag from template
				$content = str_replace($match, '', $content);

				$match = str_replace('{', '', $match);
				$match = str_replace('}', '', $match);

				$params = explode('|', $match);

				// Get location
				if (isset($params[1]) && !empty($params[1]))
				{
					$location = $params[1];
				}

				// Get distance
				if (isset($params[2]))
				{
					$distance = (int) $params[2];
					$settingDistance['distance'] = $distance;
				}

				// Get latitude and longtitude number
				$location = explode(',', $location);
				$latitude = (float) $location[0];

				if (isset($location[1]))
				{
					$longtitude = (float) $location[1];
				}

				$settingDistance['location'] = $latitude . ',' . $longtitude;
				$distance = (float) $distance;

				foreach ($category->items as $key => $item)
				{
					if (empty($item->itemLatLng) || (strpos($item->itemLatLng, ',') == false))
					{
						continue;
					}

					$itemLatLng = explode(',', $item->itemLatLng);
					$itemLatitude = (float) $itemLatLng[0];
					$itemLongtitude = (float) $itemLatLng[1];

					$item->distance = self::calculateDistance($itemLatitude, $itemLongtitude, $latitude, $longtitude, 'K');

					if ($item->distance > $distance)
					{
						unset($category->items[$key]);
					}
				}

				$category->settingDistance = $settingDistance;
				$settingDistanceStatus = true;
			}
		}

		return true;
	}

	/**
	 * Method for calculate distance between two location
	 *
	 * @param   float   $latitude1    Latitude number of location 1
	 * @param   float   $longtitude1  Longtitude number of location 1
	 * @param   float   $latitude2    Latitude number of location 2
	 * @param   flaot   $longtitude2  Longtitude number of location 2
	 * @param   string  $unit         Unit for calculate ("K" => Kilometers, "M" => Miles, "N" => Nautical Miles). Default is "M"
	 *
	 * @return  float  Distance
	 */
	public static function calculateDistance($latitude1, $longtitude1, $latitude2, $longtitude2, $unit = 'M')
	{
		$latitude1   = (float) $latitude1;
		$longtitude1 = (float) $longtitude1;
		$latitude2   = (float) $latitude2;
		$longtitude2 = (float) $longtitude2;

		// Check if same location
		if (($latitude1 == $latitude2) && ($longtitude1 == $longtitude2))
		{
			return 0;
		}

		// Reference http://www.geodatasource.com/developers/php
		$theta = $longtitude1 - $longtitude2;
		$distance = sin(deg2rad($latitude1)) * sin(deg2rad($latitude2)) + cos(deg2rad($latitude1)) * cos(deg2rad($latitude2)) * cos(deg2rad($theta));
		$distance = acos($distance);
		$distance = rad2deg($distance);
		$distance = $distance * 60 * 1.1515;

		if ($unit == 'K')
		{
			// Convert to Kilometers
			$distance = $distance * 1.609344;
		}
		elseif ($unit == 'N')
		{
			// Convert to Nautical Miles
			$distance = $distance * 0.8684;
		}

		return $distance;
	}
}
