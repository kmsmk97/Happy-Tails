package com.stock;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class stockDBUtil {
		
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
	    
		
	    
	    public static boolean insertstock(String name, String animal, String size, String uprice, String quantity, String amount,
				String coordinator) {
	    	
	    	boolean isSuccess = false;
	    	
	    	try {
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    	    String sql = "insert into stocks values (0,'"+name+"','"+animal+"','"+size+"','"+uprice+"','"+quantity+"','"+coordinator+"','"+amount+"')";
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
	    
	    public static boolean updatestock(String id, String name, String animal, String size, String uprice, String quantity, String amount,
				String coordinator) {
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "update stocks set name='"+name+"',animal='"+animal+"',size='"+size+"',uprice='"+uprice+"',quantity='"+quantity+"',"
	    				+ "amount='"+amount+"',coordinator='"+coordinator+"'"+ "where id='"+id+"'";
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
	    
	    public static List<stock> getstockDetails(String Id) {
	    	
	    	int convertedID = Integer.parseInt(Id);
	    	
	    	ArrayList<stock> pat = new ArrayList<>();
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "select * from stocks where id='"+convertedID+"'";
	    		rs = stmt.executeQuery(sql);
	    		
	    		while(rs.next()) {
	    			int id = rs.getInt(1);
	    			String name = rs.getString(2);
	    			String animal = rs.getString(3);
	    			String size = rs.getString(4);
	    			String uprice = rs.getString(5);
	    			String quantity = rs.getString(6);
	    			String amount = rs.getString(7);
	    			String coordinator = rs.getString(8);
	    			
	    			
	    			
	    			stock c = new stock(id,name,animal,size,uprice,quantity,amount,coordinator);
	    			pat.add(c);
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}	
	    	return pat;	
	    }
	 
	    
	    
	    
	    public static boolean deletestock(String id) {
	    	
	    	int convId = Integer.parseInt(id);
	    	
	    	try {
	    		
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from stocks where id='"+id+"'";
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
	    
	    
	    public static ArrayList<stock> getAllInventory1() {
			ArrayList<stock> invent = new ArrayList<stock>();
			
			try {
				//database connection
				 String url ="jdbc:mysql://localhost:3306/happytailsdb"; //my sql location
				 String user ="root";
			     String pass = "";
			     
			     Class.forName("com.mysql.jdbc.Driver");//create driver
					Connection con = DriverManager.getConnection(url , user , pass);// create db connections
					java.sql.Statement stmt = con.createStatement();
					
					String sql = "select * from happytailsdb.stocks;";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()) {  //variables for catch the values
						
						int id = rs.getInt(1);
						String name = rs.getString(2);
		    			String animal = rs.getString(3);
		    			String size = rs.getString(4);
		    			String uprice = rs.getString(5);
		    			String quantity = rs.getString(6);
		    			String amount = rs.getString(7);
		    			String coordinator = rs.getString(8);
						
					
					
						
						stock pat= new stock(id,name,animal,size,uprice,quantity,amount,coordinator);// stock object
						
						
						invent.add(pat); //stock ArrayList
					
					}
			     
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return invent;
		}
	
}
