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
<title>Login/Register Form</title>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/styleLogin.css">

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	background-color: transparent;
}

.travelShare {
	color: #000000;
	padding: 10px;
	font-family: 'Indie Flower', cursive;
	font-style: italic;
	font-weight: bold;
	font-variant: small-caps;
	text-align: center;
	text-decoration: blink;
	text-transform: capitalize;
	cursor: move;
	visibility: visible;
	text-shadow: 0px 1px 0px #800000;
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #d6d6d6;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #78c57c;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #94def3;
}

.form .message {
	margin: 15px 0 0;
	color: #ffffff;
	font-size: 18px;
	font-weight: 600;
}

.form .message a {
	color: #ffffff;
	text-decoration: none;
	text-decoration: underline;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

body {
	background: #e1e1e1; /* fallback for old browsers */
	/* background: -webkit-linear-gradient(right, #76b852, #76b852);
  background: -moz-linear-gradient(right,#76b852, #76b852);
  background: -o-linear-gradient(right, #76b852, #76b852);
  background: linear-gradient(to left, #76b852, #76b852);
  font-family: "Roboto", sans-serif;internet
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      */
	background:
		url("https://static.pexels.com/photos/547114/pexels-photo-547114.jpeg")
		/*url("http://sf.co.ua/13/02/wallpaper-948394.jpg")*/  
		
		
		/*url("http://www.stlouisllcattorney.com/wp-content/uploads/2016/07/Fence-post.jpg")*/,
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.error {
	color: red;
	font-size: 20px;
	padding: 0px;
	padding-bottom: 0px; 
	font-family : 'Indie Flower', cursive;
	font-style: italic;
	font-weight: bold;
	font-variant: small-caps;
	text-align: center;
	text-decoration: blink;
	text-transform: capitalize;
	cursor: move;
	visibility: visible;
	text-shadow: 0px 1px 0px #800000;
	font-family: 'Indie Flower', cursive;
}
</style>


<script>
	var request;
	function sendInfo() {
		var v = document.vinform.t1.value;
		var url = "ajaxTest.jsp?val=" + v;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('amit').innerHTML = val;
		}
	}
</script>

</head>

<body>

	<h1 class="travelShare">Welcome To Travel Share</h1>
	<br />

	<c:if test="${sessionScope.errorLogin != null }">
		<h1 class="error">
			<c:out value="${errorLogin}"></c:out>
		</h1>
	</c:if>

<c:if test="${sessionScope.errorRegister != null }">
		<h1 class="error">
			<c:out value="${errorRegister}"></c:out>
		</h1>
	</c:if>
	<div class="login-page">
		<div class="form">
			<!-- Register part -->
			<form class="register-form" action="register" method="post"
				enctype="multipart/form-data">
				<input id="username" type="text" name="username"
					placeholder="username" required="required" /> <input id="email"
					type="email" name="user_email" placeholder="email address"
					onkeyup="return passwordLength()" required="required" /> <input
					id="password" type="password" name="password"
					placeholder="password" required="required" /> <input
					id="conpassword" type="password" name="conpassword"
					placeholder="confirm password" required="required" /> <input
					type="text" name="user_firstname" placeholder="first name"
					required="required" /> <input type="text" name="user_lastname"
					placeholder="last nname" required="required" /> <input type="file"
					name="picture" placeholder="avatar" />
				<button type="submit">Create</button>
				<p class="message">
					Already registered? <a href="#">Sign In</a> Forgot Password? <a
						href="resetPassword">Click Here</a>
				</p>
			</form>
			`
			<!-- Login part -->
			<form class="login-form" action="login" method="post"
				required="required">
				<input type="email" placeholder="email" name="user_email" /> <input
					type="password" placeholder="password" name="password"
					required="required" />
				<button type="submit">login</button>
				<p class="message">
					Not registered? <a href="#"> Create an account</a>
				</p>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$('.message a').click(function() {
			$('form').animate({
				height : "toggle",
				opacity : "toggle"
			}, "slow");
		});
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("conpassword");

		function validatePassword() {

			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>