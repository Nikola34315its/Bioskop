package binovi;

public class Bioskop {
    private int idBioskopa;
    private String nazivBioskopa;
    private String grad;
    private String adresa;
    private int brojSala;

    public Bioskop() {
    }

    public Bioskop(int idBioskopa, String nazivBioskopa, String grad, String adresa, int brojSala) {
        this.idBioskopa = idBioskopa;
        this.nazivBioskopa = nazivBioskopa;
        this.grad = grad;
        this.adresa = adresa;
        this.brojSala = brojSala;
    }

    public int getIdBioskopa() {
        return idBioskopa;
    }

    public String getNazivBioskopa() {
        return nazivBioskopa;
    }

    public String getGrad() {
        return grad;
    }

    public String getAdresa() {
        return adresa;
    }

    public int getBrojSala() {
        return brojSala;
    }

    public void setIdBioskopa(int idBioskopa) {
        this.idBioskopa = idBioskopa;
    }

    public void setNazivBioskopa(String nazivBioskopa) {
        this.nazivBioskopa = nazivBioskopa;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public void setBrojSala(int brojSala) {
        this.brojSala = brojSala;
    }
    
    
}
