// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.TipusSensor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TipusSensor_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TipusSensor.entityManager;
    
    public static final EntityManager TipusSensor.entityManager() {
        EntityManager em = new TipusSensor().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TipusSensor.countTipusSensors() {
        return entityManager().createQuery("SELECT COUNT(*) FROM TipusSensor o", Long.class).getSingleResult();
    }
    
    public static List<TipusSensor> TipusSensor.findAllTipusSensors() {
        return entityManager().createQuery("SELECT o FROM TipusSensor o", TipusSensor.class).getResultList();
    }
    
    public static TipusSensor TipusSensor.findTipusSensor(Integer id) {
        if (id == null) return null;
        return entityManager().find(TipusSensor.class, id);
    }
    
    public static List<TipusSensor> TipusSensor.findTipusSensorEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TipusSensor o", TipusSensor.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TipusSensor.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TipusSensor.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TipusSensor attached = TipusSensor.findTipusSensor(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TipusSensor.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TipusSensor.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TipusSensor TipusSensor.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TipusSensor merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
