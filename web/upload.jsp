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
        <html:form  method="post" action="/Upload" enctype="multipart/form-data">
            <bean:write name="UploadActionForm" property="errorMessage" filter="false"/>
            &nbsp;</td>
        <table border="0">
            <tr>
                <td>Title: </td>
                <td><input property="title" type="text" name="Title" size="50" value=""/></td>
            </tr>
            <tr>
                <td>Topic: </td>
                <td><input property="topic" type="text" name="Topic" size="50" value=""/></td>
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
    </html:form>
    <form action="uploadtest" method="post" enctype="multipart/form-data">
        <input type="text" name="description" />
        <input type="file" name="file" />
        <input type="submit" />
    </form>
</center>

</body>
</html>
