<%-- 
    Document   : index
    Created on : Feb 5, 2020, 11:18:48 AM
    Author     : nikol
--%>

<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="binovi.Film" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Bioskop</title>
        <style>
            body{
                background-image: url(Slike/zavesa.jfif);
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .main, .col-xl-7, h1{
                color: #dbdbdb;
            }

            .main, .col-xl-7, .container, h3{
                margin-left: 50px;
            }

            .col-xl-7{
                background-color: #1c1c1c;
                margin-top: 50px;
                margin-bottom: 20px;
            }

            .col-sm-3{
                padding: 8px;
            }

            #film {
                height: 170px;
                width: 230px;
                padding: 10px;
                margin: 3px;
            }

            .row{
                width: 100%;
            }

            .okvir{
                width: 250px;
                height: 250px;
                background-color: gray;
            }

            .okvir h5 {
                color: white;
            }

            .levastrana{
                background-color: black;
                margin-left: 30px;
                margin-right: 30px;
                margin-top: 50px;
            }

            #dugme{
                color: #lalala;
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
            <%
                }

            %>
        </h2>
        <div class="main">
            <div class="row">

                <div class="col-xl-2">
                    <div class="levastrana">

                    </div>
                </div>

                <div class="col-xl-7 rounded" align="center">
                    <br>
                    <h1>Dobrodošli</h1>
                    <br><br>
                    <div class="container">
                        <h3 align="left">Najnoviji filmovi na repertoaru</h3>
                        <br>
                        <div class="row">
                            <%                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                Statement stmt = con.createStatement();

                                ResultSet rs = null;

                                String upit = "SELECT * FROM film WHERE preporuka = 'novi'";

                                try {
                                    rs = stmt.executeQuery(upit);

                                    while (rs.next()) {
                            %>
                            <div class="col-md-4">
                                <form action="prosledjivanjeFilma" method="post">
                                    <div class="okvir rounded">
                                        <img id="film" src="<%=rs.getString("linkSlike")%>"/>
                                        <h4><%=rs.getString("nazivFilma")%></h4>
                                        <input type="hidden" name="sifra" value="<%=rs.getInt("idFilma")%>">
                                        <input id="dugme" type="submit" class="btn btn-sm bg-secondary" value="Detaljnije">
                                    </div>
                                </form>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                    request.setAttribute("msg", e.getMessage());
                                    request.getRequestDispatcher("index.jsp").forward(request, response);
                                }

                                rs.close();
                                stmt.close();
                                con.close();
                            %>
                        </div>
                        <br>
                        <br>
                        <br>
                        <h3 align="left">Najgledaniji filmovi prethodne nedelje</h3>
                        <br>
                        <div class="row">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection kon = DriverManager.getConnection("jdbc:mysql://localhost:3306/probabioskopa", "root", "");
                                Statement st = kon.createStatement();

                                ResultSet res = null;

                                String upitPreporuceni = "SELECT * FROM film WHERE preporuka = 'najgledaniji'";

                                try {
                                    res = st.executeQuery(upitPreporuceni);

                                    while (res.next()) {
                            %>
                            <div class="col-md-4">
                                <form action="prosledjivanjeFilma" method="post">
                                    <div class="okvir rounded">
                                        <img id="film" src="<%=res.getString("linkSlike")%>"/>
                                        <h4><%=res.getString("nazivFilma")%></h4>
                                        <input type="hidden" name="sifra" value="<%=res.getInt("idFilma")%>">
                                        <input id="dugme" type="submit" class="btn btn-sm bg-secondary" value="Detaljnije">
                                    </div>
                                </form>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                    request.setAttribute("msg", e.getMessage());
                                    request.getRequestDispatcher("index.jsp").forward(request, response);
                                }

                                res.close();
                                st.close();
                                kon.close();
                            %>
                        </div>
                        <br>
                        <br>
                    </div>
                </div>

                <div class="col-xl-2">
                </div>
            </div>
        </div>
        <%
            String greska = (String) request.getAttribute("greska");
            if (greska != null) {
        %>
        <%= greska%>
        <%
            }

        %>
    </body>
</html>
