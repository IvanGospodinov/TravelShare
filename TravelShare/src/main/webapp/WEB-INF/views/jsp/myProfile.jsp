<%@page import="java.io.IOException"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>


<html>
<head>
<title>My Profile</title>
<style type="text/css">

	footer {
	/* position: re */
	}

.deleteButton {
 /*    display: block;
    width: 115px;
    height: 25px;
 */   
    background: transparent; 
   
    padding: 15px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    font-size: 15px;
    outline-color: dimgrey;
   /*  position: relative;
    left: 120px; */
}
    .backButton {
 /*    display: block;
    width: 115px;
    height: 25px;
 */    
    background: transparent; 
    color: ghostwhite;
        
    padding: 15px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    font-size: 15px;
   /*  position: relative;
    left: 120px; */
}
    .passwordButton {
 /*    display: block;
    width: 115px;
    height: 25px;
 */    
    background: transparent; 

    padding: 15px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    font-size: 15px;
   /*  position: relative;
    left: 120px; */
}
a {
	padding-bottom: 5px;

}
 
</style>
</head>
<body>
<c:if test="${sessionScope.user != null }">
	<jsp:include page="header.jsp" />
	<div class="page-wrap">
		<div class="navbar-overlay"></div>
		<div class="l-container centered-box">
			<div class="centered-box__content l-row">
				<h1>Hello <c:out value="${user.getFirstName()}"></c:out></h1>
                
                <!--AVATAR-->
                <div img class="pull-left avatar-form__img" width="60" height="60">
                 <%
    try{
      String imgName="C:\\Users\\Ivan\\Desktop\\images\\";
      imgName = imgName.concat(session.getAttribute("userID")+"-profile-pic.jpeg");
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
        <img  width="300" height="300"  class="img-responsive" src="data:image/jpg;base64, <%=b64%>"/>                            
        <% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 
    %>
    </div>
				<form class="l-row form" action="uploadPicture" accept-charset="UTF-8"method="post" enctype="multipart/form-data">
                   <button type="submit">Update Avatar</button>
                    <label class="form__label" for="picture"></label>
						<input accept="image/jpg, image/jpeg, image/png"
							type="file" name="picture" value="Add New Avatar" required="required"/>
                    </form>
						</div>
						<div class="avatar-form__img-container">
							<!-- <img class="pull-left avatar-form__img" width="60" height="60"src="https://marketplace.canva.com/MAB6v043Ud8/1/thumbnail/canva-robot-electric-avatar-icon-MAB6v043Ud8.png"
								alt="0160dcc0668dfd402690cd54b9d2a5df?s=200&amp;d=mm"/> -->
						</div>
					</div>
                    
                    <!--FIRST NAME-->
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label class="form__label" for="user_first_name">First
							name</label> <input autofocus="autofocus" required="required"
							maxlength="25" size="25" type="text"
							name="firstName" id="user_first_name" />
                            <button type="submit">Change First Name</button>
                        </form>
					</div>
                    
                    <!--LAST NAME-->
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label class="form__label" for="user_last_name">Last
							name</label> <input autofocus="autofocus" required="required"
							cmaxlength="25" size="25" type="text"
							name="lastName" id="user_last_name" />
                            <button type="submit">Change Last Name</button>
                        </form>
					</div>
                  
                    <!--EMAIL-->
                    <div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label for="email">Email</label> 
                            <input required="required" type="email"
							name="email"/>
                            <button type="submit">Change Email</button>
                        </form>
                    </div>
                    
                    <!--USERRNAME-->
					<div class="l-lg-6 form__group">
                        <form action="updateProfile" method="post">
						<label for="username">Username</label> <input autofocus="autofocus" required="required" maxlength="25" size="25" type="text" name="username"/>
                            <button type="submit">Change Username</button>
                        </form>
					</div>
                    
                    <!--PASSWORD-->
                    <div class="passwordButton">
				        <form method="get" action="/TravelShare/changePassword">
                            <button style="color:black" type="submit">Change Password</button>
				        </form>
                        </div>
                    <!--BACK BUTTON-->
                <div class="backButton">
				<form method="get" action="/TravelShare/home">
                    <button style="color: black" type="submit">Back</button>
				</form>
                    </div>

                    <!--DELETE PROFILE-->
				<div class="deleteButton">
				<a style="color: red" href="/TravelShare/deleteAccount" class="delete" data-confirm="Are you sure to delete this item? HINT if you stay we will send you chocolates!">Delete Profile</a>
				</div>
			</div>
		</div>
	</div>
	<!--<footer><jsp:include page="footer.jsp" /></footer>-->
   <script>
var deleteLinks = document.querySelectorAll('.delete');

for (var i = 0; i < deleteLinks.length; i++) {
  deleteLinks[i].addEventListener('click', function(event) {
      event.preventDefault();

      var choice = confirm(this.getAttribute('data-confirm'));

      if (choice) {
        window.location.href = this.getAttribute('href');
      }
  });
}
</script>

</c:if>
	 
     <c:if test="${sessionScope.user == null }">
    	 <jsp:forward page="login.jsp"></jsp:forward>
     </c:if>

</body>
</html>