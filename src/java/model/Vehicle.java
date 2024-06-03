package model;

import java.sql.Timestamp;
import java.util.LinkedList;

public class Vehicle {

    private String licensePlate;
    private Integer status;
    private Timestamp created_at;
    private Timestamp updated_at;
    private String image;
    public int vehicle_Categoryid;
    public LinkedList<Route> route = new LinkedList<Route>();
    public LinkedList<Evaluate> evaluate = new LinkedList<Evaluate>();

    public Vehicle() {
    }

    public Vehicle(String licensePlate, Integer status, Timestamp created_at, Timestamp updated_at, int vehicle_Categoryid, String image) {
        this.licensePlate = licensePlate;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.image = image;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    @Override
    public String toString() {
        return "Vehicle{" + "licensePlate=" + licensePlate + ", status=" + status + ", created_at=" + created_at + ", updated_at=" + updated_at + ", image=" + image + ", vehicle_Categoryid=" + vehicle_Categoryid + ", route=" + route + ", evaluate=" + evaluate + '}';
    }

}
