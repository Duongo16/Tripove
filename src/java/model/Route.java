package model;

import java.sql.Timestamp;

public class Route {

    private int id;
    private String name;
    private Integer price;
    public int departure_Locationid;
    public int arrival_Locationid;
    private String detail;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Route() {
    }

    public Route(int id, String name, Integer price, int departure_Locationid, int arrival_Locationid, String detail, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.departure_Locationid = departure_Locationid;
        this.arrival_Locationid = arrival_Locationid;
        this.detail = detail;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    
    public Route(String name, Integer price, int departure_Locationid, int arrival_Locationid, String detail, Timestamp created_at, Timestamp updated_at) {
        this.name = name;
        this.price = price;
        this.departure_Locationid = departure_Locationid;
        this.arrival_Locationid = arrival_Locationid;
        this.detail = detail;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public int getDeparture_Locationid() {
        return departure_Locationid;
    }

    public void setDeparture_Locationid(int departure_Locationid) {
        this.departure_Locationid = departure_Locationid;
    }

    public int getArrival_Locationid() {
        return arrival_Locationid;
    }

    public void setArrival_Locationid(int arrival_Locationid) {
        this.arrival_Locationid = arrival_Locationid;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
    
    

    
}
