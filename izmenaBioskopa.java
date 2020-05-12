package servleti;

import java.sql.*;
import java.io.IOException;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class izmenaBioskopa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String idBioskopaStr = request.getParameter("idBioskopa");
        String nazivBioskopa = request.getParameter("nazivBioskopa");
        String grad = request.getParameter("grad");
        String adresa = request.getParameter("adresa");
        String brojSala = request.getParameter("brojSala");

        if (idBioskopaStr != null && idBioskopaStr.length() > 0
                && nazivBioskopa != null && nazivBioskopa.length() > 0
                && grad != null && grad.length() > 0
                && adresa != null && adresa.length() > 0
                && brojSala != null && brojSala.length() > 0) {

            String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
            String user = "root";
            String pass = "";

            try {
                int BioskopID = Integer.parseInt(idBioskopaStr);
                int BrojSala = Integer.parseInt(brojSala);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);
                Statement stmt = con.createStatement();

                String upit = "UPDATE bioskop SET nazivBioskopa = ?, grad = ?, adresa = ?, brojSala = ? WHERE idBioskopa = ?";

                PreparedStatement ps = con.prepareStatement(upit);
                ps.setString(1, nazivBioskopa);
                ps.setString(2, grad);
                ps.setString(3, adresa);
                ps.setInt(4, BrojSala);
                ps.setInt(5, BioskopID);

                ps.executeUpdate();

                request.setAttribute("msg", "Uspešno ste izmenili bioskop!");
                request.getRequestDispatcher("bioskopi.jsp").forward(request, response);

                ps.close();
                stmt.close();
                con.close();
            } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException | NullPointerException e) {
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja");
            request.getRequestDispatcher("izmenaBioskopa.jsp").forward(request, response);
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
