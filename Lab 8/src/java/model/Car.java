/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus
 */
public class Car {
    
    private int carId;
    private String Brand;
    private String Model;
    private int Cyclinder;
    private double Price;
    
    public Car(){
        
    }
    
    public Car (int carId, String b, String m, int c, double p){
        this.carId = carId;
        this.Brand = b;
        this.Cyclinder = c;
        this.Model = m;
        this.Price = p;
    }
    
    public Car (String b, String m, int c, double p){
        this.Brand = b;
        this.Cyclinder = c;
        this.Model = m;
        this.Price = p;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public int getCyclinder() {
        return Cyclinder;
    }

    public void setCyclinder(int Cyclinder) {
        this.Cyclinder = Cyclinder;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }
    
}
