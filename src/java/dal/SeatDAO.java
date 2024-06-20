/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;

/**
 *
 * @author Admin
 */
public class SeatDAO extends DBContext {

    public static void main(String[] args) {
        SeatDAO sd = new SeatDAO();
        sd.deleteSeatByVehicleCatId(3);
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

}
