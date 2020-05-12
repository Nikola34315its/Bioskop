<%-- 
    Document   : izmenaSala
    Created on : Apr 16, 2020, 4:18:21 PM
    Author     : nikola
--%>

<%@page import="binovi.Sala" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izmena sala</title>
        <style>
            .container{
                margin-top: 150px;
            }

            #naslov{
                margin-top: 30px;
                color: white;
            }

            table{
                margin-top: 30px;
            }

            #dugme{
                margin-bottom: 30px;
            }

            b{
                color: white;
                margin-right: 20px;
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

                Sala s = (Sala) request.getAttribute("sala");
            %>
        </h2>

        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>

                <div class="col-xl-6 bg-secondary rounded" align="center">
                    <h1 id="naslov">Unesite izmene za salu</h1>

                    <form action="izmenaSala" method="post">
                        <table>
                            <tr>
                                <%--<td>ID sale</td>--%>
                                <td><input type="hidden" name="idSale" value="<%=s.getIdSale()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv bioskopa</b></td>
                                <td><input required type="text" name="nazivBioskopa" value="<%=s.getNazivBioskopa()%>"></td>
                            </tr>
                            <tr>
                                <td><b>Broj sedista</b></td>
                                <td><input required type="text" name="brojSedista" value="<%=s.getBrojSedista()%>"></td>
                            </tr>
                            <tr>
                                <td><b>ID bioskopa</b></td>
                                <td><input required type="text" name="idBioskopa" value="<%=s.getIdBioskopa()%>"></td>
                            </tr>
                        </table>
                        <br>
                        <br>
                        <button type="submit" id="dugme" class="btn btn-lg btn-success">Sačuvaj izmene</button>
                    </form>
                </div>

                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
