jQuery(document).ready(function($){
	

	//---------Slider homepage
	$("#owl-demo").owlCarousel({
	items: 1,
	navigation : true,
	autoplay: false,
	autoplayTimeout:4000,
	loop: false,
	});


	var MQL = 1170;

	//primary navigation slide-in effect

		var headerHeight = $('#header').height();
		$(window).on('scroll',
		{
			previousTop: 0
		},
		function () {
			var currentTop = $(window).scrollTop();
			//check if user is scrolling up
			if (currentTop < this.previousTop ) {
				//if scrolling up...
				if (currentTop > 0 && $('#header').hasClass('is-fixed')) {
					$('#header').addClass('is-visible');
				} else {
					$('#header').removeClass('is-visible is-fixed');
				}
			} else {
				//if scrolling down...
				$('#header').removeClass('is-visible');
				if( currentTop > headerHeight && !$('#header').hasClass('is-fixed')) $('#header').addClass('is-fixed');
			}
			this.previousTop = currentTop;
		});


	//open/close primary navigation
	$('.menu-toolbar').on('click', function(){



		//in firefox transitions break when parent overflow is changed, so we need to wait for the end of the trasition to give the body an overflow hidden
		if( $('#menu').hasClass('is-visible') ) {
			$('#menu').removeClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',function(){
				$('body').removeClass('overflow-hidden');
			});
		} else {
			$('#menu').addClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',function(){
				$('body').addClass('overflow-hidden');
			});
		}
		 $('.close').on('click',function() {
			if( $('#menu').hasClass('is-visible') ) {
				$('#menu').removeClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',function(){
					$('body').removeClass('overflow-hidden');
				});
			}
		});
	});

	//Click popup gallery
	$('#gallery1 .gallery-content a').on("click", function(){
		$('#gallery1 .gallery-image img').click();
	});

	$('#gallery2 .gallery-content a').on("click", function(){
		$('#gallery2 .gallery-image img').click();
	});

	$('#gallery3 .gallery-content a').on("click", function(){
		$('#gallery3 .gallery-image img').click();
	});

	$('.description-banner a').click(function(){
		/*console.log($(this.hash).offset().top);
		console.log($("#header").height());*/
		//console.log($(this.hash).offset());
		var top = $(this.hash).offset().top - $("#header").height();

	  $.scrollTo( top, 1300, { easing:'swing' });
	  return false;
	});

	if ($("body").hasClass("home")) {
		var delay = false;
		var top = $('.description-banner a').offset().top ;
		var tempTimer;

		$(window).scroll(function() {

			$(document).on('mousewheel DOMMouseScroll', function(event) {

				// event.preventDefault();
				if(delay) return;
				delay = true;
				tempTimer = setTimeout(function(){delay = false},1300);

				var wd = event.originalEvent.wheelDelta || -event.originalEvent.detail;
				var topos = $(window).scrollTop();
				var innerheight = $(window).innerHeight() - 100;

				if( topos < innerheight) {

					if(wd < 0) {
						// $('body').scrollTop( top, 1300, { easing:'swing' });
						$('html,body').animate({ scrollTop: top }, 1300);
					}
					else {
						// $('body').scrollTop( 0, 1300, { easing:'swing' });
						$('html,body').animate({ scrollTop: 0 }, 1300);
					}
					console.log(123);
				}else{
					delay = false;
					clearTimeout( tempTimer );
				}
			});

		});
	}


	$('.sub-category').find('.image').click(function(){
		window.location = jQuery(this).next().find('.title a').attr("href");
		return false;
	});

	$('.box-style').find('.image-wrapper .image').click(function(){
		window.location = jQuery(this).parent().next().find('a').attr("href");
		return false;
	});

	$('.box-badmagasinet').find('.image').click(function(){
		window.location = jQuery(this).next().find('a').attr("href");
		return false;
	});

	$('.gallery').find('.gallery-image').click(function(){
		window.location = jQuery(this).next().find('a').attr("href");
		return false;
	});

	$('.ct_box').each(function(index, el) {
		var ctbox = $(this);
		var title = $(this).find('.box-content').find('.title').text().trim();

		if ( title.length == 0 ) {
			ctbox.addClass('contact-empty');
		}
	});



	function owldots() {
		var heightBottom = $("#featured .description-banner").height() + 70;
		$('#featured .top-banner .owl-dots').css('bottom', heightBottom);
	}
	owldots();

	$(window).resize(function(event) {
		owldots();
	});
	

});

