


function changeRole(event){
  event.preventDefault();

  var changeButton = this;
  var userItem = $(this).parent();
  var roleState = $(userItem).parent();
  var profileId = $(userItem).data("id");

  profileAdmin = determineRole(userItem)

    $.ajax({
      type: "PATCH",
      url: "/api/profiles/"+profileId+".json",
      data: JSON.stringify({
        admin: profileAdmin
      }),

      contentType: "application/json",
      dataType: "json"
    })

    .done(function(data){
      console.log(data);

      var listId = data.profile.id;
      var firstName = data.profile.first_name;
      var lastName = data.profile.last_name;
      var roleList = data.profile.admin;

      var listItem = $('<li class="list-item"></li>')
        .attr('data-id', listId)
        .html(firstName + lastName + ' <a href="#" class="change-role">Change role</a>');

      if(roleList === true) {
        $("#admin-list").append(listItem);
      }
      else {
        $("#student-list").append(listItem);
      }

      $(userItem).remove();
      $(".change-role").bind('click', changeRole);

    })
}

function determineRole(userItem){
  var currentRole = $(userItem).parent().prop("className")

  if (currentRole == "admin-list") {
    return false;
  } else {
    return true;
  }
}

$(document).ready(function() {
  $(".change-role").bind('click', changeRole);

});
