package model;

import java.sql.Timestamp;
import java.util.LinkedList;

public class Vehicle_Category {

    private int id;
    private String name;
    private String utilities;
    private Timestamp created_at;
    private Timestamp updated_at;
    private Integer seatQuantity;
    private String seatType;
    private String image;
    public LinkedList<Vehicle> vehicle = new LinkedList<Vehicle>();
    public LinkedList<Seat> seat = new LinkedList<Seat>();

    public Vehicle_Category() {
    }

    public Vehicle_Category(int id, String name, String seatType, Integer seatQuantity, String utilities, Timestamp created_at, Timestamp updated_at, String image) {
        this.id = id;
        this.name = name;
        this.utilities = utilities;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.seatQuantity = seatQuantity;
        this.seatType = seatType;
        this.image=image;
    }
    
    public Vehicle_Category( String name, String seatType, Integer seatQuantity, String utilities, Timestamp created_at, String image) {
        this.name = name;
        this.utilities = utilities;
        this.created_at = created_at;
        this.seatQuantity = seatQuantity;
        this.seatType = seatType;
        this.image=image;
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

    public String getUtilities() {
        return utilities;
    }

    public void setUtilities(String utilities) {
        this.utilities = utilities;
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

    public Integer getSeatQuantity() {
        return seatQuantity;
    }

    public void setSeatQuantity(Integer seatQuantity) {
        this.seatQuantity = seatQuantity;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public LinkedList<Vehicle> getVehicle() {
        return vehicle;
    }

    public void setVehicle(LinkedList<Vehicle> vehicle) {
        this.vehicle = vehicle;
    }

    public LinkedList<Seat> getSeat() {
        return seat;
    }

    public void setSeat(LinkedList<Seat> seat) {
        this.seat = seat;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Vehicle_Category{" + "id=" + id + ", name=" + name + ", utilities=" + utilities + ", created_at=" + created_at + ", updated_at=" + updated_at + ", seatQuantity=" + seatQuantity + ", seatType=" + seatType + ", image=" + image + ", vehicle=" + vehicle + ", seat=" + seat + '}';
    }

    

    
    
    

}
