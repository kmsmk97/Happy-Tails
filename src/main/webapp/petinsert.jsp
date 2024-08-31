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
<link rel="stylesheet" type="text/css" href="css/petinsert.css">
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
    margin-left: 37%;
    margin-right:10%;
    width: 56%;
}

table {
    width: 50%;
    border-collapse: collapse;
    text-align: center;
}


/* Full-width input fields */
input[type=text], input[type=DATE], input[type=number] {
  width: 50%;
  padding: 15px;
  margin: 1px 0 10px 0;
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
  background-color: 	 #008000;
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


.w3-button {width:150px;}

.button {
  background-color: #26734d; /* Green */
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

.button3 {
  background-color:#26734d; /* Green */
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
<title>Pets Information</title>
</head>
<body style="background-image: url(images/pet.jpg);background-repeat: no-repeat;">


<h6 style = "text-align:center;font-size:30px;font-style:italic;color:red">Pet Registration</h6>
	
		
	
<a href="viewPet.jsp"><button class="button button2">View Records</button></a>	
	
	
	<form action="petinsert" method="post">
		
	
  <div class="form" >
    <p style="background-image: H:\Udaya itpm\2\Happy Tails\src\main\webapp\images\1.jpg;">
    
    <p>Please fill the form to register your pet.</p>
   

    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="K.G.Kumara" name="name" id="name" required >

    <label for="phone"><b>Phone</b></label>
    <input type="text" placeholder="8xxxxxxxx/7xxxxxxxx" pattern="[78]{1}[0-9]{8}" name="phone" id="phone" required>

    <label for="date"><b>Date</b></label>
    <input type="date" placeholder="Enter date" name="date" id="date" required > 
    
    
    <label for="category"><b>Category</b></label>
    <input type="text" placeholder="Dogs" name="category" id="category" required >
    
      
    <label for="petname"><b>Pet Name</b></label>
    <input type="text" placeholder="Dextor" name="petname" id="petname"  required>
    
     <br>
    <label for="gender"><b>Gender</b></label><br>
    <input type="radio" id="male" name="gender" value="male"  > <label for="male">Male</label>
     <input type="radio" id="female" name="gender" value="female" > <label for="female" >Female</label>
     
     <br>
    
    <label for="age"><b>Age</b></label>
    <input type="text" placeholder="Enter age" name="age" id="age" required>

    <label for="breed"><b>Breed</b></label>
    <input type="text" placeholder="Rottweiler" name="breed" id="breed" required  >
    
      <label for="dob"><b>Date of Birth</b></label>
    <input type="date" placeholder="Enter date" name="dob" id="dob" required > 
  
    
    <!--  
 
    <label for="situation"><b>Progress</b></label><br>
    
    <input type="radio" id="situation" name="situation" value="Died"> <label for="Died">Died</label> <br>
    <input type="radio" id="situation" name="situation" value="Recovered"> <label for="Recovered">Recovered</label><br>
    <input type="radio" id="situation" name="situation" value="Under Treatment"><label for="under_treatment">Under Treatment</label><br>
    -->
    <br>
    
  </div>
<button type="submit" class="submitbtn" >Submit</button>

</form><br><br>

</body>
</html>