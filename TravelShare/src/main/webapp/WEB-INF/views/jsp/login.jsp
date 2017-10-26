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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="css/styleLogin.css">
 
</head>

<body>

	<h1 class="travelShare">Welcome To Travel Share</h1><br/>	

	<div class="login-page">
		<div class="form">
			<!-- Register part -->
			
	  <form:form class="register-form" commandName="user" >
      <form:input path="username" type="text" name="uname" placeholder="username" />
      <form:input path="email" id="email" type="email" name="user_email" placeholder="email address" onkeyup="return sendInfo()"/>
      <form:input path="password" id="password" type="password" name="password" placeholder="password"/>
      <input id="conpassword" type="password" name="conpassword" placeholder="confirm password"/>
      <form:input path="firstName" type="text" name="user_firstname" placeholder="first name"/>
      <form:input path="lastName" type="text" name="user_lastname" placeholder="last nname"/>
      <form:input path="pictureURL" type="file" name="user_pictureURL" placeholder="avatar" />
      <button type="submit" >create</button><p class="message">Already registered? <a href="#">Sign In</a></p>
    </form:form>
	
<<<<<<< HEAD
	<form:form method="post">
	
		<label for="textInput1">Enter Name</label>

		<input type="submit" value="Enter"/>
	</form:form>
	
=======
			<!-- Login part -->
			<form:form class="login-form" method="post" commandName="user" >
				<form:input path="email" type="email" placeholder="email" name="user_email" /> 
				<form:input path="password" type="password" placeholder="password" name="password" />
				<button type="submit">login</button>
				<p class="message">
				Not registered? <a href="#">
				Create an account</a>
				</p>
			</form:form>
		</div>
	</div>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>
>>>>>>> d2cd1288b92d5921e704bea7fdbf3783a6a4beba

</body>
</html>