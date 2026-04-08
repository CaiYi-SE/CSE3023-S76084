/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.model;

/**
 *
 * @author Asus
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String roles;
    
    //empty constructor
    public User(){
        
    }
    
    //parameterized constructor
    public User(int id, String username, String password, String roles){
        this.id = id;
        this.username = username;
        this.roles = roles;
        this.password = password;
    }
    
    public User(String username, String password, String roles){
        this.username = username;
        this.roles = roles;
        this.password = password;
    }
    
    // Getter dan Setter
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRoles() {
        return roles;
    }
    
    public void setRoles(String roles) {
        this.roles = roles;
    }
}
