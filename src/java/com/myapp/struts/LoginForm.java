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
public class LoginForm extends org.apache.struts.action.ActionForm {

    private String nickname;
    private String password;
    private String errorMessage;
    private String logoutString;

    public String getNickname() {
        return nickname;
    }

    public String getLogoutString() {
        return logoutString;
    }

    public void setLogoutString(String logoutString) {
        this.logoutString = logoutString;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public LoginForm() {
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
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getNickname() == null || getNickname().length() < 1) {
            errors.add("nickname", new ActionMessage("error.nickname.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
}
