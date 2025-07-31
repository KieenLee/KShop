/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

 /**
 *
 * @author LAZYVL
 */
public class Products {
    private int id;
    private String name;
    private double price;
    private int stock;
    private int categoryId;
    private String image;
    private String category_type;

    public Products() {
    }

    public Products(int id, String name, double price, int stock, int categoryId, String image, String category_type) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.categoryId = categoryId;
        this.image = image;
        this.category_type = category_type;
    }

    public Products(String name, double price, int stock, int categoryId, String image, String category_type) {
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.categoryId = categoryId;
        this.image = image;
        this.category_type = category_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory_type() {
        return category_type;
    }

    public void setCategory_type(String category_type) {
        this.category_type = category_type;
    }
    
    
     
}
