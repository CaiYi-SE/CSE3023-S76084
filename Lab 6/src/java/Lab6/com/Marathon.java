/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab6.com;

/**
 *
 * @author Asus
 */
public class Marathon {
    
    private String icno;
    private String name;
    private String category;
    
    public Marathon (){
        
    }
    
    public Marathon (String icno, String name, String category) {
        this.icno = icno;
        this.name = name;
        this.category = category;
    }

    public String getIcno() {
        return icno;
    }

    public void setIcno(String icno) {
        this.icno = icno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
    
}
