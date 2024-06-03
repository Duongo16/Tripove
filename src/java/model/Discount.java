package model;

import java.sql.Timestamp;

public class Discount {

    private int id;
    private int value;
    private Timestamp start_at;
    private Timestamp end_at;
    private Timestamp created_at;
    private Timestamp updated_at;
    public Account account;

    public Discount() {
    }

    public Discount(int id, int value, Timestamp start_at, Timestamp end_at, Timestamp created_at, Timestamp updated_at, Account account) {
        this.id = id;
        this.value = value;
        this.start_at = start_at;
        this.end_at = end_at;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.account = account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Timestamp getStart_at() {
        return start_at;
    }

    public void setStart_at(Timestamp start_at) {
        this.start_at = start_at;
    }

    public Timestamp getEnd_at() {
        return end_at;
    }

    public void setEnd_at(Timestamp end_at) {
        this.end_at = end_at;
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

}
