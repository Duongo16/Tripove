/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Location;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class LocationDAO extends DBContext {

    public List<Location> getAllLocation() {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Location]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location location = new Location();
                location.setId(rs.getInt("id"));
                location.setName(rs.getString("name"));
                locations.add(location);
            }
        } catch (Exception e) {
        }
        return locations;
    }

    public String getLocationNameById(int id) {
        String locationName = null;
        String sql = "SELECT name FROM [dbo].[Location] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                locationName = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locationName;
    }

    public String getLocationNameById2(String id) {
        String locationName = null;
        String sql = "SELECT name FROM [dbo].[Location] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                locationName = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locationName;
    }

}
