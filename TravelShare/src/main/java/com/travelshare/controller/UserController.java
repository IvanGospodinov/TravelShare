package com.travelshare.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.travelshare.model.User;
import com.travelshare.model.UserDAO;
import com.travelshare.util.UserException;

@MultipartConfig
@Controller
public class UserController extends HttpServlet{

	final String AVATAR_URL = "/Users/Ivan/Desktop/images/";

	private static final long serialVersionUID = 2477388678189213947L;

	@RequestMapping(method = RequestMethod.GET)
	public String redirect(Model model, HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("user") == null) {
			System.err.println("GETTTTTTTTT IF USER SESSION DOES NOT EXIST");
			return "login";
		}
		System.err.println("GETTTTTTTTT ELSE IF SESSION EXISTS");
		System.err.println("USER class " + session.getAttribute("user"));
		System.err.println("USERNAME " + session.getAttribute("username"));
		return "home";
	}

	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {	
		System.out.println("GETTTTTTTTT REGISTER METHOD");
		return "register";
	}

	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String registerUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam("picture") MultipartFile multiPartFile) {
		File file = new File(AVATAR_URL + request.getParameter("user_email") +
				"-profile-pic." + multiPartFile.getContentType().split("/")[1]);
		String urlDB = AVATAR_URL + request.getParameter("user_email") +
				"-profile-pic." + multiPartFile.getContentType().split("/")[1];
		try {
			Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		model.addAttribute("profilePic", file.getAbsolutePath());
		System.err.println("POST REGISTER METHOD");
		User user = new User(
				request.getParameter("username"),
				request.getParameter("password"),
				request.getParameter("user_email"),
				request.getParameter("user_firstname"),
				request.getParameter("user_lastname"),
				urlDB
				);
		System.out.println(user.getPictureURL());

		try {
			UserDAO.getInstance().registerUser(user);
			if(user.getUserID() != 0) {
				session.setMaxInactiveInterval(3600);
				session.setAttribute("username", user.getUsername());
				session.setAttribute("email", request.getParameter("user_email"));
				session.setAttribute("logged", true);
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("user", user);
				response.addCookie(new Cookie("name", user.getFirstName()));
				return "home";
			} else {
				request.getSession().invalidate();
				return "errorRegister";			
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
				session.setAttribute("email", request.getParameter("user_email"));
				session.setAttribute("logged", true);
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("user", user);
				response.addCookie(new Cookie("name", user.getFirstName()));
				System.err.println("LOGIN - FOUND USER");
				return "home";
			} else{
				System.err.println("LOGIN - NO SUCH USER");
				session.setAttribute("error", "Wrong Email Address or Password!");
				System.err.println("Session USER " + session.getAttribute("user"));
				//request.getSession().invalidate();
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

	@RequestMapping(value="/updateProfile", method = RequestMethod.POST)
	public String updateProfile(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		User user = (User) session.getAttribute("user");
		System.err.println("USER ID "+ user + (int)session.getAttribute("userID"));
		System.err.println("POST UPDATE MY PROFILE");
		if(request.getParameter("avatar") != null) {
			System.err.println("AVATAR");
		}
		if(request.getParameter("firstName") != null) {
			if(UserDAO.getInstance().changeFirstName(request.getParameter("firstName"), (int)session.getAttribute("userID"))) {
				user.setFirstName(request.getParameter("firstName"));
				response.addCookie(new Cookie("name", user.getFirstName()));
				System.err.println("FIRST NAME CHANGED");
				return "myProfile";
			}
		}
		if(request.getParameter("lastName") != null) {
			if(UserDAO.getInstance().changeLastName(request.getParameter("lastName"), (int)session.getAttribute("userID"))) {
				user.setFirstName(request.getParameter("lastName"));
				System.err.println("LAST CHANGED");
				return "myProfile";
			}
		}
		if(request.getParameter("email") != null) {
			if(UserDAO.getInstance().changeEmail(request.getParameter("email"), (int)session.getAttribute("userID"))) {
				user.setFirstName(request.getParameter("email"));
				session.setAttribute("email", request.getParameter("email"));
				String URL = "C:\\Users\\Ivan\\Desktop\\images\\"+session.getAttribute("email")+"-profile-pic.jpeg";
				user.setPictureURL(URL);
				UserDAO.getInstance().changeAvatarURL(URL, (int)session.getAttribute("userID"));
				System.err.println("EMAIL CHANGED");
				return "myProfile";
			}
		}
		if(request.getParameter("username") != null) {
			if(UserDAO.getInstance().changeUsername(request.getParameter("username"), (int)session.getAttribute("userID"))) {
				user.setFirstName(request.getParameter("username"));
				session.setAttribute("username",request.getParameter("username"));
				System.err.println("USERNAME CHANGED");
				return "myProfile";
			}
		}
		System.err.println("NE GO NAMIRA");
		return "myProfile";	
	}

	@RequestMapping(value="/changePassword", method = RequestMethod.GET)
	public String changePasswordGET(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT CHANGE PASSWORD " + session.getAttribute("user")+ " " + session.getAttribute("userID"));
		System.err.println("user id " + session.getAttribute("userID"));

		return "changePassword";	
	}

	@RequestMapping(value="/sendEmail", method = RequestMethod.GET)
	public String testT(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT EMAIL");

		return "sendEmail";	
	}
	@RequestMapping(value="/errorRegister", method = RequestMethod.GET)
	public String errorRegister(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT ERROR REGISTER");

		return "errorRegister";	
	}

	@RequestMapping(value="/changePassword", method = RequestMethod.POST)
	public String changePasswordPOST(Model model, HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.err.println("useremail " + " " + user.getEmail());
		System.err.println("user id " + session.getAttribute("userID"));
		System.err.println("POST CHANGE PASSWORD");
		try {
			if(UserDAO.getInstance().checkForUser((String) session.getAttribute("email"), request.getParameter("oldPassword"))) {
				if(UserDAO.getInstance().changePassword(request.getParameter("newPassword"), (int)session.getAttribute("userID"))) {
					System.err.println("PASSWORD CHANGED");
					return "myProfile";
				}
			} else {
				System.err.println("WRONG PASSWORD ENTERED");
				return "changePassword";
			}
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.err.println("PASSWORD IS NOT CHANGED");
		return "changePassword";	
	}

	@RequestMapping(value="/uploadPicture", method=RequestMethod.POST)
	public String changeAvatar(@RequestParam("picture") MultipartFile multiPartFile,HttpServletResponse response, Model model,HttpServletRequest request, HttpSession session) {
		User u = null;
		try {
			String email = (String) session.getAttribute("email");
			String username = (String) session.getAttribute("username");

			try {
				u = UserDAO.getInstance().getUser(email);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//		if(u.getPictureURL()!=null) {
			//			File usersPicture = new File(UsersManager.getInstance().getRegisteredUsers().get(username).getPhotoURL());
			//			usersPicture.delete();
			//		}
			File file = new File(AVATAR_URL + username+"-profile-pic." + multiPartFile.getContentType().split("/")[1]);
			Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			try {
				UserDAO.getInstance().addProfilePic(u);
				model.addAttribute("profilePic", file.getAbsolutePath());
				//errorMsg= "Picture successfully uploaded!";
			} catch (SQLException e) {
				e.printStackTrace();
				//errorMsg = "something went wrong, please try again later";
			}
			/*response.setStatus(200);
		response.getWriter().append("Picture successfully uploaded!");*/

		} catch (IOException e) {
			//errorMsg="Picture failed to upload!";
			e.printStackTrace();
		}
		//model.addAttribute("errorMsg", errorMsg);
		//errorMsg=null;

		return "home";


	}



}
