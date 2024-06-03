package model;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.LinkedList;

public class Account {
	private int id;
	private String role;
	private String username;
	private String password;
	private String name;
	private String gender;
	private Date dateOfBirth;
	private Integer phoneNumber;
	private String email;
	private String address;
	private String image;
	private Timestamp created_at;
	private Timestamp updated_at;
	public LinkedList<Evaluate> evaluate = new LinkedList<Evaluate>();
	public LinkedList<Ticket> ticket = new LinkedList<Ticket>();
	public LinkedList<Discount> discount = new LinkedList<Discount>();

    public Account() {
    }

    public Account(int id, String role, String username, String password, String name, String gender, Date dateOfBirth, Integer phoneNumber, String email, String address, String image, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.role = role;
        this.username = username;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.image = image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    
    public Account(int id, String role, String username, String name, String gender, Date dateOfBirth, Integer phoneNumber, String email, String address, String image, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.role = role;
        this.username = username;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.image = image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    
    public Account(String role, String username, String password, String name, String gender, Date dateOfBirth, Integer phoneNumber, String email, String address, String image, Timestamp created_at, Timestamp updated_at) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.image = image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    
    public Account(String role, String username, String password, String name, String gender, Date dateOfBirth, Integer phoneNumber, String email, String address, String image, Timestamp created_at) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.image = image;
        this.created_at = created_at;
    }
    
    public Account(String name, String username, String password, String email, Timestamp created_at) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.created_at = created_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public LinkedList<Evaluate> getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(LinkedList<Evaluate> evaluate) {
        this.evaluate = evaluate;
    }

    public LinkedList<Ticket> getTicket() {
        return ticket;
    }

    public void setTicket(LinkedList<Ticket> ticket) {
        this.ticket = ticket;
    }

    public LinkedList<Discount> getDiscount() {
        return discount;
    }

    public void setDiscount(LinkedList<Discount> discount) {
        this.discount = discount;
    }
        
        
}