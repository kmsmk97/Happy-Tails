package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class MemberDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
	
    
    public static boolean insertmember(String name, String nic, String phone, String address, String gender, String date,
			String type, String fee) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into member values (0,'"+name+"','"+nic+"','"+phone+"','"+address+"','"+gender+"','"+date+"','"+type+"','"+fee+"')";
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
    
    public static boolean updatemember(String id, String name, String nic, String phone, String address, String gender, String date,
			String type, String fee) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "update member set name='"+name+"',nic='"+nic+"',phone='"+phone+"',address='"+address+"',gender='"+gender+"',"
    				+ "date='"+date+"',type='"+type+"',fee='"+fee+"'"
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
    
    public static List<Member> getMemberDetails(String Id) {
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<Member> mem = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from member where id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String name = rs.getString(2);
    			String nic = rs.getString(3);    			
    			String phone = rs.getString(4);
    			String address = rs.getString(5);
    			String gender = rs.getString(6);
    			String date = rs.getString(7);
    			String type = rs.getString(8);    			
    			String fee = rs.getString(9);
    			
    			
    			Member c = new Member(id,name,nic,phone,address,gender,date,type,fee);
    			mem.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return mem;	
    }
 
    
    
    
    public static boolean deletemember(String id) {
    	
    	int convId = Integer.parseInt(id);
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from member where id='"+convId+"'";
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
    
    
    public static ArrayList<Member> getAllInventory1() {
		ArrayList<Member> invent = new ArrayList<Member>();
		
		try {
			//database connection
			 String url ="jdbc:mysql://localhost:3306/happytailsdb"; //my sql location
			 String user ="root";
		     String pass = "";
		     
		     Class.forName("com.mysql.jdbc.Driver");//create driver
				Connection con = DriverManager.getConnection(url , user , pass);// create db connections
				java.sql.Statement stmt = con.createStatement();
				
				String sql = "select * from happytailsdb.member;";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {  //variables for catch the values
					
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String nic=rs.getString(3);
					String phone = rs.getString(4);
					String address=rs.getString(5);
	    			String gender = rs.getString(6);
	    			String date = rs.getString(7);
	    			String type = rs.getString(8);
	    			String fee = rs.getString(9);
	    			
					
				
				
					
					Member mem= new Member(id,name,nic,phone,address,gender,date,type,fee);// patient object
					
					
					invent.add(mem); //patient ArrayList
				
				}
		     
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return invent;
	}
}