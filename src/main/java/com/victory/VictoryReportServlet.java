package com.victory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VictoryReportServlet
 */
@WebServlet("/VictoryReportServlet")
public class VictoryReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/csv");
		response.setHeader("content-disposition", "attachment;filename = Victory Logs Report.csv");
        PrintWriter P = response.getWriter();

        ArrayList<Victory> Victory = VictoryDBUtil.victoryAllDetails();
               
        String output = "VLID, Coordinator Name, Program Type, City Name, Location, Conducted Date, Budget(Rs.)\n";

        for (Victory k : Victory) {
            output += k.getVlid() + "," + k.getCname()+", "+k.getStype()+","
            		+ ""+k.getDivision()+","+k.getLocation()+","+k.getDate()+","+k.getCost()+",   \n";
        }
       
        P.println(output);

        P.flush();
        P.close();
	}

}
