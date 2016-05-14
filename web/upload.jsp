<%-- 
    Document   : upload
    Created on : May 8, 2016, 2:51:34 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <title>JSP Page UpLoad</title>
    </head>
    <body>
    <center>
        <h1>File Upload to Database </h1>
        <%
            String user = "no member";
            String status="";
            HttpSession sess = request.getSession(false); //use false to use the existing session
            Object testObject = sess.getAttribute("nickname");//this will return username anytime in the session
            Object object = request.getAttribute("status");
            if (testObject != null) {
                user = (String) testObject;
            }
            if(object!=null){
                status =(String)object;
            }
        %>
        <form   method="POST" action="Upload" enctype="multipart/form-data">
            <input type="text" value="<%= status%>">
            <table border="0">
                <tr>
                    <td>User: </td>
                    <td><input property="user" type="text" name="user" size="50" value="<%=user%>"/></td>
                </tr>
                <tr>
                    <td>Title: </td>
                    <td><input property="title" type="text" name="title" size="50" value=""/></td>
                </tr>
                <tr>
                    <td>Topic:  </td>
                    <td >
                        <select property="topic" name="topic">
                            <option>Linh tinh</option>
                            <option> Other </option>
                        </select> </td> 
                    </td>  

                </tr>
                <tr>
                    <td>Portrait Photo: </td>
                    <td><input property="photofile" type="file" name="photo" size="50" value=""/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Upload">
                    </td>
                </tr>
            </table>
        </form>
        <!--    <form action="uploadtest" method="post" enctype="multipart/form-data">
                <input type="text" name="description" />
                <input type="file" name="file" />
                <input type="submit" />
            </form>-->
    </center>

</body>
</html>
