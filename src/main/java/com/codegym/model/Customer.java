package com.codegym.model;
public class Customer {
    private int id; private String name, email, address;
    public Customer() {}
    public Customer(int id, String name, String email, String address) {
        this.id=id; this.name=name; this.email=email; this.address=address;
    }
    public int getId(){return id;} public void setId(int id){this.id=id;}
    public String getName(){return name;} public void setName(String n){this.name=n;}
    public String getEmail(){return email;} public void setEmail(String e){this.email=e;}
    public String getAddress(){return address;} public void setAddress(String a){this.address=a;}
}
