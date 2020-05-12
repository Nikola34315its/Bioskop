<%-- 
    Document   : dodajSalu
    Created on : Apr 16, 2020, 1:25:39 PM
    Author     : nikola
--%>

<%@page import="binovi.Sala" %>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje nove sale</title>
        <style>
            #naslov{
                color: white;
                margin-top: 30px;
                margin-bottom: 20px;
            }

            b{
                color: white;
                margin-right: 20px;
            }

            table{
                margin-top: 40px;
                margin-bottom: 40px;
            }

            input{
                width: 14rem;
            }

            #dugme{
                margin-bottom: 30px;
            }

            .container{
                margin-top: 150px;
            }
            
            #poruka{
                margin-top: 50px;
                color: white;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>

        <h2 align="center" id="poruka">
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
            %>
            <%= msg%>
            <%
                }

                ArrayList<Sala> s = (ArrayList<Sala>) request.getAttribute("sala");

                HttpSession sesija = request.getSession();
            %>
        </h2>

        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>


                <div class="col-xl-6 bg-secondary rounded" align="center">
                    <h1 id="naslov">Unesite podatke o novoj sali </h1>

                    <form action="dodajSalu" method="post">
                        <table align="center">
                            <tr>
                                <td><b>Broj sedišta:</b></td>
                                <td><input required type="text" name="brojSedista"></td>
                            </tr>
                            <tr>
                                <td><b>Naziv bioskopa:</b></td>
                                <td><input required type="text" name="nazivBioskopa"></td>
                            </tr>
                            <tr>
                                <td><b>ID bioskopa:</b></td>
                                <td><input required type="text" name="idBioskopa" value="<%= sesija.getAttribute("idBioskopa")%>"></td>
                            </tr>
                        </table>
                        <button type="submit" class="btn btn-success btn-lg" id="dugme">Dodaj salu</button>
                    </form>
                </div>


                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
