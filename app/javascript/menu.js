function menu (){
  const menu = document.getElementById("header_menu-icon");
  const pullDownMenu = document.getElementById("header_menu-lists");

  menu.addEventListener('click', function(){
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });

};

window.addEventListener('turbo:load', menu);
window.addEventListener("turbo:render", menu);