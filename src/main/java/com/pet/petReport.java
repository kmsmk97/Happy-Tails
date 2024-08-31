package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/petReport")
public class petReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/csv");
		response.setHeader("content-disposition", "attachment;filename = Pets Report.csv");
        PrintWriter w = response.getWriter();

        ArrayList<Pet> pet = petDBUtil.getAllInventory1();
               
        String output = "Id, Name, Phone, Date, Category, Petname, Gender, Age, Breed \n";

        for (Pet d : pet) {
            output += d.getId() + ", " + d.getName() + ", " + d.getPhone()+", "+d.getDate()+","+d.getCategory()+","+d.getPetname()+","+d.getGender()+","+d.getAge()+","+d.getBreed()+"    \n";
        
        

            
            int count=0;


        }
       
        w.println(output);

        w.flush();
        w.close();
	}
}


