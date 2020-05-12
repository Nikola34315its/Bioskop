package binovi;

public class Rezervacija {

    private int idRezervacije;
    private String nazivFilma;
    private String nazivBioskopa;
    private String datumProjekcije;
    private String vremeProjekcije;
    private String tehnologija;
    private String tipSedista;
    private int cena;
    private int brojKarata;
    private int idSale;
    private int idKorisnika;
    private int idFilma;
    private int idProjekcije;

    public Rezervacija() {
    }

    public Rezervacija(int idRezervacije, String nazivFilma, String nazivBioskopa, String datumProjekcije, String vremeProjekcije, String tehnologija, String tipSedista, int cena, int brojKarata, int idSale, int idKorisnika, int idFilma, int idProjekcije) {
        this.idRezervacije = idRezervacije;
        this.datumProjekcije = datumProjekcije;
        this.nazivFilma = nazivFilma;
        this.nazivBioskopa = nazivBioskopa;
        this.vremeProjekcije = vremeProjekcije;
        this.tehnologija = tehnologija;
        this.tipSedista = tipSedista;
        this.cena = cena;
        this.brojKarata = brojKarata;
        this.idSale = idSale;
        this.idKorisnika = idKorisnika;
        this.idFilma = idFilma;
        this.idProjekcije = idProjekcije;
    }

    public int getIdRezervacije() {
        return idRezervacije;
    }

    public String getNazivFilma() {
        return nazivFilma;
    }

    public String getNazivBioskopa() {
        return nazivBioskopa;
    }

    public String getDatumProjekcije() {
        return datumProjekcije;
    }

    public String getVremeProjekcije() {
        return vremeProjekcije;
    }

    public String getTehnologija() {
        return tehnologija;
    }

    public String getTipSedista() {
        return tipSedista;
    }

    public int getCena() {
        return cena;
    }

    public int getBrojKarata() {
        return brojKarata;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public int getIdFilma() {
        return idFilma;
    }

    public int getIdSale() {
        return idSale;
    }

    public int getIdProjekcije() {
        return idProjekcije;
    }

    public void setIdRezervacije(int idRezervacije) {
        this.idRezervacije = idRezervacije;
    }

    public void setNazivFilma(String nazivFilma) {
        this.nazivFilma = nazivFilma;
    }

    public void setNazivBioskopa(String nazivBioskopa) {
        this.nazivBioskopa = nazivBioskopa;
    }

    public void setDatumProjekcije(String datumProjekcije) {
        this.datumProjekcije = datumProjekcije;
    }

    public void setVremeProjekcije(String vremeProjekcije) {
        this.vremeProjekcije = vremeProjekcije;
    }

    public void setTehnologija(String tehnologija) {
        this.tehnologija = tehnologija;
    }

    public void setTipSedista(String tipSedista) {
        this.tipSedista = tipSedista;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public void setBrojKarata(int brojKarata) {
        this.brojKarata = brojKarata;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public void setIdFilma(int idFilma) {
        this.idFilma = idFilma;
    }

    public void setIdProjekcije(int idProjekcije) {
        this.idProjekcije = idProjekcije;
    }

    public void setIdSale(int idSale) {
        this.idSale = idSale;
    }
}
