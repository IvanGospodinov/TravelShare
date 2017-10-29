package com.travelshare.controller;

import java.sql.SQLException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travelshare.model.User;
import com.travelshare.model.UserDAO;
import com.travelshare.util.UserException;

@Controller
@MultipartConfig
public class UserController {


	@RequestMapping(method = RequestMethod.GET)
	public String redirect(Model model, HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("user") == null) {
			System.err.println("GETTTTTTTTT IF USER SESSION DOES NOT EXIST");
			return "login";
		}
		System.err.println("GETTTTTTTTT ELSE IF SESSION EXISTS");
		System.err.println(session.getAttribute("user"));
		System.err.println(session.getAttribute("username"));
		return "home";
	}

	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {	
		System.out.println("GETTTTTTTTT REGISTER METHOD");
		return "register";
	}

	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String registerUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		final String AVATAR_URL = "/Users/Ivan/Desktop/Java EE/ShareTravel/WebContent/images/";
		//model.addAttribute("name",user.getFirstName());
		System.err.println("POST REGISTER METHOD");
		User user;
		//		try {
		//			Part avatarPart = request.getPart("user_pictureURL");
		//			InputStream fis = avatarPart.getInputStream();
		//			File myFile = new File(AVATAR_URL+request.getParameter("uname")+".jpg");
		//			if(!myFile.exists()){
		//				myFile.createNewFile();
		//			}
		//			FileOutputStream fos = new FileOutputStream(myFile);
		//			int b = fis.read();
		//			while(b != -1){
		//				fos.write(b);
		//				b = fis.read();
		//			}
		//			fis.close();
		//			fos.close();
		//		} catch (IOException | ServletException e) {
		//			e.printStackTrace();
		//		}

		String avatarUrl = "images/"+request.getParameter("uname")+".jpg";

		user = new User(
				request.getParameter("username"),
				request.getParameter("password"),
				request.getParameter("user_email"),
				request.getParameter("user_firstname"),
				request.getParameter("user_lastname"),
				avatarUrl
				);
		System.out.println(user.getPictureURL());

		try {
			UserDAO.getInstance().registerUser(user);
			if(user.getUserID() != 0) {
				session.setMaxInactiveInterval(3600);
				session.setAttribute("username", user.getUsername());
				session.setAttribute("logged", true);
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("user", user);
				response.addCookie(new Cookie("name", user.getFirstName()));
				return "home";
			} else {
				request.getSession().invalidate();
				return "login";			
			}
		} catch (UserException e) {
			e.printStackTrace();
		}
		return "home";
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.err.println("POST LOGIN");

		User user =  null;


		boolean userExists = false;	
		try {
			userExists = UserDAO.getInstance().checkForUser(request.getParameter("user_email"),request.getParameter("password"));
			if(userExists) {
				user = UserDAO.getInstance().getUser(request.getParameter("user_email"));
				session.setMaxInactiveInterval(3600);
				session.setAttribute("username", user.getUsername());
				session.setAttribute("logged", true);
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("user", user);
				response.addCookie(new Cookie("name", user.getFirstName()));
				System.err.println("LOGIN - FOUND USER");
				return "home";
			} else{
				System.err.println("LOGIN - NO SUCH USER");
				request.getSession().invalidate();
				return "login";
			}
		} catch (UserException e) {
			request.setAttribute("error", "database problem : " + e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "login";		
	}


	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("GETTTTTTTTT LOGOUT");
		request.getSession().invalidate();

		return "login";	
	}

	@RequestMapping(value="/TravelSharee/changeEmail", method = RequestMethod.GET)
	public String changeEmail2(Model model, HttpServletRequest request) {
		User user = new User();
		model.addAttribute(user);
		return "changeEmail";	
	}

	//	@RequestMapping(value="/changeEmail", method = RequestMethod.POST)
	//	public String changeEmail(@ModelAttribute User user, Model model, HttpServletRequest request) {
	//		System.err.println("In the change email method");
	//		boolean passIsCorrect = userDAO.checkPass(request.getParameter("password"));
	//		if(passIsCorrect) {
	//			userDAO.changeEmail(request.getParameter("user_email"), request.getParameter("password"));
	//			return "index";
	//		}	
	//		return "changeEmail";
	//	}

	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String aboutUs(Model model, HttpServletRequest request) {
		System.err.println("GETTTTTTTTT ABOUT US");

		return "aboutUs";	
	}

	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contacts(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT CONTACTS");
		return "contacts";	
	}

	@RequestMapping(value="/myProfile", method = RequestMethod.GET)
	public String myProfile(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT MY PROFILE");
		return "myProfile";	
	}

	@RequestMapping(value="/deleteAccount", method = RequestMethod.GET)
	public String deleteAccountGET(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT DELETE MY DELETE");
		return "deleteAccount";	
	}

	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public String deleteAccountPOST(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("POST DELETE MY PROFILE");
		if(UserDAO.getInstance().deleteAccount(request.getParameter("user_email"), request.getParameter("password"))) {
			request.getSession().invalidate();
			return "login";
		} 
		return "deleteAccount";	
	}

}
