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
  
.button2 {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

  
  
  
</style>


</head>

<body>
	<!-- header -->
	<div class="header">
		

	</div>


	<!-- <br><br>-->
<center>

<fieldset> 
	<center>
	
		
	</center>

<div id="list">

		<center><img src ="victoryImages/logo.jpg" width =300px height="200px" > </center>

<center>
	<table>
	
	
<p style="width: 50%; margin:0% 0%; align:left";>Report generated Date and Time:<%=new Date().toString()%> </p>  
		<h1>Pets Report</h1>
		<tr >
		    <th><h3>ID<h3></th>
			<th><h3>Pet Name<h3></th>
			<th><h3>Date<h3></th>
			<th><h3>Category<h3></th>
			<th><h3>Gender<h3></th>
			<th><h3>Age<h3></th>
			<th><h3>Breed<h3></th>
			<th><h3>DOB<h3></th>
			
			 
			
		</tr>
		
		<br>
		
		
			
			
			<br><br>
			

		<%
		try {
			String month = request.getParameter("Month");

			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement = connection.createStatement();
			
		
				String sql = "select *   from pet where date like '"+month+"%'";
				resultSet = statement.executeQuery(sql);
				

				while (resultSet.next()) {

		%>
		<tr>
			<td><%=resultSet.getString("id")%></td>
			<td><%=resultSet.getString("petname")%></td>
			<td><%=resultSet.getString("date")%></td>
			<td><%=resultSet.getString("category")%></td>
			<td><%=resultSet.getString("gender")%></td>
			<td><%=resultSet.getString("age")%></td>
			<td><%=resultSet.getString("breed")%></td>
			<td><%=resultSet.getString("dob")%></td>
			 
			
			
		</tr> 
		<%
		}
				
				String sql1 = "select COUNT(id) AS count from pet where date like '"+month+"%' ";
				resultSet1 = statement.executeQuery(sql1);

				Float count;	
					
				if(resultSet1.next()){
					
					count =resultSet1.getFloat("count");

				}
				
				%>
				<tr class="back">
				    <td><h4> Total records</h4> </td>
					<td><h4><%=resultSet1.getString("count")%></h4></td>
					
					 
					
					
				</tr>
				<%
				 
				
				
			
					
					
					            
				
				
					
					
					
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
	
		
	</table>
	
	 <div class="row mt-4">
	<div class="col-md-12">
	<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired By: ................................................ </p><br>
	<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired Date: ................................................ </p>
	
	
	</center>
  </div> 

</div>
		
	
	<br>
	
</fieldset> 

<button onclick="print()" class="button2">Download  Report</button>&nbsp &nbsp
           <a href="petreportsearch.jsp"  class="button button2">BACK</a> 
</center>

	
	<script >
	
	function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'Pets report.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'landscape' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();
	
	}
	
	
	</script>
	
	
	
	
	
</body>
</html>
