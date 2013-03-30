// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.HabitacleDataOnDemand;
import ad.uda.pfc.domain.Sensor;
import ad.uda.pfc.domain.SensorDataOnDemand;
import ad.uda.pfc.domain.TipusSensorDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect SensorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SensorDataOnDemand: @Component;
    
    private Random SensorDataOnDemand.rnd = new SecureRandom();
    
    private List<Sensor> SensorDataOnDemand.data;
    
    @Autowired
    private HabitacleDataOnDemand SensorDataOnDemand.habitacleDataOnDemand;
    
    @Autowired
    private TipusSensorDataOnDemand SensorDataOnDemand.tipusSensorDataOnDemand;
    
    public Sensor SensorDataOnDemand.getNewTransientSensor(int index) {
        Sensor obj = new Sensor();
        setDescripcio(obj, index);
        return obj;
    }
    
    public void SensorDataOnDemand.setDescripcio(Sensor obj, int index) {
        String descripcio = "descripcio_" + index;
        if (descripcio.length() > 250) {
            descripcio = descripcio.substring(0, 250);
        }
        obj.setDescripcio(descripcio);
    }
    
    public Sensor SensorDataOnDemand.getSpecificSensor(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Sensor obj = data.get(index);
        Integer id = obj.getId();
        return Sensor.findSensor(id);
    }
    
    public Sensor SensorDataOnDemand.getRandomSensor() {
        init();
        Sensor obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return Sensor.findSensor(id);
    }
    
    public boolean SensorDataOnDemand.modifySensor(Sensor obj) {
        return false;
    }
    
    public void SensorDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Sensor.findSensorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Sensor' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Sensor>();
        for (int i = 0; i < 10; i++) {
            Sensor obj = getNewTransientSensor(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
