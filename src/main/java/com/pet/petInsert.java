package com.pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/petInsert")
public class petInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		isTrue = petDBUtil.insertpet(name, phone, date, category, petname, gender, age, breed, dob);
		
				if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("viewPet.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccessPet.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
