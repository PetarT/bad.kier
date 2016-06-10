<?php
/**
 * @package     RedITEM.Frontend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Category Controller.
 *
 * @package     RedITEM.Frontend
 * @subpackage  Controller
 * @since       2.1
 */
class ReditemControllerCategorydetailGmap extends JControllerLegacy
{
	/**
	 * Ajax filter items
	 *
	 * @return void
	 */
	public function ajaxFilter()
	{
		$model = RModel::getFrontInstance('CategoryDetailGmap', array('ignore_request' => true), 'com_reditem');

		$mainCategory = $model->getData();
		$mainContent = $mainCategory->template->content;

		$db = JFactory::getDbo();
		$app = JFactory::getApplication();
		$query = $db->getQuery();
		$items = array();
		$return = array();

		// Items array
		if ((strpos($mainContent, '{items_loop_start}') !== false) && (strpos($mainContent, '{items_loop_end}') !== false))
		{
			$tempContent = explode('{items_loop_start}', $mainContent);
			$preContent = (count($tempContent) > 1) ? $tempContent[0] : '';

			$tempContent = $tempContent[count($tempContent) - 1];
			$tempContent = explode('{items_loop_end}', $tempContent);
			$subTemplate = $tempContent[0];

			$postContent = (count($tempContent) > 1) ? $tempContent[count($tempContent) - 1] : '';

			// Get config from type
			$typeConfig   = new JRegistry($mainCategory->type->params);
			$useGmapField = (boolean) $typeConfig->get('item_gmap_field', false);

			if ($useGmapField && !empty($mainCategory->items))
			{
				$customFieldTags = ReditemHelperItem::getCustomFieldTags($mainCategory->type_id);

				foreach ($mainCategory->items as $item)
				{
					$itemParams = new JRegistry($item->params);
					$item->itemLatLng = $itemParams->get('itemLatLng', '');

					$subContentSub = $subTemplate;
					$item->type = $mainCategory->type;
					ReditemHelperItem::replaceTag($subContentSub, $item, $mainCategory->id);
					ReditemHelperItem::replaceCustomfieldsTag($subContentSub, $item, $customFieldTags);
					$item->content = $subContentSub;

					// Clean up unneeded data
					unset($item->type);

					if (isset($item->customfield_values))
					{
						unset($item->customfield_values);
					}

					$items[$item->id] = $item;
				}

				// Filter distance process
				$filterDistanceFrom = $app->input->getRaw('gmap_filter_distance_from', '');
				$filterDistanceValue = $app->input->getRaw('gmap_filter_distance', '');

				if (!empty($filterDistanceFrom) && !empty($filterDistanceValue))
				{
					// Get latitude & longtitude from filter
					$filterDistanceFromArray = explode(',', $filterDistanceFrom);
					$latitude = $filterDistanceFromArray[0];
					$longtitude = $filterDistanceFromArray[1];

					$filterDistance = array(
						'location' => array('lat' => $latitude, 'lng' => $longtitude),
						'distance' => $filterDistanceValue
					);
					$distance = (float) $filterDistanceValue;

					foreach ($items as $key => $item)
					{
						if (empty($item->itemLatLng) || (strpos($item->itemLatLng, ',') == false))
						{
							continue;
						}

						$itemLatLng = explode(',', $item->itemLatLng);
						$itemLatitude = (float) $itemLatLng[0];
						$itemLongtitude = (float) $itemLatLng[1];

						$item->distance = ReditemHelperCategorygmap::calculateDistance($itemLatitude, $itemLongtitude, $latitude, $longtitude, 'K');

						if ($item->distance > $distance)
						{
							unset($items[$key]);
						}
					}

					$return['filterDistance'] = $filterDistance;
				}
			}

			$return['items'] = $items;

			// Related Categories
			$filterCategories  = JFactory::getApplication()->input->get_Array('filter_category', null);
			$relatedCategories = array();

			if ($filterCategories)
			{
				if (array_filter($filterCategories))
				{
					foreach ($filterCategories as $filterCatId => $catId)
					{
						if (!isset($relatedCategories[$filterCatId]))
						{
							$relatedCategories[$filterCatId] = array();
						}

						if ($catId)
						{
							$tmpCategories = ReditemHelperCategory::getRelatedCategories($catId);

							if (!empty($tmpCategories))
							{
								foreach ($tmpCategories as $tmpCategory)
								{
									$tmpParentId = $tmpCategory->parent_id;

									if (!isset($relatedCategories[$tmpParentId]))
									{
										$relatedCategories[$tmpParentId] = array();
									}

									$relatedCategories[$tmpParentId][] = $tmpCategory;
								}
							}
						}
					}

					// Make selected if this filter has been choose already
					foreach ($filterCategories as $filterCatId => $catId)
					{
						if (isset($relatedCategories[$filterCatId]))
						{
							foreach ($relatedCategories[$filterCatId] as &$relatedCategory)
							{
								$relatedCategory->filter = false;

								if ($relatedCategory->id == $catId)
								{
									$relatedCategory->filter = true;
								}
							}
						}
					}

					$return['relatedCategories'] = $relatedCategories;
				}
			}

			echo json_encode($return, JSON_FORCE_OBJECT);
		}
		else
		{
			echo json_encode(array(), JSON_FORCE_OBJECT);
		}

		JFactory::getApplication()->close();
	}
}
