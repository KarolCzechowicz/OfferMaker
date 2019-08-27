$(document).ready(function () {


    if($("#addText").text() != "") {
        $("#addInfo").style = 'visible';
    }

    $("#pdfDownloader").click(function () {

        //Due to html2canvas limitations to prepare canvas first scroll must be hidden and view set to top od page.
        window.scrollTo(0, 0);
        document.body.style.overflow = 'hidden';

        //Using "scale: 2" to boost quality of image
        html2canvas(document.getElementById("printDiv"), {scale: 2}).then(function (canvas) {
            var doc = new jsPDF('p', 'pt', 'a4');
            doc.internal.scaleFactor = 2;

            //custom jsPDF plugin to align image in center
            doc.imageAlign(canvas, 0, 0);
            var offerID = $("#offerID").text();
            doc.save(offerID + ".pdf");
            document.body.style.overflow = 'visible';
        });
    });
});
