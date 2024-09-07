<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/happytailsdb", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM pet WHERE id="+id);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

<h1>Data Deleted Successfully</h1>
<a href="viewPet.jsp"><button align="right">Back</button></a>