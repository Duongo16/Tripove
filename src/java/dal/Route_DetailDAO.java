/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Route_Detail;

/**
 *
 * @author Admin
 */
public class Route_DetailDAO extends DBContext {

    public static void main(String[] args) {
        Route_DetailDAO rdd = new Route_DetailDAO();
        rdd.addRouteDetail(new Route_Detail(1, null, null, "98A-12345", new Timestamp(System.currentTimeMillis()), null));
    }

    public List<Route_Detail> getAllRouteDetail() {
        List<Route_Detail> ls = new ArrayList<>();
        String sql = "SELECT * FROM Route_Detail";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route_Detail rd = new Route_Detail(rs.getInt("id"), rs.getInt("Routeid"),
                        rs.getDate("departureDate"), rs.getTime("departureTime"), rs.getString("vehiclelicensePlate"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                ls.add(rd);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Route_Detail> getAllRouteDetailByRouteId(int rId) {
        List<Route_Detail> ls = new ArrayList<>();
        String sql = "SELECT * FROM Route_Detail WHERE Routeid = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route_Detail rd = new Route_Detail(rs.getInt("id"), rs.getInt("Routeid"),
                        rs.getDate("departureDate"), rs.getTime("departureTime"), rs.getString("vehiclelicensePlate"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                ls.add(rd);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean deleteRouteDetailById(int id) {
        String sql = "DELETE FROM Route_Detail WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Route_Detail getRouteDetailById(int id) {
        String sql = "SELECT * FROM Route_Detail WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Route_Detail(rs.getInt("id"), rs.getInt("Routeid"),
                        rs.getDate("departureDate"), rs.getTime("departureTime"), rs.getString("vehiclelicensePlate"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateRouteDetail(Route_Detail r) {
        String sql = "UPDATE Route_Detail SET Routeid = ?, departureDate = ?, departureTime = ?, vehiclelicensePlate = ?, updated_at = ? WHERE id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, r.getRouteId());
            ps.setDate(2, r.getDepartureDate());
            ps.setTime(3, r.getDepartureTime());
            ps.setString(4, r.getVehiclelicensePlate());
            ps.setTimestamp(5, r.getUpdated_at());
            ps.setInt(6, r.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addRouteDetail(Route_Detail r) {
        String sql = "INSERT INTO Route_Detail (Routeid, departureDate, departureTime, vehiclelicensePlate, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, r.getRouteId());
            ps.setDate(2, r.getDepartureDate());
            ps.setTime(3, r.getDepartureTime());
            ps.setString(4, r.getVehiclelicensePlate());
            ps.setTimestamp(5, r.getCreated_at());
            ps.setTimestamp(6, r.getUpdated_at());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}