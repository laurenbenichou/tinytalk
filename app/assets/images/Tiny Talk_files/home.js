(function() {
  $(document).ready(function() {
    var $container;
    $("#upload-profile").on("click", function() {
      return $("#upload-form").slideToggle("slow");
    });
    $container = $("#pins");
    $container.imagesLoaded(function() {
      return $container.masonry({
        itemSelector: ".box",
        columnWidth: 240
      });
    });
    $("#close1").on("click", function() {
      $("#board_title").val("");
      $(".board_users_username").val("");
      return $("#user-form").empty();
    });
    $('#closeModal1').on("click", function() {
      $("#board_title").val("");
      $(".board_users_username").val("");
      return $("#user-form").empty();
    });
    $("#close2").on("click", function() {
      return $("#modal-body2").empty();
    });
    $('#closeModal2').on("click", function() {
      return $("#modal-body2").empty();
    });
    $('#add-users').on("click", function() {
      var form;
      form = JST["templates/users"];
      return $("#user-form").append(form);
    });
    $("#wrapper-update").on("click", "div[id='add-users2']", function() {
      var form;
      form = JST["templates/users"];
      return $("#user-form2").append(form);
    });
    $('#create_board').on("click", function(event) {
      var params, title, users;
      event.preventDefault();
      title = $('#board_title').val();
      users = $('.board_users_username').map(function(index, input) {
        return $(input).val().toLowerCase();
      });
      if (users === "" || title === "") {
        return alert("You have to input a title and a user to create a board!");
      } else if (users === gon.current_user) {
        return alert("You can't use your own username");
      } else {
        params = {
          board: {
            title: title,
            users: users.toArray()
          }
        };
        return $.post("/boards", params).done(function(response_data) {
          var html;
          html = JST["templates/boards"](response_data);
          $("#new-boards").prepend(html);
          return $("#closeModal1").click();
        });
      }
    });
    $("#wrapper").on("click", "button[data-method='delete']", function(event) {
      var answer, id;
      id = $(this).attr("data-id");
      answer = confirm("Are you sure you want to delete this board? This is final and cannot be undone.");
      if (answer) {
        return $.ajax({
          url: "/boards/" + id,
          method: "DELETE"
        }).done(function(data) {
          var board_id;
          board_id = "#" + id;
          return $(board_id).remove();
        });
      }
    });
    $("#wrapper").on("click", "button[data-target='#myModal2']", function(event) {
      var id;
      id = $(this).attr("data-id");
      return $.getJSON("/boards/" + id).done(function(response_data) {
        var update_form;
        update_form = JST["templates/board_update"](response_data);
        return $("#modal-body2").append(update_form);
      });
    });
    $("#wrapper-update").on("click", "button[data-method='put']", function(event) {
      var id, params, title, users;
      event.preventDefault();
      id = $(this).attr("data-id");
      title = $('#board_title_update').val();
      users = $('.board_users_username').map(function(index, input) {
        return $(input).val().toLowerCase();
      });
      if (users === "" || title === "") {
        return alert("You have to input a title and a user to update a board!");
      } else if (users === gon.current_user) {
        return alert("You can't use your own username");
      } else {
        params = {
          board: {
            title: title,
            users: users.toArray()
          }
        };
        return $.ajax({
          url: "/boards/" + id,
          method: "PUT",
          data: params
        }).success(function(data) {
          var board_id, new_title;
          new_title = JST["templates/board_title"](data);
          board_id = "#" + "title_" + id;
          $(board_id).replaceWith(new_title);
          return $("#closeModal2").click();
        });
      }
    });
    return $("#wrapper-update").on("click", "input[class='user-remove']", function(event) {
      var answer, board_id, board_user_id, id, user_id;
      event.preventDefault();
      id = $(this).attr("data-id");
      board_id = $(".board_id").val();
      board_user_id = "." + "board_user_id_" + id;
      user_id = $(board_user_id).val();
      if (user_id === ("" + gon.current_user_id)) {
        answer = confirm("Are you sure you want to leave the board?");
      } else {
        answer = confirm("Are you sure you want to remove this user from the board?");
      }
      if (answer) {
        return $.ajax({
          url: "/boards/remove_user_from_board/" + board_id + "/" + user_id
        }).done(function() {
          user_id = "." + "user_on_board_" + user_id;
          return $(user_id).empty();
        });
      }
    });
  });

}).call(this);
