<?php
/**
 * @package     RedITEMCategoryFields
 * @subpackage  Plugin
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Plugins for provide icons for redITEM CategoryFields on left sidebar
 *
 * @package  RedITEMCategoryFields.Plugin
 *
 * @since    2.0.10
 */
class PlgReditem_QuickiconCategoryfields extends JPlugin
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
		$icons = array();

		$icons[] = array(
			'view' => 'categoryfields',
			'icon' => 'icon-puzzle-piece',
			'text' => JText::_('PLG_REDITEM_QUICKICON_CATEGORYFIELDS_FIELDS_LABEL'),
			'link' => 'index.php?option=com_reditemcategoryfields&view=categoryfields'
		);

		$return = array(
			'header' => JText::_('PLG_REDITEM_QUICKICON_CATEGORYFIELDS_CPANEL'),
			'option' => 'com_reditemcategoryfields',
			'icons' => $icons
		);

		return $return;
	}
}
