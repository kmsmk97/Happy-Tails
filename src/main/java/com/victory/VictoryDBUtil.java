package com.victory;

import java.sql.Connection;

import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
//import java.util.ArrayList;
//import java.util.List;
import java.util.List;





public class VictoryDBUtil {
	
	//instance variables
	private static Connection con = null;
	private static Statement stmt = null;
    private static ResultSet rs = null;
	private static boolean isSuccess;

		
		//INSERT METHOD for catch inserted form the signup.java file and create the parameter
		public static boolean insertVictory( String cname, String program, String city, String location, String date, String budget) {
		
			//assign boolean variable
			boolean isSuccess = false;
			
			try {
					//database connection
			    	con =DBConnect.getConnection();
					stmt = con.createStatement();
					
					//SQL query for insert data to kobo table
					String sql = "insert into Victory values (0,'"+cname+"','"+program+"', '"+city+"', '"+location+"', '"+date+"', '"+budget+"')";
					
					//assign executed value
					int rs = stmt.executeUpdate(sql);
					
					//check data insert successful or unsuccessful
					if(rs >0) {
						isSuccess = true;
					}
					else {
						isSuccess = false;
					}
			    }
			    catch (Exception e) {
			    	e.printStackTrace();
			    }
		
		//return boolean value
		return isSuccess;
		}
		
		//retrieve data from the Victory database for update and delete form
		public static List<Victory>koboDetails(String vlid)
		{
			int convertedID = Integer.parseInt(vlid);
			
			ArrayList<Victory>Victory=new ArrayList<>();
			try {
				
		String sql="Select * from Victory where vlid='"+convertedID+"'";
		rs=stmt.executeQuery(sql);
		
		if(rs.next())
		{ 
			int Vlid = rs.getInt("vlid");
			String cname = rs.getString("cname");
			String program = rs.getString("program");
			String city = rs.getString("city");
			String location = rs.getString("location");
			String date = rs.getString("date");
			double budget = rs.getDouble("budget");
			Victory d = new Victory(Vlid,cname,program,city,location,date,budget);
			
			
			Victory.add(d);
			
		}
		
		
		}
		catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	
	return Victory;
	
			}
		
		
	//update all data in KOBO table  
		public static boolean victoryUpdate(String vlid,String cname, String program, String city, String location, String date,String budget) {
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "UPDATE VICTORY set cname='"+cname+"',program='"+program+"',city='"+city+"',location='"+location+"',date='"+date+"',budget='"+budget+"'"
	    				+ "where vlid='"+vlid+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	 
	//Delete all KOBO data set with ID    
	    public static boolean victoryDelete(String vlid) {
	    	
	    	int convId = Integer.parseInt(vlid);
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from Victory where vlid='"+convId+"'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if (r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	    
	    //Retrieve all data for the generate report
	    public static ArrayList<Victory> victoryAllDetails() {
			ArrayList<Victory> Victory = new ArrayList<Victory>();
			
			try {
				//database connection
				con = DBConnect.getConnection();
	    		stmt = con.createStatement();
					
					String sql = "select * from Victory;";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()) {  //variables for catch the values
						
						int Vlid = rs.getInt("vlid");
						String cname = rs.getString("cname");
						String program = rs.getString("program");
						String city = rs.getString("city");
						String location = rs.getString("location");
						String date = rs.getString("date");
						double budget = rs.getDouble("budget");
						Victory d = new Victory(Vlid,cname,program,city,location,date,budget);
						
						Victory.add(d); //customer ArrayList
					
					}
			     
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return Victory;
		}
	    
		
}
