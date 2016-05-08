<%-- 
    Document   : login
    Created on : Apr 26, 2016, 10:25:08 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Form</h1> 
        <html:form action="/Login">
            <table border="0">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <bean:write name="LoginForm" property="errorMessage" filter="false"/>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter your Nickname:</td>
                        <td><html:text property="nickname" /></td>
                    </tr>
                    <tr>
                        <td>Enter your Password: </td>
                        <td><html:password property="password" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><html:submit  value="Login" /></td>
                    </tr>
                </tbody>
            </table>
        </html:form>
    </body>
</html>
