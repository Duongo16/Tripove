package model;

import java.sql.Timestamp;

public class Ticket {

    private int id;
    private String payment;
    private Timestamp paymentDate;
    public Route route;
    public Account account;
    public Seat seat;

    public Ticket() {
    }

    public Ticket(int id, String payment, Timestamp paymentDate, Route route, Account account, Seat seat) {
        this.id = id;
        this.payment = payment;
        this.paymentDate = paymentDate;
        this.route = route;
        this.account = account;
        this.seat = seat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

}
