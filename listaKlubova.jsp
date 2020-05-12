<%-- 
    Document   : listaKlubova
    Created on : Apr 30, 2020, 6:26:48 PM
    Author     : nikola
--%>

<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Klub" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Klubovi</title>
        <style>
            body{
                background-image: url(Slike/zavesa.jfif);
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            #sredina{
                margin-top: 90px;
                margin-bottom: 20px;
                color: white;
            }

            #naslov{
                margin-top: 30px;
                margin-bottom: 30px;
            }

            #karta{
                margin-top: 40px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 50px;
                padding: 20px;
            }

            #izmeni{
                margin-right: 30px;
                margin-left: 160px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>

                <div class="col-xl-6 bg-secondary rounded" align="center" id="sredina">
                    <h1 id="naslov">Klubovi</h1>

                    <%
                        if (korisnik.getTipKorisnika().equals("Administrator")) {%>

                    <a href="dodajKlub.jsp">
                        <button class="btn btn-success btn-md">Dodaj novi klub</button>
                    </a>
                    <%}
                        ArrayList<Klub> klubovi = (ArrayList<Klub>) request.getAttribute("klubovi");

                        for (Klub k : klubovi) {
                    %>
                    <div class="bg-secondary bg-dark rounded" id="karta">
                        <h3><%=k.getNazivKluba()%></h3>
                        <br>
                        <p><b>Opis: </b> <%=k.getOpisPogodnosti()%></p>
                        <p><b>Popust na svaku kartu: </b><%=k.getPopust()%> %</p>

                        <%
                            if (korisnik.getTipKorisnika().equals("Korisnik")) {
                                if (k.getIdKluba() == korisnik.getIdKluba()) {%>
                        <button class="btn btn-md btn-warning">Već ste član</button>
                        <%} else {%>
                        <form action="uclaniSe" method="post">
                            <input type="hidden" name="sifraKorisnika" value="<%=korisnik.getIdKorisnika()%>">
                            <input type="hidden" name="sifraKluba" value="<%=k.getIdKluba()%>">
                            <input type="submit" value="Učlani se" class="btn btn-md btn-success">
                        </form>
                        <%}
                        } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                        %>
                        <div class="dugmici" align="center">
                            <div class="row">
                                <form action="proslediKlub" method="post">
                                    <input type="hidden" name="sifra" value="<%=k.getIdKluba()%>">
                                    <button id="izmeni" type="submit" class="btn btn-md btn-warning">Izmeni</button>
                                </form>
                                <form action="ukloniKlub" method="post">
                                    <input type="hidden" name="sifra" value="<%=k.getIdKluba()%>">
                                    <button id="ukloni" type="submit" class="btn btn-md btn-danger">Ukloni</button>
                                </form>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <% }%>
                </div>

                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
