// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.Habitacle;
import ad.uda.pfc.domain.HabitacleDataOnDemand;
import ad.uda.pfc.domain.HabitacleIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HabitacleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: HabitacleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: HabitacleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: HabitacleIntegrationTest: @Transactional;
    
    @Autowired
    private HabitacleDataOnDemand HabitacleIntegrationTest.dod;
    
    @Test
    public void HabitacleIntegrationTest.testCountHabitacles() {
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", dod.getRandomHabitacle());
        long count = Habitacle.countHabitacles();
        Assert.assertTrue("Counter for 'Habitacle' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void HabitacleIntegrationTest.testFindHabitacle() {
        Habitacle obj = dod.getRandomHabitacle();
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to provide an identifier", id);
        obj = Habitacle.findHabitacle(id);
        Assert.assertNotNull("Find method for 'Habitacle' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Habitacle' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void HabitacleIntegrationTest.testFindAllHabitacles() {
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", dod.getRandomHabitacle());
        long count = Habitacle.countHabitacles();
        Assert.assertTrue("Too expensive to perform a find all test for 'Habitacle', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Habitacle> result = Habitacle.findAllHabitacles();
        Assert.assertNotNull("Find all method for 'Habitacle' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Habitacle' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void HabitacleIntegrationTest.testFindHabitacleEntries() {
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", dod.getRandomHabitacle());
        long count = Habitacle.countHabitacles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Habitacle> result = Habitacle.findHabitacleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Habitacle' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Habitacle' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void HabitacleIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", dod.getRandomHabitacle());
        Habitacle obj = dod.getNewTransientHabitacle(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Habitacle' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Habitacle' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void HabitacleIntegrationTest.testRemove() {
        Habitacle obj = dod.getRandomHabitacle();
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Habitacle' failed to provide an identifier", id);
        obj = Habitacle.findHabitacle(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Habitacle' with identifier '" + id + "'", Habitacle.findHabitacle(id));
    }
    
}
