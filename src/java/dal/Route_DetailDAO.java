/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import model.Route_Detail;
import model.Seat;

/**
 *
 * @author Admin
 */
public class Route_DetailDAO extends DBContext {

    public static void main(String[] args) {
        Route_DetailDAO rdd = new Route_DetailDAO();
        //rdd.addRouteDetail(new Route_Detail(1, null, null, "98A-12345", new Timestamp(System.currentTimeMillis()), null));
        System.out.println(rdd.deleteRouteDetailByVehicleCatId(4));

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

    public List<Route_Detail> getAllRouteDetailByRouteIdAndDate(int routeId, Date departureDate) {
        List<Route_Detail> list = new ArrayList<>();
        String sql = "SELECT * FROM Route_Detail WHERE Routeid = ? AND departureDate = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ps.setDate(2, new Date(departureDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route_Detail rd = new Route_Detail(
                        rs.getInt("id"),
                        rs.getInt("Routeid"),
                        rs.getDate("departureDate"),
                        rs.getTime("departureTime"),
                        rs.getString("vehiclelicensePlate"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
                list.add(rd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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

    public boolean deleteRouteDetailByRouteId(int routeId) {
        String sql = "DELETE FROM Route_Detail WHERE Routeid = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, routeId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteRouteDetailByLicensePlate(String licensePlate) {
        String sql = "DELETE FROM Route_Detail WHERE VehiclelicensePlate = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, licensePlate);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteRouteDetailByVehicleCatId(int vehicleCatId) {
        String sql = "DELETE FROM Route_Detail WHERE VehiclelicensePlate IN ("
                + "SELECT licensePlate FROM Vehicle WHERE Vehicle_Categoryid = ?)" ;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, vehicleCatId);
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

    public int getLastInsertRouteDetailId() {
        String sql = "SELECT TOP 1 * FROM Route_Detail ORDER BY id DESC;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<Date> getAllUniqueDateByRouteId(int routeId) {
        List<Date> uniqueDates = new ArrayList<>();
        String sql = "SELECT DISTINCT departureDate FROM Route_Detail WHERE Routeid = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                uniqueDates.add(rs.getDate("departureDate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uniqueDates;
    }

    public List<Time> getAllUniqueTimeByRouteIdAndDate(int routeId, Date date) {
        List<Time> ls = new ArrayList<>();
        String sql = "SELECT DISTINCT departureTime FROM Route_Detail WHERE Routeid = ? AND departureDate = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ps.setDate(2, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(rs.getTime("departureTime"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ls;
    }

    public List<Route_Detail> getAllRouteDetailByDateAndTime(int routeId, Date departureDate, Time departureTime) {
        List<Route_Detail> routeDetails = new ArrayList<>();
        String sql = "SELECT * FROM Route_Detail WHERE Routeid = ? AND departureDate = ? AND departureTime  =? ";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ps.setString(2, departureDate.toString());
            ps.setString(3, departureTime.toString());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route_Detail rd = new Route_Detail(
                        rs.getInt("id"),
                        rs.getInt("Routeid"),
                        rs.getDate("departureDate"),
                        rs.getTime("departureTime"),
                        rs.getString("vehiclelicensePlate"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
                routeDetails.add(rd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return routeDetails;
    }

    public List<Seat> getAllSeatByRouteDetailId(int routeDetailId) {
        List<Seat> seats = new ArrayList<>();
        String sql = "SELECT * FROM Seat WHERE Route_Detailid = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeDetailId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Seat seat = new Seat(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("surcharge"),
                        rs.getInt("Route_Detailid"),
                        rs.getInt("accountId"));
                seats.add(seat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return seats;
    }

}
