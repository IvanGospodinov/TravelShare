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


<!--<form class="header-buttons" action="newPost" method="post"
	enctype="multipart/form-data">
	<fieldset>
		<legend>Create post</legend>
		<table align="left">
			<tr>
				<td>Choose Category</td>
				<select name="category">
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
				<td><input type="file" name="file1" multiple /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</fieldset>
</form>-->
<div class="form">
    <form action="newPost" method="post" >
        <div class="dropdown">
            <p>Choose a categoty</p>
            <select name="category">
                <option value="1">Nature</option>
                <option value="2">Animals</option>
                <option value="3">Food</option>
                <option value="4">People</option>
            </select>
        </div>
        <div class="title">
            <input type="text" name="title" placeholder="title"/>
            <input type="text" name="location" placeholder="location"/>
        </div>
        <div class="textArea">
            <p>So what do you want to share with this post</p>
            <textarea name="description" rows="5" cols="20"></textarea> 
        </div>
        <div class="postImage">
            <p>Add your images(s)</p>
            <input type="file" name="file1" multiple />
        </div>
    <button type="submit">Submit post</button>
    </form>
    
    </div>


<!--<form class="register-form" action="newPost" method="post">
	<input id="title" type="text" name="title" placeholder="title" /> <input
		type="text" name="location" placeholder="location" /> <input
		type="text" name="description" placeholder="description" />
	<button type="submit">create</button>
	<p class="message">
		Already registered? <a href="#">Sign In</a>
	</p>
</form>-->




</body>
<jsp:include page="footer.jsp" />
</html>