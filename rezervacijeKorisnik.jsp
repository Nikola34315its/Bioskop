<%-- 
    Document   : rezervacijeKorisnik
    Created on : Apr 19, 2020, 9:46:24 PM
    Author     : nikola
--%>

<%@page import="binovi.Rezervacija" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Moje rezervacije</title>
        <style>
            body{
                background: url(Slike/zavesa.jfif);
            }

            .container{
                color: white;
                margin-top: 60px;
                margin-bottom: 30px;
                padding: 10px;
            }

            #karta{
                background: #lalala;
                margin-left: 10px;
                margin-right: 10px;
            }

            #naslov{
                margin-top: 30px;
                margin-bottom: 30px;
            }

            #dugme{
                position: relative;
                bottom: 5px
            }
        </style>
    </head>
    <body class="bg-dark">

        <%@include file="navbar.jsp" %>
        <h2 id="poruka">
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

        <div class="container">
            <div class="row" align="center">
                <div class="col-xl-1"></div>


                <div class="col-xl-10 bg-dark rounded">
                    <h1 id="naslov">Moje rezervacije</h1>

                    <div class="row">

                        <%
                            for (Rezervacija r : rezervacije) {
                        %>

                        <div class="col-4">
                            <div id="karta" class="card-deck shadow mb-5 rounded bg-secondary" style="width: 15rem;">
                                <div class="card-body" align="center">
                                    <p class="card-text"><b>Naziv filma: <%=r.getNazivFilma()%></b></p>
                                    <p class="card-text">Naziv bioskopa: <%=r.getNazivBioskopa()%></p>
                                    <p class="card-text">Datum projekcije: <%=r.getDatumProjekcije()%></p>
                                    <p class="card-text">Vreme projekcije: <%=r.getVremeProjekcije()%></p>
                                    <p class="card-text">Tehnologija filma: <%=r.getTehnologija()%></p>
                                    <p class="card-text">Tip sedista: <%=r.getTipSedista()%> sedišta</p>
                                    <p class="card-text">Broj karata: <%=r.getBrojKarata()%></p>

                                    <form action="ukloniRezervaciju" method="post" id="dugme">
                                        <input type="hidden" name="sifra" value="<%=r.getIdRezervacije()%>">
                                        <input type="submit" class="btn btn-danger btn-md" value="Ukloni">
                                    </form>
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
