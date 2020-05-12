<%-- 
    Document   : prijava
    Created on : Feb 5, 2020, 11:48:08 AM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Prijava</title>
        <style>
            body{
                background-image: url(Slike/zavesa.jfif);
            }
            
            .container {
                color: white;
                margin-top: 150px;
            }

            table{
                margin-top: 30px;
                margin-bottom: 20px;
            }

            #sredina{
                margin-top: 130px;
            }
            
            #naslov{
                margin-top: 50px;
                margin-bottom: 50px;
            }
            
            #dugme{
                margin: 30px;
            }

            #poruka{
                margin-top: 50px;
                color: white;
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
            <% }%>
        </h2>

        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>

                <div id="sredina" class="col-xl-6 bg-secondary rounded" align="center">
                    <form action="logovanjeServlet">
                        <h2 id="naslov">Unesite Vaše podatke za prijavu</h2>
                        <table>
                            <tr>
                                <td><input required type="text" placeholder="Korisničko ime" name="korisnickoIme"/></td>
                            </tr>
                            <tr>
                                <td><input required type="password" placeholder="Lozinka" name="lozinka"/></td>
                            </tr>
                        </table>
                        <button id="dugme" type="submit" class="btn btn-success btn-lg">Prijavi se</button>
                    </form>
                </div>

                <div class="col-xl-3"></div>
            </div>
        </div>


    </body>
</html>
