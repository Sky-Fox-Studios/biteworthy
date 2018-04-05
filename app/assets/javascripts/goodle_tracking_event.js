$(document).ready(function() {
  $('.listener-surround').click(function(){
    if($('.aw-listener').hasClass('fa fa-minus')) {
      ga('send', 'event', 'choose-drawer', 'open', $(this).data('name'));
    }else{
      ga('send', 'event', 'choose-drawer', 'close', $(this).data('name'));
    }
  });

  $('.more-button').click(function(){
    ga('send', 'event', 'more-button', 'click', $(this).data('normal-tag'));
  });

  $('.tabs-title > a').click(function(){
    ga('send', 'event', 'mp-mr-widget', 'click', $(this).html());
  });

  $('.forecast-button > a, .weather-city').click(function(){
    ga('send', 'event', 'weather', 'full-forecast', $(this).data('location'));
  });

  $('#main-dropdown-location').change(function() {
    var location = $(this).find("option:selected").text().trim();
    ga('send', 'event', 'fya', 'main-location', location);
  });

  $('#main-dropdown-activity').change(function() {
    var activity = $(this).find("option:selected").text().trim();
    ga('send', 'event', 'fya', 'main-activity', activity);
  });

  $('#secondary-activity-select').change(function() {
    var location = $('#main-dropdown-location option:selected').text().trim();
    var activity = $(this).find("option:selected").text().trim();
    ga('send', 'event', 'fya', 'secondary-activity', location + ':' + activity);
  });

  $('#secondary-location-select').change(function() {
    var activity = $('#main-dropdown-activity option:selected').text().trim();
    var location = $(this).find("option:selected").text().trim();
    ga('send', 'event', 'fya', 'secondary-location', activity + ':' + location);
  });
});
