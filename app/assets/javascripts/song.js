$(document).ready(function(){

  // listens for a button click
  $('.like-btn').click(function(){
    var $btn = $(this);
    var songId = $btn.attr('song_id');

    // this function toggles the heart button and updates the text (called after ajax success)
    function updateLikes($btn, results){
      $btn.find('span').toggleClass('red-heart');
    }

    // post request to the rails controller
    $.ajax({
      type: 'POST',
      url:'/song' +songId+ '/favorite',
      success: function(results){
        updateLikes($btn, results);
      }
    });

  });

});