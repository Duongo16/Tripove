/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Vehicle_Category;

/**
 *
 * @author Admin
 */
public class VehicleCatDAO extends DBContext {

    public static void main(String[] args) {
        VehicleCatDAO v = new VehicleCatDAO();
        List<Vehicle_Category> ls = v.findVehicleCat(null, "Cabin", 0);
        System.out.println(ls);
    }

    public List<Vehicle_Category> getAllVehicleCat() {
        List<Vehicle_Category> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Vehicle_Category]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle_Category a = new Vehicle_Category(rs.getInt("id"), rs.getString("name"), rs.getString("seatType"),
                        rs.getInt("seatQuantity"), rs.getString("utilities"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getString("image"));
                ls.add(a);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Vehicle_Category getVehicleCatById(int id) {
        String sql = "select * from [dbo].[Vehicle_Category] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Vehicle_Category a = new Vehicle_Category(rs.getInt("id"), rs.getString("name"), rs.getString("seatType"),
                        rs.getInt("seatQuantity"), rs.getString("utilities"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getString("image"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Vehicle_Category getVehicleCatByName(String name) {
        String sql = "select * from [dbo].[Vehicle_Category] where name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Vehicle_Category a = new Vehicle_Category(rs.getInt("id"), rs.getString("name"), rs.getString("seatType"),
                        rs.getInt("seatQuantity"), rs.getString("utilities"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"), rs.getString("image"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String getVehicleCatNameById(int id) {
        String sql = "SELECT name FROM [dbo].[Vehicle_Category] WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteVehicleCat(int id) {
        String sql = "delete from [dbo].[Vehicle_Category] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateVehicleCat(Vehicle_Category o) {
        String sql = "UPDATE [dbo].[Vehicle_Category]\n"
                + "   SET [name] = ?\n"
                + "      ,[utilities] = ?\n"
                + "      ,[updated_at] = ?\n"
                + "      ,[seatQuantity] = ?\n"
                + "      ,[seatType] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE [id]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getName());
            ps.setString(2, o.getUtilities());
            ps.setTimestamp(3, o.getUpdated_at());
            ps.setInt(4, o.getSeatQuantity());
            ps.setString(5, o.getSeatType());
            ps.setString(6, o.getImage());
            ps.setInt(7, o.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public int addNewVehicleCat(Vehicle_Category o) {
        String sql = "INSERT INTO [dbo].[Vehicle_Category]\n"
                + "           ([name]\n"
                + "           ,[utilities]\n"
                + "           ,[created_at]\n"
                + "           ,[seatQuantity]\n"
                + "           ,[seatType])\n"
                + "           ,[image])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getName());
            ps.setString(2, o.getUtilities());
            ps.setTimestamp(3, o.getCreated_at());
            ps.setInt(4, o.getSeatQuantity());
            ps.setString(5, o.getSeatType());
            ps.setString(6, o.getImage());
            ps.executeUpdate();
            return 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public void addSeatForVehicleCat(Vehicle_Category o) {
        String sql = "INSERT INTO [dbo].[Seat]\n"
                + "           ([name]\n"
                + "           ,[Vehicle_Categoryid])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            for (int i = 1; i <= o.getSeatQuantity(); i++) {
                ps.setString(1, ("S" + i));
                ps.setInt(2, o.getId());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void getAllSeatByVehicleCatId(int id) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Seat]\n"
                + "  WHERE [Vehicle_Categoryid] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void deleteSeatByVehicleCatId(int vehicleCatId) {
        String sql = "DELETE FROM [dbo].[Seat] WHERE Vehicle_Categoryid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, vehicleCatId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Vehicle_Category> findVehicleCat(String name, String seatType, Integer seatQuantity) {
        List<Vehicle_Category> ls = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[Vehicle_Category] WHERE 1=1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (seatType != null && !seatType.isEmpty()) {
            sql.append(" AND seatType = ?");
        }
        if (seatQuantity != 0) {
            sql.append(" AND seatQuantity = ?");
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());

            int i = 1;
            if (name != null && !name.isEmpty()) {
                ps.setString(i++, "%" + name + "%");
            }
            if (seatType != null && !seatType.isEmpty()) {
                ps.setString(i++, seatType);
            }
            if (seatQuantity != 0) {
                ps.setInt(i++, seatQuantity);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle_Category a = new Vehicle_Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("seatType"),
                        rs.getInt("seatQuantity"),
                        rs.getString("utilities"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("image")
                );
                ls.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ls;
    }

}
