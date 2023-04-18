<%-- 
    Document   : Chef
    Created on : May 9, 2022, 5:53:53 PM
    Author     : fakhr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aisyah De Kitchen</title>
         <link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
                response.sendRedirect("index.jsp"); 
            }
        %>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-user-circle-o" style="font-size:34px; margin-right: 15px;" aria-hidden="true"></i>HI, <%=session.getAttribute("login")%>
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="Chef.jsp">Home</a>
                    <a href="#">Link 2</a>
                    <a href="logout.jsp"><i class="fa fa-sign-out" style="font-size:24px; margin-right: 15px;" aria-hidden="true"></i>Log Out</a>
                </div>
            </div>
        </div>
            <h2 style = "text-align: center; padding-top: 20px; font-size: 40px;">Chef</h2>
    </body>
</html>
