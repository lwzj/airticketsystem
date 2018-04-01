package com.ats.bean;

public class Flight {
    private int id;
    private String flightId;
    private String takeoffTime;
    private String landingTime;
    private double price;
    private int num;
    private String takeoffCity;
    private String landingCity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
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

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
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
