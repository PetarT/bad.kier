<?php
/**
 * @package     RedITEM
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

$fieldcode      = $displayData['fieldcode'];
$value          = $displayData['value'];
$defaultLatLong = $displayData['defaultlatlong'];
$attributes     = $displayData['attributes'];

// Add Google Maps script
ReditemHelperSystem::loadGoogleMapJavascriptLibrary();
?>

<style type="text/css">
	.gmap_field
	{
		display: block;
		position: relative;
		margin: 20px 0px 0px 0px;
		width: 500px;;
	}
	.gmap_field .gmap_field_canvas
	{
		width: 100%;
		height: 350px;
	}
	.gmap_field .gmap_field_panel
	{
		position: absolute;
		top: 10px;
		left: 50%;
		margin-left: -30%;
		z-index: 5;
		background-color: #fff;
		padding: 5px;
		border: 1px solid #999;
		border-radius: 5px;
	}
</style>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
	var geocoder_<?php echo $fieldcode; ?>;
	var map_<?php echo $fieldcode; ?>;
	var marker_<?php echo $fieldcode; ?>;

	function initialize_<?php echo $fieldcode; ?>()
	{
		geocoder_<?php echo $fieldcode; ?> = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(<?php echo $defaultLatLong; ?>);
		var mapOptions = {
			zoom: 8,
			center: latlng,
			panControl: false,
			zoomControl: false,
			mapTypeControl: false,
			scaleControl: false,
			streetViewControl: false,
			overviewMapControl: false,
			styles: [{"elementType":"geometry","stylers":[{"hue":"#ff4400"},{"saturation":-68},{"lightness":-4},{"gamma":0.72}]},{"featureType":"road","elementType":"labels.icon"},{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"hue":"#0077ff"},{"gamma":3.1}]},{"featureType":"water","stylers":[{"hue":"#00ccff"},{"gamma":0.44},{"saturation":-33}]},{"featureType":"poi.park","stylers":[{"hue":"#44ff00"},{"saturation":-23}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"hue":"#007fff"},{"gamma":0.77},{"saturation":65},{"lightness":99}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"gamma":0.11},{"weight":5.6},{"saturation":99},{"hue":"#0091ff"},{"lightness":-86}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"lightness":-48},{"hue":"#ff5e00"},{"gamma":1.2},{"saturation":-23}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"saturation":-64},{"hue":"#ff9100"},{"lightness":16},{"gamma":0.47},{"weight":2.7}]}]
		}
		map_<?php echo $fieldcode; ?> = new google.maps.Map(document.getElementById("gmap_field_canvas_<?php echo $fieldcode; ?>"), mapOptions);

		<?php if ($value) : ?>
		marker = new google.maps.Marker({
				map: map_<?php echo $fieldcode; ?>,
				position: latlng
		});
		<?php endif; ?>
	}

	function codeAddress_<?php echo $fieldcode; ?>()
	{
		var address = document.getElementById("gmap_field_address_<?php echo $fieldcode; ?>").value;
		geocoder_<?php echo $fieldcode; ?>.geocode( { "address": address}, function(results, status){
			if (status == google.maps.GeocoderStatus.OK) {
				map_<?php echo $fieldcode; ?>.setCenter(results[0].geometry.location);
				marker_<?php echo $fieldcode; ?> = new google.maps.Marker({
					map: map_<?php echo $fieldcode; ?>,
					position: results[0].geometry.location
				});
				document.getElementById("<?php echo $fieldcode; ?>").value = results[0].geometry.location.lat() + "," + results[0].geometry.location.lng();
			}
		});
	}

	// Add fix code for load Goole map on tab.
	jQuery(document).ready(function(){
		initialize_<?php echo $fieldcode; ?>();
		
		jQuery("#additional-link").on("shown", function(){
			initialize_<?php echo $fieldcode; ?>();
		});
	});
</script>

<div class="gmap_field_input">
	<?php $value = htmlspecialchars(html_entity_decode($value, ENT_QUOTES), ENT_QUOTES); ?>
	<input type="text" name="cform[googlemaps][<?php echo $fieldcode; ?>]" id="<?php echo $fieldcode; ?>" value="<?php echo $value; ?>" <?php echo $attributes; ?> />
</div>

<div class="gmap_field">
	<div class="gmap_field_panel input-append">
		<input id="gmap_field_address_<?php echo $fieldcode; ?>" type="text" class="input" value="" placeholder="Odense, Denmark" />
		<input type="button" class="btn"
			value="<?php echo JText::_('COM_REDITEM_CUSTOMFIELD_GOOGLEMAPS_GEOCODE'); ?>"
			onclick="codeAddress_<?php echo $fieldcode; ?>()" />
	</div>
	<div id="gmap_field_canvas_<?php echo $fieldcode; ?>" class="gmap_field_canvas"></div>
</div>
