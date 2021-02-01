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
public class Payment implements Serializable{
    int id, userID, rentID;
    String filename, path;
    Timestamp paidDate;

    public Payment(Timestamp paidDate) {
        this.paidDate = paidDate;
    }

    public int getRentID() {
        return rentID;
    }

    public void setRentID(int rentID) {
        this.rentID = rentID;
    }

    public Payment() {
    }

    public Timestamp getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Timestamp paidDate) {
        this.paidDate = paidDate;
    }

    public Payment(int id, int userID, String filename, String path, Timestamp paidDate, int rentID) {
        this.id = id;
        this.userID = userID;
        this.filename = filename;
        this.path = path;
        this.paidDate = paidDate;
        this.rentID = rentID;
    }

    public Payment(int id, int userID, String filename, String path) {
        this.id = id;
        this.userID = userID;
        this.filename = filename;
        this.path = path;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    } 
}
