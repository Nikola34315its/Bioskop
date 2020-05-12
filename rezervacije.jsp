<%-- 
    Document   : rezervacije
    Created on : Apr 19, 2020, 6:51:51 PM
    Author     : nikola
--%>

<%@page import="binovi.Rezervacija" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezervacije</title>
        <style>
            .container{
                margin-top: 90px;
                color: white;
            }

            #karta{
                margin: 20px;
            }

            #naslov{
                margin-top: 30px;
                margin-bottom: 20px;
            }

            .col-4{
            }

            #dugme{
                margin-top: 20px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <div class="container">
            <%@include file="navbar.jsp" %>

            <h2 id="poruka" align="center">
                <%
                    String msg = (String) request.getAttribute("msg");
                    if (msg != null) {
                %>
                <%= msg%>
                <%
                    }

                    ArrayList<Rezervacija> rezervacije = (ArrayList<Rezervacija>) request.getAttribute("rezervacije");
                %>
            </h2>
            <div class="row">
                <div class="col-xl-1"></div>


                <div class="col-xl-10 rounded" align="center">
                    <h1 id="naslov">Spisak svih rezervacija</h1>


                    <div class="row">

                        <%
                            for (Rezervacija r : rezervacije) {
                        %>

                        <div class="col-4">
                            <div id="karta" class="card-deck bg-secondary shadow mb-5 rounded" style="width: 15rem;">
                                <div class="card-body" align="center">
                                    <h5 class="card-title">ID rezervacije: <%=r.getIdRezervacije()%></h5>
                                    <br>
                                    <p class="card-text">Naziv filma: <%=r.getNazivFilma()%></p>
                                    <p class="card-text">Naziv bioskopa: <%=r.getNazivBioskopa()%></p>
                                    <p class="card-text">Datum projekcije: <%=r.getDatumProjekcije()%></p>
                                    <p class="card-text">Vreme projekcije: <%=r.getVremeProjekcije()%></p>
                                    <p class="card-text">ID korisnika: <%=r.getIdKorisnika()%></p>
                                    <p class="card-text">ID filma: <%=r.getIdFilma()%></p>

                                    <%
                                        if (korisnik.getTipKorisnika().equals("Administrator")) {
                                    %>
                                    <form action="ukloniRezervaciju" method="post" id="dugme">
                                        <input type="hidden" name="sifra" value="<%=r.getIdRezervacije()%>">
                                        <input type="submit" class="btn btn-danger btn-md" value="Ukloni">
                                    </form>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                        <% }%>
                    </div>

                </div>



                <div class="col-xl-1"></div>
            </div>
        </div>
    </body>
</html>
