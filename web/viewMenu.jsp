
<%-- 
    Document   : ViewMenu
    Created on : May 10, 2022, 11:13:10 PM
    Author     : fakhr
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("EmployeeID");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "test";
    String userid = "root";
    String password = "";
    
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aisyah De Kitchen</title>
    
        <meta charset="UTF-8">
        <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
        <link rel="stylesheet" href="css/adminTest.css">
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>           
            body {
                overflow-x: hidden;
            }
            /* Float four columns side by side */
            .column {
              margin: 0 auto; /* Added */
              float: none; /* Added */
              margin-bottom: 10px; /* Added */
              width: 50%;
              padding: 0 10px;

            }

            /* Remove extra left and right margins, due to padding */
            .row {margin: 0 -5px;}

            /* Clear floats after the columns */
            .row:after {
              content: "";
              display: table;
              clear: both;
            }

            /* Responsive columns */
            @media screen and (max-width: 600px) {
              .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
              }
            }

            /* Style the counter cards */
            .card {
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
              border-radius: 10px;
              padding: 10px;
              text-align: center;
              background-color: #f1f1f1;
            }
            table {
                width: 100%;
                height: 10px;
                text-align: left;
            }
            table, th, td {
                vertical-align: top;
                /*border: 1px solid black;*/
              }
            .card .button {
                border-radius: 8px;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }
            .card .button1 {
                background-color: #8B8000; /* update */
            }
            .card .button2 {
                background-color: #FF3C3C; /* delete */
            }
            .card .button:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }
              
            .card img {
                width: 100px;
                height: 100px;
              }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
                response.sendRedirect("index.jsp"); 
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
                    <a href="AddMenu.jsp">
                        <i class='bx bx-pie-chart-alt-2' ></i>
                        <span class="links_name">Add Menu</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="active">
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
                <h1 style="text-align: center; padding: 50px;">List of Menu</h1>
                        <%
                            try {
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/aisyahdekitchen","root","admin");
                                statement=connection.createStatement();
                                String sql ="select * from dish";
                                resultSet = statement.executeQuery(sql);
                                int i = 0;
                                while(resultSet.next()){
                        %>     
                        <div class="row">
                            <div class="column">
                              <div class="card">
                                  <table>
                                      <tr style="width: 20%;">
                                          <th rowspan="3" style="width: 200px; text-align: center; padding: 50px 0;"><img src="https://cdn-icons-png.flaticon.com/512/4483/4483642.png"></th>
                                      </tr>
                                      <tr>
                                          <th style="width:10%">Dish ID:</th>
                                          <td style="width:10%"><%=resultSet.getString("DishID") %></td>
                                          <th style="width:10%">Name:</th>
                                          <td style="width:30%"><%=resultSet.getString("Name") %></td>
                                      </tr>
                                      <tr>
                                          <th>Price:</th>
                                          <td>RM <%=resultSet.getString("Price") %></td>
                                          <th>Type:</th>
                                          <td><%=resultSet.getString("Type") %></td>
                                      </tr>
                                       <tr>
                                           <td style="text-align: center;"><%=resultSet.getString("Name") %></td>
                                          <th>Status</th>
                                          <td colspan="4"><%=resultSet.getString("Status") %></td>
                                      </tr>
                                       <tr>
                                           <td colspan="3"></td>
                                           <td colspan="2" style="text-align: right; vertical-align: bottom;">
                                               <button class="button button1" onclick="confirmUpdate(id=<%=resultSet.getString(1)%>)">Update</button>
                                               <button class="button button2" onclick="confirmDelete(id=<%=resultSet.getString(1)%>)">Delete</button>
                                           </td>
                                      </tr>
                                  </table>
                              </div>
                            </div>
                        </div>
                        <%
                            i++;
                            }
                            connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>        
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
                };
        </script>
        <script type="text/javascript">
            function confirmDelete(id) {
              var confirmmessage = "Are you sure you want to delete this Staff?";
              var go = "http://localhost:8080/AisyahDeKitchen/deleteMenu.jsp?id="+id;
              var cancel = "http://localhost:8080/AisyahDeKitchen/viewMenu.jsp";
              var message = "Action Was Cancelled By User";

              if (confirm(confirmmessage)) {
                  window.location = go;
              } else {
                   alert(message);
                   window.location = cancel;
              }
            }
        </script>
        <script type="text/javascript">
            function confirmUpdate(id) {
              var confirmmessage = "Are you sure you want to update this Staff?";
              var go = "http://localhost:8080/AisyahDeKitchen/EditMenu.jsp?id="+id;
              var cancel = "http://localhost:8080/AisyahDeKitchen/viewMenu.jsp";
              var message = "Action Was Cancelled By User";

              if (confirm(confirmmessage)) {
                  window.location = go;
              } else {
                   alert(message);
                   window.location = cancel;
              }
            }
        </script>
    </body>
</html>