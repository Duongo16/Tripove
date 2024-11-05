/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import model.Account;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Fantasy
 */
public class RegisterDAOTest {
    
    public RegisterDAOTest() {
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
     * Test of checkUsernameExisted method, of class RegisterDAO.
     */
//    @Test
//    public void testcheckUsernameExistedReturnTrue() {
//        RegisterDAO rd = new RegisterDAO();
//        assertEquals(true,rd.checkUsernameExisted("admin"));
//    }
//    @Test
//    public void testcheckUsernameExistedReturnFalse() {
//        RegisterDAO rd = new RegisterDAO();
//        assertEquals(false,rd.checkUsernameExisted("sdsadas"));
//    }
//    @Test
//    public void testcheckUsernameExistedReturnWrongValue() {
//        RegisterDAO rd = new RegisterDAO();
//        assertEquals(true,rd.checkUsernameExisted("admin123"));
//    }
//    
    //Email
    @Test
    public void testcheckEmailExistedReturnTrue() {
        RegisterDAO rd = new RegisterDAO();
        assertEquals(true,rd.checkEmailExisted("duongo1604@gmail.com"));
    }
    @Test
    public void testcheckEmailExistedReturnFalse() {
        RegisterDAO rd = new RegisterDAO();
        assertEquals(false,rd.checkEmailExisted("sdsadas@gmail.com"));
    }
    @Test
    public void testcheckEmailExistedReturnWrongValue() {
        RegisterDAO rd = new RegisterDAO();
        assertEquals(true,rd.checkEmailExisted("dsfsdfsd@gmail.com"));
    }
    @Test(expected = IllegalArgumentException.class)
    public void testcheckEmailExistedWithInvalidEmail() {
        RegisterDAO rd = new RegisterDAO();
        rd.checkEmailExisted("fsdfsdfsdf");
    }
}
