<%-- 
    Document   : Film
    Created on : Feb 5, 2020, 6:40:29 PM
    Author     : nikol
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Film" %>
<%@page import="binovi.Projekcija" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Film</title>
        <style>
            body{
                background: url(Slike/zavesa.jfif);
            }

            .container{
                margin-top: 90px;
                padding-bottom: 20px;
            }

            #slika{
                height: 450px;
                width: 320px;
                margin-left: 20px;
                margin-top: 20px;
            }

            #film{
                margin-top: 30px;
                margin-bottom: 20px;
            }

            #red{
                margin-bottom: 30px;
            }

            #naslov{
                margin-top: 20px;
                color: white;
            }

            #opis{
                color: white;
            }

            iframe{
                margin-bottom: 30px;
            }

            #tekst{
                color: white;
            }

            #dugmici{
                margin-bottom: 20px;
                margin-top: 20px;
            }

            #dugme{
                margin-right: 30px;
            }

            #rezervacijaBtn{
                margin-bottom: 40px;
            }

            #rezervacija{
                margin-top: 30px;
            }

            h4{
                color: red;
            }

            #sredina{
                padding-bottom: 20px;
            }

            #projekcija{
                width: 110px;
                height: 150px;
                padding: 10px;
                margin: 10px;
            }

            hr{
                background-color: white;
                color: white;
                height: 2px;
                width: 85%;
            }

            #linija{
                height: 1px;
            }

            #opis{
                width: 90%;
            }

            i{
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

                Film f = (Film) request.getAttribute("film");
            %>
        </h2>

        <div class="container">
            <div class="row" id="red">
                <div class="col-xl-12 bg-dark rounded" id="sredina">
                    <h1 id="naslov" align="center"><%= f.getNazivFilma()%></h1>

                    <div class="row" id="film">
                        <div class="col-xl-4">
                            <img id="slika" src="<%=f.getLinkSlike()%>" alt="slika filma">
                        </div>
                        <div class="col-xl-8" id="podaci">
                            <br>
                            <iframe width="500" height="280" src="<%=f.getTrejler()%>" frameborder="0" allowfullscreen></iframe>
                            <h6 id="opis"><b>Opis filma: </b><%=f.getOpis()%></h6>
                            <br>
                            <h6 id="tekst"><b>Žanr filma: </b><%=f.getZanr()%></h6>
                            <br>
                            <h6 id="tekst"><b>Trajanje: </b><%=f.getTrajanje()%> minuta</h6>
                            <br>
                            <hr id="linija" align="left">
                            <h6 id="naslov"><b>Projekcije:</b></h6>
                            <i>Kliknite na željeni datum i tip tehnologije da bi napravili rezervaciju</i>
                            <div class="row">
                                <%
                                    if (korisnik == null) {
                                %>
                                <hr id="linija" align="left">
                                <br>
                                <div id="poruka" align="center">
                                    <h4 id="poruka">Samo prijavljeni korisnici mogu napraviti rezervaciju karata!</h4>
                                </div>
                                <%
                                } else if (korisnik.getTipKorisnika().equals("Administrator")) {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = null;

                                    String upit = "SELECT * FROM projekcija WHERE idFilma = '" + f.getIdFilma() + "'";

                                    try {
                                        rs = stmt.executeQuery(upit);

                                        while (rs.next()) {
                                %>
                                <button type="submit" name="sifra" class="btn btn-secondary" value="<%=rs.getInt("idProjekcije")%>" id="projekcija">
                                    <h6 id="tekst"><%=rs.getString("tehnologija")%></h6>
                                    <h6 id="tekst"><%=rs.getString("datumProjekcije")%></h6>
                                    <h6 id="tekst"><%=rs.getString("vremeProjekcije")%></h6>
                                    <form action="ukloniProjekciju" method="post">
                                        <input type="hidden" name="sifra" value="<%=rs.getString("idProjekcije")%>">
                                        <input type="submit" value="Ukloni" class="btn btn-md btn-danger">
                                    </form>
                                </button>
                                <%}
                                    } catch (Exception e) {
                                        request.setAttribute("msg", e.getMessage());
                                        request.getRequestDispatcher("index.jsp").forward(request, response);
                                    }

                                    rs.close();
                                    stmt.close();
                                    con.close();
                                %>
                                <hr id="linija" align="left">
                                <br>
                                <div id="dugmici" align="center">
                                    <div class="row" align="center">
                                        <form action="novaProjekcija" method="post">
                                            <input type="hidden" name="sifra" value="<%=f.getIdFilma()%>">
                                            <input type="submit" id="dugme" class="btn btn-success" value="Dodaj projekciju">
                                        </form>
                                        <form action="proslediFilm" method="post">
                                            <input type="hidden" name="sifra" value="<%=f.getIdFilma()%>">
                                            <input type="submit" id="dugme" class="btn btn-warning" value="Izmeni film">
                                        </form>
                                        <form action="ukloniFilm" method="post">
                                            <input type="hidden" name="sifra" value="<%=f.getIdFilma()%>">
                                            <input type="submit" id="dugme" class="btn btn-danger" value="Ukloni film">
                                        </form>
                                    </div>
                                </div>
                                <% } else if (korisnik.getTipKorisnika().equals("Korisnik")) {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = null;

                                    String upit = "SELECT * FROM projekcija WHERE idFilma = '" + f.getIdFilma() + "'";

                                    try {
                                        rs = stmt.executeQuery(upit);

                                        while (rs.next()) {
                                %>
                                <form action="rezervacijaInfo" method="post">
                                    <button type="submit" name="sifra" class="btn btn-success" value="<%=rs.getInt("idProjekcije")%>" id="projekcija">
                                        <h6 id="tekst"><%=rs.getString("tehnologija")%></h6>
                                        <h6 id="tekst"><%=rs.getString("datumProjekcije")%></h6>
                                        <h6 id="tekst"><%=rs.getString("vremeProjekcije")%></h6>
                                    </button>
                                </form>
                                <%}
                                    } catch (Exception e) {
                                        request.setAttribute("msg", e.getMessage());
                                        request.getRequestDispatcher("index.jsp").forward(request, response);
                                    }

                                    rs.close();
                                    stmt.close();
                                    con.close();
                                %>
                                <hr id="linija" align="left">
                                <% } else if (korisnik.getTipKorisnika().equals("Menadzer"))   {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = null;

                                    String upit = "SELECT * FROM projekcija WHERE idFilma = '" + f.getIdFilma() + "'";

                                    try {
                                        rs = stmt.executeQuery(upit);

                                        while (rs.next()) {
                                %>
                                <button type="submit" name="sifra" class="btn btn-secondary" value="<%=rs.getInt("idProjekcije")%>" id="projekcija">
                                    <h6 id="tekst"><%=rs.getString("tehnologija")%></h6>
                                    <h6 id="tekst"><%=rs.getString("datumProjekcije")%></h6>
                                    <h6 id="tekst"><%=rs.getString("vremeProjekcije")%></h6>
                                </button>
                                <%}
                                    } catch (Exception e) {
                                        request.setAttribute("msg", e.getMessage());
                                        request.getRequestDispatcher("index.jsp").forward(request, response);
                                    }

                                    rs.close();
                                    stmt.close();
                                    con.close();
                                %>
                                <hr id="linija" align="left">
                                <br>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
