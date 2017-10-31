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
    transform: scale(1.1);
}


body {
	background-color: beige;
}

#image {
	padding: 1px;
	padding-right: 5px;
	height: 350px;
	width: 400px;
	float: left;
	border: 1px solid black;
}

#description {
	display: block;
}

#likeButton {
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
	float: left;
}

#dislikeButton {

	transform: rotate(180deg);
	height: 35px;
	width: 35px;
	float: left;
}

#loveButton {
	transform: rotate(360deg);
	height: 35px;
	width: 35px;
	float: left;
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

body {
	background-color: silver;
	background-image: none;
}


</style>

<body>

	<c:if test="${sessionScope.user != null }">
		<header>
			<jsp:include page="header.jsp" />
			<!--BODY-->

			<header><link rel="import" href="header.html"></header>
			<h1>Hi <c:out value="${name}"></c:out></h1><br>
			<h1 id="title">Here are the latest user posts</h1>
			<hr>

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
				<h2 id="user">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br>
				<br> 
				<button id="likeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>543</p>
				<br> 
				<button id="dislikeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>23</p>
				<br> 
				<button id="loveButton"><img id="loveButton"
					src="https://i.pinimg.com/originals/b2/71/b8/b271b8f220ce1860e247f189b374d591.png"></button>
				<p>543</p>
			</div>
			<hr id="line">
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
				<h2 id="user">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br>
				<br> 
				<button  id="likeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>543</p>
				<br> 
				<button id="dislikeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>23</p>
				<br> 
				<button id="loveButton"><img id="loveButton"
					src="https://i.pinimg.com/originals/b2/71/b8/b271b8f220ce1860e247f189b374d591.png"></button>
				<p>543</p>
			</div>
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
				<h2 id="user">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br>
				<br> 
				<button id="likeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>543</p>
				<br> 
				<button id="dislikeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>23</p>
				<br> 
				<button id="loveButton"><img id="loveButton"
					src="https://i.pinimg.com/originals/b2/71/b8/b271b8f220ce1860e247f189b374d591.png"></button>
				<p>543</p>
			</div>
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
				<h2 id="user">
					Title - ... Uploaded by  
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br>
				<br> 
				<button id="likeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>543</p>
				<br> 
				<button id="dislikeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>23</p>
				<br> 
				<button id="loveButton"><img id="loveButton"
					src="https://i.pinimg.com/originals/b2/71/b8/b271b8f220ce1860e247f189b374d591.png"></button>
				<p>543</p>
			</div>
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
				<h2 id="user">
					Title - ... Uploaded by 
					<c:out value="${postUsername}"></c:out>
				</h2>
				<h3 id="description">Description</h3>
				<div class="descriptionBox">
					<h4 id="description">Description</h4>
				</div>
				<br>
				<br> 
				<button id="likeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>543</p>
				<br> 
				<button id="dislikeButton"><img id="loveButton"
					src="https://3.bp.blogspot.com/-e2tr8NkXBjc/TbWuwAQNiJI/AAAAAAAABlA/FwW7T9aKmRE/s1600/Thumbs+Up.jpg"></button>
				<p>23</p>
				<br> 
				<button id="loveButton"><img id="loveButton"
					src="https://i.pinimg.com/originals/b2/71/b8/b271b8f220ce1860e247f189b374d591.png"></button>
				<p>543</p>
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