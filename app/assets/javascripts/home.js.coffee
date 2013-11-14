# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#upload-profile").on "click", ->
    $("#upload-form").slideToggle "slow"

  $('#create_board').on "click", (event) ->
    event.preventDefault()

    $title = $('#board_title')
    $users = $('.board_users_email')
    params = {board: {title: $title.val(), users: $users.val()}}

    $.post("/boards", params).done (response_data) ->
      console.log(response_data)
      gon.board = response_data
      # $('#user-boards').empty()
      html = JST["templates/boards"](response_data)
      $("#new-boards").prepend(html)
      $("#closeModal").click()

  $(".box").on "click", "button[data-method='delete']", (event) ->
    id = $(this).attr("data-id")
    $.ajax({url:"/boards/"+ id, method: "DELETE"}).done (data) ->
      board_id = "#" + id
      $(board_id).remove()
