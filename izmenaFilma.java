package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class izmenaFilma extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String sifra = request.getParameter("sifra");
        String Naziv = request.getParameter("naziv");
        String Opis = request.getParameter("opis");
        String preporuka = request.getParameter("preporuka");
        String brojPoena = request.getParameter("brojPoena");
        String Trejler = request.getParameter("trejler");
        String Slika = request.getParameter("slika");
        String trajanje = request.getParameter("trajanje");
        String Zanr = request.getParameter("zanr");

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        if (sifra != null && sifra.length() > 0
                && Naziv != null && Naziv.length() > 0
                && Opis != null && Opis.length() > 0
                && preporuka != null && preporuka.length() > 0
                && brojPoena != null && brojPoena.length() > 0
                && Trejler != null && Trejler.length() > 0
                && Slika != null && Slika.length() > 0
                && trajanje != null && trajanje.length() > 0
                && Zanr != null && Zanr.length() > 0) {
            try {
                int Sifra = Integer.parseInt(sifra);
                int Trajanje = Integer.parseInt(trajanje);
                int BrojPoena = Integer.parseInt(brojPoena);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);

                String upit = "UPDATE film SET nazivFilma = ?, opis = ?, preporuka = ?, brojPoena = ?, trejler = ?, linkSlike = ?, trajanje = ?, zanr = ? WHERE idFilma = ?";

                PreparedStatement ps = con.prepareStatement(upit);
                ps.setString(1, Naziv);
                ps.setString(2, Opis);
                ps.setString(3, preporuka);
                ps.setInt(4, BrojPoena);
                ps.setString(5, Trejler);
                ps.setString(6, Slika);
                ps.setInt(7, Trajanje);
                ps.setString(8, Zanr);
                ps.setInt(9, Sifra);

                ps.executeUpdate();

                request.setAttribute("msg", "Uspesno ste izmenili film");
                request.getRequestDispatcher("film.jsp").forward(request, response);

                ps.close();
                con.close();
            } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e) {
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja");
            request.getRequestDispatcher("izmenaFilma.jsp").forward(request, response);
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
