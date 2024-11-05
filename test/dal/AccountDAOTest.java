/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
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
public class AccountDAOTest {
    
    public AccountDAOTest() {
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
     * Test of main method, of class AccountDAO.
     */
//    @Test
//    public void testMain() {
//        System.out.println("main");
//        String[] args = null;
//        AccountDAO.main(args);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of addNewAccount method, of class AccountDAO.
     */
    @Test
    public void testAddNewAccount() {
        System.out.println("addNewAccount");
        Account a = new Account("admin", "j97", "1234", "Trinh Tran Phuong Tuan", "male",Date.valueOf("2005-11-10"),
                833432342, "j97@gmail.com", "", "", new Timestamp(System.currentTimeMillis()), null);
        AccountDAO instance = new AccountDAO();
        boolean expResult = true;
        boolean result = instance.addNewAccount(a);
        assertEquals(expResult, result);
    }

    /**
     * Test of updateAccount method, of class AccountDAO.
     */
//    @Test
//    public void testUpdateAccount() {
//        System.out.println("updateAccount");
//        Account a = null;
//        AccountDAO instance = new AccountDAO();
//        instance.updateAccount(a);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of updateDetailAccount method, of class AccountDAO.
//     */
//    @Test
//    public void testUpdateDetailAccount() {
//        System.out.println("updateDetailAccount");
//        Account a = null;
//        AccountDAO instance = new AccountDAO();
//        instance.updateDetailAccount(a);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of deleteAccount method, of class AccountDAO.
//     */
//    @Test
//    public void testDeleteAccount() {
//        System.out.println("deleteAccount");
//        int id = 0;
//        AccountDAO instance = new AccountDAO();
//        instance.deleteAccount(id);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

//    /**
//     * Test of getAccountByUsername method, of class AccountDAO.
//     */
//    @Test
//    public void testGetAccountByUsername() {
//        System.out.println("getAccountByUsername");
//        String username = "";
//        AccountDAO instance = new AccountDAO();
//        Account expResult = null;
//        Account result = instance.getAccountByUsername(username);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getAccountById method, of class AccountDAO.
     */
    @Test
    public void testGetAccountById() {
        System.out.println("getAccountById");
        int id = 1;
        AccountDAO instance = new AccountDAO();

        Account expResult = new Account(
                1, "admin", "admin", "123", "Ngô Tùng Beng", "male",
                Date.valueOf("2004-11-16"), 862521226, "duongo1604@gmail.com",
                "106, đường Vi Đức Thăng, phường Xương Giang, thành phố Bắc Giang",
                "image/avatar/avatar.jpg",
                Timestamp.valueOf("2024-06-03 09:11:32"),
                Timestamp.valueOf("2024-10-30 11:21:42"));

        Account result = instance.getAccountById(id); 

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

    /**
     * Test of getNameById method, of class AccountDAO.
     */
//    @Test
//    public void testGetNameById() {
//        System.out.println("getNameById");
//        int id = 0;
//        AccountDAO instance = new AccountDAO();
//        String expResult = "";
//        String result = instance.getNameById(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getIdByUsername method, of class AccountDAO.
//     */
//    @Test
//    public void testGetIdByUsername() {
//        System.out.println("getIdByUsername");
//        String username = "";
//        AccountDAO instance = new AccountDAO();
//        int expResult = 0;
//        int result = instance.getIdByUsername(username);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAllAccount method, of class AccountDAO.
//     */
//    @Test
//    public void testGetAllAccount_0args() {
//        System.out.println("getAllAccount");
//        AccountDAO instance = new AccountDAO();
//        List<Account> expResult = null;
//        List<Account> result = instance.getAllAccount();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getAllAccount method, of class AccountDAO.
//     */
//    @Test
//    public void testGetAllAccount_int_int() {
//        System.out.println("getAllAccount");
//        int index = 0;
//        int numOfPage = 0;
//        AccountDAO instance = new AccountDAO();
//        List<Account> expResult = null;
//        List<Account> result = instance.getAllAccount(index, numOfPage);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of findAccounts method, of class AccountDAO.
//     */
//    @Test
//    public void testFindAccounts_3args() {
//        System.out.println("findAccounts");
//        String role = "";
//        String name = "";
//        String phoneNumber = "";
//        AccountDAO instance = new AccountDAO();
//        List<Account> expResult = null;
//        List<Account> result = instance.findAccounts(role, name, phoneNumber);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of findAccounts method, of class AccountDAO.
//     */
//    @Test
//    public void testFindAccounts_5args() {
//        System.out.println("findAccounts");
//        String role = "";
//        String name = "";
//        String phoneNumber = "";
//        int index = 0;
//        int numOfPage = 0;
//        AccountDAO instance = new AccountDAO();
//        List<Account> expResult = null;
//        List<Account> result = instance.findAccounts(role, name, phoneNumber, index, numOfPage);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of emailStatus method, of class AccountDAO.
//     */
//    @Test
//    public void testEmailStatus() {
//        System.out.println("emailStatus");
//        String email = "";
//        AccountDAO instance = new AccountDAO();
//        boolean expResult = false;
//        boolean result = instance.emailStatus(email);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of generateRandomString method, of class AccountDAO.
//     */
//    @Test
//    public void testGenerateRandomString() {
//        System.out.println("generateRandomString");
//        AccountDAO instance = new AccountDAO();
//        String expResult = "";
//        String result = instance.generateRandomString();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of changePassword method, of class AccountDAO.
//     */
//    @Test
//    public void testChangePassword() {
//        System.out.println("changePassword");
//        String email = "";
//        String newPassword = "";
//        AccountDAO instance = new AccountDAO();
//        instance.changePassword(email, newPassword);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getNumberOfAccounts method, of class AccountDAO.
//     */
//    @Test
//    public void testGetNumberOfAccounts() {
//        System.out.println("getNumberOfAccounts");
//        AccountDAO instance = new AccountDAO();
//        int expResult = 0;
//        int result = instance.getNumberOfAccounts();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getNumberOfFilteredAccounts method, of class AccountDAO.
//     */
//    @Test
//    public void testGetNumberOfFilteredAccounts() {
//        System.out.println("getNumberOfFilteredAccounts");
//        String role = "";
//        String name = "";
//        String phoneNumber = "";
//        AccountDAO instance = new AccountDAO();
//        int expResult = 0;
//        int result = instance.getNumberOfFilteredAccounts(role, name, phoneNumber);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getImageByAccountId method, of class AccountDAO.
//     */
//    @Test
//    public void testGetImageByAccountId() {
//        System.out.println("getImageByAccountId");
//        int accountId = 0;
//        AccountDAO instance = new AccountDAO();
//        String expResult = "";
//        String result = instance.getImageByAccountId(accountId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
