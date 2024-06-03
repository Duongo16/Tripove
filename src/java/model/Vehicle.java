package model;

import java.sql.Timestamp;
import java.util.LinkedList;

public class Vehicle {

    private String licensePlate;
    private Integer status;
    private Timestamp created_at;
    private Timestamp updated_at;
    public int vehicle_Categoryid;
    public LinkedList<Route> route = new LinkedList<Route>();
    public LinkedList<Evaluate> evaluate = new LinkedList<Evaluate>();

    public Vehicle() {
    }

    public Vehicle(String licensePlate, Integer status, Timestamp created_at, Timestamp updated_at, int vehicle_Categoryid) {
        this.licensePlate = licensePlate;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.vehicle_Categoryid = vehicle_Categoryid;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }


    public int getVehicle_Categoryid() {
        return vehicle_Categoryid;
    }

    public void setVehicle_Categoryid(int vehicle_Categoryid) {
        this.vehicle_Categoryid = vehicle_Categoryid;
    }

    public LinkedList<Route> getRoute() {
        return route;
    }

    public void setRoute(LinkedList<Route> route) {
        this.route = route;
    }

    public LinkedList<Evaluate> getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(LinkedList<Evaluate> evaluate) {
        this.evaluate = evaluate;
    }


}
