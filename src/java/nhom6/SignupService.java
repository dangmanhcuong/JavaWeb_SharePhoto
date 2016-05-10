/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import com.myapp.struts.SignupForm;

/**
 *
 * @author Nagato_Pain
 */
public class SignupService {
    TblMemberHelper helper;

    public Boolean checkEmailFormat(String email) {
        return email.contains("@");
    }

    public String vadidateSignUp(SignupForm infoSignupForm) {
        if (infoSignupForm.getFirstname().equals("") || infoSignupForm.getLastname().equals("") || infoSignupForm.getNickname().equals("") || infoSignupForm.getPassword().equals("") || infoSignupForm.getEnterthepassword().equals("") || infoSignupForm.getEmail().equals("")) {
            return "thieu truong";
        } else if (!infoSignupForm.getEnterthepassword().equals(infoSignupForm.getPassword())) {
            return "passwork ko trung";
        } else if (!infoSignupForm.getEmail().contains("@")) {
            return "sai dinh dang mail";
        } else {
            return "ok";
        }

    }
    public void addMember(SignupForm signupForm ){
        helper = new TblMemberHelper();
        helper.singupMember(signupForm);
    }
}
