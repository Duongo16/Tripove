package model;

import java.sql.Timestamp;

public class News {

    private int id;
    private String title;
    private String content;
    private String image;
    private Timestamp created_at;
    private Timestamp updated_at;

    public News() {
    }
    
    public News(String title, String content, String image, Timestamp created_at) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.created_at = created_at;
    }
    
    public News(String title, String content, String image) {
        this.title = title;
        this.content = content;
        this.image = image;
    }
    
    public News(int id, String title, String content, String image) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
    }

    public News(int id, String title, String content, String image, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
