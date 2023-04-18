<%-- 
    Document   : WaiterAssignCust
    Created on : May 13, 2022, 4:53:07 PM
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
        <link rel="stylesheet" href="css/ViewStaff.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/assignCust.css">    
    </head>
    <body>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-user-circle-o" style="font-size:34px; margin-right: 15px;" aria-hidden="true"></i>HI, <%=session.getAttribute("login")%>
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="Admin.jsp" style="color: black;">Home</a>
                    <a href="#">Link 2</a>
                    <a href="logout.jsp" style="color: black;"><i class="fa fa-sign-out" style="font-size:24px; margin-right: 15px; color: black;" aria-hidden="true"></i>Log Out</a>
                </div>
            </div>
        </div>
        
        <div class="welcome-text">
            <h1>Assign <span>Customer</span></h1>
            <a href="assignTable.html">Dine In</a>
            <a href="#">Take Away</a>
        </div>
    </body>
</html>
