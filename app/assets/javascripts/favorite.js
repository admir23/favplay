// $(document).ready(function(){

//   // listens for a button click
//   $('.unfav-btn ').click(function(){
//     var $btn = $(this);
//     var songId = $btn.attr('song_id');

//     // this function toggles the heart button and updates the text (called after ajax success)
//     function updateLikes($btn, results){
//       $btn.find('span').toggleClass('red-heart');
//       $btn.parent().find('.likes-message').html(results.message);
//     }

//     // post request to the rails controller
//     $.ajax({
//       type: 'DELETE',
//       url:'/song' +songId+ '/unlike',
//       success: function(results){
//         updateLikes($btn, results);
//       }
//     });

//   });

// });