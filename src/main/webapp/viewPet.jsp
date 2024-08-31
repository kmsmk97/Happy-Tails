<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/happytailsdb";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
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
<style >

.button {
  background-color:red; /* Green */
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
.button2:hover {
  align:center;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}


</style>
	<meta charset="ISO-8859-1">


	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/view.css">
	
 	<title>View All</title>

 

	<hr>
	
		<ul class="one" position=center>
		<li><lable style="font-size:40px;  text-align: center;">Happy Tails</lable></li>
			
	<li><a href="Home.html">Home</a></li>
			<li><a href="view.jsp">Members</a></li>
			<li><a href="viewPet.jsp">Pets</a></li>
			<li><a href="VictoryViewAll.jsp">Victory Log</a></li>
			<li><a href="stockview.jsp">Stocks </a></li>
			<li><a href="About.html">About Us</a></li>
		</ul>
		
		
 	
 </head>

<body style="background-image: url(images/Pets.jpg);background-repeat: no-repeat;">
<br><br>
	
	<h1 align="center"><font><strong>Pets Record</strong></font></h1>

	<div class=search>
		<form action="petsearch" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:12pt;" align="center">
			<td><label for="fname">Search data by Pets Name</label></td>
			<td><input type="text" name="petname" ></td>
			<td><input  type="submit" name="submit" value="Search"></td></tr>
		</table>
	</form>
	</div>
	
	
	
	
	<center>
	<table border="2">
	
	<tr></tr>

		<td><b>ID</b></td>
		<td><b>Name</b></td>
		
		<td><b>Phone Number</b></td>
		<td><b>Date</b></td>
		<td><b>Category</b></td>
		<td><b>Pet Name</b></td>
		<td><b>Gender</b></td>
		<td><b>Age</b></td>
		<td><b>Breed</b></td>
		<td><b>DOB</b></td>
		<td><b>Update</b></td>
		<td><b>Delete</b></td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM pet";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>

<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("category") %></td>
<td><%=resultSet.getString("petname") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("breed") %></td>
<td><%=resultSet.getString("dob") %></td>

<td><a href="updatepet.jsp?id=<%=resultSet.getString("id")%>">Update</a></td>
<td><a href="deletePet.jsp?id=<%=resultSet.getString("id")%>">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>
</table>
</center>

<br><br>
<center>
<a href="report"><button class="button button2">Download records</button>	
<a href="petreportsearch.jsp"><button class="button button2">Reports</button>		
<a href="petinsert.jsp"><button class="button button2">Add Pets</button>

</center>									

<br>

	
</body>

</html>