package binovi;

public class Sala {

    private int idSale;
    private String nazivBioskopa;
    private int brojSedista;
    private int idBioskopa;

    public Sala() {
    }

    public Sala(int idSale, String nazivBioskopa, int brojSedista, int idBioskopa) {
        this.idSale = idSale;
        this.nazivBioskopa = nazivBioskopa;
        this.brojSedista = brojSedista;
        this.idBioskopa = idBioskopa;
    }

    public int getIdSale() {
        return idSale;
    }

    public String getNazivBioskopa() {
        return nazivBioskopa;
    }

    public int getBrojSedista() {
        return brojSedista;
    }

    public int getIdBioskopa() {
        return idBioskopa;
    }

    public void setIdSale(int idSale) {
        this.idSale = idSale;
    }

    public void setNazivBioskopa(String nazivBioskopa) {
        this.nazivBioskopa = nazivBioskopa;
    }

    public void setBrojSedista(int brojSedista) {
        this.brojSedista = brojSedista;
    }

    public void setIdBioskopa(int idBioskopa) {
        this.idBioskopa = idBioskopa;
    }

}
