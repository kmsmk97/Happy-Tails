package com.stock;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/stockupdateservlet")
public class stockupdateservlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String animal = request.getParameter("animal");
			String size = request.getParameter("size");
			String uprice = request.getParameter("uprice");
			String quantity = request.getParameter("quantity");
			String amount = request.getParameter("amount");
			String coordinator = request.getParameter("coordinator");
			
			boolean isTrue;
			
			isTrue = stockDBUtil.updatestock(id,name,animal,size,uprice,quantity,amount,coordinator);
			
			
			
			if(isTrue == true) {
				
				List<stock> stockDetails = stock.getstockDetails(id);
				request.setAttribute("stockDetails", stockDetails);
				
				RequestDispatcher dis = request.getRequestDispatcher("stockview.jsp");
				dis.forward(request, response);
			}
			else {
				List<stock> stockDetails = stockDBUtil.getstockDetails(id);
				request.setAttribute("stockDetails", stockDetails);
				
				RequestDispatcher dis = request.getRequestDispatcher("stockUnsuccess.jsp");
				dis.forward(request, response);
			}
		}

	}

