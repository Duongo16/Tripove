package model;


public class Seat {

    private int id;
    private String name;
    private int surcharge;

    public Seat() {
    }

    public Seat(int id, String name, int surcharge) {
        this.id = id;
        this.name = name;
        this.surcharge = surcharge;
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

    public int getSurcharge() {
        return surcharge;
    }

    public void setSurcharge(int surcharge) {
        this.surcharge = surcharge;
    }
 

}
