// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require datatables
//= require foundation
//= require admin_item
//= require fontawesome-all
//= require food_items
//= require google_tracking_event
//= require ingredients
//= require ratings
//= require restaurant_menu_groups
//= require web-animations.min.js
//= require hammer.min.js
//= require muuri-0.5.4.js

$(function(){ $(document).foundation(); });
$(function(){
  // Foundation.global.namespace = ''
  $(document).foundation();
  $.food_form.init();
  $.ratings.init();
  setTimeout(function(){$('.alert-box').fadeOut();},11000);
});

jQuery(window).scroll(function() {
  var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();

  if (scrollBottom < 150) {
    $(".footer").slideUp('slow');
  }
  if (scrollBottom >= 150) {
    $(".footer").slideDown('slow');
  }
});
