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

</head>


<body>




	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" /> <!-- 	<p>If you click on me, I will disappear.</p>
		<p>Click me away!</p>
		<p>Click me too!</p>
		
		

		<form name="fileform" action="uploadPicture" method="post"
			enctype="multipart/form-data">
			<h4 align="center">Select new picture:</h4>
			<input type="file" id="fileInput" name="picture" required /></label><br>
			<input class="btn" type="submit" value="Upload" />
		</form>

		<form action="sendEmail" method="get">
			<button type="submit">Push</button>
		</form>
		
		<form action="test" method="get">
			<button type="submit">Ajax Test</button>
		</form>
		
		<button id="get-image">Show the Image</button>
		<div id="image-container"></div>
 --> <!--  
		<div id="secwrapper">
			<section> <article id="featured"> <a
				href="post.jsp"> <sql:setDataSource var="snapshot"
					driver="com.mysql.jdbc.Driver"
					url="jdbc:mysql://localhost/travel_share" user="root"
					password="BratinDol14" /> <sql:query dataSource="${snapshot}"
					var="result">
      	
         SELECT user_pictureURL FROM users;
      </sql:query>
		 <table>
         <tr>
            <th>Post</th>

         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><img src="<c:out value = "${row.user_pictureURL}"/>"/>
               <h3>User: <c:out value = "${row.user_pictureURL}"/></h3>
               </td>
            </tr>
         </c:forEach>
      </table></a>
		</article>
		</section>
		-->
		<h1 style="text-align: center">
			Hello
			<c:out value="${username}"></c:out>
		</h1>
		<%
			try {
					String picPath = PostDAO.getInstance().getLastPostURL((int)session.getAttribute("userID"));
					String imgName = "C:/" + picPath;
					System.err.println("!!!!!!!!!!!!!!!!!!!!!path " + imgName);
					BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					ImageIO.write(bImage, "jpg", baos);
					baos.flush();
					byte[] imageInByteArray = baos.toByteArray();
					baos.close();
					String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
		%> <h2>Your latest post is</h2>
		<div class="post">
		<a class="hvr-grow" href="TravelShare/home"><img width="300" height="300" class="img-responsive"
			src="data:image/jpg;base64, <%=b64%>" /></a>
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
			 <%
 	} catch (IOException e) {
 			System.out.println("Error: " + e);
 		}
 %> </header>

		<%-- <h1>Email <c:out value="${email}"></c:out></h1>
		<h1>AVATAR URL <c:out value="${user.getPictureURL()}"></c:out></h1> --%>

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

	<!-- <script>
$(document).ready(function(){
    $("p").click(function(){
        $(this).hide();
    });
});
</script> -->
</body>
</html>