package com;

import java.sql.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Base64;
import util.DBConnect;
public class Employee {
	
	private static Connection con=null;
	
	//Insert Item
	public String insertEmployeeDetails(String employeeName, String employeeEmail, String empAge, String password, String phone, String nic, String gender, String address)
	{
		String output = "";
		//try close
		try
		{
			con = DBConnect.connect();
   		   
		   if (con == null)
           {return "Error while connecting to the database for inserting."; }
		   
			 // create a prepared statement
			 String query = " insert into employee (`employeeNumber`,`employeeName`,`employeeEmail`,`empAge`,`password`,`phone`,`nic`, `gender`, `address`)"
			 + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			 
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, employeeName);
			preparedStmt.setString(3, employeeEmail);
			preparedStmt.setInt(4, Integer.parseInt(empAge));
			preparedStmt.setString(5, password);
			preparedStmt.setInt(6, Integer.parseInt(phone));
			preparedStmt.setString(7, nic);
			preparedStmt.setString(8, gender);
			preparedStmt.setString(9, address);
			
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newEmployees = readEmployee();
			 output = "{\"status\":\"success\", \"data\": \"" + 
					 newEmployees + "\"}"; 
		}
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}"; 
			 System.err.println(e.getMessage()); 
		 }
		    return output;  //return out put
	}
	
	
	//Read Item
		public String readEmployee()
	    {
		   String output = "";
		   try
		   {
			   con = DBConnect.connect();
			 if (con == null)
			 {return "Error while connecting to the database for reading."; }
			 
		     // Prepare the html table to be displayed
		     output = "<table border='1'><tr>"
		     		+ "<th>Employee No</th>"
		     		+ "<th>employee Name</th>" +
					   "<th>EmployeeEmail</th>" +
					   "<th>Emp Age</th>" +
					   "<th>password</th>" +
					   "<th>phone no</th>" +
					   "<th>Nic no</th>" +
					   "<th>Gender</th>" +
					   "<th>address</th>" +
					   "<th>Update</th><th>Remove</th></tr>";
		     
           //query
			 String query = "select * from employee";
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(query);
			 
			 
			 // iterate through the rows in the result set
			 while (rs.next())
			 {
				 String employeeNumber = Integer.toString(rs.getInt("employeeNumber"));//see
				 String employeeName = rs.getString("employeeName");
				 String employeeEmail = rs.getString("employeeEmail");
				 String empAge = rs.getString("empAge");
				 String password = rs.getString("password");
				 String phone = Integer.toString(rs.getInt("phone"));
				 String nic = rs.getString("nic");
				 String gender = rs.getString("gender");
				 String address = rs.getString("address");
				
//				 // Add into the html table
//				 output += "<tr><td>" + employeeNumber + "</td>";
//				 output += "<td>" + employeeName + "</td>";
//				 output += "<td>" + employeeEmail + "</td>";
//				 output += "<td>" + empAge + "</td>";
//				 output += "<td>" + password + "</td>";
//				 output += "<td>" + phone + "</td>";
//				 output += "<td>" + nic + "</td>";
//				 output += "<td>" + gender + "</td>";
//				 output += "<td>" + address + "</td>";
				 
//				 // buttons
//				 output += "<td><input name='btnUpdate' type='button' value='Update'  class='btnUpdate btn btn-secondary'></td>" + "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger'  data-itemid='"
//						  + employeeNumber + "'>" + "</td></tr>"; 
				 
				// Add into the html table
					output += "<tr><td><input id='hidItemIDUpdate'  name='hidItemIDUpdate'  type='hidden' value='" + employeeNumber
					 + "'>" + employeeNumber + "</td>"; 
					output += "<td>" + employeeName + "</td>";
					output += "<td>" + employeeEmail + "</td>";
					 output += "<td>" + empAge + "</td>";
					 output += "<td>" + password + "</td>";
					 output += "<td>" + phone + "</td>";
					 output += "<td>" + nic + "</td>";
					 output += "<td>" + gender + "</td>";
					 output += "<td>" + address + "</td>";
					// buttons
					 output += "<td><input name='btnUpdate' type='button' value='Update'  class='btnUpdate btn btn-secondary'></td>" + "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger'  data-employeenumber='"
					  + employeeNumber + "'>" + "</td></tr>"; 
				 
			 }
			 
			 con.close();
			 
			 // Complete the html table
			 output += "</table>";
		   }
		   catch (Exception e)
		   {
			 output = "Error while reading the items.";
			 System.err.println(e.getMessage());
		   }
		   
		   return output;  //return out put
	    }
		
		//update
		public String updateEmployee(String employeeNumber, String employeeName, String employeeEmail, String empAge, String password, String phone, String nic, String gender, String address)
		 
		 {
		 String output = "";
		 try
		 {
			 con = DBConnect.connect();
		 if (con == null)
		 {return "Error while connecting to the database for updating."; }
		 output = "saffffff";
		 // create a prepared statement
		 String query = "UPDATE employee SET employeeName=?,employeeEmail=?,empAge=?,password=?,phone=?,nic=?,gender=?,address=?  WHERE employeeNumber=?";
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 // binding values
		 System.out.print("gfsdgvdsgdg");
		 preparedStmt.setString(1, employeeName);
		 preparedStmt.setString(2, employeeEmail);
		 preparedStmt.setDouble(3, Integer.parseInt(empAge));
		 preparedStmt.setString(4, password);
		 preparedStmt.setInt(5, Integer.parseInt(phone));
		 preparedStmt.setString(6, nic);
		 preparedStmt.setString(7, gender);
		 preparedStmt.setString(8, address);
		 preparedStmt.setInt(9, Integer.parseInt(employeeNumber));
		 System.out.print("fsdfsfsdgdgdgdfgdgdg");
		 // execute the statement
		 preparedStmt.execute();
		 System.out.print("fsdfsfsdgdgdgdfgdgdg");
		 con.close();
		 String newEmployees = readEmployee();
		 output = "{\"status\":\"success\", \"data\": \"" + 
				 newEmployees + "\"}"; 
		 System.out.print("hhhhhhhhhhhhhhhhhhhhhg");
		 }
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}"; 
			 System.err.println(e.getMessage()); 
		 }
		 return output; //return out put
		 }
		
		
		//delete
		public String deleteEmployee(String employeeNumber)
		 {
		 String output = "";
		 try
		 {
			 con = DBConnect.connect();
		 if (con == null)
		 {return "Error while connecting to the database for deleting."; }
		 // create a prepared statement
		 String query = "delete from employee where employeeNumber=?";
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 // binding values
		 preparedStmt.setInt(1, Integer.parseInt(employeeNumber));
		 // execute the statement
		 preparedStmt.execute();
		 con.close();
		 String newEmployees = readEmployee(); 
		 output = "{\"status\":\"success\", \"data\": \"" + 
				 newEmployees + "\"}";  //delete sucuess display this msg
		 }
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\": \"Error while deleting the item.\"}"; 
			 System.err.println(e.getMessage()); 
		 }
		 return output; //return out put
		 }
		
	
	}


				