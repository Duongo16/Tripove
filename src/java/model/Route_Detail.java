package model;

import java.sql.Timestamp;
import java.sql.Date;
import java.sql.Time;

public class Route_Detail {

    private int id;
    public int routeId;
    private Date departureDate;
    private Time departureTime;
    public String vehiclelicensePlate;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Route_Detail() {
    }
    
    public Route_Detail(int routeId, Date departureDate, Time departureTime, String vehiclelicensePlate, Timestamp created_at, Timestamp updated_at) {
        this.routeId = routeId;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.vehiclelicensePlate = vehiclelicensePlate;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Route_Detail(int id, int routeId, Date departureDate, Time departureTime, String vehiclelicensePlate, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.routeId = routeId;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.vehiclelicensePlate = vehiclelicensePlate;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Time departureTime) {
        this.departureTime = departureTime;
    }

    public String getVehiclelicensePlate() {
        return vehiclelicensePlate;
    }

    public void setVehiclelicensePlate(String vehiclelicensePlate) {
        this.vehiclelicensePlate = vehiclelicensePlate;
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

    @Override
    public String toString() {
        return "Route_Detail{" + "id=" + id + ", routeId=" + routeId + ", departureDate=" + departureDate + ", departureTime=" + departureTime + ", vehiclelicensePlate=" + vehiclelicensePlate + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
    

}
