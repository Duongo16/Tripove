package model;

import java.sql.Timestamp;

public class Evaluate {

    private int id;
    private int star;
    private String comment;
    private int accountId;
    private int routeId;
    private int routeDetailId;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Evaluate() {
    }

    public Evaluate(int id, int star, String comment, int accountId, int routeId, int routeDetailId, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.star = star;
        this.comment = comment;
        this.accountId = accountId;
        this.routeId = routeId;
        this.routeDetailId = routeDetailId;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public int getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(int routeDetailId) {
        this.routeDetailId = routeDetailId;
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
