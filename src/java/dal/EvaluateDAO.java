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
    
    public static void main(String[] args) {
        EvaluateDAO ed = new EvaluateDAO();
        ed.addEvaluate(new Evaluate(1, 5, "rất ok", 1, 1, null, null));
    }

    public void addEvaluate(Evaluate e) {
        String sql = "INSERT INTO [dbo].[Evaluate] (star, comment, accountId, Route_Detailid, created_at, updated_at) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, e.getStar());
            ps.setString(2, e.getComment());
            ps.setInt(3, e.getAccountId());
            ps.setInt(4, e.getRouteDetailId());
            ps.setTimestamp(5, e.getCreated_at());
            ps.setTimestamp(6, e.getUpdated_at());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

}
