


function changeRole(event){
  event.preventDefault();

  var changeButton = this;
  var userItem = $(this).parent().parent();
  var profileId = $(userItem).data("id");
  var profileAdmin = determineRole(userItem)

    $.ajax({
      type: "PATCH",
      url: "/api/profiles/" + profileId + ".json",
      data: JSON.stringify({
        admin: profileAdmin
      }),

      contentType: "application/json",
      dataType: "json"
    })

    .done(function(data){
      $(userItem).remove();
      console.log(data);

      var listId = data.profile.id;
      var firstName = data.profile.first_name;
      var lastName = data.profile.last_name;
      var roleList = data.profile.admin;

      if (roleList)
          icon = '<a href="#" class="change-role"><span class="glyphicon glyphicon-arrow-down"></span></a>'
      else
          icon = '<a href="#" class="change-role"><span class="glyphicon glyphicon-arrow-up"></span></a>'

      var tableDataFirstName = $('<td></td>')
        .html(firstName);

      var tableDataLastName = $('<td></td>')
        .html(lastName);

      var tableButton = $('<td class="center"></td>')
        .html(icon);

      var tableRow = $('<tr></tr>')
        .attr('data-id', listId)
        .append(tableDataFirstName)
        .append(tableDataLastName)
        .append(tableButton);

      if(roleList === true) {
        $("#admin-list").append(tableRow);
      }
      else {
        $("#student-list").append(tableRow);
      }

      $(tableRow.find('a')).bind('click', changeRole);

    })
}

function determineRole(userItem){
  var currentRole = $(userItem).parent().parent().prop("id");

  if (currentRole == "admin-list") {
    return false;
  } else {
    return true;
  }
}

$(document).ready(function() {
  $(".change-role").bind('click', changeRole);

});
