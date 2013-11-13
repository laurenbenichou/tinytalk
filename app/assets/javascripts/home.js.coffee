# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#upload-profile").on "click", ->
    $("#upload-form").slideToggle "slow"

  $('input[name="commit"]').on "click", (event) ->
    event.preventDefault()

    $title = $('#board_title')
    console.log($title)
    params = {title: $title.val()}

    $.post("/boards", {board: params}).done (response_data) ->
      console.log(response_data)
      gon.board = response_data
      # $('#user-boards').empty()
      html = JST["templates/boards"](response_data)
      $("#new-boards").prepend(html)
      $("#closeModal").click()


