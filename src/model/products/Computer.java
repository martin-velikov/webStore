package model.products;

public abstract class Computer extends Product  {
    private String computers_cpu;
    private String computers_vga;
    private String computers_ram;
    private String computers_hdd;
    private String computers_ssd;

    public String getComputers_cpu() {
        return computers_cpu;
    }

    public void setComputers_cpu(String computers_cpu) {
        this.computers_cpu = computers_cpu;
    }

    public String getComputers_vga() {
        return computers_vga;
    }

    public void setComputers_vga(String computers_vga) {
        this.computers_vga = computers_vga;
    }

    public String getComputers_ram() {
        return computers_ram;
    }

    public void setComputers_ram(String computers_ram) {
        this.computers_ram = computers_ram;
    }

    public String getComputers_hdd() {
        return computers_hdd;
    }

    public void setComputers_hdd(String computers_hdd) {
        this.computers_hdd = computers_hdd;
    }

    public String getComputers_ssd() {
        return computers_ssd;
    }

    public void setComputers_ssd(String computers_ssd) {
        this.computers_ssd = computers_ssd;
    }
}
