package servleti;

import java.sql.*;
import binovi.Projekcija;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajProjekciju extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nazivFilma = request.getParameter("nazivFilma");
        String datum = request.getParameter("datumProjekcije");
        String vreme = request.getParameter("vremeProjekcije");
        String tehnologija = request.getParameter("tehnologija");
        String cena = request.getParameter("cena");
        String nazivBioskopa = request.getParameter("nazivBioskopa");
        String idSale = request.getParameter("idSale");
        String idFilma = request.getParameter("idFilma");

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        if (nazivFilma != null && nazivFilma.length() > 0
                && datum != null && datum.length() > 0
                && vreme != null && vreme.length() > 0
                && tehnologija != null && tehnologija.length() > 0
                && cena != null && cena.length() > 0
                && nazivBioskopa != null && nazivBioskopa.length() > 0
                && idSale != null && idSale.length() > 0
                && idFilma != null && idFilma.length() > 0) {
            try{
                int Cena = Integer.parseInt(cena);
                int IdSale = Integer.parseInt(idSale);
                int IdFilma = Integer.parseInt(idFilma);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl,user,pass);
                
                String upit = "INSERT INTO projekcija(nazivFilma,datumProjekcije,vremeProjekcije,tehnologija,cena,nazivBioskopa,idSale,idFilma) VALUES (?,?,?,?,?,?,?,?)";
                
                PreparedStatement ps = con.prepareStatement(upit);
                
                ps.setString(1, nazivFilma);
                ps.setString(2, datum);
                ps.setString(3, vreme);
                ps.setString(4, tehnologija);
                ps.setInt(5, Cena);
                ps.setString(6, nazivBioskopa);
                ps.setInt(7, IdSale);
                ps.setInt(8, IdFilma);
                
                try{
                    ps.executeUpdate();
                }
                catch(SQLException e){
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("dodajProjekciju.jsp").forward(request, response);
                }
                
                request.setAttribute("msg", "Uspešno ste dodali projekciju");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
                ps.close();
                con.close();
            }
            catch(ClassNotFoundException | NumberFormatException | SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
        else{
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
