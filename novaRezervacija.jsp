<%-- 
    Document   : novaRezervacija
    Created on : Apr 20, 2020, 9:36:42 PM
    Author     : nikola
--%>

<%@page import="java.sql.*" %>
<%@page import="binovi.Projekcija" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rezervacija</title>
        <style>
            body{
                background: url(Slike/zavesa.jfif);
                background-repeat: no-repeat;
            }

            .container{
                margin-top: 100px;
                color: white;
                margin-bottom: 30px;
            }

            #naslov{
                margin-top: 30px;
                margin-bottom: 30px;
            }

            #sredina{
                padding: 20px;
            }

            input{
                width: 5rem;
                border: 1px;
            }

            #dugme{
                margin-top: 30px;
                margin-bottom: 30px;
            }

            table{
                margin-top: 30px;
            }

            #ukupno{
                background: gray;
            }

            #sala{
                height: 300px;
                width: 450px;
            }

            #sedista{
                height: 30px;
                width: 300px;
            }
        </style>
    </head>
    <body class="bg-dark">

        <%@include file="navbar.jsp" %>
        <h2 id="poruka" align="center">
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
            %>
            <%= msg%>
            <%
                }

                Projekcija p = (Projekcija) request.getAttribute("rezervacija");
            %>
        </h2>

        <div class="container">
            <div class="row">
                <div class="col-xl-2"></div>

                <div class="col-xl-8 bg-dark rounded" id="sredina">
                    <h1 id="naslov" align="center">Rezervacija</h1>

                    <p align="center"><i>Molimo da još jednom proverite sve podatke u pregledu rezervacije pre završetka rezervacije. 
                            Kad ste proverili da je sve prema željenom odabiru, kliknite "Rezervišite karte".</i></p>
                    <br>
                    <p align=center><i>Svoje karte možete preuzeti sa blagajne bioskopa, tokom radnog vremena blagajne, a najkasnije do 30 minuta pre početka projekcije. </i></p>
                    <form action="dodajRezervaciju" method="post">
                        <table align="center">
                            <tr>
                                <td><b>Naziv filma: </b></td>
                                <td><%=p.getNazivFilma()%></td>
                                <td><input type="hidden" name="nazivF" value="<%=p.getNazivFilma()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv bioskopa: </b></td>
                                <td><%=p.getNazivBioskopa()%></td>
                                <td><input type="hidden" name="nazivB" value="<%=p.getNazivBioskopa()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Datum projekcije: </b></td>
                                <td><%=p.getDatumProjekcije()%></td>
                                <td><input type="hidden" name="datum" value="<%=p.getDatumProjekcije()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Vreme projekcije: </b></td>
                                <td><%=p.getVremeProjekcije()%></td>
                                <td><input type="hidden" name="vreme" value="<%=p.getVremeProjekcije()%>"></td>
                            </tr>
                            <tr>
                                <%--<td>Tehnologija filma> </td>--%>
                                <td><input type="hidden" name="tehnologija" value="<%=p.getTehnologija()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Cena jedne karte</b></td>
                                <td><%=p.getCena()%> dinara</td>
                                <td><input type="hidden" id="cena" name="cena" value="<%=p.getCena()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Izaberite broj karata: </b></td>
                                <td><select id="brKarata" name="brKarata" onfocusout="pozivFunkcija()">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td><b>Ukupna cena: </b></td>
                                <td><input id="ukupno" type="text" id="ukupno" readonly> dinara</td>
                            </tr>
                            <tr>
                                <td><b>Odaberite tip sedišta: </b></td>
                                <td><select name="tipSedista">
                                        <option value="obicna">Obična</option>
                                        <option value="ljubavna">Ljubavna</option>
                                        <option value="vip">VIP</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <%--<td><b>Sifra sale: </b></td>--%>
                                <td><input type="hidden" name="sifraSale" value="<%=p.getIdSale()%>"></td>
                            </tr>
                            <tr>
                                <%--<td><b>Sifra projekcije</b></td>--%>
                                <td><input type="hidden" name="sifraProjekcije" value="<%=p.getIdProjekcije()%>"</td>
                            </tr>
                            <tr>
                                <%--<td>Sifra korisnika: </td>--%>
                                <td><input type="hidden" name="sifraKorisnika" value="<%=korisnik.getIdKorisnika()%>"></td>
                            </tr>
                            <tr>
                                <%--td>Sifra filma</td>--%>
                                <td><input type="hidden" name="sifraFilma" value="<%=p.getIdFilma()%>"></td>
                            </tr>
                            <%Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                Statement stmt = con.createStatement();

                                String upit = "SELECT * FROM film WHERE idFilma = '" + p.getIdFilma() + "'";

                                ResultSet rs = stmt.executeQuery(upit);

                                if (rs.next()) {
                            %>
                            <tr>
                                <%--<td>Broj poena filma</td>--%>
                                <td><input type="hidden" id="brojPoena" name="brojPoena" value="<%=rs.getInt("brojPoena")%>"></td>
                            </tr>
                            <%}
                                rs.close();
                                stmt.close();
                                con.close();
                            %>
                            <tr>
                                <%--<td>Ukupno poena</td>--%>
                                <td><input type="hidden" name="ukupnoPoena" id="ukupnoPoena"></td>
                            </tr>
                            <tr>
                                <%--<td>Sifra kluba</td>--%>
                                <td><input type="hidden" name="idKluba" id="idKluba" value="<%=korisnik.getIdKluba()%>"</td>
                            </tr>
                            <tr>
                                <%--<td>Trenutno poena</td>--%>
                                <td><input type="hidden" name="poeniKorisnik" id="poeniKorisnik" value="<%=korisnik.getBrojPoena()%>"></td>
                            </tr>
                        </table>
                        <div align="center" id="slike">
                            <img align="center" id="sala" src="Slike/sala.jpg" alt="sala">
                            <img align="center" id="sedista" src="Slike/sedista.jpg" alt="sedista">
                        </div>

                        <div class="dugmence" align="center">
                            <button id="dugme" type="submit" class="btn btn-lg btn-success">Rezervišite karte</button>
                        </div>
                    </form>
                </div>

                <div class="col-xl-2"></div>
            </div>
        </div>

        <script>
            function pozivFunkcija() {
                racunajCenu();
                ukupnoPoena();
            }

            function ukupnaCena() {
                var brKarata = parseInt(document.getElementById('brKarata').value);
                var cena = parseInt(document.getElementById('cena').value);

                document.getElementById('ukupno').value = brKarata * cena;
            }

            function ukupnoPoena() {
                var brKarata = parseInt(document.getElementById('brKarata').value);
                var brojPoena = parseInt(document.getElementById('brojPoena').value);
                var poeniKorisnik = parseInt(document.getElementById('poeniKorisnik').value);

                document.getElementById('ukupnoPoena').value = poeniKorisnik + (brKarata * brojPoena);
            }

            function racunajCenu() {
                var idKluba = parseInt(document.getElementById('idKluba').value);
                var brKarata = parseInt(document.getElementById('brKarata').value);
                var cena = parseInt(document.getElementById('cena').value);

                if (idKluba === 1) {
                    document.getElementById('ukupno').value = ((brKarata * cena) * 85) / 100;
                } else if (idKluba === 2) {
                    document.getElementById('ukupno').value = ((brKarata * cena) * 88) / 100;
                } else {
                    document.getElementById('ukupno').value = brKarata * cena;
                }
            }
        </script>
    </body>
</html>
