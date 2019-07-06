$(document).ready(function() {
	
        var color = "steelblue-light"; // tealgreen, green, red, pink, purple, orange, navyblue, magenta, cream, blue, yellow
		var css_url = "css/colors/" + color + ".css";		
		$('head').append('<link rel="stylesheet" href="' + css_url + '" type="text/css" />');
	
	
     $(window).load(function(){
        $('.loader').fadeOut('slow');
     });

 	if ($(window).width() >= 980) {
	   		if ($(window).scrollTop() > 100){
	   			$('header').addClass('scroll');
	   		} else {
	   			$('header').removeClass('scroll');
	   		}
	   	}
	   	
		$(window).on("scroll", function(){
			var winHeight = $(window).height();
			var windowWidth = $(window).width();
			var windowScroll = $(window).scrollTop();
			
			if ($(window).width() >= 980) {
				if ($(window).scrollTop() > 100){
					$('header').addClass('scroll');
				} else {
					$('header').removeClass('scroll');
				}
			}
			
});



	$('.port a, .blog-news li a.blog-thumb').lightBox({
		imageLoading: 'images/lightbox/loading.gif',
		imageBtnClose: 'images/lightbox/close.gif',
		imageBtnPrev: 'images/lightbox/prev.gif',
		imageBtnNext: 'images/lightbox/next.gif'
	});	
	
	

  
  
  	$(window).resize(function () {
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        $('#mask').css({'width':maskWidth,'height':maskHeight});        
	}); 
  
  
      $('input#mail-message-btn').click(function(){
        $('#mail-message').fadeOut('slow');
		$('#mask, .window').fadeOut('slow');
    });
    $('input#submit-mail').click(function(){		
        var formParams = $('form#contact-form').serialize();
        $.ajax({
            url: 'contact.php',
            type: 'POST',
            traditional: true,
            data: formParams,
            success: function(data){
                var response = jQuery.parseJSON(data);
                $('#mail-failure').hide();
                $('#invalid-email').hide();
                $('#empty-field').hide();
                $('#mail-success').hide();      
                if(response.success){
                    $('#mail-message-header').toggleClass('mail-message-error', false);
                    $('#mail-message-header').toggleClass('mail-message-success', true);
                    $('#mail-message-header h3').text('ALRIGHT SPARKY!');					
                    $('#mail-success').show();
                }else{
                    $('#mail-message-header').toggleClass('mail-message-error', true);
                    $('#mail-message-header').toggleClass('mail-message-success', false);
                    $('#mail-message-header h3').text('AN ERROR HAS OCCURED');						
                    $('#mail-failure').show();
                    for(i=0; i<response.errors.length; i++){
                        if(response.errors[i].error == 'empty')                            
                            $('#empty-field').show();
                        else if(response.errors[i].error == 'invalid')
                            $('#invalid-email').show();
                    }
                }  
			    popUpMask();
                $('#mail-message').fadeIn('slow');
            }
        });
    });
	
	
		$(function() {	
		$('.roll').css('opacity','0');
		$('.roll').hover(function () {
				$(this).stop().animate({opacity: .7}, 'slow');
			},
			function () {
				$(this).stop().animate({opacity: 0}, 'slow');
			});
	});
	
		/*---------------------------------------------- 
			   T W I T T E R    F U N C T I O N
	------------------------------------------------*/	
	
	 jQuery(function($){
        $("#query").tweet({
          avatar_size: 64,
          count: 2,
          username: "simplement_e",
          loading_text: "searching twitter..."
        });
      });
	  
	  
	  	/*---------------------------------------------- 
				R E S P ON S I V E   N A V 
	------------------------------------------------*/
	$("<select />").appendTo(".nav");
	
	$("<option />", {
	   "selected": "selected",
	   "value"   : "",
	   "text"    : "Go to..."
	}).appendTo("nav select");

	$(".nav li A").click(function () {
	    if ($(this).attr("id") != "lnkAccesClient") {
	        $("#accesclients").slideUp();
	    }
	});
	
	$("#lnkAccesClient").click(function () {
        $("#accesclients").slideToggle();
	    return true;
	});

	// Populate dropdown with menu items
	$(".nav li").each(function() {
		
		var depth   = $(this).parents('ul').length - 1;
		
		var indent = '';
		if( depth > 0 ) { indent = ' - '; }
		if( depth > 1 ) { indent = ' - - '; }
		if( depth > 2 ) { indent = ' - - -'; }
		if( depth > 3 ) { indent = ' - - - -'; }

		
		 var el = $(this).children('a');
		 $("<option />", {
			 "value"   : el.attr("href"),
			 "text"    : (indent+el.text()),
			 "class"    : "scroll" ,
		 }).appendTo(".nav select");
	});
	
	$(".nav select").change(function () {
	    var full_url = $(this).val();
	    if (full_url=="#accesclients") {
	        $("#accesclients").slideDown();
	    }
	    else {
	        $("#accesclients").slideUp();
	    }
		var parts = full_url.split("#");
		var trgt = parts[1];
		var target_offset = jQuery("#"+trgt).offset();
		var target_top = target_offset.top;
		jQuery('html, body').animate({scrollTop:target_top}, 900);
	});
	
	
		/* Tab boxes */
	/*---------------------------------------------------------------------*/
	jQuery(".tabs_container .tab_content").hide();
	jQuery(".tabs_container ul.tabs").find("li:first").addClass("active").show();
	jQuery(".tabs_container").find(".tab_content:first").show();

	jQuery("ul.tabs li").click(function() {
		var tabs_container = jQuery(this).parent().parent();
		var tabs = tabs_container.children(".tabs");
		var tabs_contents = tabs_container.children(".tabs_contents");
		
		tabs.children("li").removeClass("active");
		jQuery(this).addClass("active");
		
		var clicked_li_id = tabs.children("li").index(this);
		var tab_content = tabs_contents.children("div").eq(clicked_li_id);
		
		tabs_contents.children(".tab_content").hide();
		jQuery(tab_content).fadeIn();
		return false;
	});	
	
		/*---------------------------------------------- 
				      T O G G L E 
	------------------------------------------------*/

	$(".toggle_title a").click(function() { 
		
		var status = $(this).find('span').html();
		if (status == '+') { $(this).find('span').html('-'); } else { $(this).find('span').html('+'); }
		
		$(this).toggleClass('active');
		$(this).parent().siblings('.toggle_inner').slideToggle(300);
		return(false);
	});
	
//scrollspy function used to navigate on the page with easing
$(function() {
  $('ul.nav a, .logo a, a.scroll').bind('click',function(event){
  var $anchor = $(this);

  $('[data-spy="scroll"]').each(function () {
    var $spy = $(this).scrollspy('refresh')
  });



  $('html, body').stop().animate({
    scrollTop: $($anchor.attr('href')).offset().top
  }, 1300,'easeInOutExpo');

  event.preventDefault();
});

});	

});

function popUpMask() {
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        $('#mask').css({'width':maskWidth,'height':maskHeight});   
        $('#mask').fadeTo("slow",0.7);  
} 
