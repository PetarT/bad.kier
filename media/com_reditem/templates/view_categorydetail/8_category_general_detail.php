<div class="box-custom sub_id{category_id}">
  <div class="col-md-9 col-sm-8 col-xs-12 image" style="background-image: url({category_image_link});">

  </div>
  <div class="col-md-3 col-sm-4 col-xs-12 description">
    <h3 class="title">{category_title}</h3>
    <div class="short-desc">{category_introtext}</div>
  </div>
</div>

{% if fields.title_after_category_areas %}
  <div class="custom-field box-2">
    <div class="col-sm-6 col-xs-12 description">
      <h1 class="title">
        {category_extra_title_after_category_areas_value}
      </h1>
      <h2 class="short-description">{category_extra_description_after_category_areas_value}</h2>
      <p>{category_extra_content_after_category_areas_value}</p>
    </div>
    <div class="col-sm-6 col-xs-12 image" 
         style="background-image: url({category_extra_image_after_category_areas_value})">
        
    </div>
  </div>
{% endif %}

{% if fields.banner_three_column1 %}
  <!-- box 3---->
  <div class="custom-field box-3">
  	<div class="col-sm-6 col-xs-12 image" 
         style="background-image: url({category_extra_banner_three_column1_value});"></div>
  	<div class="col-sm-3 col-xs-12 image" 
         style="background-image: url({category_extra_banner_three_column2_value});"> </div>
    <div class="col-sm-3 col-xs-12 image" 
         style="background-image: url({category_extra_banner_three_column3_value});"> </div>
  </div>
{% endif %}

{% if fields.google_map %}
  <div class="box-map">
      <div class="col-md-8 col-xs-12 gogole-map">
        {category_extra_google_map_value}
      </div>
      <div class="col-md-4 col-xs-12 information-map">
        {category_extra_google_map_content_value}
    </div>
  </div>
{% endif %}

{items_loop_start}

    {if_cf|description_contact}
    <div class="col-sm-4 col-xs-12 contact ct_box">
      <div class="image" style="background-image: url({image_contact_value});"></div>
      <div class="box-content">
         
        <h3 class="title">{title_contact_value}</h3>
          <div class="description">
            {description_contact_value}
          </div>
      </div>
     
    </div>
 
	{if_cf_end}

	{if_cf|title_gallery}
	  <div class="box-gallery col-sm-4 col-xs-12 box-gallery{item_id}">
          <div class="gallery"> 	
            <div class="gallery-image" style="background-image: url({image_banner_full_screen_value})"></div>
            <div class="gallery-content">
              <h3 class="title">
                	<a href="{item_link}">{title_gallery_value}</a>
              </h3>
               <a class="arrow" href="{item_link}"><i class="fa fa-chevron-right"></i></a>
            </div>
          </div>
      </div>
	{if_cf_end}
 {items_loop_end}
 {module Module Contact}
	
{% if fields.image_banner_full_screen %}
   <div class="custom-field box-5">
     <div class="image" style="background-image:url({category_extra_image_banner_full_screen_value})">
  </div>
{% endif %}