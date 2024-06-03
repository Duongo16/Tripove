/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author Admin
 */
public class LoginDAO extends DBContext {

    public boolean checkUsername(String username) {
        String sql = "select * from Account where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            } else return false;
        } catch (Exception e) {
        }
        return false;
    }
    
    public Account checkPassword(String username, String password) {
        String sql = "select * from Account where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"),
                        rs.getString("role"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getDate("dateOfBirth"),
                        rs.getInt("phoneNumber"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
