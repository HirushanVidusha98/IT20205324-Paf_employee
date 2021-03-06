package com;
//dependencies
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException; 
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;

/**
 * Servlet implementation class EmployeesAPI
 */
@WebServlet("/EmployeesAPI")
public class EmployeesAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeesAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Employee empObj = new Employee();
		String output = empObj.insertEmployeeDetails(request.getParameter("employeeName"), 
				 request.getParameter("employeeEmail"), 
				request.getParameter("employeeAge"), 
				request.getParameter("employeePassword"), 
				request.getParameter("employeePhone"), 
				request.getParameter("nicNumber"), 
				request.getParameter("employeeGender"), 
				request.getParameter("employeeAddress")); 
				response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		Employee empObj = new Employee();
		 String output = empObj.updateEmployee(paras.get("hidItemIDSave").toString(), 
				 paras.get("employeeName").toString(),
				 paras.get("employeeEmail").toString(),
				 paras.get("employeeAge").toString(),
				 paras.get("employeePassword").toString(),
				 paras.get("employeePhone").toString(),
				 paras.get("nicNumber").toString(),
				 paras.get("employeeGender").toString(),
				 paras.get("employeeAddress").toString());
//				 request.getParameter("employeeName"), 
//				 request.getParameter("employeeEmail"), 
//					request.getParameter("employeeAge"), 
//					request.getParameter("employeePassword"), 
//					request.getParameter("employeePhone"), 
//					request.getParameter("nicNumber"), 
//					request.getParameter("employeeGender"), 
//					request.getParameter("employeeAddress"));  
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		Employee empObj = new Employee();
		 String output = empObj.deleteEmployee(paras.get("employeeNumber").toString()); 
		response.getWriter().write(output); 
	}
	
	
	// Convert request parameters to a Map
		private static Map getParasMap(HttpServletRequest request) 
		{ 
		 Map<String, String> map = new HashMap<String, String>(); 
		try
		 { 
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
		 String queryString = scanner.hasNext() ? 
		 scanner.useDelimiter("\\A").next() : ""; 
		 scanner.close(); 
		 String[] params = queryString.split("&"); 
		 for (String param : params) 
		 { 
		 
		 String[] p = param.split("="); 
		 map.put(p[0], p[1]); 
		 } 
		 } 
		catch (Exception e) 
		 { 
		 } 
		return map; 
		}
		
		
		
		
		



		
		

}
