<?php
/**
 * @package     RedITEM2
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

$tag       = $displayData['tag'];
$value     = $displayData['value'];
$width     = $displayData['width'];
$height    = $displayData['height'];
$item      = $displayData['item'];
?>

<?php if (!empty($value)) : ?>
<div class="reditem_youtube reditem_youtube_<?php echo $tag->id; ?>">
	<a class="youtube"
		href="#reditem_youtube_modal_<?php echo $tag->id; ?>"
		data-toggle="modal"
		youtube="<?php echo $value; ?>"
		style="width:<?php echo $width; ?>px; height:<?php echo $height; ?>px;">
	</a>
	<div id="reditem_youtube_modal_<?php echo $tag->id; ?>" class="modal fade reditem_youtube_modal" tabindex="-1" role="dialog" aria-hidden="true" style="width: 640px; height: 390px">
		<div id="reditem_youtube_video_<?php echo $tag->id; ?>" class="reditem_youtube_video"></div>
	</div>
</div>
<?php endif; ?>
