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
<title>| Latest Posts |</title>

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
</style>



</head>
<body>

	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />

		<h1 class="text" style="color: black">
			Hi
			<c:out value="${name}"></c:out>
		</h1>
		<br>
		<h1 class="text" style="color: black">These are the latest posts made by our users</h1>
		<hr class="descriptionBox">

		<center>
			<table style="margin-top: 100px">
				<tr>
					<%
					try {
						Post post = PostDAO.getInstance().getLastFivePosts();
						session.setAttribute("postTitle", post.getAttachments().get(0).getTitle());
						session.setAttribute("postDescription", post.getAttachments().get(0).getDescription());
						session.setAttribute("postID5", post.getAttachments().get(0).getPostID());
						//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
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
					<td style="padding-right: 150px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
					try {
											Post post = PostDAO.getInstance().getLastFivePosts();
											session.setAttribute("postTitle", post.getAttachments().get(1).getTitle());
											session.setAttribute("postDescription", post.getAttachments().get(1).getDescription());
											session.setAttribute("postID5", post.getAttachments().get(1).getPostID());
											//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
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
					<td style="padding-right: 150px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
					<%
					try {
											Post post = PostDAO.getInstance().getLastFivePosts();
											session.setAttribute("postTitle", post.getAttachments().get(2).getTitle());
											session.setAttribute("postDescription", post.getAttachments().get(2).getDescription());
											session.setAttribute("postID5", post.getAttachments().get(2).getPostID());
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
					<td style="padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
					<%
						} catch (IOException e) {
								System.out.println("Error: " + e);
							}
					%>
				</tr>
				<center>
					<table style="margin-top: 100px">
						<tr>
							<%
							try {
								Post post = PostDAO.getInstance().getLastFivePosts();
								session.setAttribute("postTitle", post.getAttachments().get(3).getTitle());
								session.setAttribute("postDescription", post.getAttachments().get(3).getDescription());
								session.setAttribute("postID5", post.getAttachments().get(3).getPostID());
								//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
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
							<td style="padding-right: 150px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							<%
							try {
								Post post = PostDAO.getInstance().getLastFivePosts();
								session.setAttribute("postTitle", post.getAttachments().get(4).getTitle());
								session.setAttribute("postDescription", post.getAttachments().get(4).getDescription());
								session.setAttribute("postID5", post.getAttachments().get(4).getPostID());
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
							<td style="padding-right: 150px; padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
							<%
							try {
								Post post = PostDAO.getInstance().getLastFivePosts();
								session.setAttribute("postTitle", post.getAttachments().get(5).getTitle());
								session.setAttribute("postDescription", post.getAttachments().get(5).getDescription());
								session.setAttribute("postID5", post.getAttachments().get(5).getPostID());
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
							<td style="padding-bottom: 300px"><a
						class="hvr-grow" href="TravelShare/home"> <img id="image"
							width="300" height="300" class="img-responsive"
							src="data:image/jpg;base64, <%=b64%>" /></a></td>
							<%
								} catch (IOException e) {
										System.out.println("Error: " + e);
									}
							%>
						</tr>
					</table>
				</center>
				</header>
				<div class="footer">
					<jsp:include page="footer.jsp" />
				</div>
	</c:if>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
var $emotionType = 2;
var $orders = $('#numbers');	
function addOrder(order) {
	$orders.replaceWith('<li>emotion ' + order + '</li>');	
};

/* $(function () { */
		
	
	
/* 	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutt',
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
}); */

	$('#likeButton').on('click', function() {
		$.ajax({	
			type: 'GET',
			url: '/TravelShare/aboutUSS?emotionType=' + 1 + '&postID=' + 78,
			success: function(orders) {
				
				$.each(orders, function(i, order)  {
					addOrder(order)		
				}) 
			}		
		})		
	});
$('#dislikeButton').on('click', function() {
	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutUSS?emotionType=' + 2 + '&postID=' + 78,
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
});
$('#loveButton').on('click', function() {
	$.ajax({	
		type: 'GET',
		url: '/TravelShare/aboutUSS?emotionType=' + 3 + '&postID=' + 78,
		success: function(orders) {
			
			$.each(orders, function(i, order)  {
				addOrder(order)		
			}) 
		}		
	})		
});



</script>

<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>
</body>
</html>