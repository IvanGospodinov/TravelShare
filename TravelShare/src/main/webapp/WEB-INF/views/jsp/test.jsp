<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demo page</title>
</head>
<style type="text/css">
	.error{
		color: #ff0000;
	}
	.errorblock{
		color: #000;
		background-color: #ffEEEE;
		border: 3px solid #ff0000;
		padding: 8px;
		margin: 16px;
	}</style>
<body>
	<form:form commandName="user">
		<!-- Handle errors -->
		<form:errors path="*" cssClass="errorblock" element="div"/>
		
		<!-- Input for name of the product with css class for errors. -->
		
		<form:input path="email" cssErrorClass="error"/>
		<form:errors path="email" cssClass="error" />
		<br>
		
		<input type="submit"/>
	</form:form>
</body>
</html>