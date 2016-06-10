  {% if fields['image_banner_column_1'] %}
  <!-- box 3---->
  <div class="custom-field box-3">
  	<div class="col-sm-6 col-xs-12 image" style="background-image: url({image_banner_column_1_value});"></div>
  	<div class="col-sm-3 col-xs-12 image" style="background-image: url({image_banner_column_2_value});"> </div>
    <div class="col-sm-3 col-xs-12 image" style="background-image: url({image_banner_column_3_value});"> </div>
  </div>
  {% endif %}
  
  {% if fields['title_contact'] %}
  <!-- box4 -->
  <div class="custom-field box-4">
    <div class="col-sm-4 col-xs-12 col1">
      <div class="image" style="background-image: url({image_contact_value});"></div>
      <div class="box-content">
         {% if fields['title_contact'] %}
          <h3>{title_contact_value}</h3>
          {% endif %}
          <div class="description">
            {description_contact_value}
          </div>
      </div>
     
    </div>
  </div>
  {% endif %}

 {% if fields['image_gallery'] %}
  <div class="box-gallery">
      <div class="gallery"> 	
        <div class="gallery-image">{image_gallery_value}</div>
        <div class="gallery-content">{title_gallery_value}</div>
      </div>
  </div>
 {% endif %}
 {% if fields['image_banner_full_screen'] %}
	<!-- box5 -->
   <div class="custom-field box-5">
     <div class="image" style="background-image:url({image_banner_full_screen_value})">
  </div>
  {% endif %}

     <div class="hidden">{image_brand_value}, {link_brand_value}</div>