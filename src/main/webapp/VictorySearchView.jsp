<%@ page import="java.util.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="victoryCss/victory.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/styles.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/header.css">
	
 <style>
.button {
  background-color: #e60000; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  
  align-items: center;
  transition-duration: 0.4s;
  cursor: pointer;
  margin:center;

}

.button1 {
  background-color: white; 
  width:100px;
  height:45px;
  color: black; 
  border: 2px solid  #990000;
  font-size: 15px;
  font-style: bold;

}
.button1:hover {
  background-color:  #e60000;
  color: white;
}



</style>
 
 <title>SEARCH RESULTS</title>
 
 <header>	
 	<hr>

<ul class="one" position=fixed;>

<li><lable style="font-size:30px;">HAPPY TAILS</lable></li>
<li><a href="Home.html">HOME</a></li>
<li><a href="view.jsp">MEMBERS</a></li>
<li><a href="viewPet.jsp">PETS</a></li>
<li><a href="VictoryViewAll.jsp">VICTORY LOGS</a></li>
<li><a href="stockview.jsp">STOCKS</a></li>
<li><a href="About.html">ABOUT US</a></li>

</ul>
		
		
 	
 </head>
  <hr>
    <body >
    <div align=center id ="bor" style="background-image: url(victoryImages/allvictory.jpg);background-repeat: no-repeat;""> 
    	<h1>Victory Logs Search Results</h1>
    	<br><br>
        <table border="2">
           
            <tr style="background-color:#000099;color:white;font-size:20px">
            <th> Victory Log ID</th>
			<th>Coordinator Name</th>
			<th>Program Type</th>
			<th>City Name</th>
			<th>Location</th>
			<th>Conducted Date</th>
			<th>Budget(Rs.)</th>


            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;color:black;font-size:19px">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            
            %>
            
        </table>
         <br><br>
	<a href="VictoryViewAll.jsp"><button  class="button button1"><b>Back</b></button></a>	
		 <br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
     <hr>
</html>