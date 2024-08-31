package com.victory;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteKoboServlet
 */
@WebServlet("/VictoryDeleteServlet")
public class VictoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vlid = request.getParameter("vlid");
		boolean isTrue;
		
		isTrue = VictoryDBUtil.victoryDelete(vlid);
		
		if (isTrue == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("VictoryViewAll.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("VictoryUnsuccess.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
