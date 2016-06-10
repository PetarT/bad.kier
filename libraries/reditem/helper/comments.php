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
 * Comments helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.Comments
 * @since       2.1
 *
 */
class ReditemHelperComments
{
	/**
	 * Method for get comments of an item
	 *
	 * @param   object  $itemId  The Id of target item
	 *
	 * @return  mixed            Array of comments on success. False otherwise.
	 */
	public static function getComments($itemId)
	{
		if (empty($itemId))
		{
			return false;
		}

		$typeId = ReditemHelperItem::getTypeIdByItemId($itemId);

		if ($typeId)
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$type = $typeModel->getItem($typeId);
		}

		$typeParams = new JRegistry($type->params);

		// Get configuration of component
		$redItemConfiguration = JComponentHelper::getParams('com_reditem');
		$ownerViewAllPrivate  = $typeParams->get('ownerViewAllPrivate', 1);

		$commentsModel = RModel::getAdminInstance('Comments', array('ignore_request' => true), 'com_reditem');
		$commentsModel->setState('filter.item_id', $itemId);
		$commentsModel->setState('filter.ownerViewAllPrivate', $ownerViewAllPrivate);

		$comments = $commentsModel->getItems();

		return $comments;
	}

	/**
	 * Method for replace comment's tag on template
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceTag(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		// Check if comments has been loaded or not on this item
		if (!isset($item->comments))
		{
			$item->comments = self::getComments($item->id);
		}

		if (!isset($item->type))
		{
			$item->type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($item->type_id);
		}

		self::replaceIfComment($content, $item);
		self::replaceCommentInfor($content, $item);
		self::replaceCommentList($content, $item);
		self::replaceCommentForm($content, $item);
	}

	/**
	 * Method for replace check condition tag
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceIfComment(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		// Check if comments has been loaded or not on this item
		if (!isset($item->comments))
		{
			$item->comments = self::getComments($item->id);
		}

		if ((strpos($content, '{if_comments}') == true) && (strpos($content, '{end_if_comments') == true))
		{
			$tempContent = explode('{if_comments}', $content);
			$preContentIf = (count($tempContent) > 1) ? $tempContent[0] : '';

			$tempContent = $tempContent[count($tempContent) - 1];
			$tempContent = explode('{end_if_comments}', $tempContent);
			$subContent = $tempContent[0];

			$postContentIf = (count($tempContent) > 1) ? $tempContent[count($tempContent) - 1] : '';

			// Check if item has comments
			if (empty($item->comments))
			{
				$content = $preContentIf . $postContentIf;
			}
		}

		// Remove {if_comments} & {end_if_comments} from template
		$content = str_replace('{if_comments}', '', $content);
		$content = str_replace('{end_if_comments}', '', $content);

		return true;
	}

	/**
	 * Method for replace comment information
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceCommentInfor(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		// Replace for {item_comment_info} tag
		if (strpos($content, '{item_comment_info}') !== false)
		{
			$contentHtml = '';

			if (!empty($item->comments))
			{
				$layoutData = array(
					'comments' => $item->comments,
					'item'     => $item,
				);

				$contentHtml = ReditemHelperLayout::render($item->type, 'item_comment_info', $layoutData, array('component' => 'com_reditem'));
			}

			$content = str_replace('{item_comment_info}', $contentHtml, $content);
		}
	}

	/**
	 * Method for replace comment list
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceCommentList(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		if (strpos($content, '{item_comments}') === false)
		{
			return false;
		}

		// Get type parameters
		if (!isset($item->type))
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$item->type = $typeModel->getItem($item->type_id);
		}

		$typeParams = new JRegistry($item->type->params);

		// Get configuration of component
		$redItemConfiguration = JComponentHelper::getParams('com_reditem');
		$reportComment        = (boolean) $redItemConfiguration->get('reportComments', false);

		// Check "Comment View" permission
		if (!ReditemHelperACL::checkItemPermission('item.comment.view', $item->id))
		{
			$content = str_replace('{item_comments}', '', $content);

			return false;
		}

		$contentHtml = '';
		$ownerViewAllPrivate = $typeParams->get('ownerViewAllPrivate', 1);
		$commentsModel = RModel::getAdminInstance('Comments', array('ignore_request' => true), 'com_reditem');
		$commentsModel->setState('filter.item_id', $item->id);
		$commentsModel->setState('filter.parent_id', 0);
		$commentsModel->setState('filter.ownerViewAllPrivate', $ownerViewAllPrivate);
		$commentsModel->setState('list.direction', 'desc');

		$comments = $commentsModel->getItems();
		$comments = $commentsModel->groupComment($comments);

		// Prepare predefined reasons list of comment from configuration
		$reasonsPredefined = $redItemConfiguration->get('reportCommentPredefined', false);
		$reportHelp        = $redItemConfiguration->get('reportCommentHelp', '');
		$reasons = array();

		if (!empty($reasonsPredefined))
		{
			$reasons = explode("\n", $reasonsPredefined);

			foreach ($reasons as $key => $reason)
			{
				$reasons[$key] = JText::_($reason);
			}
		}

		$canEdit = ReditemHelperACL::checkItemPermission('item.comment.edit', $item->id);

		$layoutData = array(
			'comments'      => $comments,
			'item'          => $item,
			'canEdit'       => $canEdit,
			'replyTo'       => 0,
			'report'        => $reportComment,
			'reportReasons' => $reasons,
			'help'          => $reportHelp
		);
		$contentHtml = ReditemHelperLayout::render($item->type, 'item_comments', $layoutData, array('component' => 'com_reditem'));

		$content = str_replace('{item_comments}', $contentHtml, $content);

		return true;
	}

	/**
	 * Method for replace comment form
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceCommentForm(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		if (strpos($content, '{item_comment_form}') === false)
		{
			return false;
		}

		// Check "Comment Edit" permission
		if (!ReditemHelperACL::checkItemPermission('item.comment.edit', $item->id))
		{
			$content = str_replace('{item_comment_form}', '', $content);

			return false;
		}

		$layoutData = array('item' => $item);
		$contentHtml = ReditemHelperLayout::render($item->type, 'item_comment_form', $layoutData, array('component' => 'com_reditem'));
		$content = str_replace('{item_comment_form}', $contentHtml, $content);

		return true;
	}
}
