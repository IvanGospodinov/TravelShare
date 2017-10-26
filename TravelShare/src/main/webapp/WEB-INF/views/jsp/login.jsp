<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Login/Register Form</title>

</head>

<body>
	<!-- If the user has logged in redirect to the index page -->
	
	<h1 class="travelShare">Welcome To Travel Share</h1><br/>	

	
	<form:form method="post" commandName="test">
	
		<label for="textInput1"> Enter Name</label>
		<form:input path="name"/>
		<input type="submit" value="Enter"/>
	</form:form>
	

</body>
</html>