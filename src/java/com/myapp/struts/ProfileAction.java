/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Photo;
import nhom6.PhotoHelper;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Nagato_Pain
 */
public class ProfileAction extends org.apache.struts.action.Action {

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
        ProfileActionForm profileActionForm = (ProfileActionForm) form;
        String fullnameString = profileActionForm.getFullname();
        String nicknameString = profileActionForm.getNickname();
        //
        String fullname = "";
        String nickname = "";
        Integer idMember = 0;
        Object object = request.getSession(false).getAttribute("nickname");
        if (object != null) {
            nickname = (String) object;

        }
        Object object2 = request.getSession(false).getAttribute("fullname");
        if (object != null) {
            fullname = (String) object2;
        }
         Object object3 = request.getSession(false).getAttribute("idmember");
        if (object3 != null) {
            idMember = (Integer) object3;
        }
        //
        if (!fullname.equals("") && !nickname.equals("")) {
            profileActionForm.setFullname(fullname);
            profileActionForm.setNickname("(" + nickname + ")");
            //get photo
            PhotoHelper photoHelper = new PhotoHelper();
            ArrayList<Photo> listPhoto = new ArrayList<>();
            try{
            listPhoto = photoHelper.getListPhotoByMember(idMember);
            //request.setAttribute("photo", listPhoto.get(0));
            byte[] a = listPhoto.get(0).getPhotoSrc();
             byte[] a1 = listPhoto.get(1).getPhotoSrc();
              byte[] a2 = listPhoto.get(2).getPhotoSrc();
               byte[] a3 = listPhoto.get(3).getPhotoSrc();
            String value = new String(a, "UTF-8");
            //
             profileActionForm.setImgSrc(value);
             profileActionForm.setStatusMessage(" have "+listPhoto.size()+" Photo! @@ ");
            return mapping.findForward(SUCCESS);
            }
            catch(Exception e){
                profileActionForm.setStatusMessage(" have 0 Photo! @@ ");
                return mapping.findForward(SUCCESS);
            }
        } else {

            return mapping.findForward(FAILURE);
        }
    }
}
