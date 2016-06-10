<?php
/**
 * @package     RedITEM.Frontend
 * @subpackage  RedITEM
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$redcoreLoader = JPATH_LIBRARIES . '/redcore/bootstrap.php';

if (!file_exists($redcoreLoader) || !JPluginHelper::isEnabled('system', 'redcore'))
{
	throw new Exception(JText::_('COM_REDITEM_REDCORE_INIT_FAILED'), 404);
}

// Bootstraps redCORE
RBootstrap::bootstrap();

$app = JFactory::getApplication();
$input = JFactory::getApplication()->input;

JLoader::import('joomla.html.parameter');

$option = $input->getCmd('option');
$view   = $input->getCmd('view');

// Register component prefix
JLoader::registerPrefix('Reditem', __DIR__);

// Register library prefix
RLoader::registerPrefix('Reditem', JPATH_LIBRARIES . '/reditem');

// Loading helper
JLoader::import('joomla.html.pagination');
JLoader::import('reditem', JPATH_COMPONENT . '/helpers');
JLoader::import('route', JPATH_COMPONENT . '/helpers');

$controller = $input->getCmd('view');

// Set the controller page
if (!file_exists(JPATH_COMPONENT . '/controllers/' . $controller . '.php'))
{
	$controller = 'categorydetail';
	$input->set('view', 'categorydetail');
}

require_once JPATH_COMPONENT . '/controllers/' . $controller . '.php';

// Execute the controller
$controller = JControllerLegacy::getInstance('reditem');
$controller->execute($input->getCmd('task'));
$controller->redirect();
