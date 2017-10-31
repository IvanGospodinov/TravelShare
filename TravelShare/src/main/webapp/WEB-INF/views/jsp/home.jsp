<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
@font-face {
	margin: 0;
	font-family: 'Leckerli One', cursive;
	text-shadow: 0 2px rgba(0, 0, 0, .5);
}

.warn {
	color: red;
	font-weight: bold;
	border: 2px solid red;
	background-color: $fcc;
}

.hidden {
	display: none;
}

@font-face {
	font-family: 'SourceSansProLight';
	src: url('fonts/SourceSansPro-Light-webfont.eot');
	src: url('fonts/SourceSansPro-Light-webfont.eot?#iefix')
		format('embedded-opentype'),
		url('fonts/SourceSansPro-Light-webfont.woff') format('woff'),
		url('fonts/SourceSansPro-Light-webfont.ttf') format('truetype'),
		url('fonts/SourceSansPro-Light-webfont.svg#SourceSansProLight')
		format('svg');
	font-weight: normal;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
}

img {
	border: none;
}

body {
	
}

header h1, nav, nav li {
	display: inline;
}

header h1 a {
	font-family: LeagueGothic, Verdana, Arial, sans-serif;
	color: white;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: normal;
	font-size: 28px;
	position: absolute;
	top: 8px;
	left: 35px;
}

#version {
	color: white;
	font-size: 10px;
	position: relative;
	top: 12px;
	left: 122px;
}

nav {
	position: absolute;
	top: 40.8%;
	left: 30.5%;
	background-color: transparent;
}

nav li a {
	color: white;
	text-decoration: none;
	font-family: Verdana, Arial, sans-serif;
	font-size: 13px;
	margin-right: 12px;
	padding: 5px;
}

nav li a:hover {
	background-color: #383838;
	border-radius: 3px;
}

.current {
	background-color: #492737;
	border-radius: 15px;
}

#adbanner {
	display: inline-block;
	margin-top: 50px;
	height: 124px;
	background-color: #dbdbdb;
	border-bottom: 1px solid #c3c3c3;
}

#ad {
	display: inline-block;
	width: 728px;
	margin: auto;
}

#adbanner img {
	display: inline-block;
	border: 1px solid #c3c3c3;
	height: 90px;
	width: 728px;
	margin: 16px auto;
	color: #6b6b6b;
	text-decoration: none;
	font-family: Verdana, Arial, sans-serif;
	font-size: 14px;
	background-color: #d1d1d1;
}

#adbanner a:hover {
	border: 1px solid #a7a7a7;
	/*text-decoration: underline;*/
	color: #3f3f3f;
	background-color: #cacaca;
}

#adbanner a p {
	text-align: center;
	margin-top: 35px;
}

section {
	width: 1000px;
	margin: auto;
}

#secwrapper {
	/*background: url('images/bg.gif') fixed;
	background-color: #f47771;*/
	padding-top: 90px;
}

article {
	width: 280px;
	margin-right: 40px;
	display: inline;
	vertical-align: top;
	border: 1px solid #c8c8c8;
	margin-bottom: 20px;
	padding: 7px;
	border-radius: 3px;
	box-shadow: 0 2px 3px #ccc;
	background-color: #d8d8d8;
	*display: inline;
	zoom: 0.9;
}

#sponsors, .rightcl {
	margin-right: 0px;
}

.readmore {
	background-color: black;
	padding: 5px 10px;
	color: white;
	text-decoration: none;
	border-radius: 3px;
	display: inline-block;
}

.readmore:hover {
	background-color: #383838;
}

article p {
	margin-bottom: 7px;
}

#photobox img {
	margin: 5px 4px 6px 6.5px;
	border: 1px solid black;
}

#sponsors a {
	color: #6b6b6b;
	text-decoration: none;
	font-family: Verdana, Arial, sans-serif;
	font-size: 14px;
	background-color: #d1d1d1;
	width: 125px;
	height: 125px;
	display: inline-block;
	margin: 5px 4px 6px 7px;
	border: 1px solid #c3c3c3;
}

#sponsors a p {
	margin: 50px auto;
	width: 125px;
	text-align: center;
}

#sponsors a:hover {
	border: 1px solid #a7a7a7;
	/*text-decoration: underline;*/
	color: #3f3f3f;
	background-color: #cacaca;
}

#featured {
	position: relative;
}

#featuredico {
	position: absolute;
	top: 0;
	left: 0;
}

#logoutButton {
	background-color: #383838;
	border-radius: 3px;
}

.old_ie header h1, .old_ie nav, .old_ie nav li, .old_ie #adbanner a,
	.old_ie article, .old_ie .readmore, .old_ie #sponsors a {
	display: inline;
	zoom: 1;
}

#title {
	position: relative;
}

.menu-bar {
	text-align: center;
	vertical-align: middle;
	background-color: transparent;
}
</style>




</head>


<body>




	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />


		<p>If you click on me, I will disappear.</p>
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

<!--  
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
		<h1>FILE</h1>
		 <%
    try{
      String imgName="C:\\Users\\Ivan\\Desktop\\images\\";
      imgName = imgName.concat(session.getAttribute("email")+"-profile-pic.jpeg");
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
        <img width="300" height="300" class="img-responsive" src="data:image/jpg;base64, <%=b64%>"/>                            
        <% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
		</header>
		<h1>Hello <c:out value="${username}"></c:out></h1>
		<h1>Email <c:out value="${email}"></c:out></h1>
		<h1>AVATAR URL <c:out value="${user.getPictureURL()}"></c:out></h1>


		<footer><jsp:include page="footer.jsp" /></footer>
<h1>Current Profile Picture</h1>
<img alt="" src="/Desktop/images/ivangospodinov88-profile-pic.jpeg"/>">


	</c:if>
	<c:if test="${sessionScope.user == null }">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:if>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.7.1.js"
		type="text/javascript"></script>

	<script type="text/javascript">
      $(document).ready(function() {

    	   $("get-image").click(function() {
    	      alert("Hello, world!");
    	   });
    		
    	});
	
	
	</script>
	<script>
$(document).ready(function(){
    $("p").click(function(){
        $(this).hide();
    });
});
</script>
</body>
</html>