<%-- 
    Document   : updateMenuProcess
    Created on : May 31, 2022, 1:37:03 AM
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
    String dishID = request.getParameter("txt_id");
    String name = request.getParameter("txt_name");
    String price = request.getParameter("txt_price");
    String type = request.getParameter("txt_type");
    String status = request.getParameter("txt_status");
    
    if(id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(id);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update dish set id=?, DishID=?, Name=?, Price=?, Type=?, Status=? where id="+id;
            ps = con.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2, dishID);
            ps.setString(3, name);
            ps.setString(4, price);
            ps.setString(5, type);
            ps.setString(6, status);
            int i = ps.executeUpdate();
            if(i > 0) {
                response.sendRedirect("viewMenu.jsp"); //after login success redirect to viewStaff.jsp page
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
