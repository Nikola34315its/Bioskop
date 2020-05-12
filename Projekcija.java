package binovi;

public class Projekcija {

    private int idProjekcije;
    private String nazivFilma;
    private String datumProjekcije;
    private String vremeProjekcije;
    private String tehnologija;
    private int cena;
    private String nazivBioskopa;
    private int idSale;
    private int idFilma;

    public Projekcija(int idProjekcije, String nazivFilma, String datumProjekcije, String vremeProjekcije, String tehnologija, int cena, String nazivBioskopa, int idSale, int idFilma) {
        this.idProjekcije = idProjekcije;
        this.nazivFilma = nazivFilma;
        this.datumProjekcije = datumProjekcije;
        this.vremeProjekcije = vremeProjekcije;
        this.tehnologija = tehnologija;
        this.cena = cena;
        this.nazivBioskopa = nazivBioskopa;
        this.idSale = idSale;
        this.idFilma = idFilma;
    }

    public int getIdProjekcije() {
        return idProjekcije;
    }

    public String getNazivFilma() {
        return nazivFilma;
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

    public int getCena() {
        return cena;
    }

    public String getNazivBioskopa() {
        return nazivBioskopa;
    }

    public int getIdSale() {
        return idSale;
    }

    public int getIdFilma() {
        return idFilma;
    }

    public void setIdProjekcije(int idProjekcije) {
        this.idProjekcije = idProjekcije;
    }

    public void setNazivFilma(String nazivFilma) {
        this.nazivFilma = nazivFilma;
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

    public void setCena(int cena) {
        this.cena = cena;
    }

    public void setNazivBioskopa(String nazivBioskopa) {
        this.nazivBioskopa = nazivBioskopa;
    }

    public void setIdSale(int idSale) {
        this.idSale = idSale;
    }

    public void setIdFilma(int idFilma) {
        this.idFilma = idFilma;
    }

}
