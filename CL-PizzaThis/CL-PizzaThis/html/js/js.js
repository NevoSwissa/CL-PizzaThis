OpenMenu = function() {
  $('.mainmenu-container').css("display", "block");
  $('.mainmenu-container').animate({"top": "30vh"}, 350)
}

CloseMenu = function() {
  $('.mainmenu-container').css("display", "none");
}

window.addEventListener('message', function(event) {
  switch(event.data.action) {
    case "CloseMenu":
    CloseMenu();
    break;
  }
});

window.addEventListener('message', function(event) {
    switch(event.data.action) {
      case "OpenMenu":
      OpenMenu();
      break;
    }
});