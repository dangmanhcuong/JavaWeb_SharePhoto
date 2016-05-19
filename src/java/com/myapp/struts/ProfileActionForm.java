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
public class ProfileActionForm extends org.apache.struts.action.ActionForm {
    
    private String statusMessage;
    private String fullname;
    private String nickname;
    private String imgSrc;
   
    /**
     * @return
     */
    public String getStatusMessage() {
        return statusMessage;
    }

    /**
     * @param string
     */
    public void setStatusMessage(String string) {
        statusMessage = string;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }
   
    public ProfileActionForm() {
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
        if (getStatusMessage() == null || getStatusMessage().length() < 1) {
            errors.add("name", new ActionMessage("error.name.required"));
            // TODO: add 'error.statusMessage.required' key to your resources
        }
        return errors;
    }
}
