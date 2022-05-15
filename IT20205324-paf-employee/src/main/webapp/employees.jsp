

<%@page import="com.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/employees.js"></script>
</head>
<body>

<div class="container"><div class="row"><div class="col-6"> 
<h1>Employee Management</h1>
<form id="formItem" name="formItem">
 Employee Name: 
 <input id="employeeName" name="employeeName" type="text" 
 class="form-control form-control-sm">
 <br> Employee Email: 
 <input id="employeeEmail" name="employeeEmail" type="text" 
 class="form-control form-control-sm">
 <br> Employee Age: 
 <input id="employeeAge" name="employeeAge" type="text" 
 class="form-control form-control-sm">
 <br> Employee Password: 
 <input id="employeePassword" name="employeePassword" type="text" 
 class="form-control form-control-sm">
 <br> Employee Phone:
 <input id="employeePhone" name="employeePhone" type="text" 
 class="form-control form-control-sm">
 <br> NIC Number:
 <input id="nicNumber" name="nicNumber" type="text" 
 class="form-control form-control-sm">
 <br> Employee Gender:
 <input id="employeeGender" name="employeeGender" type="text" 
 class="form-control form-control-sm">
 <br> Employee Address:
  <input id="employeeAddress" name="employeeAddress" type="text" 
 class="form-control form-control-sm">
 <br> 
 <input id="btnSave" name="btnSave" type="button" value="Save" 
 class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave" 
 name="hidItemIDSave" value="">
 
</form>


<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divItemsGrid">
 <%
 Employee empObj = new Employee(); 
 out.print(empObj.readEmployee()); 
 %>
</div>
</div> </div> </div> 
<div class="container">
<br>
<br>
<a class="btn btn-primary" href="http://localhost:8040/IT20205324-paf-employee/search.jsp" role="button">Search page</a>
</div>
<br>
<br>
</body>
</html>