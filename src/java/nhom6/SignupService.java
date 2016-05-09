/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

/**
 *
 * @author Nagato_Pain
 */
public class SignupService {

    public Boolean checkEmailFormat(String email) {
        return email.contains("@");
    }
    
}
