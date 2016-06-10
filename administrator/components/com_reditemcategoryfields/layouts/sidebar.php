<?php
/**
 * @package     RedITEM
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

// Load layout sidebar from redITEM
echo RLayoutHelper::render('sidebar', $displayData, JPATH_ROOT . '/administrator/com_reditem/layouts', array('component' => 'com_reditem'));
