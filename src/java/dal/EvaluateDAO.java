/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Evaluate;
import java.sql.PreparedStatement;

/**
 *
 * @author Admin
 */
public class EvaluateDAO extends DBContext {

    public void addEvaluate(Evaluate e) {
        String sql = "INSERT INTO [dbo].[Evaluate] (id, star, comment, accountId, routeId, routeDetailId, created_at, updated_at) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, e.getId());
            ps.setInt(2, e.getStar());
            ps.setString(3, e.getComment());
            ps.setInt(4, e.getAccountId());
            ps.setInt(5, e.getRouteId());
            ps.setInt(6, e.getRouteDetailId());
            ps.setTimestamp(7, e.getCreated_at());
            ps.setTimestamp(8, e.getUpdated_at());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
