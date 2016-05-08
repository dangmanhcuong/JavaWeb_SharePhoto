/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhom6;

import model.TblMember;

/**
 *
 * @author Nagato_Pain
 */
public class LoginService {

    TblMemberHelper helper;

    public LoginService() {
        this.helper = new TblMemberHelper();
    }

    public boolean authenticateUser(String nickname, String password) {
        TblMember member = helper.getMemberByNickname(nickname,password);
        return member != null;
    }
}
