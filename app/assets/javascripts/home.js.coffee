# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#upload-profile").on "click", ->
    $("#upload-form").slideToggle "slow"

############ These clear all data from form after modal is closed ##############
  $("#close1").on "click", ->
    $("#board_title").val("")
    $(".board_users_username").val("")
    $("#user-form").empty()

  $('#closeModal1').on "click", ->
    $("#board_title").val("")
    $(".board_users_username").val("")
    $("#user-form").empty()

  $("#close2").on "click", ->
    $("#modal-body2").empty()

  $('#closeModal2').on "click", ->
    $("#modal-body2").empty()


############ These add user fields when creating or updating a board##############
  $('#add-users').on "click", ->
    form = JST["templates/users"]
    $("#user-form").append(form)

  $("#wrapper-update").on "click", "div[id='add-users2']", ->
    form = JST["templates/users"]
    $("#user-form2").append(form)

############ This creates a board ##############
  $('#create_board').on "click", (event) ->
    event.preventDefault()

    title = $('#board_title').val()
    users = $('.board_users_username').map (index, input) ->
      $(input).val().toLowerCase()

    if users == "" or title == ""
      alert "You have to input a title and a user to create a board!"
    else if users == gon.current_user
      alert "You can't use your own username"
    else
      params = {board: {title: title, users: users.toArray()}}

      $.post("/boards", params).done (response_data) ->
        html = JST["templates/boards"](response_data)
        $("#new-boards").prepend(html)
        $("#closeModal1").click()

############ This deletes a board ##############
  $("#wrapper").on "click", "button[data-method='delete']", (event) ->
    id = $(this).attr("data-id")
    answer = confirm ("Are you sure you want to delete this board? This is final and cannot be undone.")
    if (answer)
      $.ajax({url:"/boards/"+ id, method: "DELETE"}).done (data) ->
        board_id = "#" + id
        $(board_id).remove()

############ This appends the update form to modal ##############
  $("#wrapper").on "click", "button[data-target='#myModal2']", (event) ->
    id = $(this).attr("data-id")
    $.getJSON("/boards/#{id}").done (response_data) ->
      update_form = JST["templates/board_update"](response_data)
      $("#modal-body2").append(update_form)

####This is updating the board #####
  $("#wrapper-update").on "click", "button[data-method='put']", (event) ->
    event.preventDefault()
    id = $(this).attr("data-id")
    title = $('#board_title_update').val()
    users = $('.board_users_username').map (index, input) ->
      $(input).val().toLowerCase()

    if users == "" or title == ""
      alert "You have to input a title and a user to update a board!"
    else if users == gon.current_user
      alert "You can't use your own username"
    else
      params = {board: {title: title, users: users.toArray()}}
      $.ajax({url:"/boards/"+ id, method: "PUT", data: params}).success (data) ->
          new_title = JST["templates/board_title"](data)
          board_id = "#" + "title_" + id
          $(board_id).replaceWith(new_title)
          $("#closeModal2").click()

####This removes users from the board #####
  $("#wrapper-update").on "click", "input[class='user-remove']", (event) ->
    event.preventDefault()
    id = $(this).attr("data-id")
    board_id = $(".board_id").val()
    board_user_id = "." + "board_user_id_" + id
    user_id = $(board_user_id).val()


    if user_id == "#{gon.current_user_id}"
      answer = confirm ("Are you sure you want to leave the board?")
    else
      answer = confirm ("Are you sure you want to remove this user from the board?")
    if (answer)
      $.ajax({url: "/boards/remove_user_from_board/" + board_id + "/" + user_id}).done ->
        user_id = "." + "user_on_board_" + user_id
        $(user_id).empty()
