
window.onload = getUrlVars();

function getUrlVars() {
    var reg = "\.+[/][?]$";
    var url = window.location.href;
    if (url.match(reg)) {
      var message = document.getElementById("msg")
        message.innerHTML = "Zły login lub hasło";
        message.style.visibility = "visible";

        setTimeout(function(){
            message.innerHTML = '';
            message.style.visibility = "hidden";
        }, 4000);
    }
}

