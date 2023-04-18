<%-- 
    Document   : login
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
        <style>
            html{
                background-color: #F3EBF6;
            }
            body {
                height: 100%;
                background-color: #F3EBF6;
                font-family: 'Ubuntu', sans-serif;
            }
    
            .main {
                background-color: #FFFFFF;
                width: 400px;
                height: 400px;
                margin: 7em auto;
                border-radius: 1.5em;
                box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            }

            .sign {
                padding-top: 40px;
                color: #8C55AA;
                font-family: 'Ubuntu', sans-serif;
                font-weight: bold;
                font-size: 23px;
            }
            
            .error {
                padding-top: 20px;
                color: red;
                font-family: 'Ubuntu', sans-serif;
                font-size: 13px;
            }

            .un {
                width: 76%;
                color: rgb(38, 50, 56);
                font-weight: 700;
                font-size: 14px;
                letter-spacing: 1px;
                background: rgba(136, 126, 126, 0.04);
                padding: 10px 20px;
                border: none;
                border-radius: 20px;
                outline: none;
                box-sizing: border-box;
                border: 2px solid rgba(0, 0, 0, 0.02);
                margin-bottom: 50px;
                margin-left: 46px;
                text-align: center;
                margin-bottom: 27px;
                font-family: 'Ubuntu', sans-serif;
            }

            form.form1 {
                padding-top: 10px;
            }

            .pass {
                width: 76%;
                color: rgb(38, 50, 56);
                font-weight: 700;
                font-size: 14px;
                letter-spacing: 1px;
                background: rgba(136, 126, 126, 0.04);
                padding: 10px 20px;
                border: none;
                border-radius: 20px;
                outline: none;
                box-sizing: border-box;
                border: 2px solid rgba(0, 0, 0, 0.02);
                margin-bottom: 50px;
                margin-left: 46px;
                text-align: center;
                margin-bottom: 27px;
                font-family: 'Ubuntu', sans-serif;
            }

            .un:focus, .pass:focus {
                border: 2px solid rgba(0, 0, 0, 0.18) !important;

            }

            .submit {
                cursor: pointer;
                border-radius: 5em;
                color: #fff;
                background: linear-gradient(to right, #9C27B0, #E040FB);
                border: 0;
                padding-left: 40px;
                padding-right: 40px;
                padding-bottom: 10px;
                padding-top: 10px;
                font-family: 'Ubuntu', sans-serif;
                margin-left: 35%;
                font-size: 13px;
                box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
            }

            .forgot {
                text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
                color: #E1BEE7;
                padding-top: 15px;
            }

            a {
                text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
                color: #E1BEE7;
                text-decoration: none
            }

            @media (max-width: 600px) {
                .main {
                    border-radius: 0px;
                }
            }
        
        </style>
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
    </head>
    <body>
        <div class="main">
            <p class="sign" align="center">Sign in</p>
            <p class="error" align="center">				   		
                <%
                    if(request.getAttribute("errorMsg")!=null) {
                        out.println(request.getAttribute("errorMsg")); //error message for email or password 
                    }
                %>
            </p>
            <form class="form1">
                <input class="un " name="txt_username" id="Email" type="text" align="center" placeholder="Username">
                <input class="pass" name="txt_password" id="Password" type="password" align="center" placeholder="Password">
                <input type="submit" class="submit" name="btn_login" value="Login">        
                <p class="forgot" align="center"><a href="#">Forgot Password?</p>    
            </form>
        </div>
    </body>
</html>
