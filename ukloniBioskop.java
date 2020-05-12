package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ukloniBioskop extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String idBioskopaStr = request.getParameter("idBioskopa");
        int idBioskopa = Integer.parseInt(idBioskopaStr);
        
        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = con.createStatement();
            
            String upitSale = "DELETE FROM sala WHERE idBioskopa = ?";
            
            PreparedStatement ps = con.prepareStatement(upitSale);
            ps.setInt(1, idBioskopa);
            
            try{
                ps.executeUpdate();
            }
            catch(SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("bioskopi.jsp").forward(request, response);
            }
            
            String upitBioskop = "DELETE FROM bioskop WHERE idBioskopa = ?";
            
            ps = con.prepareStatement(upitBioskop);
            ps.setInt(1, idBioskopa);
            
            try{
                ps.executeUpdate();
            }
            catch(SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("bioskopi.jsp").forward(request, response);
            }
            
            request.setAttribute("msg", "Obrisali ste bioskop i njegove sale");
            request.getRequestDispatcher("bioskopi.jsp").forward(request, response);
            
            ps.close();
            stmt.close();
            con.close();
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
