<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Helpers
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;
require_once JPATH_ROOT . '/components/com_reditem/helpers/route.php';

/**
 * RedITEM Features Helper
 *
 * @package     RedITEM.Component
 * @subpackage  Helpers.CusomHelper
 * @since       2.1
 *
 */
class ReditemHelperWatch
{
	/**
	 * Method for watch an item.
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  boolean       True on success. False otherwise.
	 */
	public static function watchItem($itemId)
	{
		$itemId = (int) $itemId;

		// Make sure itemID is available
		if (!$itemId)
		{
			return false;
		}

		$db   = RFactory::getDbo();
		$user = ReditemHelperSystem::getUser();

		// Check if user is already watch this item or not
		if (self::isUserWatching($user->id, $itemId))
		{
			return false;
		}

		$query = $db->getQuery(true)
			->insert($db->qn('#__reditem_watch_xref'))
			->columns($db->qn(array('item_id','user_id')))
			->values($itemId . ',' . $user->id);
		$db->setQuery($query);

		if (!$db->execute())
		{
			return false;
		}

		// Email item archived due to time
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemWatched', array($itemId, $user->id));

		return true;
	}

	/**
	 * Method for un-watch item
	 *
	 * @param   int  $itemId  Id of item
	 *
	 * @return  bool          True on success. False otherwise.
	 */
	public static function unwatchItem($itemId)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return false;
		}

		$db   = RFactory::getDbo();
		$user = ReditemHelperSystem::getUser();

		if (!self::isUserWatching($user->id, $itemId))
		{
			return false;
		}

		// Remove watch feature.
		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_watch_xref'))
			->where($db->qn('user_id') . ' = ' . (int) $user->id)
			->where($db->qn('item_id') . ' = ' . $itemId);
		$db->setQuery($query);

		if (!$db->execute())
		{
			return false;
		}

		// Email item archived due to time
		JPluginHelper::importPlugin('reditem');
		$dispatcher = RFactory::getDispatcher();
		$dispatcher->trigger('onAfterItemUnWatched', array($itemId, $user->id));

		return true;
	}

	/**
	 * user watching item or not
	 *
	 * @param   int  $userId  Id of user
	 * @param   int  $itemId  Id of item
	 *
	 * @return  bool
	 */
	public static function isUserWatching($userId, $itemId)
	{
		$userId = (int) $userId;
		$itemId = (int) $itemId;

		if (!$userId || !$itemId)
		{
			return false;
		}

		$db = RFactory::getDbo();

		$query = $db->getQuery(true)
			->select('COUNT(*) AS ' . $db->qn('count'))
			->from($db->qn('#__reditem_watch_xref'))
			->where($db->qn('user_id') . ' = ' . $userId)
			->where($db->qn('item_id') . ' = ' . $itemId);
		$db->setQuery($query);
		$result = $db->loadObject();

		if ($result && $result->count)
		{
			return true;
		}

		return false;
	}

	/**
	 * Method for get list of watchers of an item
	 *
	 * @param   int  $itemId  ID of item
	 *
	 * @return  array list of watchers
	 */

	/**
	 * Method for get list of watchers of an item
	 *
	 * @param   int   $itemId  ID of item
	 * @param   bool  $idOnly  If true, return array of Ids only
	 *
	 * @return array
	 */
	public static function getWatchers($itemId, $idOnly = false)
	{
		$itemId = (int) $itemId;

		if (!$itemId)
		{
			return array();
		}

		$db = RFactory::getDbo();

		$query = $db->getQuery(true)
			->select($db->qn('user_id'))
			->from($db->qn('#__reditem_watch_xref'))
			->where($db->qn('item_id') . ' = ' . $itemId);
		$db->setQuery($query);
		$watcherIds = $db->loadColumn();

		if (!$watcherIds)
		{
			return false;
		}

		if ($idOnly)
		{
			return $watcherIds;
		}

		$watchers = array();

		foreach ($watcherIds as $id)
		{
			$watchers[] = ReditemHelperSystem::getUser($id);
		}

		return $watchers;
	}

	/**
	 * Method for check if watcher feature is enabled
	 *
	 * @return  bool
	 */
	public static function isWatchFeatureEnabled()
	{
		return (boolean) JComponentHelper::getParams('com_reditem')->get('watch_enable', '0');
	}

	/**
	 * Method for get param value from config of redITEM
	 *
	 * @param   string  $key      key in params array
	 * @param   mixed   $default  default value if there is no param got
	 *
	 * @return  mixed
	 */
	public static function getWatchParam($key, $default = null)
	{
		if (empty($key))
		{
			return null;
		}

		return JComponentHelper::getParams('com_reditem')->get($key, $default);
	}

	/**
	 * replaceTag
	 *
	 * @param   string  &$content  String contain tags
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

		if (!isset($item->type))
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$item->type = $typeModel->getItem($item->type_id);
		}

		$user = ReditemHelperSystem::getUser();
		$html = '';

		if (self::isWatchFeatureEnabled() && !$user->guest && $item->created_user_id != $user->id)
		{
			$html = ReditemHelperLayout::render($item->type, 'features.watch', array('item_id' => $item->id), array('component' => 'com_reditem'));
		}

		$content = str_replace('{item_watching}', $html, $content);

		// Tag {item_watching_info}
		$html = '';

		if (self::isWatchFeatureEnabled())
		{
			$layoutData = array('item_id' => $item->id);
			$layoutOption = array('component' => 'com_reditem');
			$html = ReditemHelperLayout::render($item->type, 'features.watchinfo', $layoutData, $layoutOption);
		}

		$content = str_replace('{item_watching_info}', $html, $content);

		return true;
	}

	/**
	 * Method for replace check condition tag
	 *
	 * @param   string  &$content  HTML content of template
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function replaceIfWatch(&$content, $item)
	{
		if (empty($content) || empty($item))
		{
			return false;
		}

		$user       = ReditemHelperSystem::getUser();
		$isWatching = self::isUserWatching($user->id, $id);

		if ((strpos($content, '{if_watched}') == true) && (strpos($content, '{end_if_watched') == true))
		{
			$tempContent = explode('{if_watched}', $content);
			$preContentIf = (count($tempContent) > 1) ? $tempContent[0] : '';

			$tempContent = $tempContent[count($tempContent) - 1];
			$tempContent = explode('{end_if_watched}', $tempContent);
			$subContent = $tempContent[0];

			$postContentIf = (count($tempContent) > 1) ? $tempContent[count($tempContent) - 1] : '';

			// Check if item has watched by current user or not
			if (!$isWatching)
			{
				$content = $preContentIf . $postContentIf;
			}
		}

		// Remove {if_watched} & {end_if_watched} from template
		$content = str_replace('{if_watched}', '', $content);
		$content = str_replace('{end_if_watched}', '', $content);

		return true;
	}
}
