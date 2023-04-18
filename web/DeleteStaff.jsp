<%-- 
    Document   : ViewStaff
    Created on : May 9, 2022, 9:09:13 PM
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
        int i=st.executeUpdate("DELETE FROM employee WHERE id="+id);
         response.sendRedirect("viewStaff.jsp"); //after login success redirect to viewStaff.jsp page
    } catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
