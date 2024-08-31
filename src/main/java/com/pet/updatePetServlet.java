package com.pet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePetServlet")
public class updatePetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("ptid");
		String name = request.getParameter("name");
		
		String phone = request.getParameter("phone");
		String date = request.getParameter("date");
		String category = request.getParameter("category");
		String petname = request.getParameter("petname");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String breed = request.getParameter("breed");
		String dob = request.getParameter("dob");
		
		boolean isTrue;
		
		isTrue = petDBUtil.updatepet(id, name, phone, date, category, petname, gender, age, breed, dob);
		
		
		
		if(isTrue == true) {
			
			List<Pet> ptDetails = petDBUtil.getPetDetails(id);
			request.setAttribute("ptDetails", ptDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("viewPet.jsp");
			dis.forward(request, response);
		}
		else {
			List<Pet> ptDetails = petDBUtil.getPetDetails(id);
			request.setAttribute("ptDetails", ptDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("unsuccessPet.jsp");
			dis.forward(request, response);
		}
	}

}
