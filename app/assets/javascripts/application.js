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
//= require underscore
//= require bootstrap
//= require_tree ./templates
//= require imagesloaded.pkgd.js
//= require masonry.pkgd.js
//= require bootstrap
//= require_tree .


$(function () {
var $container = $('#pins');
// initialize Masonry after all images have loaded
$container.imagesLoaded( function() {
  $container.masonry({
    itemSelector: '.box',
    columnWidth : 240
  });
});
});

var comment_template = _.template('<p><strong><%= user.username %></strong>: <%= comment.content %></p>')

$(function() {
  $('#commentsubmit').click(function(event) {
    event.preventDefault();
    var $content = $('#comment_content')
    var $commtype = $('#comment_commentable_type')
    var $commid = $('#comment_commentable_id')
    var $boardid = $('#comment_board_id')

    var params = { comment: {content: $content.val(), commentable_type: $commtype.val(), commentable_id: $commid.val(), board_id: $boardid.val()}};

    $content.val("")

    $.post("/comments", params).done(function(data){
       var comment = comment_template(data)
      $('#allcomments').append(comment);
    })
  })
})
// $(function() {
//   $('.box').on('click', 'input[type="checkbox"]', function(event){
//     var pinid = $(this).attr('pin-id');
//     var pintype = $(this).attr('pin-type');
//     var checked = this.checked;
//   });
// })


