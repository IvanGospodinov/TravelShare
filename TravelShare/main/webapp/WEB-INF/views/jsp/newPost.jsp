<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create post</title>
</head>

<!--  
  <form:form class="register-form" commandName="user" >
      <form:input path="username" type="text" name="uname" placeholder="username" />
      <form:input path="email" id="email" type="email" name="user_email" placeholder="email address" onkeyup="return sendInfo()"/>
      <form:input path="password" id="password" type="password" name="password" placeholder="password"/>
      <input id="conpassword" type="password" name="conpassword" placeholder="confirm password"/>
      <form:input path="firstName" type="text" name="user_firstname" placeholder="first name"/>
      <form:input path="lastName" type="text" name="user_lastname" placeholder="last nname"/>
      <form:input path="pictureURL" type="file" name="user_pictureURL" placeholder="avatar"/>
      <button type="submit" >create</button><p class="message">Already registered? <a href="#">Sign In</a></p>
    </form:form> 
    -->





<form:form method="POST" commandName="post">

	<fieldset>
		<legend>Create post</legend>
		<table>
			<tr>
				<td>Choose Category</td>
				
				<td><form:select path="categoty_id">
						<form:option value="1" label="Nature" />
						<form:option value="2" label="Animals" />
						<form:option value="3" label="Food" />
						<form:option value="4" label="People" />
					</form:select></td>
			</tr>
			<tr>
				<td>Title</td>
				<td>
				  <form:input path="title" type="text" name="title" placeholder="title"/>
				</td>
			</tr>

			<tr>
				<td>Location</td>
				<td>
				  <form:input path="location" type="text" name="location" placeholder="location"/>
				</td>
			</tr>


			<tr>
				<td>Description</td>
				 <form:input path="description" type="textarea" name="description" placeholder="description" rows="5" cols="20"/>
			</tr>


			<tr>
				<td>Select files</td>
				<td><input type="file" name="file" multiple /></td>
			</tr>


			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</fieldset>
</form:form>






</body>

</html>