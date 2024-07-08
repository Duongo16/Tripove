/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author Admin
 */
public class RegisterDAO extends DBContext {

    public boolean checkUsernameExisted(String username) {
        String sql = "select * from Account where username=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }
    
    public boolean checkEmailExisted(String email) {
        String sql = "select * from Account where email=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }

    public void addNew(Account a) {
        String sql = "INSERT INTO [dbo].[Account]("
                + "[username],[password],[name],[email],[created_at], [role]) "
                + "VALUES(?,?,?,?,?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getName());
            st.setString(4, a.getEmail());
            st.setTimestamp(5, a.getCreated_at());
            st.setString(6, "user");
            st.executeQuery();
        } catch (Exception e) {
        }
    }

}
