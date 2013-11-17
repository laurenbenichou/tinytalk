jQuery(window).load(function() {

  "use strict";

  // Init Flex Slider
  jQuery('.widget-slider .flexslider').flexslider({
    animation: "slide",
    slideshow: "false",
    slideshowSpeed: 7000,
    animationSpeed: 600,
    easing: "swing",
    directionNav: false
  });

  // Check if Mobile or Tablet device
  function is_touch_device() {
    return !!('ontouchstart' in window)
    || !!('onmsgesturechange' in window);
  };

  // If touch device, disable transforms
  if (is_touch_device() && jQuery(window).width() < 800) {
    var bubu = {
      animationEngine: 'best-available',
      filter: '',
      sortBy: 'original-order',
      sortAscending: true,
      transformsEnabled: false,
      layoutMode: 'masonry'
    };
     } else {
       var bubu = {
         animationEngine: 'best-available',
         filter: '',
      sortBy: 'original-order',
      sortAscending: true,
      transformsEnabled: true,
      layoutMode: 'masonry',
      animationOptions: {
        queue: false,
        easing: 'linear',
        duration: 800
      }
    };
  }

  // Settings for the grid
    var $container = jQuery('#container'),
    // object that will keep track of options
    isotopeOptions = {},
    // defaults, used if not explicitly set in hash
    defaultOptions = bubu;

    var setupOptions = jQuery.extend( {}, defaultOptions, {
      itemSelector : '.isotope-post',
      masonry: {
        gutterWidth: 50,
        columnWidth: 1,
      }
  });

  $container.infinitescroll({
      navSelector  : '.isotope-loadmore',    // selector for the paged navigation
        nextSelector : '.isotope-loadmore a',  // selector for the NEXT link (to page 2)
      itemSelector : '.isotope-post',     // selector for all items you'll retrieve
      behavior: 'twitter',
      loading: {
          finishedMsg: '',
          img: ''
        }
    },
    // call Isotope as a callback
    function( newElements ) {

    var $newElems = jQuery(newElements);
      $newElems.css("opacity","0");
      $newElems.imagesLoaded(function(){
        $newElems.css("opacity","1");
        jQuery(".post").css("opacity","1");
        $container.isotope('appended', $newElems );
      });

    // Load More Callback scripts
    // =========================================

    jQuery(".isotope-loadmore a").html("Load More");

    // Slider

      jQuery('.widget-slider .flexslider').flexslider({
      animation: "slide",
      slideshow: "false",
      slideshowSpeed: 7000,
      animationSpeed: 600,
      easing: "swing",
      directionNav: false
    });

      // Video Player
    jQuery('div[data-video-id]').each(function(){

        var videoid = jQuery(this).attr('data-video-id');
        var videoposter = jQuery(this).attr('data-video-poster');
        var videourl = jQuery(this).attr('data-video-url');
        var videoheight = jQuery(this).attr('data-video-height');

      jQuery(this).jPlayer({
         ready: function () {
           jQuery(this).jPlayer("setMedia", {
              m4v: ""+videourl+"",
              poster: ""+videoposter+""
           });
         },
         play: function() { // To avoid both jPlayers playing together.
             jQuery(this).jPlayer("pauseOthers");
        },
         cssSelectorAncestor: "#jp_container_"+videoid,
         swfPath: "http://www.jplayer.org/latest/js/Jplayer.swf",
         supplied: "m4v",
         size: { width: "100%", height: ""+videoheight+""}

       });

    });

    // Audio Player
    jQuery('div[data-audio-id]').each(function(){

      var audioid = jQuery(this).attr('data-audio-id');
      var audiourl = jQuery(this).attr('data-audio-url');

         jQuery(this).jPlayer({
           ready: function () {
             jQuery(this).jPlayer("setMedia", {
               mp3: ""+audiourl+"",
             });
           },
           play: function() { // To avoid both jPlayers playing together.
             jQuery(this).jPlayer("pauseOthers");
        },
           cssSelectorAncestor: "#jp_container_"+audioid,
           swfPath: "http://www.jplayer.org/latest/js/Jplayer.swf",
           supplied: "mp3",
         });

    });

    });

  // set up Isotope

  setTimeout(function(){
    $container.isotope(setupOptions);
  }, 1);
  var $optionSets = jQuery('.category-filter').find('li'),
  isOptionLinkClicked = false;

  // switches selected class on buttons
  function changeSelectedLink( $elem ) {
    // remove selected class on previous item
    $elem.parents().find('.selected').removeClass('selected');
    // set selected class on new item
    $elem.addClass('selected');
  }

  $optionSets.find('a').click(function(){
    var $this = $(this);
    // don't proceed if already selected
    if ( $this.hasClass('selected') ) {
      return;
    }
    changeSelectedLink( $this );
    // get href attr, remove leading #
    var href = $this.attr('href').replace( /^#/, '' ),
    // convert href into object
    // i.e. 'filter=.inner-transition' -> { filter: '.inner-transition' }
    option = jQuery.deparam( href, true );
    // apply new option to previous
    jQuery.extend( isotopeOptions, option );
    // set hash, triggers hashchange on window
    $.bbq.pushState( isotopeOptions );
    isOptionLinkClicked = true;

    if (jQuery(window).width() <= 480) {
      jQuery('#nav-collapse').removeClass('in');
      jQuery('#nav-collapse').css('height','0');
    }
    // Reloads script on filter.;
        return false;
    });

    var hashChanged = false;
    jQuery(window).bind( 'hashchange', function( event ){
      // get options object from hash
      var hashOptions = window.location.hash ? jQuery.deparam.fragment( window.location.hash, true ) : {},
      // do not animate first call
      aniEngine = hashChanged ? 'best-available' : 'none',
      // apply defaults where no option was specified
      options = jQuery.extend( {}, defaultOptions, hashOptions, { animationEngine: aniEngine } );
      // apply options from hash
      $container.isotope( options );
      // save options
      isotopeOptions = hashOptions;

      // if option link was not clicked
        // then we'll need to update selected links
        if ( !isOptionLinkClicked ) {
          // iterate over options
          var hrefObj, hrefValue, $selectedLink;
          for ( var key in options ) {
            hrefObj = {};
            hrefObj[ key ] = options[ key ];
            // convert object into parameter string
            // i.e. { filter: '.inner-transition' } -> 'filter=.inner-transition'
            hrefValue = jQuery.param( hrefObj );
            // get matching link
            $selectedLink = $optionSets.find('a[href="#' + hrefValue + '"]');
            changeSelectedLink( $selectedLink );
        }
    }

    isOptionLinkClicked = false;
    hashChanged = true;
  })
    // trigger hashchange to capture any hash data on init
    .trigger('hashchange');

  jQuery('div[data-video-id]').each(function(){
      var videoid = jQuery(this).attr('data-video-id');
      var videoposter = jQuery(this).attr('data-video-poster');
      var videourl = jQuery(this).attr('data-video-url');
      var videoheight = jQuery(this).attr('data-video-height');

    jQuery(this).jPlayer({
       ready: function () {

           jQuery(this).jPlayer("setMedia", {
              m4v: ""+videourl+"",
              poster: ""+videoposter+""

           });
       },
       play: function() { // To avoid both jPlayers playing together.
           jQuery(this).jPlayer("pauseOthers");
      },
       cssSelectorAncestor: "#jp_container_"+videoid,
       swfPath: "http://www.jplayer.org/latest/js/Jplayer.swf",
       supplied: "m4v",
       size: { width: "100%", height: ""+videoheight+""}

     });

  });

  jQuery('div[data-audio-id]').each(function(){
    var audioid = jQuery(this).attr('data-audio-id');
    var audiourl = jQuery(this).attr('data-audio-url');

         jQuery(this).jPlayer({
           ready: function () {
             jQuery(this).jPlayer("setMedia", {
               mp3: ""+audiourl+"",
             });
           },
           play: function() { // To avoid both jPlayers playing together.
             jQuery(this).jPlayer("pauseOthers");
        },
           cssSelectorAncestor: "#jp_container_"+audioid,
           swfPath: "http://www.jplayer.org/latest/js/Jplayer.swf",
           supplied: "mp3",
         });
  });

  jQuery("[rel=alternate]").tooltip();

  jQuery(".fancybox").fancybox({
    helpers : {
      overlay : {
        locked : false
        }
        },
    padding: ['5px', '5px', '5px', '5px']
  });

  jQuery('.dropdown').click(function() {
      jQuery('.sub-menu', this).slideToggle(300);
    });

  jQuery(".dropdown").children("a").attr('href', "javascript:void(0)");

  jQuery().UItoTop({ easingType: 'easeOutQuart' });

  jQuery(".isotope-loadmore").click(function() {
    jQuery(".isotope-loadmore a").html("Loading...");
  });

  jQuery('.contact-submit').click(function() {

    "use strict";
    var name = jQuery("#name").val();
    var email = jQuery("#email").val();
    var message = jQuery("#message").val();

    var dataString = 'name='+ name + '&email=' + email + '&message=' + message;
    ;
    jQuery.ajax({
    type: "POST",
    url: "contact.php",
      data: dataString,
      success:  function (html) {
        if (html === "invalid_email ") {
          jQuery('.contact-alerts').empty();
          jQuery('.contact-alerts').append('<div id="email-error" class="alert alert-error">This email is invalid!</div>');
        } else if (html === "success ") {
            jQuery('.contact-alerts').empty();
            jQuery('.contact-alerts').append('<div id="email-success" class="alert alert-success">Your email has been sent!</div>');
        } else if (html === "error ") {
            jQuery('.contact-alerts').empty();
            jQuery('.contact-alerts').append('<div id="email-error" class="alert alert-error">Please fill out all the fields!</div>');
        }
      }
    });
  });

  function initialize_m() {

    var styles = [ { "stylers": [ { "visibility": "on" }, { "saturation": -100 }, { "gamma": 1 } ] },{ } ];

    var myLatlng = new google.maps.LatLng(41.385,2.169);
      var mapOptions = {
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        draggable: false,
        scrollwheel: false,
        center: myLatlng,
    };

    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

      map.setOptions({styles: styles});

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
    });

  }

  if($('#map_canvas').length > 0)
    initialize_m();

    jQuery("#container").css("opacity","1");

});