<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/happytailsdb";
String userid = "root";
String password = "";

try {
	Class.forName(driver);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from pet where id="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update</title>


	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/ptu.css">
		<hr>
	
		<ul class="one" position=fixed;>
		<li><lable style="font-size:40px;  text-align: center;">Happy Tails</lable></li>
			
	<li><a href="Home.html">Home</a></li>
			<li><a href="view.jsp">Members</a></li>
			<li><a href="viewPet.jsp">Pets</a></li>
			<li><a href="VictoryViewAll">Victory Log</a></li>
			<li><a href="stockview.jsp">Stocks </a></li>
			<li><a href="About.html">About Us</a></li>
		</ul>
		
 </head>
 <hr>
<link rel="stylesheet" type="text/css" href="css/patientinsert.css">
	<style>
	* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
  position: center;
  
	margin: auto;
}
form {
	
	display: inline-block; 
    margin-left: 30%;
    margin-right:30%;
    width: 100%;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}


/* Full-width input fields */
input[type=text], input[type=DATE], input[type=number] {
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: flex;
  border: none;
  background: #f1f1f1;
  float: center;
  
   text-align: center;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;

}

/* Set a style for the submit/register button */
.submitbtn {
  background-color: red;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 50%;
  opacity: 0.9;

}

.submitbtn:hover {
  opacity:1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}


	</style>		
 </head>
 <hr>
	

<body style="background-image: url(images/pet.jpg);background-repeat: no-repeat;">
	<div >
	<h1>Update Pets</h1>
	
  	<form action="petupdate" method="post">
  	<input type="hidden" name="ptid" value="<%=resultSet.getString("id") %>">
      	<label for="pid">Patient ID</label>
      		<input type="text" name="id"  value="<%=resultSet.getString("id") %>" readonly ><br>

      	<label for="name"><b>Name</b></label>
      		<input type="text" name="name" value="<%=resultSet.getString("name") %>" > <br>

     		
      	<label for="phone"><b>Phone Number</b></label>
      		<input type="text" name="phone" value="<%=resultSet.getString("phone") %>" > <br>

      	<label for="date"><b>Date</b></label>
      		<input type="date" name="date" value="<%=resultSet.getString("date") %>"><br>
      		
      	 <label for="category"><b>Category</b></label>
      		<input type="text" name="category" value="<%=resultSet.getString("category") %>"> <br>    	

      	<label for="petname"><b>Pet name</b></label>
      		<input type="text" name="petname" value="<%=resultSet.getString("petname") %>"> <br>
      	
      	<br>		
      	<label for="gender"><b>Gender</b></label> <br>
      		<input type="radio" id="male" name="gender" value="male"   checked> <label for="male">Male</label>
     		<input type="radio" id ="female" name="gender" value="female" ><label for="female">Female</label>
     
     	<br>
      		
      	<label for="age"><b>Age</b></label>
      		<input type="text" name="age" value="<%=resultSet.getString("age") %>" > <br>
      		
     	<label for="breed"><b>Breed</b></label>
      		<input type="text" name="breed" value="<%=resultSet.getString("breed") %>" ><br>
      		
      	<label for="dob"><b>DOB</b></label>
      		<input type="date" name="dob" value="<%=resultSet.getString("dob") %>"><br>
     
       	
      		
		      	

  	
  	<div class="row">
    	<input type="submit" value="Update">
 	 </div>
	
	</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>