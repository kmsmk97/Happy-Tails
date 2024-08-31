package com.pet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class petDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	
    
    public static boolean insertpet( String name, String phone, String date, String category, String petname, String gender,
			String age, String breed, String dob) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into pet values (0,'"+name+"','"+phone+"','"+date+"','"+category+"','"+petname+"','"+gender+"','"+age+"','"+breed+"','"+dob+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
    public static boolean updatepet(String id,  String name, String phone, String date, String category, String petname, String gender,
			String age, String breed, String dob) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "update pet set name='"+name+"',phone='"+phone+"',date='"+date+"',category='"+category+"',petname='"+petname+"',"
    				+ "gender='"+gender+"',age='"+age+"',breed='"+breed+"',dob='"+dob+"' "
    				+ "where id='"+id+"'";
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
    
    public static List<Pet> getPetDetails(String Id) {
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<Pet> pt = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from pet where id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String name = rs.getString(2);
    			String phone = rs.getString(3);
    			String date = rs.getString(4);
    			String category = rs.getString(5);
    			String petname = rs.getString(6);
    			String gender = rs.getString(7);
    			String age = rs.getString(8);
    			String breed = rs.getString(9);
    			String dob = rs.getString(10);
    			
    			
    			Pet c = new Pet(id,name,phone,date,category,petname,gender,age,breed,dob);
    			pt.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return pt;	
    }
 
    
    
    
    public static boolean deletepet(String id) {
    	
    	int convId = Integer.parseInt(id);
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from pet where id='"+convId+"'";
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
    
    
    public static ArrayList<Pet> getAllInventory1() {
		ArrayList<Pet> invent = new ArrayList<Pet>();
		
		try {
			//database connection
			 String url ="jdbc:mysql://localhost:3306/happytailsdb"; //my sql location
			 String user ="root";
		     String pass = "";
		     
		     Class.forName("com.mysql.jdbc.Driver");//create driver
				Connection con = DriverManager.getConnection(url , user , pass);// create db connections
				java.sql.Statement stmt = con.createStatement();
				
				String sql = "select * from happytailsdb.pet;";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {  //variables for catch the values
					
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String phone=rs.getString(3);
					String date = rs.getString(4);
					String category=rs.getString(5);
	    			String petname = rs.getString(6);
	    			String gender = rs.getString(7);
	    			String age = rs.getString(8);
	    			String breed = rs.getString(9);
	    			String dob = rs.getString(10);
	    			
					
				
				
					
					Pet pt= new Pet(id,name,phone,date,category,petname,gender,age,breed,dob);// pet object
					
					
					invent.add(pt); //pet ArrayList
				
				}
		     
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return invent;
	}
}