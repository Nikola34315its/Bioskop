<%-- 
    Document   : izmeniKlub
    Created on : Apr 30, 2020, 7:49:46 PM
    Author     : nikola
--%>

<%@page import="binovi.Klub" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izmena kluba</title>
        <style>
            .container{
                color: white;
                margin-top: 180px;
            }

            #sredina{
                padding: 30px;
            }

            #naslov{
                margin-bottom: 40px;
            }

            #dugme{
                margin-bottom: 20px;
                margin-top: 30px;
            }

            input{
                width: 15rem;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>
                <div id="sredina" class="col-xl-6 bg-secondary rounded" align="center">
                    <h1 id="naslov">Izmenite podatke kluba</h1>
                    <%
                        Klub k = (Klub) request.getAttribute("klub");
                    %>
                    <form action="izmeniKlub" method="post">
                        <table id="tabela">
                            <tr>
                                <%--<td>Sifra kluba</td>--%>
                                <td><input type="hidden" name="sifra" value="<%=k.getIdKluba()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv kluba: </b></td>
                                <td><input required type="text" name="naziv" value="<%=k.getNazivKluba()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Opis pogodnosti: </b></td>
                                <td><textarea required name="opis" rows="4" cols="31"><%=k.getOpisPogodnosti()%></textarea></td>
                            </tr>
                            <tr>
                                <td><b>Popust:</b></td>
                                <td><input required type="text" name="popust" value="<%=k.getPopust()%>"></td>
                            </tr>
                        </table>
                        <button type="submit" id="dugme" class="btn btn-lg btn-success">Sačuvaj promene</button> 
                    </form>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
