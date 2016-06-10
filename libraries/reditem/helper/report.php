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
 * Report helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.Report
 * @since       2.1
 *
 */
class ReditemHelperReport
{
	/**
	 * Get report data of a comment
	 *
	 * @param   int  $commentId  ID of comment
	 *
	 * @return  object  Result data
	 */
	public static function getReportCommentData($commentId)
	{
		$commentId = (int) $commentId;
		$user = ReditemHelperSystem::getUser();

		if (!$commentId || $user->guest)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn(array('id', 'reason')))
			->from($db->qn('#__reditem_comment_reports', 'r'))
			->where($db->qn('r.user_id') . ' = ' . $user->id)
			->where($db->qn('r.comment_id') . ' = ' . $commentId);
		$db->setQuery($query);

		return $db->loadObject();
	}

	/**
	 * Replace tag {item_report} on content of template
	 *
	 * @param   string  &$content  Content template
	 * @param   object  $item      Item data object
	 *
	 * @return  boolean  True on success. False otherwise.
	 */
	public static function replaceTag(&$content, $item)
	{
		if (empty($content) || empty($item) || !$item->id || (strpos($content, '{item_report}') === false))
		{
			return false;
		}

		// Get configuration of component
		$redItemConfiguration = JComponentHelper::getParams('com_reditem');

		// Check if report system for items has been enabled nor not
		$reportItemEnable = (boolean) $redItemConfiguration->get('reportItems', false);

		if (!$reportItemEnable)
		{
			return false;
		}

		// Get report of current user for this item
		$user = ReditemHelperSystem::getUser();

		if ($user->guest || ($user->id == $item->created_user_id))
		{
			$content = str_replace('{item_report}', '', $content);

			return false;
		}

		$hasReport    = false;
		$reportReason = '';
		$contentHtml  = '';

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn(array('id', 'reason')))
			->from($db->qn('#__reditem_item_reports', 'r'))
			->where($db->qn('r.user_id') . ' = ' . $user->id)
			->where($db->qn('r.item_id') . ' = ' . $item->id);
		$db->setQuery($query);
		$report = $db->loadObject();

		if ($report)
		{
			$hasReport = true;
			$reportReason = $report;
		}

		// Prepare Predefined reasons list
		$predefinedReasons = $redItemConfiguration->get('reportItemPredefined', '');
		$reportHelp        = $redItemConfiguration->get('reportItemHelp', '');
		$reasons           = array();

		if (!empty($predefinedReasons))
		{
			$reasons = explode("\n", $predefinedReasons);

			foreach ($reasons as $key => $value)
			{
				$reasons[$key] = JText::_($value);
			}
		}

		$layoutData = array(
			'item'         => $item,
			'reasons'      => $reasons,
			'hasReport'    => $hasReport,
			'reportReason' => $reportReason,
			'help'         => $reportHelp
		);
		$contentHtml = ReditemHelperLayout::render($item->type, 'item_report', $layoutData, array('component' => 'com_reditem'));
		$content = str_replace('{item_report}', $contentHtml, $content);

		return true;
	}

	/**
	 * Method for block user if he/she have number of reports match configuration
	 *
	 * @param   int  $userId  User ID
	 *
	 * @return  boolean  True on success. False otherwise.
	 */
	public static function processOnUserReported($userId)
	{
		$userId = (int) $userId;

		if (!$userId)
		{
			return false;
		}

		$user = ReditemHelperSystem::getUser($userId);

		// Make sure user exist and not Guest.
		if ($user->guest)
		{
			return false;
		}

		$redItemConfiguration   = JComponentHelper::getParams('com_reditem');
		$reportUserBlockCount   = (int) $redItemConfiguration->get('reportUserBlockCount', 10);
		$reportUserGroupsEffect = $redItemConfiguration->get('userGroupsEffect', array());

		// Check if user is Groups effected
		$userEffected = false;

		foreach ($user->groups as $group)
		{
			if (in_array($group, $reportUserGroupsEffect))
			{
				$userEffected = true;

				// Exit loop for
				break;
			}
		}

		// If user not in effected group, stop function
		if (!$userEffected)
		{
			return false;
		}

		$itemBlocked    = 0;
		$commentBlocked = 0;
		$db = JFactory::getDbo();

		// Get count of blocked items
		$query = $db->getQuery(true)
			->select('COUNT(*) as ' . $db->qn('count'))
			->from($db->qn('#__reditem_items'))
			->where($db->qn('created_user_id') . ' = ' . $userId)
			->where($db->qn('blocked') . ' = 1');
		$db->setQuery($query);
		$result = $db->loadObject();

		if ($result)
		{
			$itemBlocked = $result->count;
		}

		// Get count of blocked comments
		$query->clear()
			->select('COUNT(*) as ' . $db->qn('count'))
			->from($db->qn('#__reditem_comments'))
			->where($db->qn('user_id') . ' = ' . $userId)
			->where($db->qn('trash') . ' = 2');
		$db->setQuery($query);
		$result = $db->loadObject();

		if ($result)
		{
			$commentBlocked = $result->count;
		}

		// Get total of reports base on reports of comments and reports of items
		$total = $itemBlocked + $commentBlocked;

		// Check if total of reports still less than config
		if ($total < $reportUserBlockCount)
		{
			// If user has been blocked, unblock user
			if ($user->block == 1)
			{
				$user->block = 0;
				$user->save();
			}

			return true;
		}

		$user->block = 1;
		$user->save();

		// Email item blocked by reported
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterUserBlockedByReport', array($user->id));

		return true;
	}

	/**
	 * Method for get reports of an item
	 *
	 * @param   int      $itemId       Item ID
	 * @param   boolean  $onlyPublish  Only show publish reports or show all
	 *
	 * @return  array/boolean          Array of reports if success. False other wise.
	 */
	public static function getReportsItem($itemId, $onlyPublish = false)
	{
		$itemId      = (int) $itemId;
		$onlyPublish = (boolean) $onlyPublish;

		// Make sure itemID available
		if (!$itemId)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn(array('r.id', 'r.reason', 'r.created', 'r.user_id', 'r.state')))
			->select($db->qn('u.name', 'reporter'))
			->from($db->qn('#__reditem_item_reports', 'r'))
			->leftJoin($db->qn('#__users', 'u') . ' ON ' . $db->qn('r.user_id') . ' = ' . $db->qn('u.id'))
			->where($db->qn('r.item_id') . ' = ' . $itemId);

		if ($onlyPublish)
		{
			$query->where($db->qn('r.state') . ' = 1');
		}

		$db->setQuery($query);
		$reports = $db->loadObjectList();

		return $reports;
	}

	/**
	 * Method for get reports of an comment
	 *
	 * @param   int  $commentId    Comment ID
	 * @param   int  $onlyPublish  Show only publish comment or show all
	 *
	 * @return  array/boolean  Array of reports if success. False other wise.
	 */
	public static function getReportsComment($commentId, $onlyPublish = false)
	{
		$commentId = (int) $commentId;
		$onlyPublish = (boolean) $onlyPublish;

		// Make sure itemID available
		if (!$commentId)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn(array('r.id', 'r.reason', 'r.created', 'r.user_id', 'r.state')))
			->select($db->qn('u.name', 'reporter'))
			->from($db->qn('#__reditem_comment_reports', 'r'))
			->leftJoin($db->qn('#__users', 'u') . ' ON ' . $db->qn('r.user_id') . ' = ' . $db->qn('u.id'))
			->where($db->qn('r.comment_id') . ' = ' . $commentId);

		if ($onlyPublish)
		{
			$query->where($db->qn('r.state') . ' = 1');
		}

		$db->setQuery($query);
		$reports = $db->loadObjectList();

		return $reports;
	}

	/**
	 * Method for calculate the reports of an item and block if needed
	 *
	 * @param   int  $itemId  ID of Item
	 *
	 * @return  boolean       True on success. False otherwise.
	 */
	public static function calculateItemBlockDueToReport($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$item          = RTable::getAdminInstance('Item', array('ignore_report' => true), 'com_reditem');
		$redItemConfig = JComponentHelper::getParams('com_reditem');
		$itemBlockCount = (int) $redItemConfig->get('reportItemBlockCount', 5);

		// Load data of item
		if (!$item->load($itemId))
		{
			return false;
		}

		$categories = ReditemHelperItem::getCategories($item->id);

		if (isset($categories[$item->id]))
		{
			$item->categories = $categories[$item->id];
		}

		// Calculate if this item has been block due to reports or not
		$reports = self::getReportsItem($item->id, true);

		// If reports not enough, do nothing
		if (count($reports) < $itemBlockCount)
		{
			// If current item has been blocked, unblock this item
			if ($item->blocked == 1)
			{
				$item->blocked = 0;
				$item->store();
			}

			return true;
		}

		// Number of reports is match the configuration, block this item
		$item->blocked = 1;
		$item->store();

		// Run event
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemBlockedByReport', array($itemId));

		return true;
	}

	/**
	 * Method for calculate the reports of an comment and block if needed
	 *
	 * @param   int  $commentId  ID of Item
	 *
	 * @return  boolean          True on success. False otherwise.
	 */
	public static function calculateCommentBlockDueToReport($commentId)
	{
		$commentId = (int) $commentId;

		if (!$commentId)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$comment       = RTable::getAdminInstance('Comment', array('ignore_report' => true), 'com_reditem');
		$redItemConfig = JComponentHelper::getParams('com_reditem');
		$commentBlockCount = (int) $redItemConfig->get('reportCommentBlockCount', 5);

		// Load table data of this comment
		if (!$comment->load($commentId))
		{
			return false;
		}

		// Get number of reports on this comment
		$reports = self::getReportsComment($comment->id, true);

		// If reports not enough, do nothing
		if (count($reports) < $commentBlockCount)
		{
			// If current comment has been blocked, unblock this comment
			if ($comment->trash == 2)
			{
				$comment->trash = 0;
				$comment->store();
			}

			return true;
		}

		// Number of reports is match the configuration, block this comment
		$comment->trash = 2;
		$comment->store();

		// Email after comment blocked
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterCommentBlockByReported', array($commentId));

		return true;
	}

	/**
	 * Method to get list of reporters of an item
	 *
	 * @param   int   $itemId  Item Id
	 * @param   bool  $idOnly  If true, return list Ids of reporters
	 *
	 * @return  array
	 */
	public static function getReporters($itemId, $idOnly = false)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return array();
		}

		$db = RFactory::getDbo();

		$query = $db->getQuery(true)
			->select($db->qn('user_id'))
			->from($db->qn('#__reditem_item_reports'))
			->where($db->qn('item_id') . ' = ' . $itemId);
		$db->setQuery($query);
		$reporterIds = $db->loadColumn();

		if (!$reporterIds)
		{
			return false;
		}

		if ($idOnly)
		{
			return $reporterIds;
		}

		$reporters = array();

		foreach ($reporterIds as $id)
		{
			$reporters[] = ReditemHelperSystem::getUser($id);
		}

		return $reporters;
	}
}
