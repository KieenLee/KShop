/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LAZYVL
 */
public class Shopping_Cart {
    private int id;
    private int userId;
    private int productId;
    private int quantity;
    private double price;
    private int statusCart;

    public Shopping_Cart() {
    }

    public Shopping_Cart(int id, int userId, int productId, int quantity, double price, int statusCart) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.statusCart = statusCart;
    }

    public Shopping_Cart(int userId, int productId, int quantity, double price, int statusCart) {
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.statusCart = statusCart;
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

    
    
}
