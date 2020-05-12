package servleti;

import java.sql.*;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajSalu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nazivBioskopaNovi = request.getParameter("nazivBioskopa");
        String brojSedistaNovi = request.getParameter("brojSedista");
        String idBioskopaNovi = request.getParameter("idBioskopa");

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        if (brojSedistaNovi != null && brojSedistaNovi.length() > 0
                && nazivBioskopaNovi != null && nazivBioskopaNovi.length() > 0
                && idBioskopaNovi != null && idBioskopaNovi.length() > 0) {
            try {
                int BrojSedistaNovi = Integer.parseInt(brojSedistaNovi);
                int IDBioskopaNovi = Integer.parseInt(idBioskopaNovi);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);
                String upitNovi = "INSERT INTO sala(brojSedista, nazivBioskopa, idBioskopa) VALUES (?,?,?)";

                PreparedStatement ps = con.prepareStatement(upitNovi);
                ps.setInt(1, BrojSedistaNovi);
                ps.setString(2, nazivBioskopaNovi);
                ps.setInt(3, IDBioskopaNovi);

                try {
                    ps.executeUpdate();
                } catch (SQLException e) {
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                request.setAttribute("msg", "Uspesno ste dodali novu salu");
                request.getRequestDispatcher("dodajSalu.jsp").forward(request, response);

                ps.close();
                con.close();
            } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e) {
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
