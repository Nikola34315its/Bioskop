<%-- 
    Document   : dodajBioskop
    Created on : Apr 15, 2020, 1:26:24 PM
    Author     : nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje novog bioskopa</title>
        <style>
            .col-xl-6{
                margin-top: 150px;
                padding: 20px;
                background: bg-secondary;
            }
            
            input{
                width: 15rem;
                padding: 4px;
                
            }
            
            #naslov{
                padding-bottom: 30px;
                color: white;
            }
            
            b{
                color: white;
            }
            
            #dugme{
                margin-left: 220px;
                margin-top: 40px;
                margin-bottom: 20px;
            }
            
            td{
                padding-left: 15px;
            }

            #poruka{
                margin-top: 50px;
                color: white;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        
        <h2 align="center" id="poruka">
            <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
        <%= msg%>
        <%
            }
        %>
        </h2>
        
        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>
                <div class="col-xl-6 bg-secondary rounded">
                    <h1 id="naslov" align="center">Unesite podatke o novom bioskopu</h1>
                    <form action="dodajBioskop" method="post">
                        <table align="center">
                            <tr>
                                <td><b>Naziv bioskopa: </b></td>
                                <td><input required type="text" name="naziv"></td>
                            </tr><tr>
                                <td><b>Naziv grada: </b></td>
                                <td><input required type="text" name="grad"></td>
                            </tr><tr>
                                <td><b>Adresa bioskopa: </b></td>
                                <td><input required type="text" name="adresa"></td>
                            </tr><tr>
                                <td><b>Broj sala: </b></td>
                                <td><input required type="text" name="brojSala"></td>
                            </tr>
                        </table>
                        <button id="dugme" type="submit" class="btn btn-lg btn-success center">Dodaj</button>
                    </form>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
