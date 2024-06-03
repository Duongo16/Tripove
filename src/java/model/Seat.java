package model;

import java.sql.Timestamp;
import java.util.LinkedList;

public class Seat {

    private int id;
    private String name;
    private Timestamp created_at;
    private Timestamp updated_at;
    public Vehicle_Category vehicle_Category;
    public LinkedList<Ticket> ticket = new LinkedList<Ticket>();

    public Seat() {
    }

    public Seat(int id, String name, Timestamp created_at, Timestamp updated_at, Vehicle_Category vehicle_Category) {
        this.id = id;
        this.name = name;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.vehicle_Category = vehicle_Category;
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

    public Vehicle_Category getVehicle_Category() {
        return vehicle_Category;
    }

    public void setVehicle_Category(Vehicle_Category vehicle_Category) {
        this.vehicle_Category = vehicle_Category;
    }

    public LinkedList<Ticket> getTicket() {
        return ticket;
    }

    public void setTicket(LinkedList<Ticket> ticket) {
        this.ticket = ticket;
    }

}
