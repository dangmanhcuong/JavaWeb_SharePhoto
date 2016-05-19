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
public class HomeAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private static final String DEFAULT = "default";

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
        String searchString = request.getParameter("searchcontent");
        if (searchString != null) {
            if (searchString.equals("aa")) {
                request.setAttribute("namename", "CuongDM");
                return mapping.findForward(SUCCESS);
            }
        }
//        PhotoHelper photoHelper = new PhotoHelper();
//        ArrayList<Photo> listPhoto = new ArrayList<>();
//        listPhoto= photoHelper.getListPhoto();
//        
//        request.setAttribute("photo", listPhoto.get(0));
//       
//        for(int i=0;i< listPhoto.size();i++){
//            byte[] a = listPhoto.get(i).getPhotoSrc();
//              // response.getOutputStream().write(a); 
//            }
//                
//        
        return mapping.findForward(SUCCESS);
    }
}
