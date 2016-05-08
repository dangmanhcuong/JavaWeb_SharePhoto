<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%-- 
    Document   : Home
    Created on : Apr 23, 2016, 2:12:20 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Share Photo Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid" >
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Team 6</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li ><a href="#">Home</a></li>
                        <li ><a href="#">Photo Hot</a></li>
                        <li><a href="#">New Photo</a></li>
                    </ul>
                    <%  String welcomeMember = "";
                        Boolean flagUploadAndLogout = false;
                        Boolean flagLogin = true;
                        String styleUploadAndLogout = "visibility: hidden";
                        String styleLogin = "visibility: visible";
                        Object object = request.getAttribute("nickname");
                        if (object != null) {
                            flagLogin = false;
                            flagUploadAndLogout = true;
                            welcomeMember = "Hello "+(String)object;
                        }
                        if (flagUploadAndLogout) {
                            styleUploadAndLogout = "visibility: visible";
                        }
                        if (!flagLogin) {
                            styleLogin = "visibility: hidden";
                        }


                    %>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a ><span class="icon-bar"></span> <%=welcomeMember%></a></li>
                        </li>
                        <li style='<%= styleUploadAndLogout%>'>
                            <a href="upload.jsp"><span class="icon-bar"></span> Upload</a></li>
                        <li  >
                            <a href="signup.jsp"><span  class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li style='<%= styleLogin%>'>
                            <a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li style='<%= styleUploadAndLogout%>' >
                            <a href="Home.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>

                    </ul>
                    <div>
                        <input  type="text" placeholder="Search here..."  style="vertical-align: auto;" required>
                        <input  type="submit" value="Search" name="Search" style="margin:  12px 10px;" />
                    </div>
                </div>

            </div>

        </nav>

        <!--        <div class="container">
                    <h3>Collapsible Navbar</h3>
                    <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
                    <p>Only when the button is clicked, the navigation bar will be displayed.</p>
                </div>-->
        <ul id="myList">
            <li>One</li>
            <li>Two</li>
            <li>Three</li>
            <li>Four</li>
            <li>Five</li>
            <li>Six</li>
            <li>Seven</li>
            <li>Eight</li>
            <li>Nine</li>
            <li>Ten</li>
            <li>Eleven</li>
            <li>Twelve</li>
            <li>Thirteen</li>
            <li>Fourteen</li>
            <li>Fifteen</li>
            <li>Sixteen</li>
            <li>Seventeen</li>
            <li>Eighteen</li>
            <li>Nineteen</li>
            <li>Twenty one</li>
            <li>Twenty two</li>
            <li>Twenty three</li>
            <li>Twenty four</li>
            <li>Twenty five</li>
        </ul>
        <div id="loadMore">Load more</div>
        <div id="showLess">Show less</div>
    </body>
</html>
