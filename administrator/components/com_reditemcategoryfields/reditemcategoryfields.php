<?php
/**
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Entry point
 *
 * @copyright   Copyright (C) 2013 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

$app = JFactory::getApplication();
$input = $app->input;

$redcoreLoader = JPATH_LIBRARIES . '/redcore/bootstrap.php';

if (!file_exists($redcoreLoader) || !JPluginHelper::isEnabled('system', 'redcore'))
{
	throw new Exception(JText::_('COM_REDITEM_REDCORE_INIT_FAILED'), 404);
}

// Bootstraps redCORE
RBootstrap::bootstrap();

// Register component prefix
JLoader::registerPrefix('RedITEMCategoryFields', __DIR__);

// Load redITEM Library
JLoader::import('reditemcategoryfields.library');

// Load language file from com_reditem
$lang = JFactory::getLanguage();
$lang->load('com_reditem', JPATH_ADMINISTRATOR, $lang->getTag(), true);

$controller = $input->getCmd('view', 'categoryfields');

// Set the controller page
if (!file_exists(JPATH_COMPONENT . '/controllers/' . $controller . '.php'))
{
	$controller = 'reditemcategoryfields';
	$input->set('view', 'categoryfields');
}

$controller	= JControllerLegacy::getInstance('reditemcategoryfields');
$controller->execute($input->getCmd('task', ''));
$controller->redirect();
