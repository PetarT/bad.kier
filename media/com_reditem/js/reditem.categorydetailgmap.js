/**
 * Method for run filter item
 *
 * @return  void
 */
function reditemGmapFilterAjax()
{
	(function($){
		var form = document.getElementById("reditemCategoryDetail");
		form.task.value = 'categorydetailgmap.ajaxFilter';
		var url = 'index.php?' + $(form).serialize();

		reditemGmapLoadAjaxData(url);
	})(jQuery);
}

/**
 * Method for get data from AJAX and replace in div
 *
 * @param   string  url  URL of ajax
 *
 * @return  void
 */
function reditemGmapLoadAjaxData(url)
{
	(function($){
		$.ajax({
			url: url,
			dataType: "json",
			cache: false
		})
		.success(function (data){
			$.getScript(holderlib);
		})
		.done(function (data){
			// Process on pin icons in map
			if (typeof data.items != 'undefined')
			{
				var results = data.items;

				// Process on markers
				for (index in markers)
				{
					if (typeof results[index] == 'undefined')
					{
						// Remove this marker from map
						markers[index].setMap(null);
					}
					else
					{
						// Re-add this marker to map
						markers[index].setMap(map);
					}
				}
			}

			// Process on filter area if available
			if (typeof data.filterDistance != 'undefined')
			{
				var locationPoint = new google.maps.LatLng(data.filterDistance.location.lat,data.filterDistance.location.lng);
				reditemCategoryDetailGmapDrawCircle(locationPoint, data.filterDistance.distance * 1000)
			}
			else
			{
				reditemCategoryDetailGmapRemoveCircle();
			}

			// Related Categories filter
			if (typeof data.relatedCategories != 'undefined')
			{
				for (parentCat in data.relatedCategories)
				{
					var relatedCategories = data.relatedCategories[parentCat];
					var selectbox = $('#filter_related_' + parentCat);
					var selectAllText = selectbox.find("option[value='']").text();

					if ((selectbox.length > 0) && (!$.isEmptyObject(relatedCategories)))
					{
						selectbox.empty();

						selectbox.append("<option value=''>" + selectAllText + "</option>");

						for (relatedCat in relatedCategories)
						{
							var relatedCategory = relatedCategories[relatedCat];
							var attr = "";

							if (relatedCategory.filter == true)
							{
								attr = " selected='selected'";
							}

							selectbox.append("<option value='"+ relatedCategory.id +"'" + attr + ">" + relatedCategory.title + "</option>");
						}

						selectbox.select2();
					}
				}
			}
			else
			{
				if ($('select.reditemFilterRelated').length > 0)
				{
					$('select.reditemFilterRelated').each(function(index){
						var selectbox = $(this);
						var tmp = $('#' + selectbox.attr('id') + '_tmp');

						if (tmp.length > 0)
						{
							selectbox.empty();

							tmp.find('option').each(function(){
								selectbox.append(new Option($(this).text(), $(this).val()));
	 						});

	 						selectbox.select2();
						}
					});
				}
			}
		});
	})(jQuery);
}
