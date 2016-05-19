<%@page import="model.Photo"%>
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
        <style>
            body {
                background: white }
            section {
                background: black;
                color: white;
                border-radius: 1em;

                position: absolute;
                top: 260%;
                left: 50%;
                margin-right: -50%;
                transform: translate(-50%, -50%) }
            </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Share Photo Page</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        </head>
        <body>
            <html:form  action="/Welcome">
                <nav  id="HeaderBar" class="navbar navbar-inverse" style=" width: 100% ; position: fixed;">
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
                            HttpSession sess = request.getSession(false); //use false to use the existing session
                            Object testObject = sess.getAttribute("nickname");//this will return username anytime in the session
                            Boolean flagUploadAndLogout = false;
                            Boolean flagLogin = true;
                            String styleUploadAndLogout = "visibility: hidden";
                            String styleLogin = "visibility: visible";
                            Object object = request.getAttribute("nickname");
                            if (object != null) {
                                flagLogin = false;
                                flagUploadAndLogout = true;
                                welcomeMember = "Hello " + (String) testObject;

                            } else {
                                HttpSession newsession = request.getSession(false);
                                if (newsession != null) {
                                    newsession.invalidate();

                                }
                            }
                            if (flagUploadAndLogout) {
                                styleUploadAndLogout = "visibility: visible";
                            }
                            if (!flagLogin) {
                                styleLogin = "visibility: hidden";
                            }
                            //                      Object home = request.getAttribute("Home");

    //                        String loadmoreString;
    //                        if(home!=null){
    //                            loadmoreString = (Home)home.
    //                        }

                        %>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="Profile.do"  name="user" > <%=welcomeMember%></a></li>
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
                            <input  property="searchcontent" name="searchcontent" type="text" placeholder="Search here..."  style="vertical-align: auto;" required>
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
            <%
                Object photoObject = request.getAttribute("photo");
                if(photoObject!=null){
                    
                }
            %>
            <ul id="myList" style="padding-top: 100px">
                <li>
                    <img width="600px" height="600px" src="C:\Users\Nagato_Pain\Desktop\4.png"/>
                </li>
                </ul>
                <div id="loadMore" >Load more</div>
                <div id="showLess">Show less</div>
                <a property="loadmore"> hello</a>
                <%
                    String name="dang manh cuong";
                    if(request.getAttribute("namename")!=null){
                        name=(String)request.getAttribute("namename");
                    }
                %>
                <input   value="<%=name%>" property="name" placeholder='User Name' type='text' name="nickname" style="color: yellow">  
        </html:form>
    </body>
</html>
