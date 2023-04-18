<%-- 
    Document   : updateStaffProcess
    Created on : May 28, 2022, 9:33:59 PM
    Author     : fakhr
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/aisyahdekitchen";%>
<%!String user = "root";%>
<%!String psw = "admin";%>
<%
    String id = request.getParameter("id");
    String empID = request.getParameter("txt_employeeid");
    String username = request.getParameter("txt_username");
    String password = request.getParameter("txt_password");
    String shift = request.getParameter("txt_shift");
    String gender = request.getParameter("txt_gender");
    String name = request.getParameter("txt_fullname");
    String salary = request.getParameter("nmbr_salary");
    String dob = request.getParameter("date_DOB");
    String address = request.getParameter("txt_address");
    String designation = request.getParameter("txt_designation");
    String department = request.getParameter("txt_department");
    
    
    if(id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(id);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update employee set id=?, EmployeeID=?, Username=?, Password=?, Shift=?, Gender=?, Name=?, Salary=?, DOB=?, Address=?, Designation=?, Department=? where id="+id;
            ps = con.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2, empID);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, shift);
            ps.setString(6, gender);
            ps.setString(7, name);
            ps.setString(8, salary);
            ps.setString(9, dob);
            ps.setString(10, address);
            ps.setString(11, designation);
            ps.setString(12, department);
            int i = ps.executeUpdate();
            if(i > 0) {
                response.sendRedirect("viewStaff.jsp"); //after login success redirect to viewStaff.jsp page
            } else {
                out.print("There is a problem in updating Record.");
            } 
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
