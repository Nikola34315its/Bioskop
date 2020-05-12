package servleti;

import binovi.Bioskop;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class prosledjivanjeBioskopa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String bioskop = request.getParameter("idBioskopa");
        int BioskopID = Integer.parseInt(bioskop);
        
        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = con.createStatement();
            
            String upit = "SELECT * FROM bioskop WHERE idBioskopa = '" + BioskopID +"'";
            
            ResultSet rs = stmt.executeQuery(upit);
            if(rs.next()){
                Bioskop izmenaBioskopa = new Bioskop(BioskopID, rs.getString("nazivBioskopa"), rs.getString("grad"), rs.getString("adresa"), rs.getInt("brojSala"));
                
                request.setAttribute("bioskop", izmenaBioskopa);
                request.getRequestDispatcher("izmenaBioskopa.jsp").forward(request, response);
            }
            
            stmt.close();
            con.close();
        }catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("izmenaBioskopa.jsp").forward(request, response);
        }
        
        request.setAttribute("idBioskopa", BioskopID);
        request.getRequestDispatcher("izmenaBioskopa.jsp").forward(request, response);
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
