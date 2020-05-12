<%-- 
    Document   : sale
    Created on : Apr 13, 2020, 4:47:05 PM
    Author     : nikola
--%>

<%@page import="java.util.ArrayList" %>
<%@page import="binovi.Sala" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale</title>
        <style>
            .row{
                margin-top: 100px;
            }

            #naslov{
                color: white;
                margin-bottom: 80px;
            }

            b{
                color: white;
            }

            p{
                color: white;
            }

            form{
                margin: 3px;
                padding: 3px;
            }

            h5{
                color: white;
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
            %>
        </h2>

        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>
                <div class="col-xl-6" id="sredina" align="center">
                    <h1 id="naslov">Sale odabranog bioskopa</h1>

                    <%
                        ArrayList<Sala> sale = (ArrayList<Sala>) request.getAttribute("sale");

                        if (korisnik.getTipKorisnika().equals("Administrator")) {
                    %>

                    <a href="dodajSalu.jsp">
                        <input type="submit" class="btn btn-success" value="Dodaj novu salu">
                    </a>
                    <% } %>
                    <div class="row" align="center">
                        <%
                            for (Sala s : sale) {
                        %>
                        <div class="col-4">
                            <div class="card-deck bg-secondary shadow mb-5 rounded" style="width: 10rem;">
                                <div class="card-body" align="center">
                                    <h5 class="card-title"><b>ID Sale: <%= s.getIdSale()%></b></h5>
                                    <p class="card-text">Naziv bioskopa: <%=s.getNazivBioskopa()%></p>
                                    <p class="card-text">Broj sedista: <%= s.getBrojSedista()%></p>
                                    <p class="card-text">ID Bioskopa: <%= s.getIdBioskopa()%></p>

                                    <%

                                        HttpSession sesija = request.getSession();
                                        sesija.setAttribute("idBioskopa", s.getIdBioskopa());

                                        if (korisnik.getTipKorisnika().equals("Administrator")) {
                                    %>
                                    <form action="prosledjivanjeSala" method="post">
                                        <input type="hidden" name="idSale" value="<%= s.getIdSale()%>">
                                        <button type="submit" class="btn btn-sm btn-warning">Izmeni</button>
                                    </form>
                                    <form action="ukloniSalu" method="post">
                                        <input type="hidden" name="idSale" value="<%=s.getIdSale()%>">
                                        <button type="submit" class="btn btn-sm btn-danger">Ukloni</button>
                                    </form>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </div>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
