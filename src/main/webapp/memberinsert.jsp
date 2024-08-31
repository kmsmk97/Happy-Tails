<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 

<head>

	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/pti.css">
	
		<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:40px;">Happy Tails</lable></li>
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
.form {
	text-transform: uppercase;
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
  background-color: #00cc00;
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

.uBack{
  background-color: #00cc00;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 50%;
  opacity: 0.9;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}


.w3-button {width:150px;}

.button {
  background-color:#002699; /* Green */
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
<title>INSERT MEMBER</title>
</head>
<body class="ibody">

	<br><br>
	<h6 style = "text-align:center;font-size:30px;font-style:bold;color:red">ADD NEW MEMBER DETAILS</h6>
	
	<form action="insert" method="post">
		
	
  <div class="form" >
    
    <p>Please fill in this form to add a member.</p>
   

    <label for="name"><b>Name :</b></label>
    <input type="text" placeholder="Insert name with initials" name="name" id="name" STYLE="text-transform:uppercase" required >

    <label for="nic"><b>NIC :</b></label>
    <input type="text" pattern=[0-9]{9}[VvXx]{1}||[0-9]{12} placeholder="856478914V or 856478914X or 200045787844" name="nic" id="nic" STYLE="text-transform:uppercase" required >
    
    <label for="phone"><b>Phone :</b></label>
    <input type="text" pattern=[0]{1}[0-9]{9} placeholder="0774567890" name="phone" id="phone" required >

    <label for="address"><b>Address :</b></label>
    <input type="text" placeholder="enter your residence address" name="address" id="address" STYLE="text-transform:uppercase" required >
    
      <br>
    <label for="gender"><b>Gender :</b></label><br>
    <input type="radio" id="male" name="gender" value="male" > <label for="male">Male</label>
     <input type="radio" id="female" name="gender" value="female" > <label for="female">Female</label>
     
     <br>
     <label for="date"><b>Date of Registration :</b></label>
    <input type="date" placeholder="Date of Registration" name="date" id="date" min="2022-01-01"required >
    
     
    <label for="type"><b>Type :</b></label><br>
    
    <input type="radio" id="type" name="type" value="Commitee Member"> <label for="Commitee Member">Commitee Member</label>
    <input type="radio" id="type" name="type" value="New volunteer"> <label for="New volunteer">New volunteer</label><br>
   <br><br>
    
    <label for="fee"><b>Annual Fee(Rs.) :</b></label>
    <input type="number" placeholder="Enter fee" name="fee" id="address" ><br><br>
    
  
    <button type="submit" class="submitbtn" onclick="alert('Adding New Record!')" >Submit</button><br><br>
    
    <a href="view.jsp"><button class="uBack" onclick="history.back()" >Back</button></a>
  </div>


</form><br>
		
	<br><br>


</body>
</html>