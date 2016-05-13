/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Nagato_Pain
 */
public class UploadActionForm extends org.apache.struts.action.ActionForm {
    
    private String title;
    private String topic;
    private String photofile;
    private String errorMessage;

    /**
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param string
     */
    public void setTitle(String string) {
        title = string;
    }

    public String getTopicString() {
        return topic;
    }

    public void setTopicString(String topicString) {
        this.topic = topicString;
    }

    public String getPhotofile() {
        return photofile;
    }

    public void setPhotofile(String photofile) {
        this.photofile = photofile;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    /**
     *
     */
    public UploadActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getTitle() == null || getTitle().length() < 1) {
            errors.add("name", new ActionMessage("error.name.required"));
            // TODO: add 'error.title.required' key to your resources
        }
        return errors;
    }
}
