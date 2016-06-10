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
ReditemHelperSystem::loadGoogleMapJavascriptLibrary();

$tag          = $displayData['tag'];
$value        = $displayData['value'];
$reditemId    = $displayData['reditemId'];
$reditemTitle = $displayData['reditemTitle'];
?>

<?php if (!empty($value)) : ?>
<script type="text/javascript">
	(function($){
		$(document).ready(function($){
			// reditem_customfield_googlemaps_init();
				jQuery('.reditem_custom_googlemaps').each(function (index) {
		var mapid = jQuery(this).find('input[id="mapid"]').val();
		var markerLatLng = jQuery(this).find('input[id="maplatlng"]').val();
		var infor = jQuery(this).find('input[id="mapinfor"]').val();

		var markerLatLngArray = markerLatLng.split(',');
		var latlng = new google.maps.LatLng(markerLatLngArray[0], markerLatLngArray[1]);

		var mapOptions = {
			zoom: 8,
			center: latlng,
			panControl: false,
			zoomControl: true,
			mapTypeControl: false,
			scaleControl: false,
			streetViewControl: false,
			overviewMapControl: false,
			scrollwheel: false,
			styles: [
    {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#868686"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fbfbfb"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#868686"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#fefefe"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "administrative.locality",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#434341"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#6a6a63"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "saturation": "3"
            },
            {
                "color": "#ff0000"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fffefe"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#fcfcfc"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 19
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#aaaa9e"
            },
            {
                "lightness": 17
            }
        ]
    }
]
		};

		var map = new google.maps.Map(document.getElementById(mapid), mapOptions);
		var image = {
			    url: '../images/icon-map.png'
			  };

		var marker = new google.maps.Marker({
			map: map,
			position: latlng,
			icon: image
		});

		google.maps.event.addListener(marker, "click", function (e) {
			var infowindow = new google.maps.InfoWindow({
				content: infor
			});

			infowindow.open(map, this);
		});
	});
		});
	})(jQuery);
</script>

<div class="reditem_googlemap reditem_googlemap_<?php echo $reditemId; ?>">
    <div class="reditem_custom_googlemaps">
        <div id="reditem_customfield_googlemaps_<?php echo $reditemId; ?>_canvas" class="reditem_custom_googlemaps_canvas"></div>
        <input type="hidden" id="mapid" value="reditem_customfield_googlemaps_<?php echo $reditemId; ?>_canvas" />
        <input type="hidden" id="maplatlng" value="<?php echo $value; ?>" />
        <input type="hidden" id="mapinfor" value="<h3> <a href='https://www.google.dk/maps/place/Paludan-M%C3%BCllers+Vej+38,+8200+Aarhus/@56.171171,10.183637,17z/data=!4m18!1m15!4m14!1m6!1m2!1s0x464c3fdb41c2890b:0x8c0ec48d7ce1fdf6!2sPaludan-M%C3%BCllers+Vej+38!2m2!1d10.185831!2d56.171168!1m6!1m2!1s0x464c3fdb41c2890b:0x8c0ec48d7ce1fdf6!2sPaludan-M%C3%BCllers+Vej+38,+8200+Aarhus!2m2!1d10.185831!2d56.171168!3m1!1s0x464c3fdb41c2890b:0x8c0ec48d7ce1fdf6' target='_blank' style='color: #232427;'>Find vej - klik her</a></h3>" />
    </div>
</div>
<?php endif; ?>
