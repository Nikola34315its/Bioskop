package binovi;

public class Klub {
    private int idKluba;
    private String nazivKluba;
    private String opisPogodnosti;
    private int popust;

    public Klub(int idKluba, String nazivKluba, String opisPogodnosti, int popust) {
        this.idKluba = idKluba;
        this.nazivKluba = nazivKluba;
        this.opisPogodnosti = opisPogodnosti;
        this.popust = popust;
    }

    public int getIdKluba() {
        return idKluba;
    }

    public String getNazivKluba() {
        return nazivKluba;
    }

    public String getOpisPogodnosti() {
        return opisPogodnosti;
    }

    public int getPopust() {
        return popust;
    }

    public void setIdKluba(int idKluba) {
        this.idKluba = idKluba;
    }

    public void setNazivKluba(String nazivKluba) {
        this.nazivKluba = nazivKluba;
    }

    public void setOpisPogodnosti(String opisPogodnosti) {
        this.opisPogodnosti = opisPogodnosti;
    }

    public void setPopust(int popust) {
        this.popust = popust;
    }
}
