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
import model.Vehicle;

/**
 *
 * @author Admin
 */
public class VehicleDAO extends DBContext {

    public static void main(String[] args) {
        VehicleDAO vd = new VehicleDAO();
        System.out.println(vd.findVehicle("98A", null, 10));
    }
    public List<Vehicle> getAllVehicle() {
        List<Vehicle> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Vehicle]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle a = new Vehicle(rs.getString("licensePlate"), rs.getInt("status"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("vehicle_Categoryid"), rs.getString("image"));
                ls.add(a);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Vehicle getVehicleById(String licensePlate) {
        String sql = "select * from [dbo].[Vehicle] where licensePlate = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, licensePlate);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Vehicle a = new Vehicle(rs.getString("licensePlate"), rs.getInt("status"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("vehicle_Categoryid"), rs.getString("image"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteVehicle(String licensePlate) {
        String sql = "delete from [dbo].[Vehicle] where licensePlate=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, licensePlate);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateVehicle(Vehicle vehicle) {
        String sql = "UPDATE [dbo].[Vehicle] SET status = ?, created_at = ?, updated_at = ?, vehicle_Categoryid = ?, image = ? WHERE licensePlate = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, vehicle.getStatus());
            st.setTimestamp(2, vehicle.getCreated_at());
            st.setTimestamp(3, vehicle.getUpdated_at());
            st.setInt(4, vehicle.getVehicle_Categoryid());
            st.setString(5, vehicle.getImage());
            st.setString(6, vehicle.getLicensePlate());

            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addNewVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO [dbo].[Vehicle] (licensePlate, status, created_at, updated_at, vehicle_Categoryid, image) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, vehicle.getLicensePlate());
            st.setInt(2, vehicle.getStatus());
            st.setTimestamp(3, vehicle.getCreated_at());
            st.setTimestamp(4, vehicle.getUpdated_at());
            st.setInt(5, vehicle.getVehicle_Categoryid());
            st.setString(6, vehicle.getImage());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteVehicleByVehicleCatId(int id) {
        String sql = "DELETE FROM [dbo].[Vehicle]\n"
                + "      WHERE vehicle_Categoryid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Vehicle> findVehicle(String licensePlate, String vehicleCat, int status) {
        List<Vehicle> ls = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[Vehicle] WHERE 1=1");

        if (licensePlate != null && !licensePlate.isEmpty()) {
            sql.append(" AND licensePlate LIKE ?");
        }
        if (vehicleCat != null && !vehicleCat.isEmpty()) {
            sql.append(" AND Vehicle_Categoryid = ?");
        }
        if (status != 0) {
            sql.append(" AND status = ?");
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());

            int i = 1;
            if (licensePlate != null && !licensePlate.isEmpty()) {
                ps.setString(i++, "%" + licensePlate + "%");
            }
            if (vehicleCat != null && !vehicleCat.isEmpty()) {
                ps.setString(i++, vehicleCat);
            }
            if (status != 0) {
                ps.setInt(i++, status);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle a = new Vehicle(rs.getString("licensePlate"), rs.getInt("status"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getInt("vehicle_Categoryid"), rs.getString("image"));
                ls.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ls;
    }
}
