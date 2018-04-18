package com.ats.dto;

public class OrderDto2 {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String username;
    private String flightId;
    private String IDcard;
    private int isDel;
    private String takeoffTime;
    private String landingTime;
    private double price;
    private String takeoffCity;
    private String landingCity;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
    }

    public String getIDcard() {
        return IDcard;
    }

    public void setIDcard(String IDcard) {
        this.IDcard = IDcard;
    }

    public int getIsDel() {
        return isDel;
    }

    public void setIsDel(int isDel) {
        this.isDel = isDel;
    }

    public String getTakeoffTime() {
        return takeoffTime;
    }

    public void setTakeoffTime(String takeoffTime) {
        this.takeoffTime = takeoffTime;
    }

    public String getLandingTime() {
        return landingTime;
    }

    public void setLandingTime(String landingTime) {
        this.landingTime = landingTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public String getTakeoffCity() {
        return takeoffCity;
    }

    public void setTakeoffCity(String takeoffCity) {
        this.takeoffCity = takeoffCity;
    }

    public String getLandingCity() {
        return landingCity;
    }

    public void setLandingCity(String landingCity) {
        this.landingCity = landingCity;
    }
}
