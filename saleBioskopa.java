package servleti;

import binovi.Sala;
import java.util.ArrayList;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class saleBioskopa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String bioskopID = request.getParameter("idBioskopa");
        int BioskopID = Integer.parseInt(bioskopID);
        ArrayList<Sala> listaSala = new ArrayList<Sala>();

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = con.createStatement();

            String upit = "SELECT * FROM sala WHERE idBioskopa = '" + BioskopID + "'";
            ResultSet rs = stmt.executeQuery(upit);

            while (rs.next()) {
                listaSala.add(new Sala(rs.getInt("idSale"), rs.getString("nazivBioskopa"), rs.getInt("brojSedista"), rs.getInt("idBioskopa")));
            }

            request.setAttribute("sale", listaSala);
            request.getRequestDispatcher("sale.jsp").forward(request, response);

            rs.close();
            stmt.close();
            con.close();
        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("bioskopi.jsp").forward(request, response);
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
