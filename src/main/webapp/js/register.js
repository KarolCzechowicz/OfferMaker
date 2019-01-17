
window.onload = getUrlVars();

function getUrlVars() {
    var reg = "\.+[/][?]$";
    var url = window.location.href;
    if (url.match(reg)) {
        var message = document.getElementById("msg2")
        message.innerHTML = "Podany login już istnieje";
        message.style.visibility = "visible";

        setTimeout(function(){
            message.innerHTML = '';
            message.style.visibility = "hidden";
        }, 4000);
    }
}