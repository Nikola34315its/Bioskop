<%-- 
    Document   : dodajKlub
    Created on : Apr 30, 2020, 8:24:29 PM
    Author     : nikola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodavanje kluba</title>
        <style>
            .container{
                margin-top: 150px;
                color: white;
            }
            
            #sredina{
                padding: 30px;
            }
            
            #naslov{
                margin-top: 30px;
                margin-bottom: 30px;
            }
            
            #dugme{
                margin-top: 30px;
                margin-bottom: 30px;
            }
            
            input{
                width: 17rem;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@include file="navbar.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-xl-3"></div>
                <div class="col-xl-6 bg-secondary rounded" id="sredina" align="center">
                    <h1 id="naslov">Unesite podatke o novom klubu</h1>
                    <form action="dodajKlub" method="post">
                        <table>
                            <tr>
                                <td><b>Naziv kluba: </b></td>
                                <td><input required type="text" name="naziv"></td>
                            </tr>
                            <tr>
                                <td><b>Opis pogodnosti: </b></td>
                                <td><input required type="text" name="opis"></td>
                            </tr>
                            <tr>
                                <td><b>Popust: </b></td>
                                <td><input required type="text" name="popust"></td>
                            </tr>
                        </table>
                        <button id="dugme" type="submit" class="btn btn-lg btn-success">Sačuvajte klub</button>
                    </form>
                </div>
                <div class="col-xl-3"></div>
            </div>
        </div>
    </body>
</html>
