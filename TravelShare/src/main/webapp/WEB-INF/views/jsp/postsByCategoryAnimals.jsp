<%@page import="com.travelshare.model.PostDAO"%>
<%@page import="com.travelshare.model.Post"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal Posts</title>

<style type="text/css">

body {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	background:
		url("https://static.pexels.com/photos/347139/pexels-photo-347139.jpeg")
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.text {
	text-decoration-color: fuchsia;
	font-family: 'Indie Flower', cursive;
	text-align: center;
	color: black;
}

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
	transform: scale(1.2);
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

.descriptionBox {
	border: 1px solid;
	border-color: black;
	max-height: 80px;
}

</style>



</head>
<body>

	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />

<%
 	try {
 			Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
 			if(post.getAttachments().get(0).getTitle() != null) {
 			session.setAttribute("postTitle1", post.getAttachments().get(0).getTitle());
 			}
 			if(post.getAttachments().get(1).getTitle() != null) {
 	 			session.setAttribute("postTitle2", post.getAttachments().get(1).getTitle());
 	 			}
 			if(post.getAttachments().get(2).getTitle() != null) {
 	 			session.setAttribute("postTitle3", post.getAttachments().get(2).getTitle());
 	 			}
 			if(post.getAttachments().get(3).getTitle() != null) {
 	 			session.setAttribute("postTitle4", post.getAttachments().get(3).getTitle());
 	 			}
 			if(post.getAttachments().get(4).getTitle() != null) {
 	 			session.setAttribute("postTitle5", post.getAttachments().get(4).getTitle());
 	 			}
 			if(post.getAttachments().get(5).getTitle() != null) {
 	 			session.setAttribute("postTitle6", post.getAttachments().get(5).getTitle());
 	 			}
 %> <%
 	} catch (IOException e) {
 			System.out.println("Error: " + e);
 		}
 %>


		<h1 class="text" style="color: black">
			Hi
			<c:out value="${name}"></c:out>
		</h1>
		<br>
		<h1 class="text" style="color: black">Here are the latest posts from our <c:out value="${category}"></c:out> category</h1>
		<hr class="descriptionBox">

		<center>
			<table style="margin-top: 100px">
			<tr>
					<th>Title - "<c:out value="${postTitle1}"></c:out>"</th>
   					 <th>Title - "<c:out value="${postTitle2}"></c:out>"</th> 
   					 <th>Title - "<c:out value="${postTitle3}"></c:out>"</th>
  				</tr>
				<tr>
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
								session.setAttribute("postDescription", post.getAttachments().get(0).getDescription());
								String imgName = "C:/";
								imgName = imgName.concat(post.getAttachments().get(0).getURL());
								BufferedImage bImage = ImageIO.read(new File(imgName));
								ByteArrayOutputStream baos = new ByteArrayOutputStream();
								ImageIO.write(bImage, "jpg", baos);
								baos.flush();
								byte[] imageInByteArray = baos.toByteArray();
								baos.close();
								String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
					%>
					<td style="padding-right: 150px; padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
								session.setAttribute("postDescription", post.getAttachments().get(1).getDescription());
								String imgName = "C:/";
								imgName = imgName.concat(post.getAttachments().get(1).getURL());
								BufferedImage bImage = ImageIO.read(new File(imgName));
								ByteArrayOutputStream baos = new ByteArrayOutputStream();
								ImageIO.write(bImage, "jpg", baos);
								baos.flush();
								byte[] imageInByteArray = baos.toByteArray();
								baos.close();
								String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
					%>
					<td style="padding-right: 150px; padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					
					<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
					
					<%
						try {
								Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
								session.setAttribute("postDescription", post.getAttachments().get(2).getDescription());
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
					<td style="padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					
					<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
					
				</tr>
				
				<center>
					<table style="margin-top: 100px">
					<tr>
					<th>Title - "<c:out value="${postTitle1}"></c:out>"</th>
   					 <th>Title - "<c:out value="${postTitle2}"></c:out>"</th> 
   					 <th>Title - "<c:out value="${postTitle3}"></c:out>"</th>
  				</tr>
						<tr>
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
										session.setAttribute("postDescription", post.getAttachments().get(3).getDescription());
										String imgName = "C:/";
										imgName = imgName.concat(post.getAttachments().get(3).getURL());
										BufferedImage bImage = ImageIO.read(new File(imgName));
										ByteArrayOutputStream baos = new ByteArrayOutputStream();
										ImageIO.write(bImage, "jpg", baos);
										baos.flush();
										byte[] imageInByteArray = baos.toByteArray();
										baos.close();
										String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
							%>
							<td style="padding-right: 150px; padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							
							<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
							
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
										session.setAttribute("postDescription", post.getAttachments().get(4).getDescription());
										//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
										String imgName = "C:/";
										imgName = imgName.concat(post.getAttachments().get(4).getURL());
										BufferedImage bImage = ImageIO.read(new File(imgName));
										ByteArrayOutputStream baos = new ByteArrayOutputStream();
										ImageIO.write(bImage, "jpg", baos);
										baos.flush();
										byte[] imageInByteArray = baos.toByteArray();
										baos.close();
										String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
							%>
							<td style="padding-right: 150px; padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							
							<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
							
							<%
								try {
										Post post = PostDAO.getInstance().getLastThreePostsByCategory(2);
										session.setAttribute("postDescription", post.getAttachments().get(5).getDescription());
										//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
										String imgName = "C:/";
										imgName = imgName.concat(post.getAttachments().get(5).getURL());
										BufferedImage bImage = ImageIO.read(new File(imgName));
										ByteArrayOutputStream baos = new ByteArrayOutputStream();
										ImageIO.write(bImage, "jpg", baos);
										baos.flush();
										byte[] imageInByteArray = baos.toByteArray();
										baos.close();
										String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
							%>
							<td style="padding-bottom: 150px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							
							<h2 class="text" style="color: black">
					Post Title is
					"<c:out value="${postTitle}"></c:out>"
				</h2>
				<h3 style="color: black" id="description">Description</h3>
				<div class="descriptionBox">
					<h4 style="color: white" id="description"><c:out value="${postDescription}"></c:out></h4>
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
							
						</tr>
					</table>
				</center>
				</header>
				<div class="footer">
					<jsp:include page="footer.jsp" />
				</div>
	</c:if>
</body>
</html>