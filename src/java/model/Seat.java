package model;

import java.sql.Date;

public class Seat {

    private int id;
    private String name;
    private int surcharge, routeDetailId, accountId;
    private Date paymentDate;
    private String pickUp;

    public Seat() {
    }

    public Seat(int id, String name, int surcharge, int routeDetailId, int accountId, Date paymentDate, String pickUp) {
        this.id = id;
        this.name = name;
        this.surcharge = surcharge;
        this.routeDetailId = routeDetailId;
        this.accountId = accountId;
        this.paymentDate = paymentDate;
        this.pickUp = pickUp;
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

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPickUp() {
        return pickUp;
    }

    public void setPickUp(String pickUp) {
        this.pickUp = pickUp;
    }

   

    
}
