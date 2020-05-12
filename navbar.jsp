<%-- 
    Document   : navbar
    Created on : Mar 11, 2020, 4:04:31 PM
    Author     : nikola
--%>

<%@page import="binovi.Korisnik" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filmovi</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
        <style>
            #logo{
                width: 40px;
                height: 40px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background: #1c1c1c">
            <div class="collapse navbar-collapse" id="navbarTogglerDemo">
                <ul class="navbar-nav mr-auto mt-lg-0">
                    <li class="nav-item">
                        <a href="index.jsp">
                            <img src="Slike/logo.png" id="logo" alt="logo">
                        </a>
                    </li>
                    <%
                        Korisnik korisnik = (Korisnik) request.getSession().getAttribute("k");

                        if (korisnik == null) {
                    %>
                    <li class="nav-item">
                        <a href="listaFilmova" class="btn btn-secondary btn-md ml-3">Svi filmovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="registracija.jsp" class="btn btn-secondary btn-md ml-3">Registracija</a>
                    </li>
                    <li class="nav-item">
                        <a href="prijava.jsp" class="btn btn-secondary btn-md ml-3">Prijava</a>
                    </li>
                    <%
                    } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                    %>
                    <li class="nav-item">
                        <a href="listaFilmova" class="btn btn-secondary btn-md ml-3">Svi filmovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaBioskopa" class="btn btn-secondary btn-md ml-3">Bioskopi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaKlubova" class="btn btn-secondary btn-md ml-3">Klubovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaRezervacija" class="btn btn-secondary btn-md ml-3">Rezervacije</a>
                    </li>
                    <li class="nav-item">
                        <form action="proslediProfil" method="post">
                            <input type="hidden" name="sifra" value="<%=korisnik.getIdKorisnika()%>">
                            <button type="submit" class="btn btn-secondary btn-md ml-3">Moj profil</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                    </li>
                    <%
                    } else if (korisnik.getTipKorisnika().equals("Menadzer")) {
                    %>
                    <li class="nav-item">
                        <a href="listaFilmova" class="btn btn-secondary btn-md ml-3">Svi filmovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaBioskopa" class="btn btn-secondary btn-md ml-3">Bioskopi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaKlubova" class="btn btn-secondary btn-md ml-3">Klubovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="listaRezervacija" class="btn btn-secondary btn-md ml-3">Rezervacije</a>
                    </li>
                    <li class="nav-item">
                        <form action="proslediProfil" method="post">
                            <input type="hidden" name="sifra" value="<%=korisnik.getIdKorisnika()%>">
                            <button type="submit" class="btn btn-secondary btn-md ml-3">Moj profil</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                    </li>
                    <% } else if (korisnik.getTipKorisnika().equals("Korisnik")) {%>
                    <li class="nav-item">
                        <a href="listaFilmova" class="btn btn-secondary btn-md ml-3">Svi filmovi</a>
                    </li>
                    <li class="nav-item">
                        <form action="rezervacijeKorisnik" method="post">
                            <input type="hidden" name="sifra" value="<%=korisnik.getIdKorisnika()%>">
                            <button type="submit" class="btn btn-secondary btn-md ml-3">Rezervacije</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form action="proslediProfil" method="post">
                            <input type="hidden" name="sifra" value="<%=korisnik.getIdKorisnika()%>">
                            <button type="submit" class="btn btn-secondary btn-md ml-3">Moj profil</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a href="listaKlubova" class="btn btn-secondary btn-md ml-3">Klubovi</a>
                    </li>
                    <li class="nav-item">
                        <a href="odjava" class="btn btn-danger btn-md ml-3">Odjavi se</a>
                    </li>
                    <% }%>
                </ul>
            </div>
        </nav>
    </body>
</html>