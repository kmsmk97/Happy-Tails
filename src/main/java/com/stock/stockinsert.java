package com.stock;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StockInsert")
public class stockinsert extends HttpServlet {

		private static final long serialVersionUID = 1L;


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String name = request.getParameter("name");
			String animal = request.getParameter("animal");
			String size = request.getParameter("size");
			String uprice = request.getParameter("uprice");
			String quantity = request.getParameter("quantity");
			String amount = request.getParameter("amount");
			String coordinator = request.getParameter("coordinator");
			
			
			
			boolean isTrue;
			
			isTrue = stockDBUtil.insertstock(name,animal,size,uprice,quantity,coordinator,amount);
			
					if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("stockview.jsp");
				dis.forward(request, response);
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("stockUnsuccess.jsp");
				dis2.forward(request, response);
			}
			
			
		}

	}
