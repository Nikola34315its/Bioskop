<%-- 
    Document   : izmenaFilma
    Created on : Apr 18, 2020, 8:05:30 PM
    Author     : nikola
--%>

<%@page import="binovi.Film" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izmena filma</title>
        <style>
            #sredina{
                margin-top: 120px;
            }

            #naslov{
                margin-top: 20px;
                color: white;
            }

            #dugme{
                margin-bottom: 30px;
                margin-top: 30px;
            }

            b{
                color: white;
            }

            table{
                margin-top: 40px;
            }

            input{
                width: 22rem;
            }

            #opis{
                rows: 5;
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

                Film f = (Film) request.getAttribute("film");
            %>
        </h2>

        <div class="container">
            <div class="row">

                <div class="col-xl-2"></div>

                <div class="col-xl-8 bg-secondary rounded" id="sredina">
                    <h1 id="naslov" align="center">Izmenite željene podatke o filmu</h1>

                    <form action="izmenaFilma" method="post">
                        <table align="center">
                            <tr>
                                <%--<td><b>Sifra filma</b></td>--%>
                                <td><input type="hidden" name="sifra" value="<%=f.getIdFilma()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv filma: </b></td>
                                <td><input type="text" name="naziv" value="<%=f.getNazivFilma()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Opis filma: </b></td>
                                <td><textarea name="opis" rows="4" cols="46"><%=f.getOpis()%></textarea></td>
                            </tr>
                            <tr>
                                <td><b>Preporuka filma: (uskoro, novi, najgledaniji, obican)</b></td>
                                <td><input type="text" name="preporuka" value="<%=f.getPreporuka()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Broj poena: </b></td>
                                <td><input type="text" name="brojPoena" value="<%=f.getBrojPoena()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Link trejlera: </b></td>
                                <td><input type="text" name="trejler" value="<%=f.getTrejler()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Link slike: </b></td>
                                <td><input type="text" name="slika" value="<%=f.getLinkSlike()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Trajanje filma: </b></td>
                                <td><input type="text" name="trajanje" value="<%=f.getTrajanje()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Zanr filma: </b></td>
                                <td><input type="text" name="zanr" value="<%=f.getZanr()%>"></td>
                            </tr>
                        </table>
                        <div class="dugmic" align="center">
                            <button id="dugme" type="submit" class="btn btn-lg btn-success">Sačuvaj</button>
                        </div>
                    </form>
                </div>

                <div class="col-xl-2"></div>
            </div>
        </div>
    </body>
</html>
