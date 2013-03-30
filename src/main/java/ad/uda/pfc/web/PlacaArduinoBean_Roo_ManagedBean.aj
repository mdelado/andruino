// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ad.uda.pfc.web;

import ad.uda.pfc.domain.PinArduino;
import ad.uda.pfc.domain.PlacaArduino;
import ad.uda.pfc.web.PlacaArduinoBean;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LengthValidator;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect PlacaArduinoBean_Roo_ManagedBean {
    
    declare @type: PlacaArduinoBean: @ManagedBean(name = "placaArduinoBean");
    
    declare @type: PlacaArduinoBean: @SessionScoped;
    
    private String PlacaArduinoBean.name = "PlacaArduinoes";
    
    private PlacaArduino PlacaArduinoBean.placaArduino;
    
    private List<PlacaArduino> PlacaArduinoBean.allPlacaArduinoes;
    
    private boolean PlacaArduinoBean.dataVisible = false;
    
    private List<String> PlacaArduinoBean.columns;
    
    private HtmlPanelGrid PlacaArduinoBean.createPanelGrid;
    
    private HtmlPanelGrid PlacaArduinoBean.editPanelGrid;
    
    private HtmlPanelGrid PlacaArduinoBean.viewPanelGrid;
    
    private boolean PlacaArduinoBean.createDialogVisible = false;
    
    private List<PinArduino> PlacaArduinoBean.selectedPinArduinoes;
    
    @PostConstruct
    public void PlacaArduinoBean.init() {
        columns = new ArrayList<String>();
        columns.add("descripcio");
        columns.add("nom");
        columns.add("versio");
    }
    
    public String PlacaArduinoBean.getName() {
        return name;
    }
    
    public List<String> PlacaArduinoBean.getColumns() {
        return columns;
    }
    
    public List<PlacaArduino> PlacaArduinoBean.getAllPlacaArduinoes() {
        return allPlacaArduinoes;
    }
    
    public void PlacaArduinoBean.setAllPlacaArduinoes(List<PlacaArduino> allPlacaArduinoes) {
        this.allPlacaArduinoes = allPlacaArduinoes;
    }
    
    public String PlacaArduinoBean.findAllPlacaArduinoes() {
        allPlacaArduinoes = PlacaArduino.findAllPlacaArduinoes();
        dataVisible = !allPlacaArduinoes.isEmpty();
        return null;
    }
    
    public boolean PlacaArduinoBean.isDataVisible() {
        return dataVisible;
    }
    
    public void PlacaArduinoBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void PlacaArduinoBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void PlacaArduinoBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void PlacaArduinoBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText pinArduinoesCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesCreateOutput.setId("pinArduinoesCreateOutput");
        pinArduinoesCreateOutput.setValue("Pin Arduinoes:   ");
        htmlPanelGrid.getChildren().add(pinArduinoesCreateOutput);
        
        HtmlOutputText pinArduinoesCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesCreateInput.setId("pinArduinoesCreateInput");
        pinArduinoesCreateInput.setValue("This relationship is managed from the PinArduino side");
        htmlPanelGrid.getChildren().add(pinArduinoesCreateInput);
        
        Message pinArduinoesCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        pinArduinoesCreateInputMessage.setId("pinArduinoesCreateInputMessage");
        pinArduinoesCreateInputMessage.setFor("pinArduinoesCreateInput");
        pinArduinoesCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(pinArduinoesCreateInputMessage);
        
        HtmlOutputText descripcioCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcioCreateOutput.setId("descripcioCreateOutput");
        descripcioCreateOutput.setValue("Descripcio: * ");
        htmlPanelGrid.getChildren().add(descripcioCreateOutput);
        
        InputTextarea descripcioCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descripcioCreateInput.setId("descripcioCreateInput");
        descripcioCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.descripcio}", String.class));
        LengthValidator descripcioCreateInputValidator = new LengthValidator();
        descripcioCreateInputValidator.setMaximum(250);
        descripcioCreateInput.addValidator(descripcioCreateInputValidator);
        descripcioCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(descripcioCreateInput);
        
        Message descripcioCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descripcioCreateInputMessage.setId("descripcioCreateInputMessage");
        descripcioCreateInputMessage.setFor("descripcioCreateInput");
        descripcioCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descripcioCreateInputMessage);
        
        HtmlOutputText nomCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomCreateOutput.setId("nomCreateOutput");
        nomCreateOutput.setValue("Nom:   ");
        htmlPanelGrid.getChildren().add(nomCreateOutput);
        
        InputText nomCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nomCreateInput.setId("nomCreateInput");
        nomCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.nom}", String.class));
        htmlPanelGrid.getChildren().add(nomCreateInput);
        
        Message nomCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nomCreateInputMessage.setId("nomCreateInputMessage");
        nomCreateInputMessage.setFor("nomCreateInput");
        nomCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nomCreateInputMessage);
        
        HtmlOutputText versioCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        versioCreateOutput.setId("versioCreateOutput");
        versioCreateOutput.setValue("Versio:   ");
        htmlPanelGrid.getChildren().add(versioCreateOutput);
        
        InputText versioCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        versioCreateInput.setId("versioCreateInput");
        versioCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.versio}", String.class));
        htmlPanelGrid.getChildren().add(versioCreateInput);
        
        Message versioCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        versioCreateInputMessage.setId("versioCreateInputMessage");
        versioCreateInputMessage.setFor("versioCreateInput");
        versioCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(versioCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText pinArduinoesEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesEditOutput.setId("pinArduinoesEditOutput");
        pinArduinoesEditOutput.setValue("Pin Arduinoes:   ");
        htmlPanelGrid.getChildren().add(pinArduinoesEditOutput);
        
        HtmlOutputText pinArduinoesEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesEditInput.setId("pinArduinoesEditInput");
        pinArduinoesEditInput.setValue("This relationship is managed from the PinArduino side");
        htmlPanelGrid.getChildren().add(pinArduinoesEditInput);
        
        Message pinArduinoesEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        pinArduinoesEditInputMessage.setId("pinArduinoesEditInputMessage");
        pinArduinoesEditInputMessage.setFor("pinArduinoesEditInput");
        pinArduinoesEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(pinArduinoesEditInputMessage);
        
        HtmlOutputText descripcioEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcioEditOutput.setId("descripcioEditOutput");
        descripcioEditOutput.setValue("Descripcio: * ");
        htmlPanelGrid.getChildren().add(descripcioEditOutput);
        
        InputTextarea descripcioEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descripcioEditInput.setId("descripcioEditInput");
        descripcioEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.descripcio}", String.class));
        LengthValidator descripcioEditInputValidator = new LengthValidator();
        descripcioEditInputValidator.setMaximum(250);
        descripcioEditInput.addValidator(descripcioEditInputValidator);
        descripcioEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(descripcioEditInput);
        
        Message descripcioEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descripcioEditInputMessage.setId("descripcioEditInputMessage");
        descripcioEditInputMessage.setFor("descripcioEditInput");
        descripcioEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descripcioEditInputMessage);
        
        HtmlOutputText nomEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomEditOutput.setId("nomEditOutput");
        nomEditOutput.setValue("Nom:   ");
        htmlPanelGrid.getChildren().add(nomEditOutput);
        
        InputText nomEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nomEditInput.setId("nomEditInput");
        nomEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.nom}", String.class));
        htmlPanelGrid.getChildren().add(nomEditInput);
        
        Message nomEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nomEditInputMessage.setId("nomEditInputMessage");
        nomEditInputMessage.setFor("nomEditInput");
        nomEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nomEditInputMessage);
        
        HtmlOutputText versioEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        versioEditOutput.setId("versioEditOutput");
        versioEditOutput.setValue("Versio:   ");
        htmlPanelGrid.getChildren().add(versioEditOutput);
        
        InputText versioEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        versioEditInput.setId("versioEditInput");
        versioEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.versio}", String.class));
        htmlPanelGrid.getChildren().add(versioEditInput);
        
        Message versioEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        versioEditInputMessage.setId("versioEditInputMessage");
        versioEditInputMessage.setFor("versioEditInput");
        versioEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(versioEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid PlacaArduinoBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText pinArduinoesLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesLabel.setId("pinArduinoesLabel");
        pinArduinoesLabel.setValue("Pin Arduinoes:   ");
        htmlPanelGrid.getChildren().add(pinArduinoesLabel);
        
        HtmlOutputText pinArduinoesValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        pinArduinoesValue.setId("pinArduinoesValue");
        pinArduinoesValue.setValue("This relationship is managed from the PinArduino side");
        htmlPanelGrid.getChildren().add(pinArduinoesValue);
        
        HtmlOutputText descripcioLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcioLabel.setId("descripcioLabel");
        descripcioLabel.setValue("Descripcio:   ");
        htmlPanelGrid.getChildren().add(descripcioLabel);
        
        InputTextarea descripcioValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        descripcioValue.setId("descripcioValue");
        descripcioValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.descripcio}", String.class));
        descripcioValue.setReadonly(true);
        descripcioValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(descripcioValue);
        
        HtmlOutputText nomLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomLabel.setId("nomLabel");
        nomLabel.setValue("Nom:   ");
        htmlPanelGrid.getChildren().add(nomLabel);
        
        HtmlOutputText nomValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nomValue.setId("nomValue");
        nomValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.nom}", String.class));
        htmlPanelGrid.getChildren().add(nomValue);
        
        HtmlOutputText versioLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        versioLabel.setId("versioLabel");
        versioLabel.setValue("Versio:   ");
        htmlPanelGrid.getChildren().add(versioLabel);
        
        HtmlOutputText versioValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        versioValue.setId("versioValue");
        versioValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{placaArduinoBean.placaArduino.versio}", String.class));
        htmlPanelGrid.getChildren().add(versioValue);
        
        return htmlPanelGrid;
    }
    
    public PlacaArduino PlacaArduinoBean.getPlacaArduino() {
        if (placaArduino == null) {
            placaArduino = new PlacaArduino();
        }
        return placaArduino;
    }
    
    public void PlacaArduinoBean.setPlacaArduino(PlacaArduino placaArduino) {
        this.placaArduino = placaArduino;
    }
    
    public List<PinArduino> PlacaArduinoBean.getSelectedPinArduinoes() {
        return selectedPinArduinoes;
    }
    
    public void PlacaArduinoBean.setSelectedPinArduinoes(List<PinArduino> selectedPinArduinoes) {
        if (selectedPinArduinoes != null) {
            placaArduino.setPinArduinoes(new HashSet<PinArduino>(selectedPinArduinoes));
        }
        this.selectedPinArduinoes = selectedPinArduinoes;
    }
    
    public String PlacaArduinoBean.onEdit() {
        if (placaArduino != null && placaArduino.getPinArduinoes() != null) {
            selectedPinArduinoes = new ArrayList<PinArduino>(placaArduino.getPinArduinoes());
        }
        return null;
    }
    
    public boolean PlacaArduinoBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void PlacaArduinoBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String PlacaArduinoBean.displayList() {
        createDialogVisible = false;
        findAllPlacaArduinoes();
        return "placaArduino";
    }
    
    public String PlacaArduinoBean.displayCreateDialog() {
        placaArduino = new PlacaArduino();
        createDialogVisible = true;
        return "placaArduino";
    }
    
    public String PlacaArduinoBean.persist() {
        String message = "";
        if (placaArduino.getId() != null) {
            placaArduino.merge();
            message = "Successfully updated";
        } else {
            placaArduino.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPlacaArduinoes();
    }
    
    public String PlacaArduinoBean.delete() {
        placaArduino.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllPlacaArduinoes();
    }
    
    public void PlacaArduinoBean.reset() {
        placaArduino = null;
        selectedPinArduinoes = null;
        createDialogVisible = false;
    }
    
    public void PlacaArduinoBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}