package model;

import java.sql.Timestamp;

public class Evaluate {

    private int id;
    private Integer star;
    private String comment;
    private int vehicleid;
    private Timestamp created_at;
    private Timestamp updated_at;
    public Account account;
    public Vehicle vehiclelicensePlate;
    public Route route;

    public Evaluate() {
    }

    public Evaluate(int id, Integer star, String comment, int vehicleid, Timestamp created_at, Timestamp updated_at, Account account, Vehicle vehiclelicensePlate, Route route) {
        this.id = id;
        this.star = star;
        this.comment = comment;
        this.vehicleid = vehicleid;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.account = account;
        this.vehiclelicensePlate = vehiclelicensePlate;
        this.route = route;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getVehicleid() {
        return vehicleid;
    }

    public void setVehicleid(int vehicleid) {
        this.vehicleid = vehicleid;
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

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Vehicle getVehiclelicensePlate() {
        return vehiclelicensePlate;
    }

    public void setVehiclelicensePlate(Vehicle vehiclelicensePlate) {
        this.vehiclelicensePlate = vehiclelicensePlate;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

}
