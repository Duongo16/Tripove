/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Seat;

/**
 *
 * @author Admin
 */
public class SeatDAO extends DBContext {

    public static void main(String[] args) {
        SeatDAO sd = new SeatDAO();
        System.out.println(sd.getSeatByRouteDetailIdAndSeatName(1048, "S0"));;
    }

    public void addSeatForNewRouteDetail(int routeDetailId, int n) {
        String sql = "INSERT INTO [dbo].[Seat]\n"
                + "           ([name]\n"
                + "           ,[surcharge]\n"
                + "           ,[Route_Detailid])\n"
                + "     VALUES (?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            for (int i = 0; i < n; i++) {
                ps.setString(1, "S" + i);
                ps.setInt(2, 0);
                ps.setInt(3, routeDetailId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Seat> getSeatByRouteDetailId(int routeDetailId) {
        List<Seat> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Seat] WHERE Route_Detailid = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeDetailId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Seat s = new Seat(rs.getInt("id"), rs.getString("name"), rs.getInt("surcharge"), routeDetailId, rs.getInt("accountId"), rs.getDate("paymentDate"), rs.getString("pickUp"));
                ls.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public List<Seat> getSeatByRouteDetailIdAndSeatName(int routeDetailId, String seatName) {
        List<Seat> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Seat] WHERE Route_Detailid = ? AND name = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeDetailId);
            ps.setString(2, seatName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Seat s = new Seat(rs.getInt("id"), rs.getString("name"), rs.getInt("surcharge"), routeDetailId, rs.getInt("accountId"), rs.getDate("paymentDate"), rs.getString("pickUp"));
                ls.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public List<Seat> getSeatByAccountId(int accountId) {
        List<Seat> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Seat] WHERE Accountid = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Seat s = new Seat(rs.getInt("id"), rs.getString("name"), rs.getInt("surcharge"), rs.getInt("Route_Detailid"), rs.getInt("accountId"), rs.getDate("paymentDate"), rs.getString("pickUp"));
                ls.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public int getNumberOfEmptySeatByRouteDetailId(int routeDetailId) {
        String sql = "SELECT * FROM [dbo].[Seat] WHERE Route_Detailid = ? AND Accountid IS NULL";
        int num = 0;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeDetailId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    public int getNumberOfBookingByAccountId(int accountId) {
        String sql = "SELECT COUNT(*) FROM [dbo].[Seat] WHERE Accountid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void deleteSeatByVehicleCatId(int vehicleCatId) {
        String sql = "DELETE FROM [dbo].[Seat] WHERE Route_Detailid IN ("
                + "SELECT rd.id FROM [dbo].[Route_Detail] rd "
                + "JOIN [dbo].[Vehicle] v ON rd.VehiclelicensePlate = v.licensePlate "
                + "WHERE v.Vehicle_Categoryid = ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, vehicleCatId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSeatByRouteDetailId(int routeDetailId) {
        String sql = "DELETE FROM [dbo].[Seat] WHERE Route_Detailid = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeDetailId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSeatByRouteId(int routeId) {
        String sql = "DELETE FROM [dbo].[Seat] WHERE Route_Detailid IN ("
                + "SELECT id FROM [dbo].[Route_Detail] "
                + "WHERE Routeid = ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSeatByLicensePlate(String licensePlate) {
        String sql = "DELETE FROM [dbo].[Seat] WHERE Route_Detailid IN ("
                + "SELECT id FROM [dbo].[Route_Detail] WHERE VehiclelicensePlate = ?) ";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, licensePlate);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void buyTicket(String seatName, int routeDetailId, String pickUp, int accountId) {
        String sql = "UPDATE [dbo].[Seat]\n"
                + "   SET [Accountid] = ?\n"
                + "      ,[paymentDate] = ?\n"
                + "      ,[pickUp] = ?\n"
                + " WHERE name = ? AND Route_Detailid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            ps.setString(3, pickUp);
            ps.setString(4, seatName);
            ps.setInt(5, routeDetailId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
