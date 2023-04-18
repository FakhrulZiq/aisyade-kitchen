<%-- 
    Document   : register
    Created on : Apr 25, 2022, 9:46:53 PM
    Author     : fakhr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%--<%
    if(session.getAttribute("login")!=null) {//check login session user not access or back to register.jsp page
        response.sendRedirect("welcome.jsp");
    }
%>--%>

<%
    try {
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aisyahdekitchen","root","admin"); //create connection
	
	if(request.getParameter("btn_register")!=null){ //check register button click event not null
		
            PreparedStatement pstmt=null; //create statement
		
            pstmt=con.prepareStatement("insert into employee(EmployeeID,Username,Password,Shift,Gender,Name,Salary,DOB,Address,Designation,Department) values(?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query
            pstmt.setString(1,request.getParameter("txt_employeeid")); //txt_employeeid
            pstmt.setString(2,request.getParameter("txt_username")); //txt_username
            pstmt.setString(3,request.getParameter("txt_password")); //txt_password
            pstmt.setString(4,request.getParameter("txt_shift")); //txt_shift
            pstmt.setString(5,request.getParameter("txt_gender")); //txt_shift
            pstmt.setString(6,request.getParameter("txt_fullname")); //txt_shift
            pstmt.setString(7,request.getParameter("nmbr_salary")); //txt_shift
            pstmt.setString(8,request.getParameter("date_DOB")); //txt_shift
            pstmt.setString(9,request.getParameter("txt_address")); //txt_shift
            pstmt.setString(10,request.getParameter("txt_designation")); //txt_shift
            pstmt.setString(11,request.getParameter("txt_department")); //txt_shift
		
            pstmt.executeUpdate(); //execute query
		
            request.setAttribute("successMsg","Register Successfully...!"); //register success messeage
            
            con.close(); //close connection
	}
    }
    catch(Exception e){
	out.println(e);
    }
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aisyah De Kitchen</title>
    
        <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
        <link rel="stylesheet" href="css/adminTest.css">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="css/login-register.css">
    
        <!-- javascript for registeration form validation-->
        <script>	
            function validate() {
                var fname_valid = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
                var username_valid = /^[0-9a-zA-Z]+$/; //pattern allowed alphabet a-z or A-Z and 1 - 10
                var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 

                var empID = document.getElementById("empID"); //textbox id fname
                var username = document.getElementById("username"); //textbox id lname
                var passowrd = document.getElementById("password"); //textbox id email
                var shift = document.getElementById("shift"); //textbox id password
                var gender = document.getElementById("gender"); //textbox id fname
                var fullname = document.getElementById("fname"); //textbox id lname
                var salary = document.getElementById("salary"); //textbox id email
                var dob = document.getElementById("myDate"); //textbox id password
                var address = document.getElementById("address"); //textbox id email
                var designation = document.getElementById("designation"); //textbox id password

                if(!username_valid.test(empID.value) || empID.value==='') {
                    alert("Enter Employee ID Alphabet and Number Only....!");
                    empID.focus();
                    empID.style.background = '#f08080';
                    return false;                    
                }
                
                if(!fname_valid.test(fname.value) || fname.value==='') {
                    alert("Enter Firstname Alphabet Only....!");
                    fname.focus();
                    fname.style.background = '#f08080';
                    return false;                    
                }

                if(!password_valid.test(password.value) || password.value==='') {
                    alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                    password.focus();
                    password.style.background = '#f08080';
                    return false;                    
                }
            }	
        </script>	
    </head>
    <body>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
                response.sendRedirect("login.jsp"); 
            }
        %>
        
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxl-c-plus-plus'></i>
                <span class="logo_name">Aisyah De Kitchen</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="Admin.jsp">
                        <i class='bx bx-grid-alt' ></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="active">
                        <i class='bx bx-box' ></i>
                        <span class="links_name">Register Staff</span>
                    </a>
                </li>
                <li>
                    <a href="viewStaff.jsp">
                        <i class='bx bx-list-ul' ></i>
                        <span class="links_name">View Staff</span>
                    </a>
                </li>
                <li>
                    <a href="AddMenu.jsp">
                        <i class='bx bx-pie-chart-alt-2' ></i>
                        <span class="links_name">Add Menu</span>
                    </a>
                </li>
                <li>
                    <a href="viewMenu.jsp">
                        <i class='bx bx-coin-stack' ></i>
                        <span class="links_name">View Menu</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-book-alt' ></i>
                        <span class="links_name">Total order</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-user' ></i>
                        <span class="links_name">Team</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-message' ></i>
                        <span class="links_name">Messages</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-heart' ></i>
                        <span class="links_name">Favrorites</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-cog' ></i>
                        <span class="links_name">Setting</span>
                    </a>
                </li>
                <li class="log_out">
                    <a href="logout.jsp">
                        <i class='bx bx-log-out'></i>
                        <span class="links_name">Log out</span>
                    </a>
                </li>
            </ul>  
        </div>            
        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="profile-details">
                    <!--<img src="images/profile.jpg" alt="">-->
                    <span class="admin_name"><%=session.getAttribute("login")%></span>
                    <i class='bx bx-chevron-down' ></i>
                </div>
            </nav>

            <div class="home-content">
                <form class="form-register" method="post" onsubmit="return validate();">
                    <div class="form-register-with-email">
                        <div class="form-white-background">
                            <div class="form-title-row">
                                <h1>Register</h1>
                            </div>
                            <p style="color:green">				   		
                                <%
                                    if(request.getAttribute("successMsg")!=null) {
                                        out.println(request.getAttribute("successMsg")); //register success message
                                    }
                                %>
                            </p>
                            </br>

                            <div class="form-row">
                                <label>
                                    <span>EmployeeID</span>
                                    <input type="text" name="txt_employeeid" id="empID" placeholder="enter employeeid">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Username</span>
                                    <input type="text" name="txt_username" id="username" placeholder="enter username">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Password</span>
                                    <input type="text" name="txt_password" id="password" placeholder="enter password">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Shift </span>
                                    <select name="txt_shift" style="color:  #5f5f5f;box-sizing: border-box;width: 230px;box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);padding: 12px 18px;border: 1px solid #dbdbdb;">  
                                        <option value = "Opening">Opening</option>  
                                        <option value = "Middle">Middle</option>  
                                        <option value = "Closing">Closing</option>
                                    </select>
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Gender </span>
                                    <select name="txt_gender" style="color:  #5f5f5f;box-sizing: border-box;width: 230px;box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);padding: 12px 18px;border: 1px solid #dbdbdb;">  
                                        <option value = "Male">Male</option>  
                                        <option value = "Female">Female</option>  
                                    </select>
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Full Name</span>
                                    <input type="text" name="txt_fullname" id="fname" placeholder="enter full name">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Salary</span>
                                    <input type="number" name="nmbr_salary" id="salary" placeholder="enter salary">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Date of Birth</span>
                                    <input type="date" name="date_DOB" id="myDate" value="2014-02-09">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Address</span>
                                    <input type="text" name="txt_address" id="address" placeholder="enter address">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Designation</span>
                                    <input type="text" name="txt_designation" id="designation" placeholder="enter designation">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Department</span>
                                    <select name="txt_department"style="color:  #5f5f5f;box-sizing: border-box;width: 230px;box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);padding: 12px 18px;border: 1px solid #dbdbdb;">    
                                        <option value = "Admin">Admin</option>  
                                        <option value = "Chef">Chef</option>  
                                        <option value = "Cashier">Cashier</option>  
                                        <option value = "Waiter">Waiter</option>  
                                </select>
                                </label>
                            </div>
                            <input type="submit" name="btn_register" value="Register">			
                        </div>
                        <!--<a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a> -->
                    </div>
                </form>
            </div>
        </section>
        <script>
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".sidebarBtn");
            sidebarBtn.onclick = function() {
                sidebar.classList.toggle("active");
                if(sidebar.classList.contains("active")){
                    sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
                } else {
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
                }
            }
        </script>
    </body>
</html>
