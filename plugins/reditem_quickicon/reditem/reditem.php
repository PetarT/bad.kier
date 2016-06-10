<?php
/**
 * @package     RedITEM
 * @subpackage  Plugin
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Plugins for provide icons for redITEM on left sidebar
 *
 * @package  RedITEM.Plugin
 *
 * @since    2.1.14
 */
class PlgReditem_QuickiconReditem extends JPlugin
{
	/**
	 * Constructor
	 *
	 * @param   object  &$subject  The object to observe
	 * @param   array   $config    An array that holds the plugin configuration
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);
		$this->loadLanguage();
	}

	/**
	 * Method for run when render sidebar
	 *
	 * @return  array   List of icons
	 */
	public function getSidebarIcons()
	{
		$icons = array(
			array(
				'view' => 'cpanel',
				'icon' => 'icon-home',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_HOME_LABEL'),
				'link' => 'index.php?option=com_reditem&view=cpanel'
			),
			array(
				'view' => 'explore',
				'icon' => 'icon-sitemap',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_EXPLORE_LABEL'),
				'link' => 'index.php?option=com_reditem&view=explore'
			),
			array(
				'view' => 'types',
				'icon' => 'icon-book',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_TYPES_LABEL'),
				'link' => 'index.php?option=com_reditem&view=types'
			),
			array(
				'view' => 'categories',
				'icon' => 'icon-sitemap',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_CATEGORIES_LABEL'),
				'link' => 'index.php?option=com_reditem&view=categories'
			),
			array(
				'view' => 'items',
				'icon' => 'icon-file-text',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_ITEMS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=items'
			),
			array(
				'view' => 'fields',
				'icon' => 'icon-puzzle-piece',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_FIELDS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=fields'
			),
			array(
				'view' => 'templates',
				'icon' => 'icon-desktop',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_TEMPLATES_LABEL'),
				'link' => 'index.php?option=com_reditem&view=templates'
			),
			array(
				'view' => 'comments',
				'icon' => 'icon-comments',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_COMMENTS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=comments'
			),
		);

		$redItemConfiguration = JComponentHelper::getParams('com_reditem');

		// Check if we should display mail center or not
		if (JPluginHelper::isEnabled('reditem', 'mail'))
		{
			$icons[] = array(
				'view' => 'mails',
				'icon' => 'icon-envelope',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_MAILS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=mails'
			);
			$icons[] = array(
				'view' => 'subscriblers',
				'icon' => 'icon-rss',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_SUBSCRIBLER_LABEL'),
				'link' => 'index.php?option=com_reditem&view=subscriblers'
			);
		}

		// Check if report system for items has been enabled nor not
		if ($redItemConfiguration->get('reportItems', false))
		{
			$icons[] = array(
				'view' => 'reportusers',
				'icon' => 'icon-frown',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_REPORT_USERS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=reportusers'
			);

			$icons[] = array(
				'view' => 'reportitems',
				'icon' => 'icon-frown',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_REPORT_ITEMS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=reportitems'
			);

			$icons[] = array(
				'view' => 'reportcomments',
				'icon' => 'icon-frown',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_REPORT_COMMENTS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=reportcomments'
			);

			$icons[] = array(
				'view' => 'reporters',
				'icon' => 'icon-user',
				'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_REPORTERS_LABEL'),
				'link' => 'index.php?option=com_reditem&view=reporters'
			);
		}

		// Configuration link
		$uri = JUri::getInstance();
		$return = base64_encode('index.php' . $uri->toString(array('query')));
		$configurationLink = 'index.php?option=com_redcore&view=config&layout=edit&component=com_reditem&return=' . $return;

		$icons[] = array(
			'view' => 'configuration',
			'icon' => 'icon-cog',
			'text' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_CONFIGURATION_LABEL'),
			'link' => $configurationLink
		);

		$return = array(
			'header' => JText::_('PLG_REDITEM_QUICKICON_REDITEM_CPANEL'),
			'option' => 'com_reditem',
			'icons' => $icons
		);

		return $return;
	}
}
