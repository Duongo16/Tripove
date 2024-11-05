/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.List;
import model.Location;
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
public class LocationDAOTest {
    
    public LocationDAOTest() {
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
     * Test of getAllLocation method, of class LocationDAO.
     */
    @Test
    public void testGetLocationByIdReturnNull() {
        LocationDAO ld = new LocationDAO();
        String name = ld.getLocationNameById2("1");
        assertEquals(null, name);
    }
    @Test
    public void testGetLocationNameByIdReturnLocationName() {
        LocationDAO ld = new LocationDAO();
        String name = ld.getLocationNameById2("64");
        assertEquals("An Giang", name);
    }
    @Test(expected = java.lang.NumberFormatException.class)
    public void testInvalidId() {
        LocationDAO ld = new LocationDAO();
        ld.getLocationNameById2("abcd");
        
    }
    @Test(expected = IllegalArgumentException.class)
    public void testInvalidId2() {
        LocationDAO ld = new LocationDAO();
        String name = ld.getLocationNameById2("-64");
        
    }
    @Test
    public void testGetLocationNameByIdReturnWrongLocationName() {
        LocationDAO ld = new LocationDAO();
        String name = ld.getLocationNameById2("63");
        assertEquals("An Giang", name);
    }
}
