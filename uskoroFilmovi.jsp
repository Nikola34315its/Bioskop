<%-- 
    Document   : uskoroFilmovi
    Created on : Apr 30, 2020, 9:14:43 AM
    Author     : nikola
--%>

<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Film" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uskoro na repertoaru</title>
        <style>
            body{
                background: url("Slike/zavesa.jfif");
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .container{
                margin-top: 90px;
                margin-bottom: 20px;
            }

            #film{
                margin-top: 30px;
                padding: 30px;
                background: #1a1a1a;
            }

            #sredina{
                padding: 30px;
            }

            #naslov{
                color: white;
                margin-bottom: 20px;
            }

            h3{
                color: white;
            }

            p{
                color: white;
            }

            i{
                color: white;
            }

            img{
                height: 200px;
                width: 160px;
            }

            #dugme{
                margin: 5px;
            }

            #noviFilm{
                margin-left: 270px;
                margin-top: 10px;
                margin-bottom: 20px;
            }
            
            #trenutno{
                color: white;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row">

                <div class="col-xl-2"></div>
                <div id="sredina" class="col-xl-8 bg-secondary rounded">
                    <h1 id="naslov" align="center">Uskoro na repertoaru</h1>

                    <% if (korisnik == null) {
                        } else if (korisnik.getTipKorisnika().equals("Administrator")) {
                    %>
                    <a href="dodajFilm.jsp">
                        <button id="noviFilm" class="btn btn-lg btn-success">Dodaj novi film</button>
                    </a>
                    <% } %>
                    <div class="row" align="center">
                        <div class="col-md-2"></div>

                        <div class="col-md-3">
                            <form action="listaFilmova" method="post">
                                <button type="submit" id="trenutno" class="btn btn-md bg-dark">Trenutno na repertoaru</button>
                            </form>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <form action="uskoroFilmovi" method="post">
                                <button type="submit" class="btn btn-md">Uskoro na repertoaru</button>
                            </form>
                        </div>
                        <div class="col-md-2"></div>

                    </div>
                    
                    <br>
                    <br>
                    <i>Filmovi će biti na repertoaru od narednog meseca.</i>
                    <%
                        ArrayList<Film> uskoro = (ArrayList<Film>) request.getAttribute("uskoro");

                        for (Film f : uskoro) {
                    %>
                    <div id="film" class="okvir rounded">
                        <div class="row">

                            <div id="slika" class="col-md-4">
                                <img src="<%=f.getLinkSlike()%>">
                            </div>
                            <div id="opis" class="col-md-8">
                                <h3 id="naslov"><b>Naziv filma: <%=f.getNazivFilma()%></b></h3>
                                <p><b>Opis filma: </b><%=f.getOpis()%></p>
                                <p><b>Trajanje filma: </b><%=f.getTrajanje()%> minuta</p>
                                <p><b>Zanr: </b><%=f.getZanr()%></p>

                                <div class="row">
                                    <form action="prosledjivanjeFilma" method="post">
                                        <input type="hidden" name="sifra" value="<%=f.getIdFilma()%>">
                                        <button id="dugme" type="submit" class="btn btn-secondary">Detaljnije</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>

                </div>
                <div class="col-xl-2"></div>
            </div>
        </div>
    </body>
</html>
