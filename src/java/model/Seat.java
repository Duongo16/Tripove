package model;

public class Seat {

    private int id;
    private String name;
    private int surcharge, routeDetailId, accountId;

    public Seat() {
    }

    public Seat(int id, String name, int surcharge, int routeDetailId, int accountId) {
        this.id = id;
        this.name = name;
        this.surcharge = surcharge;
        this.routeDetailId = routeDetailId;
        this.accountId = accountId;
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

    public int getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(int routeDetailId) {
        this.routeDetailId = routeDetailId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    
    

}
