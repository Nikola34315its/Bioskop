package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajBioskop extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nazivBioskopaNovi = request.getParameter("naziv");
        String gradNovi = request.getParameter("grad");
        String adresaNovi = request.getParameter("adresa");
        String brojSalaNovi = request.getParameter("brojSala");

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement stmt = con.createStatement();
            String upit = "SELECT nazivBioskopa, grad, adresa FROM bioskop";
            ResultSet rs = stmt.executeQuery(upit);

            while (rs.next()) {
                if (nazivBioskopaNovi.equals(rs.getString("nazivBioskopa")) && gradNovi.equals(rs.getString("grad")) && adresaNovi.equals(rs.getString("adresa"))) {
                    request.setAttribute("msg", "Bioskop sa tim podacima već postoji.");
                    request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
                }
            }
            stmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("msg", e.getMessage());
            request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
        }

        if (nazivBioskopaNovi != null && nazivBioskopaNovi.length() > 0
                && gradNovi != null && gradNovi.length() > 0
                && adresaNovi != null && adresaNovi.length() > 0
                && brojSalaNovi != null && brojSalaNovi.length() > 0) {
            try{
                int brojSala = Integer.parseInt(brojSalaNovi);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);
                String upitNovi = "INSERT INTO bioskop(nazivBioskopa,grad,adresa,brojSala) VALUES (?,?,?,?)";
                
                PreparedStatement ps = con.prepareStatement(upitNovi);
                ps.setString(1, nazivBioskopaNovi);
                ps.setString(2, gradNovi);
                ps.setString(3, adresaNovi);
                ps.setInt(4, brojSala);
                
                try{
                    ps.executeUpdate();
                }
                catch(SQLException e){
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
                }
                
                request.setAttribute("msg", "Uspešno ste dodali novi bioskop.");
                request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
                
                ps.close();
                con.close();
            }catch(ClassNotFoundException | SQLException e){
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("dodajBioskop.jsp").forward(request, response);
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
