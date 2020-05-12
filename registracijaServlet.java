package servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class registracijaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        String pol = request.getParameter("pol");
        String korisnickoIme = request.getParameter("korisnickoIme");
        String lozinka = request.getParameter("lozinka");
        String potvrda = request.getParameter("potvrda");
        int brojPoena = 0;
        String tipKorisnika = "Korisnik";

        String dbUrl = "jdbc:mysql://localhost:3306/probabioskopa";
        String user = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, user, pass);
            Statement st = con.createStatement();
            ResultSet rs = null;
            String upit = "SELECT korisnickoIme, lozinka FROM korisnik";
            rs = st.executeQuery(upit);

            while (rs.next()) {
                if (korisnickoIme.equals(rs.getString("korisnickoIme"))) {
                    request.setAttribute("msg", "Korisničko ime je već u upotrebi. Pokušajte da izaberete drugo.");
                    request.getRequestDispatcher("registracija.jsp").forward(request, response);
                }
            }
            st.close();
            con.close();

        } catch (ClassNotFoundException e) {
            request.setAttribute("greska", e.getMessage());
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
        } catch (SQLException se) {
            String poruka = se.getMessage();
            request.setAttribute("greska", poruka);
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
        }

        if (korisnickoIme != null && korisnickoIme.length() > 0 && lozinka != null && lozinka.length() > 0 && potvrda != null && potvrda.length() > 0 && telefon != null && telefon.length() > 0) {
            if (lozinka.equals(potvrda)) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dbUrl, user, pass);
                    String upit = "INSERT INTO korisnik(ime,prezime,telefon,email,pol,korisnickoIme,lozinka,brojPoena,tipKorisnika) VALUES (?,?,?,?,?,?,?,?,?)";

                    PreparedStatement ps = con.prepareStatement(upit);
                    ps.setString(1, ime);
                    ps.setString(2, prezime);
                    ps.setString(3, telefon);
                    ps.setString(4, email);
                    ps.setString(5, pol);
                    ps.setString(6, korisnickoIme);
                    ps.setString(7, lozinka);
                    ps.setInt(8, brojPoena);
                    ps.setString(9, tipKorisnika);

                    try {
                        ps.executeUpdate();
                    } catch (SQLException e) {
                        String poruka = e.getMessage();
                        request.setAttribute("greska", poruka);
                        request.getRequestDispatcher("registracija.jsp").forward(request, response);
                    }
                    request.setAttribute("msg", "Uspesno ste se registrovali. Unesite vaše podatke da bi ste se prijavili.");
                    request.getRequestDispatcher("prijava.jsp").forward(request, response);
                    ps.close();
                    con.close();
                } catch (ClassNotFoundException se) {

                } catch (Exception e) {
                    String poruka = e.getMessage();
                    request.setAttribute("greska", poruka);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Lozinke se ne poklapaju!");
                request.getRequestDispatcher("registracija.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja!");
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
        }
    }
}
