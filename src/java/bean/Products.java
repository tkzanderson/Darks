/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author janic
 */
public class Products implements Serializable{
    private String prodTitle, prodDescription, prodType;
    private double prodPrice;
    private int id, activate;
    private String prodImage;
    private double promotionPrice;
    private int promotionStatus;

    public double getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(double promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    public int getPromotionStatus() {
        return promotionStatus;
    }

    public void setPromotionStatus(int promotionStatus) {
        this.promotionStatus = promotionStatus;
    }



    public Products(String prodTitle, String prodDescription, String prodType, double prodPrice, int id, String prodImage, int activate) {
        this.prodTitle = prodTitle;
        this.prodDescription = prodDescription;
        this.prodType = prodType;
        this.prodPrice = prodPrice;
        this.id = id;
        this.prodImage = prodImage;
        this.activate = activate;
    }
    
     public Products(String prodTitle, String prodDescription, String prodType, double prodPrice, int id, String prodImage, int activate, double promotionPrice, int promotionStatus) {
        this.prodTitle = prodTitle;
        this.prodDescription = prodDescription;
        this.prodType = prodType;
        this.prodPrice = prodPrice;
        this.id = id;
        this.prodImage = prodImage;
        this.activate = activate;
          this.promotionPrice = promotionPrice;
            this.promotionStatus = promotionStatus;
    }
    public Products(String prodTitle, String prodDescription, String prodType, double prodPrice, int id, String prodImage) {
        this.prodTitle = prodTitle;
        this.prodDescription = prodDescription;
        this.prodType = prodType;
        this.prodPrice = prodPrice;
        this.id = id;
        this.prodImage = prodImage;
    }

    public int getActivate() {
        return activate;
    }

    public void setActivate(int activate) {
        this.activate = activate;
    }

    public Products() {
        prodTitle = "";
        prodImage = "";
        prodPrice = 0;
    }

    public Products(int id, String prodTitle, double prodPrice, String prodImage) {
        this.id = id;
        this.prodTitle = prodTitle;
        this.prodPrice = prodPrice;
        this.prodImage = prodImage;
    }
    
    public String getProdTitle() {
        return prodTitle;
    }

    public void setProdTitle(String prodTitle) {
        this.prodTitle = prodTitle;
    }

    public String getProdDescription() {
        return prodDescription;
    }

    public void setProdDescription(String prodDescription) {
        this.prodDescription = prodDescription;
    }

    public String getProdType() {
        return prodType;
    }

    public void setProdType(String prodType) {
        this.prodType = prodType;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProdImage() {
        return prodImage;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }
}
