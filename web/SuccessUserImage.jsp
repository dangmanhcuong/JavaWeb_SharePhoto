<%-- 
    Document   : SuccessUserImage
    Created on : May 10, 2016, 12:14:50 AM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Struts2 File Upload Example</h2>
    User Image: <s:property value="userImage"/>
    <br/>
    Content Type: <s:property value="userImageContentType"/>
    <br/>
    File Name: <s:property value="userImageFileName"/>
    <br/>
    Uploaded Image:
    <br/>
    <img src="<s:property value="userImageFileName"/>"/>
    </body>
</html>
