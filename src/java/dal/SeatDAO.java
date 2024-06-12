/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class SeatDAO extends DBContext {
    
    public static void main(String[] args) {
        SeatDAO sd = new SeatDAO();
        sd.addSeatForNewRouteDetail(15, 6);
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
                ps.setString(1, "S"+i);
                ps.setInt(2, 0);
                ps.setInt(3, routeDetailId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
