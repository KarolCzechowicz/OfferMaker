$(document).ready(function () {

    $("#pdfSend").click(function (e) {
        e.preventDefault();

        var addressValue = "send";

        //Due to html2canvas limitations to prepare canvas first scroll must be hidden and view set to top od page.
        window.scrollTo(0, 0);
        document.body.style.overflow = 'hidden';

        //Using "scale: 2" to boost quality of image
        html2canvas(document.getElementById("printDiv"), {scale: 2}).then(function (canvas) {
            var doc = new jsPDF('p', 'pt', 'a4');
            doc.internal.scaleFactor = 2;

            //custom jsPDF plugin to align image in center
            doc.imageAlign(canvas, 0, 0);
            var binary = doc.output('datauristring', {});
            var clientEmail = $("#clientEmail").text();
            //JSON
            $.ajax({
                url: addressValue,
                type: "POST",
                dataType: 'JSON',
                data: {eml: clientEmail, bin: binary},
                contentType: 'application/json',
                mimeType: 'application/json'
            });
            document.body.style.overflow = 'visible';
        });
    });
});
