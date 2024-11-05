/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    private final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();

        a.deleteAccount(11);
    }

    public boolean addNewAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account] "
                + "([role], [username], [password], [name], [gender], [dateOfBirth], "
                + "[phoneNumber], [email], [address], [image], [created_at]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getRole());
            ps.setString(2, a.getUsername());
            ps.setString(3, a.getPassword());
            ps.setString(4, a.getName());
            ps.setString(5, a.getGender());
            ps.setDate(6, a.getDateOfBirth());
            ps.setInt(7, a.getPhoneNumber());
            ps.setString(8, a.getEmail());
            ps.setString(9, a.getAddress());
            ps.setString(10, a.getImage());
            ps.setTimestamp(11, a.getCreated_at());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public void updateAccount(Account a) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [name] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[dateOfBirth] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[updated_at] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getName());
            ps.setString(2, a.getGender());
            ps.setDate(3, a.getDateOfBirth());
            ps.setInt(4, a.getPhoneNumber());
            ps.setString(5, a.getEmail());
            ps.setString(6, a.getAddress());
            ps.setTimestamp(7, a.getUpdated_at());
            ps.setString(8, a.getImage());
            ps.setInt(9, a.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateDetailAccount(Account a) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [role] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[dateOfBirth] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[updated_at] = ?\n"
                + " WHERE [id]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getRole());
            ps.setString(2, a.getUsername());
            ps.setString(3, a.getPassword());
            ps.setString(4, a.getName());
            ps.setString(5, a.getGender());
            ps.setDate(6, a.getDateOfBirth());
            ps.setInt(7, a.getPhoneNumber());
            ps.setString(8, a.getEmail());
            ps.setString(9, a.getAddress());
            ps.setString(10, a.getImage());
            ps.setTimestamp(11, a.getUpdated_at());
            ps.setInt(12, a.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteAccount(int id) {
        String sql = "delete from [dbo].[Account] where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByUsername(String username) {
        String sql = "select * from [dbo].[Account] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("role"), rs.getString("username"),
                        rs.getString("password"), rs.getString("name"), rs.getString("gender"),
                        rs.getDate("dateOfBirth"), rs.getInt("phoneNumber"), rs.getString("email"),
                        rs.getString("address"), rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountById(int id) {
        String sql = "select * from [dbo].[Account] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("role"), rs.getString("username"),
                        rs.getString("password"), rs.getString("name"), rs.getString("gender"),
                        rs.getDate("dateOfBirth"), rs.getInt("phoneNumber"), rs.getString("email"),
                        rs.getString("address"), rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getNameById(int id) {
        String sql = "SELECT name FROM [dbo].[Account] WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getIdByUsername(String username) {
        String sql = "select id from [dbo].[Account] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public List<Account> getAllAccount() {
        List<Account> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Account]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("id"), rs.getString("role"), rs.getString("username"),
                        rs.getString("password"), rs.getString("name"), rs.getString("gender"),
                        rs.getDate("dateOfBirth"), rs.getInt("phoneNumber"), rs.getString("email"),
                        rs.getString("address"), rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at"));
                ls.add(a);
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getAllAccount(int index, int numOfPage) {
        List<Account> ls = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Account] ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, numOfPage * (index - 1));
            ps.setInt(2, numOfPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt("id"),
                        rs.getString("role"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getDate("dateOfBirth"),
                        rs.getInt("phoneNumber"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
                ls.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ls;
    }

    public List<Account> findAccounts(String role, String name, String phoneNumber) {
        List<Account> ls = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[Account] WHERE 1=1");

        if (role != null && !role.isEmpty()) {
            sql.append(" AND role = ?");
        }
        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (phoneNumber != null && !phoneNumber.isEmpty()) {
            sql.append(" AND phoneNumber LIKE ?");
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());
            int i = 1;
            if (role != null && !role.isEmpty()) {
                ps.setString(i++, role);
            }
            if (name != null && !name.isEmpty()) {
                ps.setString(i++, "%" + name + "%");
            }
            if (phoneNumber != null && !phoneNumber.isEmpty()) {
                String vp = phoneNumber;
                if (vp.startsWith("0")) {
                    vp = vp.substring(1);
                }
                ps.setString(i++, "%" + vp + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt("id"), rs.getString("role"), rs.getString("username"),
                        rs.getString("password"), rs.getString("name"), rs.getString("gender"),
                        rs.getDate("dateOfBirth"), rs.getInt("phoneNumber"), rs.getString("email"),
                        rs.getString("address"), rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at")
                );
                ls.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public List<Account> findAccounts(String role, String name, String phoneNumber, int index, int numOfPage) {
        List<Account> ls = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM [dbo].[Account] WHERE 1=1");

        if (role != null && !role.isEmpty()) {
            sql.append(" AND role = ?");
        }
        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (phoneNumber != null && !phoneNumber.isEmpty()) {
            sql.append(" AND phoneNumber LIKE ?");
        }

        sql.append(" ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());
            int i = 1;
            if (role != null && !role.isEmpty()) {
                ps.setString(i++, role);
            }
            if (name != null && !name.isEmpty()) {
                ps.setString(i++, "%" + name + "%");
            }
            if (phoneNumber != null && !phoneNumber.isEmpty()) {
                String vp = phoneNumber;
                if (vp.startsWith("0")) {
                    vp = vp.substring(1);
                }
                ps.setString(i++, "%" + vp + "%");
            }
            ps.setInt(i++, numOfPage * (index - 1));
            ps.setInt(i++, numOfPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt("id"), rs.getString("role"), rs.getString("username"),
                        rs.getString("password"), rs.getString("name"), rs.getString("gender"),
                        rs.getDate("dateOfBirth"), rs.getInt("phoneNumber"), rs.getString("email"),
                        rs.getString("address"), rs.getString("image"),
                        rs.getTimestamp("created_at"), rs.getTimestamp("updated_at")
                );
                ls.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public boolean emailStatus(String email) {
        String sql = "SELECT * FROM [dbo].[Account] WHERE email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String generateRandomString() {
        StringBuilder sb = new StringBuilder(8);
        Random r = new Random();
        for (int i = 0; i < 8; i++) {
            int index = r.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }
        return sb.toString();
    }

    public void changePassword(String email, String newPassword) {
        String updateSql = "UPDATE [dbo].[Account] SET password = ? WHERE email = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(updateSql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getNumberOfAccounts() {
        String sql = "SELECT COUNT(*) FROM [dbo].[Account]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getNumberOfFilteredAccounts(String role, String name, String phoneNumber) {
        String sql = "SELECT COUNT(*) FROM [dbo].[Account] WHERE 1=1";

        if (role != null && !role.isEmpty()) {
            sql += " AND role = ?";
        }
        if (name != null && !name.isEmpty()) {
            sql += " AND name LIKE ?";
        }
        if (phoneNumber != null && !phoneNumber.isEmpty()) {
            sql += " AND phoneNumber LIKE ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int i = 1;
            if (role != null && !role.isEmpty()) {
                ps.setString(i++, role);
            }
            if (name != null && !name.isEmpty()) {
                ps.setString(i++, "%" + name + "%");
            }
            if (phoneNumber != null && !phoneNumber.isEmpty()) {
                String vp = phoneNumber;
                if (vp.startsWith("0")) {
                    vp = vp.substring(1);
                }
                ps.setString(i++, "%" + vp + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public String getImageByAccountId(int accountId) {
        String sql = "SELECT image FROM [dbo].[Account] WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("image");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
