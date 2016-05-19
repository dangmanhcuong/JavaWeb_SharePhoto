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
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Login Page</title>
    </head>
    <body>
        <section>
            <span></span>
            <html:form action="/Login">
                <h1>Member Login</h1>
                <bean:write name="LoginForm" property="errorMessage" filter="false"/>
                &nbsp;

        <input  property="nickname"  value="" placeholder='User Name' type='text' name="nickname">
            <input property="password" placeholder='Password' type='password' name="password">
            <button>Login</button>
        </html:form>
        <h2 >
            <a href='forgotpassword.jsp'>Forgot Password?</a>
            <a href='signup.jsp'>
                <button  property="signup" style="width: 80px">Sign Up</button>
            </a>
        </h2>
    </section>
</body>
</html>
