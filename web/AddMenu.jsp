<%-- 
    Document   : AddMenu
    Created on : May 10, 2022, 10:54:01 PM
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
		
            pstmt=con.prepareStatement("insert into dish(DishID,Name,Price,Type,Status) values(?,?,?,?,?)"); //sql insert query
            pstmt.setString(1,request.getParameter("txt_id")); //txt_employeeid
            pstmt.setString(2,request.getParameter("txt_name")); //txt_username
            pstmt.setString(3,request.getParameter("txt_price")); //txt_password
            pstmt.setString(4,request.getParameter("txt_type")); //txt_shift
            pstmt.setString(5,request.getParameter("txt_status")); //txt_shift
		
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
                    <a href="register.jsp">
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
                    <a href="#" class="active">
                        <i class='bx bx-pie-chart-alt-2' ></i>
                        <span class="links_name">Add Menu</span>
                    </a>
                </li>
                <li>
                    <a href="viewMenu.jsp">
                        <i class='bx bx-pie-chart-alt-2' ></i>
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
                                <h1>Add Menu</h1>
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
                                    <span>Dish ID</span>
                                    <input type="text" name="txt_id" id="dishID" placeholder="Enter Dish ID">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Name</span>
                                    <input type="text" name="txt_name" id="name" placeholder="Enter Dish Name">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Price</span>
                                    <input type="text" name="txt_price" id="price" placeholder="Enter Dish Price">
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Type</span>
                                    <select name="txt_type" style="color:  #5f5f5f;box-sizing: border-box;width: 230px;box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);padding: 12px 18px;border: 1px solid #dbdbdb;">  
                                        <option value = "Nasi Goreng">Nasi Goreng</option>  
                                        <option value = "Mee">Mee</option>  
                                        <option value = "Kuey Teaw">Kuey Teaw</option>  
                                    </select>
                                </label>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Status</span>
                                    <select name="txt_status" style="color:  #5f5f5f;box-sizing: border-box;width: 230px;box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);padding: 12px 18px;border: 1px solid #dbdbdb;">  
                                        <option value = "Available">Available</option>  
                                        <option value = "Unavailable">Unavailable</option>  
                                </select>
                                </label>
                            </div>
                            <input type="submit" name="btn_register" value="Add">			
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
                } else
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
                }
        </script>
    </body>
</html>