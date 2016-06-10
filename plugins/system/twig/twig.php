<?php
/**
 * @package     Twig
 * @subpackage  Plugin
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

/**
 * Plugin for enabling Twig library on files render.
 *
 * @package  Twig.Plugin
 *
 * @since    1.0.0
 */
class PlgSystemTwig extends JPlugin
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
		require_once JPATH_LIBRARIES . '/twig/library.php';
	}
}
