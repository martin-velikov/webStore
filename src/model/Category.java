package model;

public class Category {
    private long id_category;
    private String category_name;

    public long getId() {
        return id_category;
    }

    public void setId(long id_category) {
        this.id_category = id_category;
    }

    public String getName() {
        return category_name;
    }

    public void setName(String category_name) {
        this.category_name = category_name;
    }
}
