<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
    	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	
	
 
 <title> sample </title>
 

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
    </head>
    <body>
    
    	<h1>Pets search result</h1>
    	<a href="viewPet.jsp"><button class="btnback" align="right">Back</button></a>
        <table border="2">
           
            <tr>
                <td><b>Sr No</b></td>
                <td><b>Name</b></td>
                <td><b>Phone Number</b></td>
                <td><b>Date</b></td>
                <td><b>Category</b></td>
                <td><b>Pet Name</b></td>
                <td><b>Gender</b></td>
                <td><b>Age</b></td>
                <td><b>Breed</b></td>
                <td><b>DOB</b></td>
            
          

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
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                <td><%=pList.get(8)%></td>
                <td><%=pList.get(9)%></td>
               
              
                
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
    </body>
</html>