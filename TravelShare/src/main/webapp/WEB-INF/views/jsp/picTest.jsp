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
<title>Demo page</title> 


gfdgdfgf
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/travel_share" user="root"
		password="BratinDol14" />

	<sql:query dataSource="${snapshot}" var="result">
            SELECT * from attachments WHERE attachment_id = 31;
         </sql:query>

	<table border="1" width="100%">
		<tr>
			<th>Emp ID</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>



		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.attachmentURL}" /></td>
				<%
									try {
											Post post = PostDAO.getInstance().getLastFivePosts();
											session.setAttribute("postTitle", post.getAttachments().get(4).getTitle());
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
				<a class="hvr-grow" href="home"><img id="image"
					width="300" height="300" class="img-responsive"
					src="data:image/jpg;base64, <%=b64%>" /></a>
				<%
									} catch (IOException e) {
											System.out.println("Error: " + e);
										}
								%>
			</tr>
		</c:forEach>
	</table>
</body>

</body>
</html>