package com.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/report")
public class report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/csv");
		response.setHeader("content-disposition", "attachment;filename = Member Report.csv");
        PrintWriter w = response.getWriter();

        ArrayList<Member> member = MemberDBUtil.getAllInventory1();
               
        String output = "EMP Id, Name, NIC number, Contact Number, Address, Gender, Date of Registration, Employment type, Annual fee\n";

        for (Member d : member) {
            output += d.getId() + ", " + d.getName() + ", " + d.getNic()+", "+d.getPhone()+","+d.getAddress()+","+d.getGender()+","+d.getDate()+","+d.getType()+","+d.getFee()+"    \n";
        
        

            
            int count=0;


        }
       
        w.println(output);

        w.flush();
        w.close();
	}
}


