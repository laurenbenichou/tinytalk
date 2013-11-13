# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#upload-profile").on "click", ->
    $("#upload-form").slideToggle "slow"

  board_template = _.template('<div id="<%= id %>">' + 'Title: <%= title %> <br>' + '<button data-id="<%= id  %>" data-method="delete">Delete</button></div>')

  $('input[name="commit"]').on "click", (event) ->
    event.preventDefault()

    $title = $('#board_title')
    console.log($title)
    params = {title: $title.val()}

    $.post("/boards", {board: params}).done (response_data) ->
      console.log(response_data)
      board_html = board_template(response_data)
      $("#user-boards").prepend(board_html)
      $("#closeModal").click()


