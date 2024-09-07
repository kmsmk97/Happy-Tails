<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
 	<title>Enter Search Criteria</title>

 

	<hr>
	
		<ul class="one" position=center>
		<li><lable style="font-size:40px;  text-align: center;">Happy Tails</lable></li>
			
			<li><a href="Home.html">Home</a></li>
			<li><a href="view.jsp">Members</a></li>
			<li><a href="viewPet.jsp">Pets</a></li>
			<li><a href="VictoryViewAll">Victory Log</a></li>
			<li><a href="stockview">Stocks </a></li>
			<li><a href="About.html">About Us</a></li>
		</ul>
		
		
 	

</head>

<body style="background-color:grey;">

<h3 align="left">Enter the required report?</h3><br>
     <br><br>
	
	<fieldset>
	<legend style="font-size:30px;"><b>Report Generation</b></legend><br>
		<form name="RE_month" action="memberreport.jsp" method="post">	
			<select name="Month" id="Month">
			
 				 <option value="2022-01">January 2022</option>
  				 <option value="2022-02">February 2022</option>
                 <option value="2022-03">March 2022</option>
                <option value="2022-04">April 2022</option>
                <option value="2022-05">May 2022</option>
                <option value="2022-06">June 2022</option>
                <option value="2022-07">July 2022</option>
                <option value="2022-08">August 2022</option>
                <option value="2022-09">September 2022</option>
                <option value="2022-10">October 2022</option>
                <option value="2022-11">November 2022</option>
                <option value="2022-12">December 2022</option>
            </select>
            
            
         <br><br>   
          <input type="submit" value="SUBMIT" style="font-size:20px;" class="button button2">   &nbsp &nbsp
          <a href="view.jsp"  class="button button2">BACK</a> 
		</form>
</fieldset>

</body>
</html>