/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author user
 */
public class Payment  implements Serializable{
        private int id;


        private double  total;
        private int productID;
        private String size;
        private int userID;
        private String status;
        private String startDate;
        private String endDate;
        private String paymentStatus;
        private Timestamp  paidDate;
        private int quantity;
    public Payment(double total, int productID, String size, int userID, String status, String startDate, String endDate, String paymentStatus, int quantity) {
        this.total = total;
        this.productID = productID;
        this.size = size;
        this.userID = userID;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.paymentStatus = paymentStatus;
        this.quantity = quantity;
        
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Payment(Timestamp  paidDate) {
        this.paidDate = paidDate;
    }

  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
        public Timestamp getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Timestamp paidDate) {
        this.paidDate = paidDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Payment() {
    }
}
