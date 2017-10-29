<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

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
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

    
.form {
    position: relative;
    margin-top: 40px;
    border-radius: 25px;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	/*background-color: transparent;*/
	/*   opacity: 0.9;
    filter: alpha(opacity=80);*/
	background-color: lightgray;
	opacity: 0.9;
}

.dropdown {
    border-radius: 50px:
	margin-bottom: 20px;
    background-color: #94def3;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	color: brown;
	background-color: transparent;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: rgb(120, 197, 179);
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus, .dropdown:hover {
	background: #94def3;
}

.postLocation {
	outline-style: solid;
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
    text-align: center;
}

.postTitle {
	outline-style: groove;
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
}
    .text {
    margin-bottom: 20px;
    margin-top: 20px;
    max-height: 30px;
    color: black;
    }

    
p {
     font-family: 'Indie Flower', cursive;;
     font-size: 19px;
      margin-bottom: 10px;
      margin-top: 10px;
 }    
    
    .button {
        border-radius: 25px:
    }
    
    .footer {
        margin-top: 100px;
    }

    
</style>


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
<c:if test="${sessionScope.user != null }">
<div class="form">
	<form class="wrap" action="newPost" method="post">
		<div class="dropdownPost">
			<p>Choose a categoty</p>
			<select class="dropdown" name="category">
				<option value="1">Nature</option>
				<option value="2">Animals</option>
				<option value="3">Food</option>
				<option value="4">People</option>
			</select>
		</div>
		<div>
            <p>Post Title</p>
			<div class="postTitle">
				<input class="text" type="text" name="title" placeholder="Title" />
			</div>
            <p>Post Location</p>
			<div class="postLocation">
				<input class="text" type="text" name="location" placeholder="Location" />
			</div>
		</div>
		<div class="textArea">
			<p>So what do you want to share with this post</p>
			<textarea style="background-color: lightgray" name="description"
				rows="5" cols="20"></textarea>
		</div>
		<div class="postImage">
			<p>Add your images(s)</p>
			<input type="file" name="file1" multiple />
		</div>
		<button class="button" type="submit">Submit post</button>
	</form>

</div>
	
</body>
    <footer class="footer"><jsp:include page="footer.jsp" /></footer>
     </c:if>
	 
     <c:if test="${sessionScope.user == null }">
    	 <jsp:forward page="login.jsp"></jsp:forward>
     </c:if>
</html>