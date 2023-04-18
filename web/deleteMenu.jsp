<%-- 
    Document   : deleteMenu
    Created on : May 31, 2022, 1:26:06 AM
    Author     : fakhr
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aisyahdekitchen", "root", "admin");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("DELETE FROM dish WHERE id="+id);
         response.sendRedirect("viewMenu.jsp"); //after login success redirect to viewStaff.jsp page
    } catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
