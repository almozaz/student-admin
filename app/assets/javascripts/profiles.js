


function changeRole(event){
  event.preventDefault();

  var changeButton = this;
  var userItem = $(this).parent();
  var roleState = $(userItem).parent();
  var profileId = $(userItem).data("id");

  profileAdmin = determineRole(profileId)
  debugger;
    $.ajax({
      type: "PATCH",
      url: "/api/profiles/"+profileId+".json",
      data: JSON.stringify({
        admin: true
      }),

      contentType: "application/json",
      dataType: "json"
    })
}

function determineRole(profileId){

  if ($(profileId).parent().prop("className") === "admin-list") {
    return false;
  } else {
    return true;
  }
}

$(document).ready(function() {
  $(".change-role").bind('click', changeRole);

});
