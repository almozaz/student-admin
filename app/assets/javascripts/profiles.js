


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
