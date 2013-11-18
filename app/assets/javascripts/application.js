// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./templates
//= require_tree ./all
//= require_tree ./views



// $(function () {
// var $container = $('#pins');
// // initialize Masonry after all images have loaded
// $container.imagesLoaded( function() {
//   $container.masonry({
//     itemSelector: '.box',
//     columnWidth : 240
//   });
// });
// });

var comment_template = _.template('<div id= comment<%= comment.id %>><p><strong><%= user.username %></strong>: <%= comment.content %> <button data-id=<%= comment.id %> data-method=commdelete>Delete</button></p></div>')

$(function() {
  console.log("attaching comment submit handler")
  $('#commentsubmit').click(function(event) {
    event.preventDefault();
    var $content = $('#comment_content')
    var $commtype = $('#comment_commentable_type')
    var $commid = $('#comment_commentable_id')
    var $boardid = $('#comment_board_id')
    var $userid = $('#comment_user_id')

    var params = { comment: {content: $content.val(), commentable_type: $commtype.val(), commentable_id: $commid.val(), board_id: $boardid.val(), user_id: $userid.val()}};
    console.log(params);
    $content.val("")

    $.post("/comments", params).done(function(data){
      console.log(data);
       var comment = comment_template(data)
      $('#allcomments').append(comment);
    })
  })

  $('#allcomments').on('click', 'button[data-method="commdelete"]', function(event) {
    console.log(this);
    var id = $(this).attr("data-id");
    console.log(id);
    $.ajax({
      url: "/comments/"+id,
      method: "DELETE"
    }).done(function(){
      var item_id = "#comment"+id;
      $(item_id).remove();
    });
  });
});


