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

$tag        = $displayData['tag'];
$images     = $displayData['value'];
$firstImage = $displayData['firstImage'];
$reditemId  = $displayData['reditemId'];
$index      = (int) $displayData['index'];
$divId      = 'colorbox_group_categoryfield_' . $reditemId . '_' . $index;
?>

<script type="text/javascript">
	(function($){
		$(document).ready(function () {
			$('.<?php echo $divId; ?>').colorbox({
				rel:"<?php echo $divId; ?>",
				maxWidth: "90%",
				maxHeight: "90%"
			});
		});
	})(jQuery);
</script>

<div class="reditem_categoryfield_gallery reditem_categoryfield_gallery_<?php echo $tag->id; ?>">
	<?php if ($firstImage) : ?>
	<a class="<?php echo $divId; ?>" href="<?php echo $firstImage; ?>">
		<img src="<?php echo $firstImage; ?>" />
	</a>
	<?php endif; ?>
	<?php if ($images) : ?>
		<?php foreach ($images as $image) : ?>
		<a class="<?php echo $divId; ?> hidden" href="<?php echo $image; ?>"></a>
		<?php endforeach; ?>
	<?php endif; ?>
</div>
