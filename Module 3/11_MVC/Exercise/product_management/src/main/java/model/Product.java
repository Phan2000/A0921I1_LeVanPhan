package model;

public class Product {
    private int id;
    private String nameProduct;
    private String origin;
    private float price;

    public Product() {
    }

    public Product(int id, String nameProduct, String origin, float price) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.origin = origin;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
