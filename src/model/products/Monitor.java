package model.products;

public class Monitor extends Product{
    private String monitor_size;
    private String monitor_resolution;
    private String monitor_matrix;

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
}
