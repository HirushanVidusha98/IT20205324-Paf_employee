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

<div class="container">

<h1> Search Page </h1>
<form id="bbb" name="bbb" method="post" >
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Search Employee ID" aria-label="Recipient's username" aria-describedby="basic-addon2" id= "employeeNumber" name ="employeeNumber">
  <div class="input-group-append">
    <input class="btn btn-outline-secondary" type="submit" id="ddd" name="ddd" value="search">
  </div>
</div>
</form>


 <%
 Employee empObj = new Employee(); 
 String abc = request.getParameter("employeeNumber");
 out.print(empObj.viewProfile(abc)); 
 %>
 </div>
</body>
</html>