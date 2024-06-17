/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Route;

/**
 *
 * @author Admin
 */
public class RouteDAO extends DBContext {

    public static void main(String[] args) {
        RouteDAO rd = new RouteDAO();
//        rd.addNewRoute(new Route("Hà Nội Hải Phòng", 1000, Date.valueOf("2024-12-12"),
//                Time.valueOf("12:12:00"), new Timestamp(System.currentTimeMillis()), null, 1,
//                "98A-12345", 2));
//        rd.updateRoute(new Route(2007, "Hà Nội Hải Phòng", 10002, Date.valueOf("2024-12-12"),
//                Time.valueOf("12:12:00"), new Timestamp(System.currentTimeMillis()), null, 1,
//                "98A-12345", 2));
        System.out.println(rd.getVehicleCatImageByRouteId(1));
    }

    public List<Route> getAllRoute() {
        List<Route> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Route]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route a = new Route(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getInt("departure_Locationid"),
                        rs.getInt("arrival_Locationid"),
                        rs.getString("detail"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
                ls.add(a);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Route getRouteById(int id) {
        String sql = "SELECT * FROM [dbo].[Route] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Route(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getInt("departure_Locationid"),
                        rs.getInt("arrival_Locationid"),
                        rs.getString("detail"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateRoute(Route r) {
        String sql = "UPDATE [dbo].[Route] SET name=?, price=?, created_at=?, updated_at=?, departure_Locationid=?, arrival_Locationid=?, detail=? WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getName());
            ps.setInt(2, r.getPrice());
            ps.setTimestamp(3, r.getCreated_at());
            ps.setTimestamp(4, r.getUpdated_at());
            ps.setInt(5, r.getDeparture_Locationid());
            ps.setInt(6, r.getArrival_Locationid());
            ps.setString(7, r.getDetail());
            ps.setInt(8, r.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addNewRoute(Route r) {
        String sql = "INSERT INTO [dbo].[Route] (name, price, created_at, updated_at, departure_Locationid, arrival_Locationid, detail) VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, r.getName());
            ps.setInt(2, r.getPrice());
            ps.setTimestamp(3, r.getCreated_at());
            ps.setTimestamp(4, r.getUpdated_at());
            ps.setInt(5, r.getDeparture_Locationid());
            ps.setInt(6, r.getArrival_Locationid());
            ps.setString(7, r.getDetail());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error adding new route: " + e.getMessage());
        }
    }

    public void deleteRouteById(int id) {
        String sql = "DELETE FROM [dbo].[Route] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void deleteRouteByLicensePlate(String licensePlate) {
        String sql = "DELETE FROM [dbo].[Route] WHERE VehiclelicensePlate = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, licensePlate);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void deleteRouteByVehicleCatId(int vehicleCatId) {
        String sql = "DELETE FROM [dbo].[Route] "
                + "WHERE VehiclelicensePlate IN "
                + "(SELECT licensePlate FROM [dbo].[Vehicle] "
                + "WHERE Vehicle_Caategoryid = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, vehicleCatId);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public String getVehicleLicensePlateByRouteId(int routeId) {
        String sql = "SELECT vehiclelicensePlate FROM [dbo].[Route] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, routeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("vehiclelicensePlate");
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Route> findRoute(String name, Integer departureLocation, Integer arrivalLocation, Integer price) {
        List<Route> routes = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[Route] WHERE 1=1");

        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (departureLocation != -1) {
            sql.append(" AND departure_Locationid = ?");
        }
        if (arrivalLocation != -1) {
            sql.append(" AND arrival_Locationid = ?");
        }
        if (price != -1) {
            sql.append(" AND originPrice <= ?");
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());

            int index = 1;
            if (name != null && !name.isEmpty()) {
                ps.setString(index++, "%" + name + "%");
            }
            if (departureLocation != -1) {
                ps.setInt(index++, departureLocation);
            }
            if (arrivalLocation != -1) {
                ps.setInt(index++, arrivalLocation);
            }
            if (price != -1) {
                ps.setInt(index++, price);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Route route = new Route(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getInt("departure_Locationid"),
                        rs.getInt("arrival_Locationid"),
                        rs.getString("detail"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
                routes.add(route);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return routes;
    }

    public List<String> getVehicleCatImageByRouteId(int routeId) {
        List<String> listImage = new ArrayList<>();
        int check = 0;
        String sql = "SELECT vc.image FROM [dbo].[Vehicle_Category] vc "
                + "JOIN [dbo].[Vehicle] v ON vc.id = v.Vehicle_Categoryid "
                + "JOIN [dbo].[Route_Detail] rd ON v.licensePlate = rd.VehiclelicensePlate "
                + "WHERE rd.Routeid = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    for(String ei : listImage){
                        if(ei.equals(rs.getString("image"))){
                            check = 1;
                            break;
                        }       
                    }
                    if(check==0){
                        listImage.add(rs.getString("image"));
                    } else {
                        check = 0;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listImage;
    }
}
