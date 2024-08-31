package com.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("memid");
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String date = request.getParameter("date");
		String type = request.getParameter("type");
		String fee = request.getParameter("fee");
		
		
		boolean isTrue;
		
		isTrue = MemberDBUtil.updatemember(id, name, nic, phone, address, gender, date, type, fee);
		
		
		
		if(isTrue == true) {
			
			List<Member> memDetails = MemberDBUtil.getMemberDetails(id);
			request.setAttribute("memDetails", memDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
			dis.forward(request, response);
		}
		else {
			List<Member> memDetails = MemberDBUtil.getMemberDetails(id);
			request.setAttribute("memDetails", memDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
