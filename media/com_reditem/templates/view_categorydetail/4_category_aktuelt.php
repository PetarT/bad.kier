{sub_category_start}
<div class="box-custom sub_id{sub_category_id}">
  <div class="col-md-9 col-sm-8 col-xs-12 image" style="background-image: url({sub_category_image_link});">

  </div>
  <div class="col-md-3 col-sm-4 col-xs-12 description">
    <h3 class="title">
      <a href="{sub_category_link}">{sub_category_title}</a>
    </h3>
    <div class="short-desc">
      <a href="{sub_category_link}">{sub_category_introtext}</a>
    </div>
    <a class="arrow" href="{sub_category_link}"><i class="fa  fa-chevron-right"></i></a>
  </div>
</div>
{sub_category_end}
{module Custom Banner Middle}

{items_loop_start}
<div class="box-badmagasinet">
  <div class="col-sm-7 col-xs-12 image" style="background-image: url({item_image_after_hero_areas_value});">
    
  </div>
  <div class="col-sm-5 col-xs-12 description">
    <div class="desc-text">
      <h3 class="title">
        {title_after_hero_areas_value}
      </h3>
      <span class="date">{item_description_after_hero_areas_value}</span>
    </div>
    <div class="desc-img">
      <a href="#">{item_content_after_hero_areas_value}</a>
    </div>
  </div>
</div>
{items_loop_end}