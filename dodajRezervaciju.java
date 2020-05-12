package servleti;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dodajRezervaciju extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nazivFilmaStr = request.getParameter("nazivF");
        String nazivBioskopaStr = request.getParameter("nazivB");
        String datumStr = request.getParameter("datum");
        String vremeStr = request.getParameter("vreme");
        String cenaStr = request.getParameter("cena");
        String brKarataStr = request.getParameter("brKarata");
        String sifraKorisnikaStr = request.getParameter("sifraKorisnika");
        String idSaleStr = request.getParameter("sifraSale");
        String sifraFilmaStr = request.getParameter("sifraFilma");
        String sifraProjekcijeStr = request.getParameter("sifraProjekcije");
        String tehnologija = request.getParameter("tehnologija");
        String tipSedista = request.getParameter("tipSedista");

        String ukupnoPoenaStr = request.getParameter("ukupnoPoena");

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        if (nazivFilmaStr != null && nazivFilmaStr.length() > 0
                && nazivBioskopaStr != null && nazivBioskopaStr.length() > 0
                && datumStr != null && datumStr.length() > 0
                && vremeStr != null && vremeStr.length() > 0
                && cenaStr != null && cenaStr.length() > 0
                && brKarataStr != null && brKarataStr.length() > 0
                && tehnologija != null && tehnologija.length() > 0
                && idSaleStr != null && idSaleStr.length() > 0
                && sifraKorisnikaStr != null && sifraKorisnikaStr.length() > 0
                && sifraFilmaStr != null && sifraFilmaStr.length() > 0
                && sifraProjekcijeStr != null && sifraProjekcijeStr.length() > 0) {
            try {
                int BrKarataStr = Integer.parseInt(brKarataStr);
                int SifraKorisnikaStr = Integer.parseInt(sifraKorisnikaStr);
                int SifraFilmaStr = Integer.parseInt(sifraFilmaStr);
                int CenaStr = Integer.parseInt(cenaStr);
                int IdSaleStr = Integer.parseInt(idSaleStr);
                int IdProjekcijeStr = Integer.parseInt(sifraProjekcijeStr);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(dbUrl, user, pass);

                String upit = "INSERT INTO rezervacija(nazivFilma, nazivBioskopa, datumProjekcije, vremeProjekcije, tehnologija, tipSedista, cena, brojKarata, idKorisnika, idSale, idFilma, idProjekcije) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(upit);

                ps.setString(1, nazivFilmaStr);
                ps.setString(2, nazivBioskopaStr);
                ps.setString(3, datumStr);
                ps.setString(4, vremeStr);
                ps.setString(5, tehnologija);
                ps.setString(6, tipSedista);
                ps.setInt(7, CenaStr);
                ps.setInt(8, BrKarataStr);
                ps.setInt(9, SifraKorisnikaStr);
                ps.setInt(10, IdSaleStr);
                ps.setInt(11, SifraFilmaStr);
                ps.setInt(12, IdProjekcijeStr);

                try {
                    ps.executeUpdate();
                } catch (SQLException e) {
                    request.setAttribute("greska", e.getMessage());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                request.setAttribute("msg", "Uspesno ste odradili rezervaciju");
                request.getRequestDispatcher("index.jsp").forward(request, response);

                ps.close();
                con.close();
            } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                request.setAttribute("greska", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        try {
            int UkupnoPoenaStr = Integer.parseInt(ukupnoPoenaStr);
            int SifraKorisnikaStr = Integer.parseInt(sifraKorisnikaStr);

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);

            String upit = "UPDATE korisnik SET brojPoena = ? WHERE idKorisnika = ?";

            PreparedStatement ps = con.prepareStatement(upit);

            ps.setInt(1, UkupnoPoenaStr);
            ps.setInt(2, SifraKorisnikaStr);

            try {
                ps.executeUpdate();
            } catch (SQLException e) {
                request.setAttribute("msg", e.getMessage());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("msg", e.getMessage());
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
