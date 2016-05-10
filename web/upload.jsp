<%-- 
    Document   : upload
    Created on : May 8, 2016, 2:51:34 PM
    Author     : Nagato_Pain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page UpLoad</title>
    </head>
    <body>
        <s:actionerror />
        <s:form action="userImage" method="post" enctype="multipart/form-data">
            <s:file name="userImage" label="User Image" />
            <s:submit value="Upload" align="center" />
        </s:form>
</body>
</html>
