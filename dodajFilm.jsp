<%-- 
    Document   : dodajFilm
    Created on : Apr 18, 2020, 1:24:54 PM
    Author     : nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj novi film</title>
        <style>

            .container{
                margin-top: 80px;
                margin-bottom: 30px;
                padding: 30px;
            }

            #naslov{
                color: white;
                margin-top: 20px;
            }

            #forma{
                margin-top: 0px;
            }

            b{
                color: white;
            }

            input{
                width: 22rem;
            }

            table{
                margin-top: 30px;
                margin-bottom: 20px;
            }

            #dugme{
                margin-bottom: 20px;
            }

            #poruka{
                margin-top: 50px;
                color: white;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        <h2 id="poruka" align="center"><%
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
                <div class="col-xl-2"></div>

                <div class="col-xl-8 bg-secondary rounded" id="sredina" align="center">
                    <h1 id="naslov">Unesite podatke o novom filmu</h1>
                    <form action="dodajFilm" method="post">
                        <table align="center">
                            <tr>
                                <td><b>Naziv filma: </b></td>
                                <td><input required type="text" name="naziv"></td>
                            </tr>
                            <tr>
                                <td><b>Opis filma: </b></td>
                                <td><textarea name="opis" rows="5" cols="47"></textarea></td>
                            </tr>
                            <tr>
                                <td><b>Broj poena: </b></td>
                                <td><input required type="text" name="brojPoena"></td>
                            </tr>
                            <tr>
                                <td><b>Link trejlera: </b></td>
                                <td><input required type="text" name="trejler" placeholder="samo link"></td>
                            </tr>
                            <tr>
                                <td><b>Trajanje filma: </b></td>
                                <td><input required type="text" name="trajanje" placeholder="u minutima"></td>
                            </tr>
                            <tr>
                                <td><b>Zanr filma: </b></td>
                                <td><input required type="text" name="zanr"></td>
                            </tr>
                            <tr>
                                <td><b>Link slike: </b></td>
                                <td><input required type="text" name="slika"></td>
                            </tr>
                        </table>
                        <button id="dugme" type="submit" class="btn btn-success btn-lg">Sačuvaj film</button>
                    </form>
                </div>

                <div class="col-xl-2"></div>
            </div>
        </div>
    </body>
</html>
