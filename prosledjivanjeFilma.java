package servleti;

import binovi.Film;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class prosledjivanjeFilma extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sifra = request.getParameter("sifra");
        int sifraFilma = Integer.parseInt(sifra);

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection kon = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = kon.createStatement();

            String upit = "SELECT * FROM film WHERE idFilma = '" + sifraFilma + "'";

            ResultSet rs = stmt.executeQuery(upit);

            if (rs.next()) {

                Film detaljiFilma = new Film(sifraFilma, rs.getString("nazivFilma"), rs.getString("opis"), rs.getString("preporuka"), rs.getInt("brojPoena"), rs.getString("trejler"), rs.getInt("trajanje"), rs.getString("zanr"), rs.getString("linkSlike"));

                request.setAttribute("film", detaljiFilma);
                request.getRequestDispatcher("film.jsp").forward(request, response);
            }

            rs.close();
            stmt.close();
            kon.close();
        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("listaFilmova.jsp").forward(request, response);
        }

        request.setAttribute("idFilma", sifraFilma);
        request.getRequestDispatcher("film.jsp").forward(request, response);
    }
}
