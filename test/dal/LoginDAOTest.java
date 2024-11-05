/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.Timestamp;
import model.Account;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class LoginDAOTest {

    public LoginDAOTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of checkUsername method, of class LoginDAO.
     */
    @Test
    public void testCheckExistUsername() {
        System.out.println("checkUsername");
        LoginDAO instance = new LoginDAO();

        String username = "admin";
        boolean expResult = true;
        boolean result = instance.checkUsername(username);
        assertEquals(expResult, result);
    }

    @Test
    public void testCheckExistUsernameButUpperCase() {
        System.out.println("checkUsername");
        LoginDAO instance = new LoginDAO();

        String username = "ADMIN";
        boolean expResult = false;
        boolean result = instance.checkUsername(username);
        assertEquals(expResult, result);
    }

    @Test
    public void testCheckNotExistUsername() {
        System.out.println("checkUsername");
        LoginDAO instance = new LoginDAO();

        String username = "j97";
        boolean expResult = false;
        boolean result = instance.checkUsername(username);
        assertEquals(expResult, result);
    }

    @Test
    public void testCheckInvalidUsername() {
        System.out.println("checkUsername");
        LoginDAO instance = new LoginDAO();

        String username = "ad   min";
        boolean expResult = false;
        boolean result = instance.checkUsername(username);
        assertEquals(expResult, result);
    }

    /**
     * Test of checkPassword method, of class LoginDAO.
     */
    @Test
    public void testCheckCorrectPassword() {
        System.out.println("checkPassword");
        String username = "admin";
        String password = "123";
        LoginDAO instance = new LoginDAO();
        Account expResult = new Account(
                1, "admin", "admin", "123", "Ngô Tùng Beng", "male",
                Date.valueOf("2004-11-16"), 862521226, "duongo1604@gmail.com",
                "106, đường Vi Đức Thăng, phường Xương Giang, thành phố Bắc Giang",
                "image/avatar/avatar.jpg",
                Timestamp.valueOf("2024-06-03 09:11:32"),
                Timestamp.valueOf("2024-10-30 11:21:42"));
        Account result = instance.checkPassword(username, password);
        assertEquals(expResult.getId(), result.getId());
        assertEquals(expResult.getRole(), result.getRole());
        assertEquals(expResult.getUsername(), result.getUsername());
        assertEquals(expResult.getPassword(), result.getPassword());
        assertEquals(expResult.getName(), result.getName());
        assertEquals(expResult.getGender(), result.getGender());
        assertEquals(expResult.getDateOfBirth(), result.getDateOfBirth());
        assertEquals(expResult.getPhoneNumber(), result.getPhoneNumber());
        assertEquals(expResult.getEmail(), result.getEmail());
        assertEquals(expResult.getAddress(), result.getAddress());
        assertEquals(expResult.getImage(), result.getImage());
        assertEquals(expResult.getCreated_at().getTime() / 1000, result.getCreated_at().getTime() / 1000);
        assertEquals(expResult.getUpdated_at().getTime() / 1000, result.getUpdated_at().getTime() / 1000);
    }
    
    @Test
    public void testCheckIncorrectPassword() {
        System.out.println("checkPassword");
        String username = "admin";
        String password = "12345";
        LoginDAO instance = new LoginDAO();
        Account expResult = null;
        Account result = instance.checkPassword(username, password);
        assertEquals(expResult, result);
    }


}
