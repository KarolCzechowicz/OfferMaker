<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Offer</title>
    <style>
        a {
            -moz-box-shadow: 0px 10px 14px -7px #276873;
            -webkit-box-shadow: 0px 10px 14px -7px #276873;
            box-shadow: 0px 10px 14px -7px #276873;
            background: linear-gradient(slategrey, darkslategray);
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
            border-radius: 8px;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            text-align: center;
            font-family: Arial;
            font-size: 20px;
            font-weight: bold;
            padding: 13px 32px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #3d768a;

        }

        a :hover {
            background: linear-gradient(darkgray, darkslategray);
        }

        a :active {
            position: relative;
            top: 1px;
        }

        .vie {
            background-image: url("/images/hand.jpeg");
            background-position: center;

        }

        #printDiv {
            width: 794px;
            height: 1123px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        #borderDiv {
            border-style: solid;
            border-width: 5px;
            border-color: black;
            background-color: white;
            margin-left: auto;
            margin-right: auto;
            height: 1112px;
            overflow: hidden;
        }

        table {
            margin-top: 12%;
            display: inline-block;
            text-align: center;
            width: 80%;
        }

        td {
            padding-top: 10px;
            padding-bottom: 10px;
            border-style: solid;
            border-color: black;
            border-width: medium;
            font-size: 20px;

        }
        th {
            background-color: black;
            border-style: solid;
            border-color: black;
            border-width: thin;
            padding-top: 10px;
            padding-bottom: 10px;
            color: white;
            font-size: 40px;
        }
    </style>
</head>
<body class="vie">
<div style="text-align: center">
    <p id="offerID" style="visibility: hidden">${offer.id}</p>
    <p id="clientEmail" style="visibility: hidden">${offer.customerEmail}</p>

    <a href="/offer/all">Powrót</a>

    <a id="pdfDownloader">Zapisz PDF</a>

    <a id="pdfSend">Wyślij</a>
</div>
<div id="printDiv">
    <div id="borderDiv">
        <div style="margin-right: 10%; margin-left: 10%; margin-top: 5%">
            <div style="float: left" >
                <h1>
                    Company Name
                </h1>
                <h2>
                    Company Adress
                </h2>
            </div>
            <div>
                <img src="" alt="companyLogo"  width="200" height="150"
                     style=" border-style: solid; border-color: black; float: right">
            </div>
        </div>
        <table id="printTable">
            <thead>
            <th colspan="2">
                Offer Details
            </th>
            </thead>
            <tr>
                <tbody>
                <td colspan="2" class="addTd"><img src="/images/${offer.car.imageLink}" alt="zdjęcie" width="200" height="150"></td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Samochód:</td>
                <td class="addTd">${offer.car.manufacturer.name} ${offer.car.carModel.name} ${offer.car.fuel.type}</td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Pojemność moc i rodzaj napędu:</td>
                <td class="addTd">${offer.car.engine}, ${offer.car.horsePower}, ${offer.car.driveType.type}</td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Skrzynia biegów, liczba miejsc, klimatyzacja:</td>
                <td class="addTd">Skrzynia biegów: ${offer.car.transmission.type}, Miejsca: ${offer.car.seat.quantity}, Klimatyzacja: ${offer.car.airCondition}</td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Od:</td>
                <td class="addTd">${offer.dateFrom}</td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Do:</td>
                <td class="addTd">${offer.dateTo}</td>
                </tbody>
            </tr>
            <tr>
                <tbody>
                <td class="addTd">Cena:</td>
                <td class="addTd">${offer.price}</td>
                </tbody>
            </tr>
            <tr id="addInfo" style="visibility: hidden">
                <tbody>
                <td class="addTd">Dodatkowe informacje:</td>
                <td class="addTd" id="addText">${offer.info}</td>
                </tbody>
            </tr>
        </table>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
<script src="/js/html2canvas.js" type="text/javascript"></script>
<script src="/js/jspdf.debug.js" type="text/javascript"></script>
<script src="/js/viewDownload.js" type="text/javascript"></script>
<script src="/js/viewSend.js" type="text/javascript"></script>
</body>
</html>