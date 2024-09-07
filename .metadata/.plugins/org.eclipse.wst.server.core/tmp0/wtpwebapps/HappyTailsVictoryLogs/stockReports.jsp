<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "happytailsdb";
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
ResultSet resultSet1 = null;
%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<meta charset="ISO-8859-1">
<title>stocks Report</title>
<link rel = "stylesheet" href = "Styles/vehicle/deco.css">
<link rel = "stylesheet" href = "Styles/vehicle/ieldset.css">
<script src="JavaScriptSources/St_search.js"></script>




<style>
  table {
    border-collapse: collapse;
  }
  th, td {
    border: 2px solid black;
    padding: 10px;
    text-align: left;
  }
  
  .back{
  
  		background-color:  	#D3D3D3;
  
  
  }
  
  
  fieldset{
	
	margin:50px 20px 20px 20px;
	width: 70%;
	border-color:black;
	 border-radius: 10px;
	
	background-color:#F8F8F8;
}
  
  
  
</style>









</head>
<body>
	<!-- header -->
	<div class="header">
		<center>
			<img alt="" src="images/logo.jpg" width =300px height="200px">
		</center>
	</div>


	<!-- <br><br>-->
<center>

<fieldset> 
	<center>
	
		
	</center>
	<!-- table -->
	<br>
	<br>

<div id="list">

<p style="width: 50%;margin:0% 5%">Date&Time:<%=new Date().toString()%> </p>  
<center>
	<table>
	
	<h1>Stocks Report</h1>
		<tr >
		    <th><h3>Item ID<h3></th>
			<th><h3>Item Name<h3></th>
			<th><h3>Concerned Animal<h3></th>
			<th><h3>Item Size<h3></th>
			<th><h3>Unit Price(Rs.)<h3></th>
			<th><h3>Quantity<h3></th>
			<th><h3>Serial Number<h3></th>
			<th><h3>Coordinator Name<<h3></th>
			
		</tr>
		
		<br>
		
		
			
			
			<br><br>
			

		<%
		try {
			String name = request.getParameter("name");

			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement = connection.createStatement();
			
		
				String sql = "select *  from stocks where name='" + name + "' ";
				resultSet = statement.executeQuery(sql);
				

				while (resultSet.next()) {

		%>
		<tr>
		
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("name") %></td>
			<td><%=resultSet.getString("animal") %></td>
			<td><%=resultSet.getString("size") %></td>
			<td><%=resultSet.getString("uprice") %></td>
			<td><%=resultSet.getString("quantity") %></td>
			<td><%=resultSet.getString("amount") %></td>
			<td><%=resultSet.getString("coordinator") %></td>
			
		</tr> 
		<%
		}
				
				String sql1 = "select COUNT(id) AS count from stocks where name='" + name + "' ";
				resultSet1 = statement.executeQuery(sql1);

				Float count;	
					
				if(resultSet1.next()){
					
					count =resultSet1.getFloat("count");

				}
				
				%>
				<tr class="back">
				    <td><h4> Items count</h4> </td>
					<td><h4><%=resultSet1.getString("count")%></h4></td>
					
					 
					
					
				</tr>
<% 				
				
			String sql2 = "select SUM(amount) AS new_amount  from stocks where name='" + name + "' ";
			resultSet = statement.executeQuery(sql2);
			Float New_amount;	
					
				if(resultSet.next()){
					New_amount=resultSet.getFloat("new_amount");
 				}
%>
				<tr class="back" >
				    <td><b> Budget</b> </td>
					<td><b><center>   <%=resultSet.getString("new_amount")%></center></b></td>
				</tr>
				
				

	<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>

		
	</table>
	</center>
  </div> 
 
		
	
	<br>
	
</fieldset> 

<button onclick="print()" class="button2">Download  Report</button>
</center>

	
	<script >
	
	function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'Stocks report.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();
	
	}
	
	
	</script>
	
	
	
	
	
</body>
</html>
