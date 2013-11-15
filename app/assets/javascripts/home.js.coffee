# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#upload-profile").on "click", ->
    $("#upload-form").slideToggle "slow"

  $('#create_board').on "click", (event) ->
    event.preventDefault()

    title = $('#board_title').val()
    users = $('.board_users_email').val()
    if users == "" or title == ""
      alert "You have to input a title and a user to create a board!"
    else
      params = {board: {title: title, users: users}}

      $.post("/boards", params).done (response_data) ->
        console.log(response_data)
        # $('#user-boards').empty()
        html = JST["templates/boards"](response_data)
        $("#new-boards").prepend(html)
        $("#closeModal").click()


  $("#wrapper").on "click", "button[data-method='delete']", (event) ->
    id = $(this).attr("data-id")
    answer = confirm ("Are you sure you want to delete this board? This is final and cannot be undone.")
    if (answer)
      $.ajax({url:"/boards/"+ id, method: "DELETE"}).done (data) ->
        board_id = "#" + id
        $(board_id).remove()
