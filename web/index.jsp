<%-- 
    Document   : index
    Created on : Apr 25, 2022, 9:25:36 PM
    Author     : fakhr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    if(session.getAttribute("login")!=null) {//check login session user not access or back to index.jsp page 
        response.sendRedirect("Admin.jsp");
    }
%>

<%
    try {
        String username = request.getParameter("txt_username"); //txt_email
        String password = request.getParameter("txt_password"); //txt_password
    
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aisyahdekitchen","root","admin"); //create connection
	
        PreparedStatement admn = admn = con.prepareStatement("select * from employee where Username=? AND Password=? AND Department = 'Admin'"); //sql select query 
        admn.setString(1,username);
        admn.setString(2,password);
        ResultSet DepAdmn = admn.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement chf = chf = con.prepareStatement("select * from employee where Username=? AND Password=? AND Department = 'Chef'"); //sql select query 
        chf.setString(1,username);
        chf.setString(2,password);
        ResultSet DepChf = chf.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement cshr = cshr = con.prepareStatement("select * from employee where Username=? AND Password=? AND Department = 'Cashier'"); //sql select query 
        cshr.setString(1,username);
        cshr.setString(2,password);
        ResultSet Depshr= cshr.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement wtr = wtr = con.prepareStatement("select * from employee where Username=? AND Password=? AND Department = 'Waiter'"); //sql select query 
        wtr.setString(1,username);
        wtr.setString(2,password);
        ResultSet Depwtr = wtr.executeQuery(); //execute query and store in resultset object rs.
        
	if(request.getParameter("btn_login")!=null) {//check login button click event not null
            String dbusername,dbpassword;

            if(DepAdmn.next()) {
		dbusername=DepAdmn.getString("Username");
		dbpassword=DepAdmn.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("Admin.jsp"); //after login success redirect to welcome.jsp page
		}
            } else if(DepChf.next()) {
		dbusername=DepChf.getString("Username");
		dbpassword=DepChf.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("Chef.jsp"); //after login success redirect to welcome.jsp page
		}
            } else if(Depshr.next()) {
		dbusername=Depshr.getString("Username");
		dbpassword=Depshr.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("searchOrderID.html"); //after login success redirect to welcome.jsp page
		}
            } else if(Depwtr.next()) {
		dbusername=Depwtr.getString("Username");
		dbpassword=Depwtr.getString("Password");
			
		if(username.equals(dbusername) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbusername); //session name is login and store fetchable database email address
                    response.sendRedirect("assignCust.html"); //after login success redirect to welcome.jsp page
		}
            }
            
            else {
		request.setAttribute("errorMsg","invalid username or password"); //invalid error message for email or password wrong
            }
            con.close(); //close connection	
	}
    }
    catch(Exception e) {
            out.println("Database Tak Connect");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aisyah De Kitchen</title>
        
        <link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
    
        <script>
            function validate() {
                var email = document.myform.txt_email;
                var password = document.myform.txt_password;

                if (email.value === null || email.value === "") {//check email textbox not blank
                    window.alert("please enter email ?"); //alert message
                    email.style.background = '#f08080';
                    email.focus();
                    return false;
                }
                if (password.value === null || password.value === "") {//check password textbox not blank
                    window.alert("please enter password ?"); //alert message
                    password.style.background = '#f08080'; 
                    password.focus();
                    return false;
                }
            }
        </script>
        
        <style>
            html {
                background-image: url('css/bg.jpg');
            }
        </style>
    </head>
    <body>
        <div class="main-content">
            <form class="form-register" method="post" name="myform" onsubmit="return validate();">
                <div class="form-register-with-email">
                    <div class="form-white-background">
                        <div class="form-title-row">
                            <h1>Login</h1>
                        </div>
                        <p style="color:red">				   		
                            <%
                                if(request.getAttribute("errorMsg")!=null) {
                                    out.println(request.getAttribute("errorMsg")); //error message for email or password 
                                }
                            %>
                        </p>
                        </br>

                        <div class="form-row">
                            <label>
                                <span>Username</span>
                                <input type="text" name="txt_username" id="Email" placeholder="enter username">
                            </label>
                        </div>

                        <div class="form-row">
                            <label>
                                <span>Password</span>
                                <input type="password" name="txt_password" id="Password" placeholder="enter password">
                            </label>
                        </div>

                        <input type="submit" name="btn_login" value="Login">          
                    </div>

                    <!--<a href="register.jsp" class="form-log-in-with-existing">You Don't have an account? <b> Register here </b></a>-->
                </div>
            </form>
        </div>
    </body>
</html>
