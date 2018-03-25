package model.products;

public class PC extends Computer {
    private String pc_psu;
    private String pc_mb;

    public String getPc_psu() {
        return pc_psu;
    }

    public void setPc_psu(String pc_psu) {
        this.pc_psu = pc_psu;
    }

    public String getPc_mb() {
        return pc_mb;
    }

    public void setPc_mb(String pc_mb) {
        this.pc_mb = pc_mb;
    }
}
