<%@page import="com.travelshare.model.Post"%>
<%@page import="com.travelshare.model.PostDAO"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/styleIndex.css" />
<!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<title>Travel Share</title>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">



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

.hvr-grow:hover, .hvr-grow:focus, .hvr-grow:active {
	transform: scale(1.3);
}

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

.img-responsive {
	padding: 1px;
	padding-right: 5px;
	height: 550px;
	width: 550px;
	align: middle;
	margin: 0 auto;
}

#description {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
}

.buttons {
	border-radius: 15px 50px 30px 5px:  
	margin-left: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
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
	align: middle;
}

.text {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	text-align: center;
	color: #383a3d;
}

#numbers {
	display:inline-table;
	font-size: 20px;
}

img{
    max-width:200px;
    max-height:300px;
}

</style>

</head>


<body>

	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />
		<h1 class="text">
			Hello
			<c:out value="${username}"></c:out>
		</h1>
	<%-- 	<%
			try {
					String picPath = PostDAO.getInstance().getLastPostURL((int) session.getAttribute("userID"));
					if (picPath == null) {
		%><h1 class="text">You have no posts yet. Click on the New Post
			button to get started.</h1>
		<%
			} else {
						String imgName = "C:/"
								+ PostDAO.getInstance().getLastPostURL((int) session.getAttribute("userID"));
						System.err.println("!!!!!!!!!!!!!!!!!!!!!path " + imgName);
						BufferedImage bImage = ImageIO.read(new File(imgName));
						ByteArrayOutputStream baos = new ByteArrayOutputStream();
						ImageIO.write(bImage, "jpg", baos);
						baos.flush();
						byte[] imageInByteArray = baos.toByteArray();
						baos.close();
						String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
		%>
		<h2 class="text">This Is Your Latest Post</h2>
		<div class="post">
			<a class="hvr-grow" href="mapTest"><img
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></a>
			</h2>
			<h3 id="description">Description</h3>
			<div class="descriptionBox">
				<h4 id="description">Description</h4>
			</div>
			<br> <br>
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
		</div>
		<%
			}
				} catch (IOException e) {
					System.out.println("Error: " + e);
				}
		%> 
 --%>
		<center>
			<table style="margin-top: 100px">
					<%
			try {
					String picPath = PostDAO.getInstance().getLastPostURL((int)session.getAttribute("userID"));
					if (picPath == null) {
		%><h1 class="text">You have no posts yet. Click on the New Post
			button to get started.</h1>
		<%
			} else {
				%>
				<th class="text" style="font-size: 30px;padding-left: 10px;">Your Latest Post</th>
				<th class="text" style="font-size: 30px;">The latest post on our site</th>
				</tr>
				
				<tr>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle1}"></c:out>'</th>
				<th class="text" style="font-size: 25px;">Title '<c:out value="${postTitle2}"></c:out>'</th>
				</tr>
				<tr>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription1}"></c:out>'</th>
				<th class="text" style="font-size: 17px;">Description: '<c:out value="${postDescription2}"></c:out>'</th>
				</tr>
			
				<tr>
				
				<tr>
				<%
						session.setAttribute("postTitle1", PostDAO.getInstance().getLastTitle((int)session.getAttribute("userID")));
						session.setAttribute("postDescription1", PostDAO.getInstance().getLastDescription((int)session.getAttribute("userID")));
						String imgName = "C:/"
								+ PostDAO.getInstance().getLastPostURL((int) session.getAttribute("userID"));
						System.err.println("!!!!!!!!!!!!!!!!!!!!!path " + imgName);
						BufferedImage bImage = ImageIO.read(new File(imgName));
						ByteArrayOutputStream baos = new ByteArrayOutputStream();
						ImageIO.write(bImage, "jpg", baos);
						baos.flush();
						byte[] imageInByteArray = baos.toByteArray();
						baos.close();
						String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
		%>
					<td style="padding-left: 50px; padding-right: 150px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="200" height="200" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
				<%
			}
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
					try {
						session.setAttribute("postTitle1", PostDAO.getInstance().getLastTitleFromOtherUserLastPost((int)session.getAttribute("userID")));
						session.setAttribute("postDescription1", PostDAO.getInstance().getLastDescriptionFromOtherUserLastPost((int)session.getAttribute("userID")));
						String imgName = "C:/"
								+ PostDAO.getInstance().getLastPostFromOtherUserURL((int) session.getAttribute("userID"));
						System.err.println("!!!!!!!!!!!!!!!!!!!!!path " + imgName);
						BufferedImage bImage = ImageIO.read(new File(imgName));
						ByteArrayOutputStream baos = new ByteArrayOutputStream();
						ImageIO.write(bImage, "jpg", baos);
						baos.flush();
						byte[] imageInByteArray = baos.toByteArray();
						baos.close();
						String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
			%>
					<td style="padding-right: 100px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="200" height="200" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%-- <%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
								//session.setAttribute("postTitle", post.getAttachments().get(2).getTitle());
								//session.setAttribute("postDescription", post.getAttachments().get(2).getDescription());
								//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
								String imgName = "C:/";
								imgName = imgName.concat(post.getAttachments().get(2).getURL());
								BufferedImage bImage = ImageIO.read(new File(imgName));
								ByteArrayOutputStream baos = new ByteArrayOutputStream();
								ImageIO.write(bImage, "jpg", baos);
								baos.flush();
								byte[] imageInByteArray = baos.toByteArray();
								baos.close();
								String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
					%>
					<td style="padding-right: 50px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							"width="200" height="200" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
				</tr> --%>
				</tr>
				</table>
				</center>
				</header>
		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</c:if>
	<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.7.1.js"
		type="text/javascript"></script>

</body>
</html>