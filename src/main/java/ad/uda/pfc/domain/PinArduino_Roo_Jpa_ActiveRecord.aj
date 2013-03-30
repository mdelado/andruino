// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.PinArduino;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PinArduino_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PinArduino.entityManager;
    
    public static final EntityManager PinArduino.entityManager() {
        EntityManager em = new PinArduino().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PinArduino.countPinArduinoes() {
        return entityManager().createQuery("SELECT COUNT(*) FROM PinArduino o", Long.class).getSingleResult();
    }
    
    public static List<PinArduino> PinArduino.findAllPinArduinoes() {
        return entityManager().createQuery("SELECT o FROM PinArduino o", PinArduino.class).getResultList();
    }
    
    public static PinArduino PinArduino.findPinArduino(Integer id) {
        if (id == null) return null;
        return entityManager().find(PinArduino.class, id);
    }
    
    public static List<PinArduino> PinArduino.findPinArduinoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PinArduino o", PinArduino.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PinArduino.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PinArduino.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PinArduino attached = PinArduino.findPinArduino(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PinArduino.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PinArduino.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PinArduino PinArduino.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PinArduino merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}