package binovi;

public class Film {

    private int idFilma;
    private String nazivFilma;
    private String opis;
    private String preporuka;
    private int brojPoena;
    private String trejler;
    private int trajanje;
    private String zanr;
    private String linkSlike;

    public Film() {
    }

    public Film(int idFilma, String nazivFilma, String opis, String preporuka, int brojPoena, String trejler, int trajanje, String zanr, String linkSlike) {
        this.idFilma = idFilma;
        this.nazivFilma = nazivFilma;
        this.opis = opis;
        this.preporuka = preporuka;
        this.brojPoena=brojPoena;
        this.trejler = trejler;
        this.trajanje = trajanje;
        this.zanr = zanr;
        this.linkSlike = linkSlike;
    }

    public int getIdFilma() {
        return idFilma;
    }

    public String getNazivFilma() {
        return nazivFilma;
    }

    public String getOpis() {
        return opis;
    }

    public String getPreporuka() {
        return preporuka;
    }

    public int getBrojPoena() {
        return brojPoena;
    }

    public String getTrejler() {
        return trejler;
    }

    public int getTrajanje() {
        return trajanje;
    }

    public String getZanr() {
        return zanr;
    }

    public String getLinkSlike() {
        return linkSlike;
    }

    public void setIdFilma(int idFilma) {
        this.idFilma = idFilma;
    }

    public void setNazivFilma(String nazivFilma) {
        this.nazivFilma = nazivFilma;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public void setPreporuka(String preporuka) {
        this.preporuka = preporuka;
    }

    public void setBrojPoena(int brojPoena) {
        this.brojPoena = brojPoena;
    }

    public void setTrejler(String trejler) {
        this.trejler = trejler;
    }

    public void setTrajanje(int trajanje) {
        this.trajanje = trajanje;
    }

    public void setZanr(String zanr) {
        this.zanr = zanr;
    }

    public void setLinkSlike(String linkSlike) {
        this.linkSlike = linkSlike;
    }

}
