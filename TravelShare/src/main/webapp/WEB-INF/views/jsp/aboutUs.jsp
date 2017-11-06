
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
		//var img = document.createElement("img");
		//console.log(user.imgName)
		//img.src = user.imgName;
		//img.style = "float:left,padding-right:10px";
	//	img.width = 100;
	//	img.height = 100;
		//$("#people").append(img);
		var name = document.createElement("p");
		console.log(user)
		name.innerHTML = user.firstName;
		name.style = "padding:5px"
		$("#people").append(name);
		
		//var age = document.createElement("p");
		//age.innerHTML = user.age;
	//	age.style = "padding:5px"
	//	$("#people").append(age);
		
		//var city = document.createElement("p");
		//city.innerHTML = user.city;
		//city.style = "padding:5px"
	//	$("#people").append(city);
		
		//var btn = document.createElement("BUTTON");
		//btn.width = 100;
		//btn.height = 100;
		//btn.name = "choose";
		//$("#people").append(btn);
		
		var novRed = document.createElement("p");
		$("#people").append(novRed);
		
		
		
	}

	});
}
</script>
</head>
<body>
<form class="register-form" action="getUsers" method="get" >
	<label> Enter username: </label>
	<input id="username" type="text" name="username"placeholder="username" required="required" onkeyup="refreshUsername()"/> 
	</form>
	<div id="people"></div>

</body>
</html>
