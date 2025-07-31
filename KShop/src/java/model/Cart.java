/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LAZYVL
 */
public class Cart {
    private int id;
    private int userId;
    private int productId;
    private String productName;
    private int quantity;
    private double price;
    private int statusCart;

    public Cart(int id, int userId, int productId, String productName, int quantity, double price, int statusCart) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    public Cart(int userId, int productId, String productName, int quantity, double price, int statusCart) {
        this.userId = userId;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }

    public Cart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatusCart() {
        return statusCart;
    }

    public void setStatusCart(int statusCart) {
        this.statusCart = statusCart;
    }
    
    
    
    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", userId=" + userId + ", productId=" + productId + ", productName=" + productName + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
}
