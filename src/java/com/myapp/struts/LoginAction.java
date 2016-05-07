/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhom6.LoginService;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Nagato_Pain
 */
public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private final static String FAILURE = "failure";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // extract user data
        LoginForm formBean = (LoginForm) form;
        String nickname = formBean.getNickname();
        String password = formBean.getPassword();
        LoginService loginService = new LoginService();
        // perform validation
        if (nickname.equals("") || password.equals("")) {
            formBean.setErrorMessage("<h1> nickname or passwork null </h1>");
            return mapping.findForward(FAILURE);
        } else {
            boolean result = loginService.authenticateUser(nickname, password);
            if (result) {
                return mapping.findForward(SUCCESS);
            } else {
                formBean.setErrorMessage("<h1> fail login</h1> <h2> fail login 2 </h2>");
                return mapping.findForward(FAILURE);
            }
        }

    }
}
