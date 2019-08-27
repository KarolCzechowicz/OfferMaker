window.onload = getUpdated();

function getUpdated() {

    var updated1 = document.getElementById("updated1");
    var updated2 = document.getElementById("updated2");

    if (updated2.innerHTML == "") {

        updated1.style.visibility = "hidden";
        updated2.style.visibility = "hidden";

    }
}