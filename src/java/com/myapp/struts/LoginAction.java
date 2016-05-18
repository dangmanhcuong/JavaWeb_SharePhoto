/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.TblMember;
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
        if (nickname != null && password != null) {
            if (nickname.equals("") || password.equals("")) {
                formBean.setErrorMessage("<h2 style='color: red'> Please fill in nickname and password </h2>");
                formBean.setNickname("");
                return mapping.findForward(FAILURE);
            } else {
                formBean.setErrorMessage("<h2 style='color: red'> OK! Please wait...  </h2>");
                //boolean result = loginService.authenticateUser(nickname, password);
                TblMember member = loginService.getMember(nickname, password);
                if (member!=null) {
                    HttpSession sess = request.getSession();
                    sess.setAttribute("nickname", nickname);
                    sess.setAttribute("password", password);
                    sess.setAttribute("idmember", member.getIdMember());
                    request.setAttribute("nickname", nickname);
                    return mapping.findForward(SUCCESS);
                } else {
                    formBean.setErrorMessage("<h2 style='color: red'> Nickname and password you entered did not match  </h2>");
                    return mapping.findForward(FAILURE);
                }
            }
        } else {
            return mapping.findForward(FAILURE);
        }
    }
}
