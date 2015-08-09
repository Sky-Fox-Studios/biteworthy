$.ratings = {
  init: function(){
    this.wireupListeners();
  },

  wireupListeners: function(){
    $('.rating-star').click(function() {
      var rating    = $(this).data('rating');
      var star_id   = $(this).data('star-id');
      var star_type = $(this).data('star-type');
      console.log("rating="+rating+" star_id="+star_id+" star_type="+star_type);
      $.ratings.create_rating(rating, star_id, star_type);
    });
  },

  create_rating: function(rating, star_id, star_type) {
    if(star_id != ""){
      $.ajax({
        url: "/create_user_rating",
        cache: false,
        dataType: "html",
        type: "GET",
        data: { rating: rating, star_id: star_id, star_type: star_type },
        success: function(new_rating_stars){
          var rating_stars_div = '#rating-stars-'+star_type.toLowerCase()+'-'+star_id;
          console.log("success, updating="+rating_stars_div.toString());
          $(rating_stars_div.toString()).html(new_rating_stars);
          $.ratings.wireupListeners();
        },
        error: function(error) {
          console.log("create ajax error: ");
          console.log(error);
        }
      });
    }
  }
}
