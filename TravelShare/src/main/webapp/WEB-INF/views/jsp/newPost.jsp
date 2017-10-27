<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create post</title>
</head>

   
 
   <form:form class="register-form" commandName="user" >
		
		<fieldset>
			<legend>Create post</legend>


			<table >

				<tr>
					<td>Choose Category</td>
					<td><select name="category">
					<option value="1">Nature</option>
					<option value="2">Animals</option>
					<option value="3">Food</option>
					<option value="4">People</option>

					</select> 
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" name="title"></td>
				</tr>
				
				<tr>
					<td>Location</td>
					<td><input type="text" name="location"></td>
				</tr>
				

				<tr>
					<td>Description</td>
					<td><textarea name="description" rows="5" cols="20"></textarea></td>
				</tr>


				<tr>
					<td>Select files</td>
					<td><input type="file" name="file1" multiple/></td>

				</tr>
				
				
				<tr>
					<td></td>
					<td><input type="submit" value="Submit" ></td>
				</tr>
			</table>
			</fieldset>
	</form:form>






</body>

</html>