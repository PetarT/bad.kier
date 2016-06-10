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
$imagesAlt  = $displayData['alts'];
$reditemId  = $displayData['reditemId'];
$item       = $displayData['item'];

$index      = (int) $displayData['index'];
$divId      = 'colorbox_group_' . $reditemId . '_' . $index;

?>

<?php if (!empty($images)): ?>
<script type="text/javascript">
	(function($){
		$(document).ready(function () {


			function nWin() {
				var content = jQuery(this).attr('datahref');
				var w = window.open();
				var html = '<img src="'+content+'" />';
				$(w.document.body).html(html);
				setTimeout(function(){w.print()}, 500);
			}

			$('.<?php echo $divId; ?>').colorbox({
				rel:"<?php echo $divId; ?>",
				maxWidth: "90%",
				maxHeight: "90%",
				title: function () {
					var alt = $(this).find('img').attr('alt');
					var url = $(this).attr('href');

					var aobj = jQuery('<a/>',{
						class: "print",
						href: 'javascript:;',
						datahref: url,
						html: '<div class="titleBox">'+alt+'</div>'+'<span>Print</span>',
					});

					aobj.click(nWin);

					return aobj;
				} 
			});

		});
	})(jQuery);
</script>
<script type="text/javascript">
	(function($){
		$(document).ready(function() {
		  $("#reditem_gallery_<?php echo $tag->id ?>").rowGrid({itemSelector: ".item", minMargin: 10, maxMargin: 25, firstItemClass: "first-item", resize: true});
		});
	})(jQuery);
</script>
<?php endif; ?>

<div class="reditem_gallery reditem_gallery_<?php echo $tag->id; ?>" id="reditem_gallery_<?php echo $tag->id ?>">
	<?php if ($firstImage && !empty($images)) : ?>
		<?php
		list($width, $height, $type, $attr) = getimagesize($firstImage['original']);
		$diff = 350 / $height;
		$width = ceil($width * $diff);
		$thumb = ReditemHelperImage::getImageLink($item, 'customfield', JFile::getName($firstImage['original']), 'thumbnail', $width, 350, true);
		?>
	<div class="item">
		<a class="<?php echo $divId; ?>" href="<?php echo $firstImage['original'] ?>">
		<img src="<?php echo $thumb; ?>" alt="<?php echo (isset($firstImage['alt'])) ? $firstImage['alt'] : '' ;?>" width="<?php echo $width ?>" height="350" />
		</a>
	</div>
	<?php elseif ($firstImage): ?>
		<img src="<?php echo $firstImage['thumbnail']; ?>" alt="<?php echo (isset($firstImage['alt'])) ? $firstImage['alt'] : '' ;?>" />	
	<?php endif; ?>
	<?php if (!empty($images)) : ?>
		<?php foreach ($images as $key => $image) : ?>
		<div class="item">
			<?php
			list($width, $height, $type, $attr) = getimagesize($image);
			$diff = 350 / $height;
			$width = ceil($width * $diff);
			$thumb = ReditemHelperImage::getImageLink($item, 'customfield', JFile::getName($image), 'thumbnail', $width, 350, true);
			?>
			<a class="<?php echo $divId; ?>" href="<?php echo $image; ?>">
			<img src="<?php echo $thumb; ?>" alt="<?php echo (isset($imagesAlt[$key])) ? $imagesAlt[$key] : '' ;?>" width="<?php echo $width ?>" height="350" />
			</a>
		</div>
		<?php endforeach; ?>
	<?php endif; ?>
</div>
