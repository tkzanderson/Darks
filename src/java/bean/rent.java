/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;


/**
 *
 * @author Anderson
 */
public class rent {
    private int quantity, userID, prodID, id;
    private double price, totalprice;
    private String prodImage, prodTitle, size, status, username;
    private Date startdate= new Date();
    private Date enddate= new Date();

    public rent() {
    }
    

    public rent(int quantity, int userID, int prodID, double price, double totalprice, String prodImage, String prodTitle, String size) {
        this.quantity = quantity;
        this.userID = userID;
        this.prodID = prodID;
        this.price = price;
        this.totalprice = totalprice;
        this.prodImage = prodImage;
        this.prodTitle = prodTitle;
        this.size = size;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
    
    

    public Date getStartdate() {
        return startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    

    
    
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
     

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public int getUserID() {
        return userID;
    }

    public int getProdID() {
        return prodID;
    }


    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }

    public void setProdTitle(String prodTitle) {
        this.prodTitle = prodTitle;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public String getProdImage() {
        return prodImage;
    }

    public String getProdTitle() {
        return prodTitle;
    }
    
    
}
