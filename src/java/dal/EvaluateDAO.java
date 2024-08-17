/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Evaluate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class EvaluateDAO extends DBContext {

    public static void main(String[] args) {
        EvaluateDAO ed = new EvaluateDAO();
        System.out.println(ed.getAllEvaluateByRouteId(1));
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

    public List<Evaluate> getAllEvaluateByRouteId(int routeId) {
        List<Evaluate> ls = new ArrayList<>();
        String sql = "SELECT * FROM Evaluate WHERE Route_Detailid IN ("
                + "SELECT id FROM Route_Detail WHERE Routeid = ?"
                + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, routeId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Evaluate e = new Evaluate(rs.getInt("star"), rs.getString("comment"),
                        rs.getInt("Accountid"), rs.getInt("Route_Detailid"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                ls.add(e);
            }
        } catch (Exception e) {

        }
        return ls;
    }
    
    public void deleteEvaluateByAccountId(int accountId) {
        String sql = "DELETE FROM [dbo].[Evaluate] WHERE Accountid IN ("
                + "SELECT id FROM [dbo].[Account] "
                + "WHERE id = ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
