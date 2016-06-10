<?php
/**
 * @package     RedITEM2
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

RHelperAsset::load('jquery.colorbox.min.js', 'com_reditem');
RHelperAsset::load('colorbox.min.css', 'com_reditem');

JHtml::_('rholder.image', '100x100');

$tag   = $displayData['tag'];
$value = $displayData['value'];
$thumb = $displayData['thumb'];



$val = str_replace(JURI::base(), '', $value);

echo $value;

?>

