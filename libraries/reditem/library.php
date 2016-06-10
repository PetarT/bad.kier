<?php
/**
 * RedITEM Library file.
 * Including this file into your application will make redITEM available to use.
 *
 * @package    RedITEM.Library
 * @copyright  Copyright (C) 2013 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later, see LICENSE.
 */

defined('JPATH_PLATFORM') or die;

// JPATH redITEM defines
define('JPATH_REDITEM_LIBRARY', __DIR__);
define('JPATH_REDITEM_MEDIA', JPATH_ROOT . '/media/com_reditem/');
define('JPATH_REDITEM_TEMPLATES', JPATH_REDITEM_MEDIA . 'templates/');
define('JPATH_REDITEM_CATEGORY_IMAGES', JPATH_REDITEM_MEDIA . 'images/category/');
define('JPATH_REDITEM_CUSTOMFIELD_IMAGES', JPATH_REDITEM_MEDIA . 'images/customfield/');

// Bootstraps redCORE
RBootstrap::bootstrap();

// Register library prefix
RLoader::registerPrefix('Reditem', JPATH_REDITEM_LIBRARY);

// Make available the redITEM fields
JFormHelper::addFieldPath(JPATH_REDITEM_LIBRARY . '/form/fields');

// Make available the redITEM form rules
JFormHelper::addRulePath(JPATH_REDITEM_LIBRARY . '/form/rules');
