/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;


import java.sql.Timestamp;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import model.Route;
import model.Route_Detail;
import model.Seat;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author user
 */
public class Route_DetailDAOTest {
    
    public Route_DetailDAOTest() {
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
     * Test of deleteRouteDetailByVehicleCatId method, of class Route_DetailDAO.
     */
    @Test
    public void testDeleteRouteDetailByVehicleCatId() {
        System.out.println("deleteRouteDetailByVehicleCatId");
        Route_DetailDAO instance = new Route_DetailDAO();
        int vehicleCatId = 2;
        boolean expResult = true;
        boolean result = instance.deleteRouteDetailByVehicleCatId(vehicleCatId);
        assertEquals(expResult, result);
    }
     @Test
    public void testDeleteRouteDetailByVehicleCatId2() {
        System.out.println("deleteRouteDetailByVehicleCatId");
        Route_DetailDAO instance = new Route_DetailDAO();
        int vehicleCatId2 = 22222;
        boolean expResult2 = false;
        boolean result2 = instance.deleteRouteDetailByVehicleCatId(vehicleCatId2);
        assertEquals(expResult2, result2);
    }
    
    @Test
    public void testGetRouteDetailById() {
        System.out.println("getRouteDetailById");
        Route_DetailDAO instance = new Route_DetailDAO();
        int id = 1;
        Route_Detail expResult = null;
        Route_Detail result = instance.getRouteDetailById(id);
        assertEquals(expResult, result);
    }
     @Test(expected = NumberFormatException.class)
     public void testGetRouteDetailById2() {
        System.out.println("getRouteDetailById");
        Route_DetailDAO instance = new Route_DetailDAO();
        int id2 = 1048;
        Route_Detail expResult2 = new Route_Detail(1048, 1, Date.valueOf("2004-11-16"), 
                Time.valueOf("05:00:00.0000000"), "98A-22222",
                Timestamp.valueOf("2024-06-27 16:59:41.473"),Timestamp.valueOf("2024-10-28 19:54:34.853"));
        Route_Detail result2 = instance.getRouteDetailById(id2);
    }
     
        
    @Test
    public void testGetPriceByRouteDetailId() {
        System.out.println("getPriceByRouteDetailId");
        Route_DetailDAO instance = new Route_DetailDAO();
        int routeDetailId = 1048;
        int expResult = 90000;
        int result = instance.getPriceByRouteDetailId(routeDetailId);
        assertEquals(expResult, result);
    }
     @Test
    public void testGetPriceByRouteDetailId2() {
        System.out.println("getPriceByRouteDetailId");
        Route_DetailDAO instance = new Route_DetailDAO();
        int routeDetailId = 1000;
        int expResult = 0;
        int result = instance.getPriceByRouteDetailId(routeDetailId);
        assertEquals(expResult, result);
    }
    
}
