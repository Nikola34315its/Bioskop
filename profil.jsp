<%-- 
    Document   : profil
    Created on : Mar 15, 2020, 1:11:52 PM
    Author     : nikola
--%>
<%@page import="binovi.Korisnik" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profil</title>
        <style>
            .container{
                padding-top: 100px;
            }

            b{
                color: white;
            }

            .container, .row, .col-xl-8, h1{
                color: white;
            }

            p{
                color: grey;
            }

            #profilna{
                height: 300px;
                width: 230px;
                margin-bottom: 30px;
            }

            #karta{
                margin-top: 20px;
                padding-top: 20px;
                background: #1a1a1a;
            }

            #tip{
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>

        <%
            Korisnik k = (Korisnik) request.getAttribute("korisnik");
        %>
        <div class="container">

            <div class="row">
                <div class="col-xl-2"></div>

                <div class="col-xl-8 shadow rounded"  id="karta" align="center">
                    <h1>Korisnička karta</h1>
                    <br>
                    <div class="row shadow">
                        <div class="col-xl-4">
                            <%
                                if (k.getTipKorisnika().equals("Administrator")) {
                            %>
                            <img id="profilna" src="https://png.pngtree.com/png-vector/20190119/ourlarge/pngtree-cartoon-cartoon-business-business-man-business-man-png-image_476177.jpg" alt="slika">
                            <h4 id="tip" align="center">Administrator</h4>
                            <% }%>
                            <%
                                if (k.getTipKorisnika().equals("Korisnik")) {
                                    if (k.getPol().equals("muski")) {
                            %>
                            <img id="profilna" src="https://png.pngtree.com/png-clipart/20190120/ourlarge/pngtree-business-man-man-the-man-business-man-png-image_494842.jpg" alt="slika">
                            <h4 align="center">Korisnik</h4>
                            <% } else {%>
                            <img id="profilna" src="https://png.pngtree.com/element_origin_min_pic/17/07/10/5f92d0b6e0dc654868882cc64423a181.jpg" alt="slika">
                            <h4 align="center">Korisnik</h4>
                            <%
                                    }
                                }
                                if (k.getTipKorisnika().equals("Menadzer")) {
                            %>
                            <img id="profilna" src="https://png.pngtree.com/element_origin_min_pic/16/10/28/0811fed6da6eb55a34e65929b0a686ac.jpg" alt="slika">
                            <h4 id="tip" align="center">Menadžer</h4>
                            <% }%>
                        </div>
                        <div class="col-xl-8">

                            <table class="table">
                                <tr>
                                    <td><b>Ime</b></td>
                                    <td><p><%= k.getIme()%></p></td>
                                </tr>
                                <tr>
                                    <td><b>Prezime</b></td>
                                    <td><p><%= k.getPrezime()%></p></td>
                                </tr>
                                <tr>

                                    <td><b>Broj telefona</b></td>
                                    <td><p><%= k.getTelefon()%></p></td>
                                </tr>
                                <tr>
                                    <td><b>Email adresa</b></td>
                                    <td><p><%= k.getEmail()%></p></td>
                                </tr>
                                <tr>
                                    <td><b>Pol</b></td>
                                    <td><p><%= k.getPol()%></p></td>
                                </tr>

                                <% if (korisnik.getTipKorisnika().equals("Korisnik")) {%>
                                <tr>
                                    <td><b>Broj skupljenih poena</b></td>
                                    <td><p><%= k.getBrojPoena()%></p></td>
                                </tr>
                                <% } else {}%>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-xl-2"></div>
            </div>
        </div>
    </body>
</html>
