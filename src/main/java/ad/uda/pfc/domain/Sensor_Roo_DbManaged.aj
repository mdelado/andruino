// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.Caracteristica;
import ad.uda.pfc.domain.Habitacle;
import ad.uda.pfc.domain.PinArduino;
import ad.uda.pfc.domain.Sensor;
import ad.uda.pfc.domain.TipusSensor;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

privileged aspect Sensor_Roo_DbManaged {
    
    @OneToMany(mappedBy = "idSensor")
    private Set<Caracteristica> Sensor.caracteristicas;
    
    @OneToMany(mappedBy = "idSensor")
    private Set<PinArduino> Sensor.pinArduinoes;
    
    @ManyToOne
    @JoinColumn(name = "id_habitacle", referencedColumnName = "id")
    private Habitacle Sensor.idHabitacle;
    
    @ManyToOne
    @JoinColumn(name = "id_tipus_sensor", referencedColumnName = "id")
    private TipusSensor Sensor.idTipusSensor;
    
    @Column(name = "descripcio", length = 250)
    private String Sensor.descripcio;
    
    public Set<Caracteristica> Sensor.getCaracteristicas() {
        return caracteristicas;
    }
    
    public void Sensor.setCaracteristicas(Set<Caracteristica> caracteristicas) {
        this.caracteristicas = caracteristicas;
    }
    
    public Set<PinArduino> Sensor.getPinArduinoes() {
        return pinArduinoes;
    }
    
    public void Sensor.setPinArduinoes(Set<PinArduino> pinArduinoes) {
        this.pinArduinoes = pinArduinoes;
    }
    
    public Habitacle Sensor.getIdHabitacle() {
        return idHabitacle;
    }
    
    public void Sensor.setIdHabitacle(Habitacle idHabitacle) {
        this.idHabitacle = idHabitacle;
    }
    
    public TipusSensor Sensor.getIdTipusSensor() {
        return idTipusSensor;
    }
    
    public void Sensor.setIdTipusSensor(TipusSensor idTipusSensor) {
        this.idTipusSensor = idTipusSensor;
    }
    
    public String Sensor.getDescripcio() {
        return descripcio;
    }
    
    public void Sensor.setDescripcio(String descripcio) {
        this.descripcio = descripcio;
    }
    
}
