/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.List;
import model.Evaluate;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author phung
 */
public class EvaluateDAOTest {
    
    public EvaluateDAOTest() {
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
     * Test of addEvaluate method, of class EvaluateDAO.
     */
    @Test
    public void testAddEvaluate() {
        System.out.println("addEvaluate");
        Timestamp created_at = Timestamp.valueOf("2024-07-04 17:29:50.887");
        Timestamp updated_at = Timestamp.valueOf("2024-07-05 11:37:44.603");
        Evaluate e = new Evaluate(5, "abc", 1, 1048, created_at, updated_at);
        EvaluateDAO instance = new EvaluateDAO();
        boolean expResult = instance.addEvaluate(e);
        boolean result = true;
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getAllEvaluateByRouteId method, of class EvaluateDAO.
     */
//    @Test
//    public void testGetAllEvaluateByRouteId() {
//        System.out.println("getAllEvaluateByRouteId");
//        int routeId = 0;
//        EvaluateDAO instance = new EvaluateDAO();
//        List<Evaluate> expResult = null;
//        List<Evaluate> result = instance.getAllEvaluateByRouteId(routeId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of deleteEvaluateByAccountId method, of class EvaluateDAO.
     */
    @Test
    public void testDeleteEvaluateByAccountId() {
        System.out.println("deleteEvaluateByAccountId");
        int accountId = 1;
        EvaluateDAO instance = new EvaluateDAO();
        boolean expResult = instance.deleteEvaluateByAccountId(accountId);
        boolean result = true;
        assertEquals(expResult, result);
    }
    
}
