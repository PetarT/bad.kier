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
 * System helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.System
 * @since       2.1
 *
 */
class ReditemHelperSystem
{
	/**
	 * Get the current redITEM version
	 *
	 * @return  string  The redITEM version
	 *
	 * @since   2.1.9
	 */
	public static function getVersion()
	{
		$xmlfile = JPATH_SITE . '/administrator/components/com_reditem/reditem.xml';
		$version = JText::_('COM_REDITEM_FILE_NOT_FOUND');

		if (file_exists($xmlfile))
		{
			$data = JApplicationHelper::parseXMLInstallFile($xmlfile);
			$version = $data['version'];
		}

		return $version;
	}

	/**
	 * Get the current redITEM version
	 *
	 * @return  string  The redITEM version
	 *
	 * @since   2.1.9
	 */
	public static function getStats()
	{
		$stats = new stdClass;

		// Get count of items
		$stats->items = 0;
		$itemsModel = RModel::getAdminInstance('Items', array('ignore_request' => true), 'com_reditem');
		$itemsModel->setState('list.select', 'count(*) as count');
		$items = $itemsModel->getItems();

		if ($items)
		{
			$stats->items = $items[0]->count;
		}

		// Get count of categories
		$stats->categories = 0;
		$categoriesModel = RModel::getAdminInstance('Categories', array('ignore_request' => true), 'com_reditem');
		$categoriesModel->setState('list.select', 'count(*) as count');
		$categories = $categoriesModel->getItems();

		if ($categories)
		{
			$stats->categories = $categories[0]->count;
		}

		// Get count of types
		$stats->types = 0;
		$typesModel = RModel::getAdminInstance('Types', array('ignore_request' => true), 'com_reditem');
		$typesModel->setState('list.select', 'count(*) as count');
		$types = $typesModel->getItems();

		if ($types)
		{
			$stats->types = $types[0]->count;
		}

		// Get count of customfields
		$stats->fields = 0;
		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
		$fieldsModel->setState('list.select', 'count(*) as count');
		$fields = $fieldsModel->getItems();

		if ($fields)
		{
			$stats->fields = $fields[0]->count;
		}

		// Get count of templates
		$stats->templates = 0;
		$templatesModel = RModel::getAdminInstance('Templates', array('ignore_request' => true), 'com_reditem');
		$templatesModel->setState('list.select', 'count(*) as count');
		$templates = $templatesModel->getItems();

		if ($templates)
		{
			$stats->templates = $templates[0]->count;
		}

		// Get count of comments
		$stats->comments = 0;
		$commentsModel = RModel::getAdminInstance('Comments', array('ignore_request' => true), 'com_reditem');
		$comments = $commentsModel->getItems();

		if ($comments)
		{
			$stats->comments = count($comments);
		}

		// Get count of comment's reports
		$stats->reportcomments = 0;
		$reportCommentsModel = RModel::getAdminInstance('ReportComments', array('ignore_request' => true), 'com_reditem');
		$result = $reportCommentsModel->getItems();

		if ($result)
		{
			$stats->reportcomments = count($result);
		}

		// Get count of user reports
		$stats->reportusers = 0;
		$reportUsersModel = RModel::getAdminInstance('ReportUsers', array('ignore_request' => true), 'com_reditem');
		$result = $reportUsersModel->getItems();

		if ($result)
		{
			$stats->reportusers = count($result);
		}

		// Get count of item reports
		$stats->reportitems = 0;
		$reportItemsModel = RModel::getAdminInstance('ReportItems', array('ignore_request' => true), 'com_reditem');
		$result = $reportItemsModel->getItems();

		if ($result)
		{
			$stats->reportitems = count($result);
		}

		// Get count of reporters
		$stats->reporters = 0;
		$reportersModel = RModel::getAdminInstance('Reporters', array('ignore_request' => true), 'com_reditem');
		$result = $reportersModel->getItems();

		if ($result)
		{
			$stats->reporters = count($result);
		}

		if (JPluginHelper::isEnabled('reditem', 'mail'))
		{
			$stats->mails = 0;
			$model = RModel::getAdminInstance('Mails', array('ignore_request' => true), 'com_reditem');
			$result = $model->getItems();

			if ($result)
			{
				$stats->mails = count($result);
			}

			$stats->subscriblers = 0;
			$model = RModel::getAdminInstance('Subscriblers', array('ignore_request' => true), 'com_reditem');
			$model->setState('filter.subscrible', 1);
			$result = $model->getItems();

			if ($result)
			{
				$stats->subscriblers = count($result);
			}
		}

		return $stats;
	}

	/**
	 * Method to get templates by Section code and Type Id
	 *
	 * @param   string   $section  Section code
	 * @param   integer  $type     Type Id
	 *
	 * @return  mixed
	 */
	public static function getTemplatesBySection($section = 'view_itemdetail', $type = 0)
	{
		$templatesModel = RModel::getAdminInstance('Templates', array('ignore_request' => true), 'com_reditem');
		$templatesModel->setState('filter.section', $section);

		if (!empty($type))
		{
			$templatesModel->setState('filter.filter_types', (int) $type);
		}

		return $templatesModel->getItems();
	}

	/**
	 * Method for create JDate class with applied timezone of current user.
	 *
	 * @param   string   $date          Date string of specific time.
	 * @param   boolean  $convertToUTC  True to convert local time into UTC.
	 * @param   int      $userId        ID of user.
	 *
	 * @return  JDate            JDate class.
	 */
	public static function getDateWithTimezone($date = 'now', $convertToUTC = false, $userId = 0)
	{
		$tz = JFactory::getConfig()->get('offset', 'UTC');
		$tz = self::getUser($userId)->getParam('timezone', $tz);
		$timezone = new DateTimeZone($tz);

		if (empty($date))
		{
			return JFactory::getDate('0000-00-00');
		}

		if ($convertToUTC && $tz != 'UTC')
		{
			$tmpDate = new DateTime($date, $timezone);
			$tmpDate->setTimeZone(new DateTimeZone('UTC'));
			$date = $tmpDate->format('Y-m-d H:i:s');

			return JFactory::getDate($date);
		}

		$date = JFactory::getDate($date);
		$date->setTimeZone($timezone);

		return $date;
	}

	/**
	 * Method for get user data. Avoid the JUser::_load warning message
	 *
	 * @param   int  $userId  ID of user
	 *
	 * @return  JUser         Object user data
	 */
	public static function getUser($userId = null)
	{
		$userId = (int) $userId;

		if (!$userId || !JUser::getInstance()->load($userId))
		{
			return JFactory::getUser();
		}

		return JFactory::getUser($userId);
	}

	/**
	 * Method for load GoogleMap Javascript library v3
	 *
	 * @return  boolean  True on success. False otherwise.
	 */
	public static function loadGoogleMapJavascriptLibrary()
	{
		$doc = JFactory::getDocument();
		$jsLibrary = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places';

		// If this library not load, load it
		if (!array_key_exists($jsLibrary, $doc->_scripts))
		{
			$doc->addScript($jsLibrary);

			return true;
		}

		return false;
	}
}
