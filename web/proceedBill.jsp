<%-- 
    Document   : proceedBill
    Created on : May 10, 2022, 11:09:01 PM
    Author     : Hamdan Sumat
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body>
    <%
            if(session.getAttribute("login")==null || session.getAttribute("login")==" ") {//check condition unauthorize user not direct access welcome.jsp page
                response.sendRedirect("index.jsp"); 
            }
        %>
    <div class="card">
        <div class="card-header">
            Aisyah De Kitchen System
        </div>
    </div>

    <div align="center">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Order Date</th>
                    <th scope="col">Total Price(RM)</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
<!--            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button type="button" class="btn btn-primary">VIEW BILL</button>
                    <button type="button" class="btn btn-danger">DELETE</button>
                </td>
            </tr>-->
            <tbody>
                <%
                    try {
                        //db connection
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aisyahdekitchen", "root", "admin");
                        Statement st = con.createStatement();
                        String order = request.getParameter("order");
                        String sqlStr = "select * from orders where OrderID='" + order + "'";
                        ResultSet rs = st.executeQuery(sqlStr);
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getDate("OrderDate")%></td>
                    <td><%=rs.getFloat("TotalPrice")%></td>
                    <td>
                        <button type="button" class="btn btn-primary">VIEW BILL</button>
                        <button type="button" class="btn btn-danger">DELETE</button>
                    </td>
                </tr>
                <%
                        }

                    } catch (Exception e) {
                        System.out.println(e.getMessage());

                    }
                %>
            </tbody>
            <td>
                <button type="button" class="btn btn-success">PAY</button>
                <button type="button" class="btn btn-success">PRINT RECEIPT</button>
            </td>
        </table>
    </div>   
</body>

</html>
