<%@page import="com.travelshare.model.UserDAO"%>
<%@page import="com.travelshare.model.User"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<title>| Posts |</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
@import "compass/css3";

.hvr-grow {
    display: inline-block;
    transform: translateZ(0);
    box-shadow: 0 0 1px rgba(0, 0, 0, 0);
    backface-visibility: hidden;
    -moz-osx-font-smoothing: grayscale;
    transition-duration: 0.3s;
    transition-property: transform;
    float: left;
}

.hvr-grow:hover,
.hvr-grow:focus,
.hvr-grow:active {
    transform: scale(1.2);
}

#image {
	padding: 1px;
	padding-right: 5px;
	height: 350px;
	width: 400px;
	float: left;
	z-index: 1;
	
}

#description {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
}

.buttons {
	border-radius: 15px 50px 30px 5px:  
	margin-left: 35px;
	margin-top: 10px;
	margin-bottom: 20px;
	background: transparent;
}

#likeButton {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
}

#dislikeButton {
	align: middle;
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(180deg);
	height: 35px;
	width: 35px;
}

#loveButton {
	margin-left: 25px;
	margin-right: 25px;
	padding-left: 0px;
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
}

.post {
	border: 1px;
	border-color: aqua;
}

.bottomPosts {
	margin-bottom: 20px;
	margin-top: 70px;
}

#title {
	text-align: center;
	padding-top: 10px;
}

.descriptionBox {
	border: 1px solid;
	border-color: black;
	max-height: 80px;
}

.footerContainer {
	display: inline;
}

#numbers {
	display:inline-table;
	font-size: 20px;
}

.text {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	text-align: center;
	color: black;
}

</style>

<body>

	<c:if test="${sessionScope.user != null }">
		<header>
			<jsp:include page="header.jsp" />
			<!--BODY-->

			<header><link rel="import" href="header.html"></header>
			<h1 class="text" style="color: black">Hi <c:out value="${name}"></c:out></h1><br>
			<h1 class="text" style="color: black">Here are the latest user posts</h1>
			<hr class="descriptionBox">

			<div class="post">
				<%
    try{
    	User user = UserDAO.getInstance().getTopUsers();
    	session.setAttribute("postUsername", user.getPosts().get(0).getUsername());
    	System.err.println("!!!!!!!!!!!!!!!!!!!!!postUsername " + user.getUsername());
        String imgName="C:/";
        imgName = imgName.concat(user.getPosts().get(0).getPictureURL());
        System.err.println("!!!!!!!!!!!!!!!!!!!!!PATH postUsername " + imgName + " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        BufferedImage bImage = ImageIO.read(new File(imgName));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
				<a class="hvr-grow" href="TravelShare/home"><img id="image" width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
				<h2 class="text" style="color: black">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br><br> 
				<div class="buttons">
				<button class="buttons">
					<img id="likeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">543</p>
				<br>
				<button class="buttons">
					<img id="dislikeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">23</p>
				<br>
				<button class="buttons">
					<img id="loveButton"
						src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
				</button>
				<p id="numbers">543</p>
			</div>
			<hr class="descriptionBox">
			<div class="bottomPosts">
				<%
    try{
    	User user = UserDAO.getInstance().getTopUsers();
    	session.setAttribute("postUsername", user.getPosts().get(1).getUsername());
        String imgName="C:/";
        imgName = imgName.concat(user.getPosts().get(1).getPictureURL());
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
				<a class="hvr-grow" href="TravelShare/home"><img id="image" width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
				<h2 class="text" style="color: black">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br><br> 
				<div class="buttons">
				<button class="buttons">
					<img id="likeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">543</p>
				<br>
				<button class="buttons">
					<img id="dislikeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">23</p>
				<br>
				<button class="buttons">
					<img id="loveButton"
						src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
				</button>
				<p id="numbers">543</p>
			</div>
			<hr class="descriptionBox">
			<div class="bottomPosts">
				<%
    try{
    	User user = UserDAO.getInstance().getTopUsers();
    	session.setAttribute("postUsername", user.getPosts().get(2).getUsername());
        String imgName="C:/";
        imgName = imgName.concat(user.getPosts().get(2).getPictureURL());;
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
				<a class="hvr-grow" href="TravelShare/home"><img id="image" width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
				<h2 class="text" style="color: black">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br><br> 
				<div class="buttons">
				<button class="buttons">
					<img id="likeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">543</p>
				<br>
				<button class="buttons">
					<img id="dislikeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">23</p>
				<br>
				<button class="buttons">
					<img id="loveButton"
						src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
				</button>
				<p id="numbers">543</p>
			</div>
			<hr class="descriptionBox">
			<div class="bottomPosts">
				<%
    try{
    	User user = UserDAO.getInstance().getTopUsers();
    	session.setAttribute("postUsername", user.getPosts().get(3).getUsername());
        String imgName="C:/";
        imgName = imgName.concat(user.getPosts().get(3).getPictureURL());
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
				<a class="hvr-grow" href="TravelShare/home"><img id="image" width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
				<h2 class="text" style="color: black">
					Title - ... Uploaded by  
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br><br> 
				<div class="buttons">
				<button class="buttons">
					<img id="likeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">543</p>
				<br>
				<button class="buttons">
					<img id="dislikeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">23</p>
				<br>
				<button class="buttons">
					<img id="loveButton"
						src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
				</button>
				<p id="numbers">543</p>
			</div>
			<hr class="descriptionBox">
			<div class="bottomPosts">
				<%
    try{
    	User user = UserDAO.getInstance().getTopUsers();
    	session.setAttribute("postUsername", user.getPosts().get(4).getUsername());
        String imgName="C:/";
        imgName = imgName.concat(user.getPosts().get(4).getPictureURL());
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
				<a class="hvr-grow" href="TravelShare/home"><img id="image" width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
				<h2 class="text" style="color: black">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br><br> 
				<div class="buttons">
				<button class="buttons">
					<img id="likeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">543</p>
				<br>
				<button class="buttons">
					<img id="dislikeButton"
						src="https://cdn0.iconfinder.com/data/icons/winter-lollipop/374/Like.png">
				</button>
				<p id="numbers">23</p>
				<br>
				<button class="buttons">
					<img id="loveButton"
						src="https://cdn2.iconfinder.com/data/icons/christmas-hand-drawn-scribbles-icons/512/86-512.png">
				</button>
				<p id="numbers">543</p>
			</div>
			<hr class="descriptionBox">
			</div>
		</header>
		<footer>
			<div class="footerContainer">
				<ul class="about">
					<li><a href="http://www.instagram.com" target="_blank">About
							Us</a></li>
					<li><a href="http://www.instagram.com" target="_blank">Contacts</a></li>
				</ul>
				<ul class="social">
					<li><a href="http://facebook.com" class="fa fa-facebook"
						target="_blank"></a></li>
					<li><a href="http://www.twitter.com" class="fa fa-twitter"
						target="_blank"></a></li>
					<li><a href="http://www.googleplus.com" class="fa fa-google"
						target="_blank"></a></li>
					<li><a href="http://www.instagram.com" class="fa fa-instagram"
						target="_blank"></a></li>
					<li><a href="http://www.pinterest.com" class="fa fa-pinterest"
						target="_blank"></a></li>
					<li><a href="http://www.snapchat.com"
						class="fa fa-snapchat-ghost" target="_blank"></a></li>
					<li id="follow">Follow us on:</li>
				</ul>

			</div>

		</footer>

<script type="text/javascript">


</script>

	</c:if>
	<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>
</body>

</html>