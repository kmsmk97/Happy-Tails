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
	String sql ="select * from stocks where id="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update</title>


	<link rel="stylesheet" type="text/css" href="stockcss/styles.css">
	<link rel="stylesheet" type="text/css" href="stockcss/header.css">
	<link rel="stylesheet" type="text/css" href="stockcss/footer.css">
	<link rel="stylesheet" type="text/css" href="stockcss/ptu.css">
		<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:40px;">Happy Tail</lable></li>
			<li><a href="Home.html">HOME</a></li>
<li><a href="view.jsp">MEMBERS</a></li>
<li><a href="viewPet.jsp">PETS</a></li>
<li><a href="VictoryViewAll.jsp">VICTORY LOGS</a></li>
<li><a href="stockview.jsp">STOCKS</a></li>
<li><a href="About.html">ABOUT US</a></li>

			
		</ul>
		
 </head>
 <hr>
<link rel="stylesheet" type="text/css" href="css/stocksinsert.css">
	<style>
	* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
  position: center;
  
	margin: auto;
}
form {
	margin: auto;
    
    width: 100%;
}

table {
    width: 90%;
    border-collapse: collapse;
    text-align: center;
}


/* Full-width input fields */
input[type=text], input[type=DATE], input[type=animal] {
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
	

<body style="
	background-image:url(file:///C:/Users/Fujitsu/eclipse-workspace/Happy/src/main/webapp/images/image1.jpg);
	background-repeat:no-repeat;
	background-postion:center;
	background-size:cover;
	margin:auto;
	max-width: 1000px;
	padding: 0px;"
}>
	<div class="container">
	<h1>Update Stock</h1>
	
  	<form action="stockupdate" method="post">
  	<input type="hidden" name="patid" value="<%=resultSet.getString("id") %>">
      	<label for="pid">Item ID</label>
      		<input type="text" name="id"  value="<%=resultSet.getString("id") %>" readonly ><br>

      	<label for="name"><b>Item Name</b></label>
      		<input type="text" name="name" value="<%=resultSet.getString("name") %>" > <br>

      	<label for="animal" class="form-label" >Concerned Animal</label> 
		<select name="animal" id="animals" class="form-control text-uppercase" >
			<option value="dog">Dog</option>
			<option value="cat">Cat</option>
			<option value="birds">Birds</option>
			<option value="mouse">Mouse</option>
			<option value="bunny">Bunny</option>
		</select>
		
		<label for="size" class="form-label">Item Size</label><br> 
		<input type="radio" id="small" name="size" value="SMALL" checked>
		<label for="small"  >SMALL</label>
		<input type="radio" id="medium" name="size" value="MEDIUM">
		<label for="medium">MEDIUM</label>
		<input type="radio" id="large" name="size" value="LARGE">
		<label for="large">LARGE</label><br>
      		
      	<label for="address"><b>Unit Price(Rs.)</b></label>
    <input type="text" placeholder="00.00" name="uprice" id="uprice" value="<%=resultSet.getString("uprice") %>">
    
    <label for="phone"><b>Quantity</b></label>
    <input type="text" placeholder="00" name="quantity" id="qty" value="<%=resultSet.getString("quantity") %>">

    <label for="date"><b>Serial Number</b></label>
    <input type="text" placeholder="00.00" name="amount" id="amt" value="<%=resultSet.getString("amount") %>">
    
    <label for="age"><b>Coordinator name</b></label>
    <input type="text" placeholder="mr.smith" name="coordinator" id="coordinator" value="<%=resultSet.getString("coordinator") %>" readonly>
      		
  	<div class="row">
    	<input type="submit" value="Update">
 	 </div><br>
 	 
 	 <button type="button" id="Back"><a href="stockview.jsp">Back</a></button>
	
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