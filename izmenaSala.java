package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class izmenaSala extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String idSaleStr = request.getParameter("idSale");
        String nazivBioskopa = request.getParameter("nazivBioskopa");
        String brojSedistaStr = request.getParameter("brojSedista");
        String idBioskopaStr = request.getParameter("idBioskopa");

        if (idSaleStr != null && idSaleStr.length() > 0
                && brojSedistaStr != null && brojSedistaStr.length() > 0
                && idBioskopaStr != null && idBioskopaStr.length() > 0) {
            String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
            String user = "root";
            String pass = "";
            
            try{
                int IDSale = Integer.parseInt(idSaleStr);
                int BrojSedista = Integer.parseInt(brojSedistaStr);
                int IDBioskopa = Integer.parseInt(idBioskopaStr);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);
                Statement stmt = con.createStatement();
                
                String upit = "UPDATE sala SET nazivBioskopa = ? ,brojSedista = ?, idBioskopa = ? WHERE idSale = ?";
                
                PreparedStatement ps = con.prepareStatement(upit);
                ps.setString(1, nazivBioskopa);
                ps.setInt(2, BrojSedista);
                ps.setInt(3, IDBioskopa);
                ps.setInt(4, IDSale);
                
                ps.executeUpdate();
                
                request.setAttribute("msg", "Uspesno ste izmenili salu");
                request.getRequestDispatcher("sale.jsp").forward(request, response);
            
                ps.close();
                stmt.close();
                con.close();
            }catch(IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e){
                request.setAttribute("greska", "Uspesno ste izmenili salu");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("msg", "Morate popuniti sva polja");
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
