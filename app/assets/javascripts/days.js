var testText = $('<p></p>')
  .html("render text")


function showDay(event) {
  var dayId = $(this).find("div")[0].id;
  $(".matches").append(showMatches(dayId));

}

function showMatches(dayId) {
  debugger;
}

function hideDay(event) {
  var dayData = this;
  testText.remove();

  $(".day").bind('click', showDay)
}

$(document).ready(function() {
  $(".day").bind('click', showDay);
});
