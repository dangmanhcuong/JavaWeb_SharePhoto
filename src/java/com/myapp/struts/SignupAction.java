/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhom6.SignupService;
import nhom6.TblMemberHelper;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Nagato_Pain
 */
public class SignupAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

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
        SignupForm signupForm = (SignupForm) form;

        String errorMessage = signupForm.getErrorMessage();
        String firstname = signupForm.getFirstname();
        String lastname = signupForm.getLastname();
        String nickname = signupForm.getNickname();
        String password = signupForm.getPassword();
        String enterthepassword = signupForm.getEnterthepassword();
        String email = signupForm.getEmail();
        String gender = signupForm.getGender();
        if (firstname != null && lastname != null && nickname != null && password != null && enterthepassword != null && email != null && gender != null) {
            SignupService signupService = new SignupService();
            String messageVadidateString = signupService.vadidateSignUp(signupForm);
            if (messageVadidateString.equals("ok")) {
                signupService.addMember(signupForm);
                return mapping.findForward(SUCCESS);
            } else {
                signupForm.setErrorMessage(messageVadidateString);
                return mapping.findForward(FAILURE);
            }
        } else {
            signupForm.setErrorMessage("Form null");
            return mapping.findForward(FAILURE);
        }
    }
}
