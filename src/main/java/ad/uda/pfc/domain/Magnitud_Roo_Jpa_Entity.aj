// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.domain;

import ad.uda.pfc.domain.Magnitud;
import javax.persistence.Entity;
import javax.persistence.Table;

privileged aspect Magnitud_Roo_Jpa_Entity {
    
    declare @type: Magnitud: @Entity;
    
    declare @type: Magnitud: @Table(schema = "pfc_schema", name = "magnitud");
    
}
