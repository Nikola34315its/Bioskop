package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class uclaniSe extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String sifraKorisnika = request.getParameter("sifraKorisnika");
        String sifraKluba = request.getParameter("sifraKluba");
        int SifraKorisnika = Integer.parseInt(sifraKorisnika);
        int SifraKluba = Integer.parseInt(sifraKluba);

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);

            String upit = "UPDATE korisnik SET idKluba = ? WHERE idKorisnika = ?";
            
            PreparedStatement ps = con.prepareStatement(upit);
            ps.setInt(1, SifraKluba);
            ps.setInt(2, SifraKorisnika);
            
            try{
                ps.executeUpdate();
            }
            catch(SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("listaKlubova.jsp").forward(request, response);
            }
            
            request.setAttribute("msg", "Uspesno ste se učlanili u klub. Morate ponovo da se prijavite da bi se videla promena.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
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
