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
 * Rating helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.Rating
 * @since       2.1
 *
 */
class ReditemHelperRating
{
	/**
	 * Get Rating value of item
	 *
	 * @param   int  $itemId  Id of item
	 *
	 * @return   float  Rating value of this item
	 */
	public static function getRatingValue($itemId)
	{
		$itemId              = (int) $itemId;
		$value               = new stdClass;
		$value->rating_total = 0;
		$value->rating_value = 0.0;
		$value->users        = null;

		if (!$itemId)
		{
			return $value;
		}

		// Get rating value of this item
		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn('rating') . ',' . $db->qn('user_id'))
			->from($db->qn('#__reditem_item_rating'))
			->where($db->qn('item_id') . '=' . $itemId);
		$db->setQuery($query);
		$ratings = $db->loadObjectList();

		if (count($ratings) > 0)
		{
			$value->rating_total = count($ratings);

			foreach ($ratings as $rating)
			{
				$value->rating_value += $rating->rating;
				$value->users[]      = $rating;
			}

			$value->rating_value = $value->rating_value / $value->rating_total;

			// Round the rating value
			$itemTypeId = ReditemHelperItem::getTypeIdByItemId($itemId);
			$typeModel  = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$type       = $typeModel->getItem($itemTypeId);
			$typeParams = new JRegistry($type->params);
			$paramRound = $typeParams->get('itemRatingRound', 'none');

			switch ($paramRound)
			{
				case 'up':
					$value->rating_value = ceil($value->rating_value * 2) / 2;
					break;

				case 'down':
					$value->rating_value = floor($value->rating_value * 2) / 2;
					break;

				default:
					break;
			}
		}

		return $value;
	}

	/**
	 * Method for replace {item_rating} tag into HTML code
	 *
	 * @param   string  &$content  Template content of item
	 * @param   object  $item      Item data object
	 *
	 * @return  boolean  True on success. False otherwise.
	 */
	public static function replaceTag(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		// Prepare Type params object
		if (!isset($item->type))
		{
			$typeModel  = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$item->type = $typeModel->getItem($item->type_id);
		}

		$typeParams  = new JRegistry($item->type->params);
		$contentHtml = '';
		$ratingSize  = array('xl', 'lg', 'md', 'sm', 'xs');
		$values      = self::getRatingValue($item->id);

		self::replaceRatingIf($content, $values->rating_total);

		$paramStars   = $typeParams->get('itemRatingMaxStars', 5);
		$paramStep    = $typeParams->get('itemRatingStep', 1);
		$paramSize    = $typeParams->get('itemRatingSize', 'md');
		$paramLibrary = $typeParams->get('itemRatingLibrary', 'bootstrap_star_rating');

		$layoutData = array(
			'stars' => $paramStars,
			'step'  => $paramStep,
			'size'  => $paramSize,
			'value' => $values->rating_value,
			'total' => $values->rating_total,
			'users' => $values->users,
			'item'  => $item
		);

		$layoutFile = 'item_rating';

		// If admin use jQuery Raty for rating library
		if ($paramLibrary == 'jquery_raty')
		{
			$layoutFile = 'item_rating_jqueryraty';
		}

		// Get template path with override method support
		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, array('component' => 'com_reditem'));
		$content     = str_replace('{item_rating}', $contentHtml, $content);

		// Tag {item_rating_info}
		$contentHtml = '';

		if ($values->rating_value > 0)
		{
			$contentHtml = ReditemHelperLayout::render($item->type, 'item_rating_info', $layoutData, array('component' => 'com_reditem'));
		}

		$content = str_replace('{item_rating_info}', $contentHtml, $content);

		return true;
	}

	/**
	 * Method for replace rating information
	 *
	 * @param   string  &$content   HTML content of template
	 * @param   int     $rateCount  Rating value
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceRatingIf(&$content, $rateCount)
	{
		$rateCount = (float) $rateCount;

		if (empty($content))
		{
			return false;
		}

		if ((strpos($content, '{if_rating}') == true) && (strpos($content, '{end_if_rating') == true))
		{
			$tempContent   = explode('{if_rating}', $content);
			$preContentIf  = (count($tempContent) > 1) ? $tempContent[0] : '';
			$tempContent   = $tempContent[count($tempContent) - 1];
			$tempContent   = explode('{end_if_rating}', $tempContent);
			$subContent    = $tempContent[0];
			$postContentIf = (count($tempContent) > 1) ? $tempContent[count($tempContent) - 1] : '';

			// Check if item has rating
			if ($rateCount <= 0)
			{
				$content = $preContentIf . $postContentIf;
			}
		}

		// Remove {if_rating} & {if_rating} from template
		$content = str_replace('{if_rating}', '', $content);
		$content = str_replace('{end_if_rating}', '', $content);

		return true;
	}
}
