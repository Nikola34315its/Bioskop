package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajFilm extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nazivNovi = request.getParameter("naziv");
        String opisNovi = request.getParameter("opis");
        String brojPoena = request.getParameter("brojPoena");
        String trejlerNovi = request.getParameter("trejler");
        String trajanjeNovi = request.getParameter("trajanje");
        String zanrNovi = request.getParameter("zanr");
        String slikaNovi = request.getParameter("slika");
        String preporuka = "uskoro";

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        if (nazivNovi != null && nazivNovi.length() > 0
                && opisNovi != null && opisNovi.length() > 0
                && trejlerNovi != null && trejlerNovi.length() > 0
                && slikaNovi != null && slikaNovi.length() > 0
                && brojPoena != null && brojPoena.length() > 0
                && zanrNovi != null && zanrNovi.length() > 0
                && trajanjeNovi != null && trajanjeNovi.length() > 0) {

            try {
                int TrajanjeNovi = Integer.parseInt(trajanjeNovi);
                int BrojPoena = Integer.parseInt(brojPoena);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);

                String upit = "INSERT INTO film(nazivFilma, opis, preporuka, brojPoena, trejler, trajanje, zanr, linkSlike) VALUES (?,?,?,?,?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(upit);
                ps.setString(1, nazivNovi);
                ps.setString(2, opisNovi);
                ps.setString(3, preporuka);
                ps.setInt(4, BrojPoena);
                ps.setString(5, trejlerNovi);
                ps.setInt(6, TrajanjeNovi);
                ps.setString(7, zanrNovi);
                ps.setString(8, slikaNovi);

                try {
                    ps.executeUpdate();
                } catch (SQLException e) {
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("dodajFilm.jsp").forward(request, response);
                }

                request.setAttribute("msg", "Uspesno ste dodali novi film");
                request.getRequestDispatcher("dodajFilm.jsp").forward(request, response);

                ps.close();
                con.close();
            } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("dodajFilm.jsp").forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
