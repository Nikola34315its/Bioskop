<%-- 
    Document   : bioskopi
    Created on : Apr 13, 2020, 4:47:27 PM
    Author     : nikola
--%>


<%@page import="binovi.Bioskop" %>
<%@page import="binovi.Korisnik" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bioskopi</title>
        <style>
            .row{
                padding-top: 30px;
                width: 100%;
                margin-top: 50px;
            }

            .row, .col-xl-8, #naslov{
                color: white;
            }

            #dugme{
                margin-left: 43px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
        <%= msg%>
        <%
            }
        %>
        <div class="row">
            <div class="col-xl-2"></div>


            <div class="col-xl-8" align="center">
                <h1 id="naslov">Podaci o bioskopima</h1>
                <%
                    ArrayList<Bioskop> bioskopi = (ArrayList<Bioskop>) request.getAttribute("bioskopi");

                    if (korisnik.getTipKorisnika().equals("Administrator")) {
                %>
                <div class="container">
                    <a href="dodajBioskop.jsp">
                        <input type="submit" class="btn btn-success" align="left" value="Dodaj novi bioskop" style="margin-top: 50px;">
                    </a>

                    <% } %>
                    <div class="row" align="center">
                        <%
                            for (Bioskop b : bioskopi) {
                        %>
                        <div class="col-4">
                            <div class="card-deck bg-secondary shadow mb-5 rounded" style="width: 18rem;">
                                <div class="card-body" align="center">
                                    <h5 class="card-title"><b><%= b.getNazivBioskopa()%></b></h5>
                                    <p class="card-text"><%= b.getIdBioskopa()%></p>
                                    <p class="card-text"><%= b.getGrad()%></p>
                                    <p class="card-text"><%= b.getAdresa()%></p>
                                    <p class="card-text">Broj sala: <b><%= b.getBrojSala()%></b></p>

                                    <form action="saleBioskopa" method="post">
                                        <input type="hidden" name="idBioskopa" value="<%= b.getIdBioskopa()%>">
                                        <input type="submit" name="sale" class="btn btn-sm btn-info" value="Sale">
                                    </form>

                                    <div class="row">
                                        <%
                                            if (korisnik.getTipKorisnika().equals("Administrator")) {
                                        %>
                                        <form action="prosledjivanjeBioskopa" method="post">
                                            <input type="hidden" name="idBioskopa" value="<%= b.getIdBioskopa()%>">
                                            <input id="dugme" type="submit" name="izmeni" class="btn btn-sm btn-warning" value="Izmeni">
                                        </form>
                                        <form action="ukloniBioskop" method="post">
                                            <input type="hidden" name="idBioskopa" value="<%= b.getIdBioskopa()%>">
                                            <input id="dugme" type="submit" name="ukloni" class="btn btn-sm btn-danger" value="Ukloni">
                                        </form>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
            <div class="col-xl-2"></div>
        </div>
    </body>
</html>
