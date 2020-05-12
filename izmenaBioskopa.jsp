<%-- 
    Document   : izmenaBioskopa
    Created on : Apr 15, 2020, 5:58:50 PM
    Author     : nikola
--%>

<%@page import="binovi.Bioskop" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izmena bioskopa</title>
        <style>
            #poruka{
                color: white;
            }

            #naslov{
                color: white;
                margin-bottom: 50px;
            }

            .col-xl-6{
                margin-top: 150px;
                padding: 30px;
            }

            b{
                color: white;
                margin-right: 30px;
            }

            input{
                width: 15rem;
                margin-bottom: 25px;
            }

            button{
                margin-top: 20px;
                padding-top: 20px;
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

                Bioskop b = (Bioskop) request.getAttribute("bioskop");
            %>
        </h2>
        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>

                <div class="col-xl-6 bg-secondary rounded" align="center">
                    <h1 id="naslov">Promenite podatke bioskopa</h1>

                    <form action="izmenaBioskopa" method="post">
                        <table>
                            <tr>
                                <%--<td>ID bioskopa</td>--%>
                                <td><input type="hidden" name="idBioskopa" value="<%=b.getIdBioskopa()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv bioskopa</b></td>
                                <td><input required type="text" name="nazivBioskopa" value="<%=b.getNazivBioskopa()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Grad</b></td>
                                <td><input required type="text" name="grad" value="<%=b.getGrad()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Adresa</b></td>
                                <td><input required type="text" name="adresa" value="<%=b.getAdresa()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Broj sala</b></td>
                                <td><input required type="text" name="brojSala" value="<%=b.getBrojSala()%>"></td>
                            </tr>
                        </table>
                        <br>
                        <br>
                        <button type="submit" class="btn btn-lg btn-success">Sačuvaj izmene</button>
                    </form>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>