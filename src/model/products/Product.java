package model.products;

import model.Category;

public class Product {
    private long id_product;
    private String product_brand;
    private String product_model;
    private int product_quantity;
    private double product_price;
    private String product_description;
    private String product_image;
    private String computers_cpu;
    private String computers_vga;
    private String computers_ram;
    private String computers_hdd;
    private String computers_ssd;
    private String monitor_size;
    private String monitor_resolution;
    private String monitor_matrix;
    private String pc_psu;
    private String pc_mb;
    private Category category;

    public long getId_product() {
        return id_product;
    }

    public void setId_product(long id_product) {
        this.id_product = id_product;
    }

    public String getProduct_brand() {
        return product_brand;
    }

    public void setProduct_brand(String product_brand) {
        this.product_brand = product_brand;
    }

    public String getProduct_model() {
        return product_model;
    }

    public void setProduct_model(String product_model) {
        this.product_model = product_model;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

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

    public String getMonitor_size() {
        return monitor_size;
    }

    public void setMonitor_size(String monitor_size) {
        this.monitor_size = monitor_size;
    }

    public String getMonitor_resolution() {
        return monitor_resolution;
    }

    public void setMonitor_resolution(String monitor_resolution) {
        this.monitor_resolution = monitor_resolution;
    }

    public String getMonitor_matrix() {
        return monitor_matrix;
    }

    public void setMonitor_matrix(String monitor_matrix) {
        this.monitor_matrix = monitor_matrix;
    }

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
