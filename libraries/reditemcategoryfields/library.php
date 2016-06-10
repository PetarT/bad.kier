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

// Define redITEM Library Folder Path
define('JPATH_REDITEMCATEGORYFIELDS_LIBRARY', __DIR__);

// Bootstraps redCORE
RBootstrap::bootstrap();

// Register library prefix
RLoader::registerPrefix('ReditemCategoryFields', JPATH_REDITEMCATEGORYFIELDS_LIBRARY);
