<%-- 
    Document   : signup
    Created on : May 8, 2016, 2:44:27 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page Sign Up </title>
    </head>
    <body>
        <section>
            <span></span>
            <html:form action="/Signup">
                <h1>Sign Up Member </h1>
                <bean:write name="SignupForm" property="errorMessage" filter="false"/>
                &nbsp;</td>
                <h2>
                    <input style="width: 105px"property="firstname" placeholder=' First Name' type='text' name="firstname">
                    <input style="width: 105px" property="lastname" placeholder='Last Name' type='text' name="lastname">
                </h2>       
                <input  property="nickname" placeholder=' Name Member' type='text' name="nickname">
                <input property="password" placeholder='Password' type='password' name="password">
                <input property="password" placeholder='Password' type='password' name="password">
                <input property="password" placeholder='Password' type='password' name="password">
                <h2>
                    <a style="margin-left: auto">gioi tinh</a>
                    <select style="" name="gioitinh">
                        <option>nam</option>
                        <option>nu</option>
                        <option>other</option>
                    </select> 
                </h2>

                <button>Sign Up</button>
            </html:form>
            <h2 >
                <a >You have registered?</a>
                <a href='login.jsp'>
                    <button  style="width: 80px">Login</button>
                </a>
            </h2>
        </section>
    </body>
</html>
