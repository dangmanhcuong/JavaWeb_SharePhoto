<%-- 
    Document   : profile
    Created on : May 8, 2016, 11:05:26 PM
    Author     : Nagato_Pain
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div {
                position: relative;
            }

            .inner-image {
                position: absolute;
                top: 115px;
                right: 86%;

                h2 {
                    position: absolute;
                    top: 100px;
                    left: 200px;
                    width: 50%;
                    margin: 0 auto;

                }
                P.blocktext {
                    margin-left: auto;
                    margin-right: auto;
                    width: 6em
                }
            }
        </style>
    </head>
    <body>
        <%
            
//            String fullnameString = "";
//            String nicknameString = "";
            Object object = request.getSession(false).getAttribute("nickname");
            if (object == null) {
                request.getRequestDispatcher("/login.jsp").forward(request, response);

            }
            else{
                String nickname =(String)object;
                if(nickname.equals("")){
                     request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            }
//            Object object2 = request.getSession(false).getAttribute("fullname");
//            if (object != null) {
//                fullnameString = (String) object2;
//            }
//        %>
        <html:form action="/Profile">
            <div style="width: 100%" >
                <img src="https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/13094181_976963789087296_7053670023809168846_n.jpg?oh=634e578261fc79d210c8248b5e3d2ff0&oe=57E4DAE7" style="width:100%; height:300px">

                <img class="inner-image" src="https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/11393023_807708139346196_8760757727061461547_n.jpg?oh=08b50cfabebcb82449bc69b7685061a3&oe=57A50361" style="width:170px; height:170px">
                <div class="text">
                    <h2>
                        <a><bean:write name="ProfileActionForm" property="fullname" /></a>
                        <a><bean:write name="ProfileActionForm" property="nickname" /></a>
                        <a><bean:write name="ProfileActionForm" property="statusMessage" /> </a>
                    </h2>
                        
                </div>
            </div>
            <div style="padding-top: 10px; margin-left: 20%"  >

                 <img  src="<bean:write name="ProfileActionForm" property="imgSrc"/>" >
                 <img  src="<bean:write name="ProfileActionForm" property="imgSrc"/>">

            </div>
        </html:form>

    </body>
</html>
