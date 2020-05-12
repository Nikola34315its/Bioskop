<%-- 
    Document   : dodajProjekciju
    Created on : Apr 29, 2020, 12:34:35 PM
    Author     : nikola
--%>

<%@page import="binovi.Film" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodaj projekciju</title>
        <style>
            .container{
                margin-top: 160px;
                color: white;
            }

            .col-xl-6{
                margin: 20px;
                padding: 20px;
            }

            #naslov{
                margin-top: 20px;
                margin-bottom: 30px;
            }

            .dugme{
                margin: 25px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>
                <div class="col-xl-6 bg-secondary rounded" align="center">
                    <h1 id="naslov">Unesite podatke o novoj projekciji</h1>

                    <h2 id="poruka" align="center"><%
                        String msg = (String) request.getAttribute("msg");
                        if (msg != null) {
                        %>
                        <%= msg%>
                        <%
                            }

                            Film f = (Film)request.getAttribute("film");
                        %>
                    </h2>
                    <form action="dodajProjekciju" method="post">
                        <table align="center">
                            <tr>
                                <td>Naziv filma: </td>
                                <td><input required type="text" name="nazivFilma" value="<%=f.getNazivFilma()%>"></td>
                            </tr>
                            <tr>
                                <td>Datum projekcije: (format GGGG-MM-DD) </td>
                                <td><input required type="text" name="datumProjekcije"></td>
                            </tr>
                            <tr>
                                <td>Vreme projekcije: (format SS:MM:ss) </td>
                                <td><input required type="text" name="vremeProjekcije"></td>
                            </tr>
                            <tr>
                                <td>Tehnologija: (2D ili 3D)</td>
                                <td><input required type="text" name="tehnologija"></td>
                            </tr>
                            <tr>
                                <td>Cena karte: </td>
                                <td><input required type="text" name="cena"></td>
                            </tr>
                            <tr>
                                <td>Naziv bioskopa: </td>
                                <td><input required type="text" name="nazivBioskopa"></td>
                            </tr>
                            <tr>
                                <td>Sifra sale: </td>
                                <td><input required type="text" name="idSale"></td>
                            </tr>
                            <tr>
                                <td>Sifra filma: </td>
                                <td><input required type="text" name="idFilma" value="<%=f.getIdFilma()%>"></td>
                            </tr>
                        </table>
                        <div class="dugme" align="center">
                            <button type="submit" class="btn btn-lg btn-success">Dodaj projekciju</button>
                        </div>
                    </form>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
