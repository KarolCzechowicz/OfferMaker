
var input = document.getElementById("img");
input.addEventListener( 'change', showFileName );

function showFileName(event) {

    var input = event.target;
    var fileName = input.files[0].name;
    document.getElementById("link").value=fileName;
}