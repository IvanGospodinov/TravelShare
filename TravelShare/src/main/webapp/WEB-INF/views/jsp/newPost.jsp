<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  
<html>
<head>
<meta charset="UTF-8">
  
    
 <!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 --> 
 
<title>create post</title>
</head>

  <jsp:include page="header.jsp" />
 
 
<form class="header-buttons" action="CreatePost" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>Create post</legend>


			<table align="left">

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
	</form>






</body>
 <jsp:include page="footer.jsp" />
</html>