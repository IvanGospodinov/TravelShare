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
<title>Insert title here</title>

<jsp:include page="header.jsp" />

<center>
	<table style="margin-top:100px">
		<tr>
		<%
	try {
		Post post = PostDAO.getInstance().getLastFivePosts();
		session.setAttribute("postTitle", post.getAttachments().get(0).getTitle());
		session.setAttribute("postDescription", post.getAttachments().get(0).getDescription());
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
			<td style="padding-right: 150px; padding-bottom:300px"><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
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
			<td style="padding-right: 150px; padding-bottom:300px"><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
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
			<td style="padding-bottom: 300px"><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
				<%
	} catch (IOException e) {
		System.out.println("Error: " + e);
	}
%>
		</tr>
		<tr>
	
		<%
	try {
		//Post post = PostDAO.getInstance().getLastFivePosts();
		Post post2 = PostDAO.getInstance().getLastThreePostsByCategory(2);
		//session.setAttribute("postTitle", post.getAttachments().get(0).getTitle());
		//session.setAttribute("postDescription", post.getAttachments().get(0).getDescription());
		//System.err.println("!!!!!!!!!!!!!!!!!!!!!post TITLE " + post.getAttachments().get(4).getTitle());
		String imgName = "C:/";
		imgName = imgName.concat(post2.getAttachments().get(0).getURL());
		BufferedImage bImage = ImageIO.read(new File(imgName));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bImage, "jpg", baos);
		baos.flush();
		byte[] imageInByteArray = baos.toByteArray();
		baos.close();
		String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
%>
			<td style="padding-right: 150px"><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
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
			<td style="padding-right:150px"><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
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
			<td><img id="image" width="320" height="300"
				class="img-responsive" src="data:image/jpg;base64, <%=b64%>" /></td>
				<%
	} catch (IOException e) {
		System.out.println("Error: " + e);
	}
%>
		</tr>
	</table>
</center>
<script type="text/javascript">
function setValue(){
document.getElementById("dropdown").value=document.getElementById("colour").value;
document.productForm.submit();
return true;
}
</script>

</body>
<script type="text/javascript">

function previewFile() {
    // Where you will display your image
    var preview = document.querySelector('img');
    // The button where the user chooses the local image to display
    var file = document.querySelector('input[type=file]').files[0];
    // FileReader instance
    var reader  = new FileReader();

    // When the image is loaded we will set it as source of
    // our img tag
    reader.onloadend = function () {
      preview.src = reader.result;
    }

    
    if (file) {
      // Load image as a base64 encoded URI
      reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }
  }

</script>
</html>