<%-- 
    Document   : registracija
    Created on : Feb 5, 2020, 11:48:00 AM
    Author     : nikol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Registracija</title>
        <style>
            body{
                background-image: url(Slike/zavesa.jfif);
            }
            
            .row{
                align-self: center;
            }

            table{
                padding: 10px;
                margin-top: 30px;
                margin-bottom: 20px;
            }

            .container {
                color: white;
                margin-top: 170px;
            }

            #naslov{
                margin-bottom: 30px;
                margin-top: 30px;
            }

            input{
                width: 15rem;
            }

            #dugme{
                margin-bottom: 30px;
                margin-left: 200px;
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

                <div class="col-xl-6 bg-secondary rounded" id="sredina">

                    <h1 id="naslov" align="center">Dobrodošli</h1>
                    <form action="registracijaServlet" method="post">
                        <h3 align="center">Unesite podatke za registraciju</h3>
                        <table align="center">
                            <tr>
                                <td align="left"><b>Unesite Vaše ime: </b></td>
                                <td width=""><input required type="text" minlength="3" name="ime"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite Vaše prezime: </b></td>
                                <td><input required type="text"  minlength="2" name="prezime"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite Vaš broj telefona: </b></td>
                                <td><input required type="text" placeholder="U formatu 064xxxxxx" minlength="7" name="telefon"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite Vašu email adresu: </b></td>
                                <td><input required type="text" placeholder="U formatu xxxxx@xxx.com" minlength="8" name="email"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite Vaš pol: </b></td>
                                <td><input required type="text" placeholder="muski ili zenski" minlength="5" name="pol"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite željeno korisničko ime: </b></td>
                                <td><input required type="text" name="korisnickoIme"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Unesite željenu lozinku: </b></td>
                                <td><input required type="password" placehodler="Minimum 6 karaktera." minlength="6" name="lozinka"></td>
                            </tr>
                            <tr>
                                <td align="left"><b>Potvrdite željenu lozinku: </b></td>
                                <td><input required type="password" placehodler="Mora se poklapati sa gornjom" minlength="6" name="potvrda"></td>
                            </tr>
                        </table>
                        <button id="dugme" align="center" type="submit" class="btn btn-success btn-lg">Sačuvaj</button>
                    </form>
                </div>

                <div class="col-xl-3"></div>
            </div>
        </div>
    </div>
</body>
</html>
