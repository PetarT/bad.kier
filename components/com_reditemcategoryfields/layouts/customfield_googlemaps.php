<?php
/**
 * @package     RedITEM2
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

// Add Google Maps script
ReditemHelperTags::loadGoogleMapJavascriptLibrary();

$tag          = $displayData['tag'];
$value        = $displayData['value'];
$reditemId    = $displayData['reditemId'];
$reditemTitle = $displayData['reditemTitle'];
?>

<?php if (!empty($value)) : ?>
<script type="text/javascript">
	(function($){
		$(document).ready(function($){
			reditem_extra_category_googlemaps_init();
		});
	})(jQuery);
</script>

<div class="reditem_googlemap reditem_googlemap_<?php echo $reditemId; ?>">
	<div class="reditem_extra_category_googlemaps">
		<div id="reditem_extra_category_googlemaps_<?php echo $reditemId; ?>_canvas" class="reditem_extra_category_googlemaps_canvas"></div>
		<input type="hidden" id="map_extra_id" value="reditem_extra_category_googlemaps_<?php echo $reditemId; ?>_canvas" />
		<input type="hidden" id="map_extra_latlng" value="<?php echo $value; ?>" />
		<input type="hidden" id="map_extra_infor" value="<h3><?php echo $reditemTitle; ?></h3>" />
	</div>
</div>
<?php endif; ?>
