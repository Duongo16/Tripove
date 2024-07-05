package dal;

import model.News;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO extends DBContext {

    public List<News> getAllNews() {
        List<News> ls = new ArrayList<>();
        String sql = "SELECT * FROM News";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
                ls.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ls;
    }

    public News getNewsById(int id) {
        String sql = "SELECT * FROM News WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"));
                return n;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addNews(News news) {
        String sql = "INSERT INTO News (title, content, image, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImage());
            ps.setTimestamp(4, news.getCreated_at());
            ps.setTimestamp(5, news.getUpdated_at());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNews(News news) {
        String sql = "UPDATE News SET title = ?, content = ?, image=?,  updated_at = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImage());
            ps.setTimestamp(4, news.getUpdated_at());
            ps.setInt(5, news.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteNewsById(int id) {
        String sql = "DELETE FROM News WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
