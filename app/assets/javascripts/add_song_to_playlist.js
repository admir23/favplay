$(document).on("click", ".open-AddSong", function () {
     var mySongId = $(this).data('id');
     $(".modal-body #songId").val( mySongId );
});