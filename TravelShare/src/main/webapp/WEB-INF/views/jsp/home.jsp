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


body {
	padding-bottom: 30px;
	
}
 .footer{
 display:inline;
position: fixed;

  }

</style>

</head>


<body>




	<c:if test="${sessionScope.user != null }">
		<header> <jsp:include page="header.jsp" />


	<!-- 	<p>If you click on me, I will disappear.</p>
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
 -->
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
		<h1 style="text-align: center">Hello <c:out value="${username}"></c:out></h1>
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