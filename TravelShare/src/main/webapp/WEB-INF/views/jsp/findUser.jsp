
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Find User</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

body {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	background:
		url("https://static.pexels.com/photos/229014/pexels-photo-229014.jpeg")
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

</style>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous">
	</script>
<script type="text/javascript">
function refreshUsername() {
	$("#people").empty();
	var username = $("#username").val();
	$.get("http://localhost:8080/TravelShare/getUsers?user=" + username,
			function(data) {
	
	for ( var index in data ) {
		var user = data[index];

		var firstName = document.createElement("tr");
		console.log(user)
		firstName.innerHTML = user.firstName;
		$("#people").append("User's first name is ");
		$("#people").append(firstName);
		
		var lastName = document.createElement("tr");
		console.log(user)
		lastName.innerHTML = user.lastName;
		$("#people").append("User's last name is ");
		$("#people").append(lastName);
		
		var username = document.createElement("tr");
		console.log(user)
		username.innerHTML = user.username;
		$("#people").append("Username ");
		$("#people").append(username);
		
		var novRed = document.createElement("p");
		$("#people").append(novRed);
		
		
		
	}

	});
}
</script>
</head>
<body>
<center>
<table>
	<label> Search Through our database to find a user: </label>
	<input id="username" type="text" name="username"placeholder="username" required="required" onkeyup="refreshUsername()"/> 
	</form>
	<div id="people"></div>
</table>
</center>
</body>
</html>
