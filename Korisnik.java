package binovi;

public class Korisnik {

    private int idKorisnika;
    private String ime;
    private String prezime;
    private int telefon;
    private String email;
    private String pol;
    private String korisnickoIme;
    private String lozinka;
    private int brojPoena;
    private String tipKorisnika;
    private int idKluba;

    public Korisnik() {
    }

    public Korisnik(int idKorisnika, String ime, String prezime, int telefon, String email, String pol, String korisnickoIme, String lozinka, int brojPoena, String tipKorisnika, int idKluba) {
        this.idKorisnika = idKorisnika;
        this.ime = ime;
        this.prezime = prezime;
        this.telefon = telefon;
        this.email = email;
        this.pol = pol;
        this.korisnickoIme = korisnickoIme;
        this.lozinka = lozinka;
        this.brojPoena = brojPoena;
        this.tipKorisnika = tipKorisnika;
        this.idKluba = idKluba;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public String getIme() {
        return ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public int getTelefon() {
        return telefon;
    }

    public String getEmail() {
        return email;
    }

    public String getPol() {
        return pol;
    }

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public String getLozinka() {
        return lozinka;
    }

    public int getBrojPoena() {
        return brojPoena;
    }

    public String getTipKorisnika() {
        return tipKorisnika;
    }

    public int getIdKluba() {
        return idKluba;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public void setTelefon(int telefon) {
        this.telefon = telefon;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPol(String pol) {
        this.pol = pol;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public void setBrojPoena(int brojPoena) {
        this.brojPoena = brojPoena;
    }

    public void setTipKorisnika(String tipKorisnika) {
        this.tipKorisnika = tipKorisnika;
    }

    public void setIdKluba(int idKluba) {
        this.idKluba = idKluba;
    }
}
