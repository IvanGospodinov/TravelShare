package com.travelshare.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

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

import com.google.gson.Gson;
import com.travelshare.model.EmotionDAO;
import com.travelshare.model.PostDAO;
import com.travelshare.model.User;
import com.travelshare.model.UserDAO;
import com.travelshare.util.UserException;

@MultipartConfig
@Controller
public class UserController extends HttpServlet{

	final String AVATAR_URL = "/Users/Ivan/Desktop/images/";
	//final String AVATAR_URL = "/Users/Mumko/Desktop/images/";


	private static final long serialVersionUID = 2477388678189213947L;

	@RequestMapping(method = RequestMethod.GET)
	public String redirect(Model model, HttpServletRequest request,HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "login";
		}
		return "home";
	}

	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {	
		System.out.println("GETTTTTTTTT REGISTER METHOD");
		return "register";
	}

	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String registerUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam("picture") MultipartFile multiPartFile) {
		try {
			if((!UserDAO.getInstance().checkForEmail(request.getParameter("userEmail"))) || (!!UserDAO.getInstance().checkForUsername(request.getParameter("username")))) {
				User user = new User(
						request.getParameter("username"),
						request.getParameter("password"),
						request.getParameter("userEmail"),
						request.getParameter("userFirstName"),
						request.getParameter("userLastName"),
						null
						);
				if(!UserDAO.getInstance().registerUser(user)) {
					session.setAttribute("errorRegister", "We are sorry there is an internal error please try again later!");
				}
				if(user.getUserID() != 0) {

					if(multiPartFile.getContentType() != null) {
						int id = UserDAO.getInstance().getUserID(request.getParameter("userEmail"));
						File file = new File(AVATAR_URL + id +
								"-profile-pic." + multiPartFile.getContentType().split("/")[1]);
						String urlDB = AVATAR_URL + id +
								"-profile-pic." + multiPartFile.getContentType().split("/")[1];

						UserDAO.getInstance().changeAvatarURL(urlDB, id);
						try {
							Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
						} catch (IOException e1) {
							e1.printStackTrace();
						}
						model.addAttribute("profilePic", file.getAbsolutePath());
					}
					session.setMaxInactiveInterval(3600);
					session.setAttribute("username", user.getUsername());
					session.setAttribute("email", request.getParameter("userEmail"));
					session.setAttribute("error", null);
					session.setAttribute("userID", user.getUserID());
					session.setAttribute("user", user);
					session.setAttribute("errorRegister", null);
					session.setAttribute("errorDeleteAccount", null);
					session.setAttribute("name", user.getFirstName());
					return "home";
				} else {	
					session.setAttribute("errorRegister", "There was a problem with our server please try again later!");
					return "login";		
				}
			} else {
				request.getSession(true);
				session.setAttribute("errorRegister", "A user with the same email is already registered!");
				return "login";			
			}
		} catch (UserException e) {
			e.printStackTrace();
			session.setAttribute("errorLogin", "The username, or email are already taken, please try again!");
		}
		return "home";
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginUser(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.err.println("POST LOGIN");
		boolean userExists = false;	
		try {
			userExists = UserDAO.getInstance().checkForUser(request.getParameter("userEmail"),request.getParameter("password"));
			if(userExists) {
				User user =  null;
				user = UserDAO.getInstance().getUser(request.getParameter("userEmail"));
				session.setMaxInactiveInterval(3600);
				session.setAttribute("username", user.getUsername());
				session.setAttribute("email", request.getParameter("userEmail"));
				session.setAttribute("errorLogin", null);
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("user", user);
				session.setAttribute("errorDeleteAccount", null);
				session.setAttribute("name", user.getFirstName());
				return "home";
			} else{
				session.setAttribute("errorLogin", "Wrong Email Address or Password!");
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
		request.getSession().invalidate();
		return "login";	
	}

	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contacts(Model model, HttpServletRequest request, HttpSession session) {
		return "contacts";	
	}

	@RequestMapping(value="/myProfile", method = RequestMethod.GET)
	public String myProfile(Model model, HttpServletRequest request, HttpSession session) {
		return "myProfile";	
	}

	@RequestMapping(value="/deleteAccount", method = RequestMethod.GET)
	public String deleteAccountGET(Model model, HttpServletRequest request, HttpSession session) {
		return "deleteAccount";	
	}

	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public String deleteAccountPOST(Model model, HttpServletRequest request, HttpSession session) {
		if(request.getSession().getId() != null) {
			if(request.getParameter("userEmail").equals(session.getAttribute("email"))) {
				try {
					if(UserDAO.getInstance().deleteAccount(request.getParameter("userEmail"), request.getParameter("password"))) {
						request.getSession().invalidate();
						return "login";
					}
				} catch (UserException e) {
					e.printStackTrace();
				} 
				session.setAttribute("errorDeleteAccount", "Wrong Email Address or password!");
				return "deleteAccount";	
			} else {
				session.setAttribute("errorDeleteAccount", "This is not your email address please try again!");
				return "deleteAccount";	
			}
		} else {
			request.getSession().invalidate();
			return "login";
		}
	}

	@RequestMapping(value="/updateProfile", method = RequestMethod.POST)
	public String updateProfile(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		if(request.getSession().getId() != null) {
			User user = (User) session.getAttribute("user");
			if(request.getParameter("firstName") != null) {
				try {
					if(UserDAO.getInstance().changeFirstName(request.getParameter("firstName"), (int)session.getAttribute("userID"))) {
						user.setFirstName(request.getParameter("firstName"));
						response.addCookie(new Cookie("name", user.getFirstName()));
						session.setAttribute("updateProfile", "First Name Changed");
						return "myProfile";
					}
				} catch (UserException e) {
					session.setAttribute("updateProfile", "First Name Not Changed");
					e.printStackTrace();
				}
			}
			if(request.getParameter("lastName") != null) {
				try {
					if(UserDAO.getInstance().changeLastName(request.getParameter("lastName"), (int)session.getAttribute("userID"))) {
						user.setLastName(request.getParameter("lastName"));
						session.setAttribute("updateProfile", "Last Name Changed");
						return "myProfile";
					}
				} catch (UserException e) {
					session.setAttribute("updateProfile", "Last Not Name Changed");
					e.printStackTrace();
				}
			}
			if(request.getParameter("email") != null) {
				try {
					if(UserDAO.getInstance().changeEmail(request.getParameter("email"), (int)session.getAttribute("userID"))) {
						user.setEmail(request.getParameter("email"));
						session.setAttribute("email", request.getParameter("email"));
						session.setAttribute("updateProfile", "Email Changed");
						return "myProfile";
					}
				} catch (UserException e) {
					session.setAttribute("updateProfile", "Email Not Changed");
					e.printStackTrace();
				}
			}
			if(request.getParameter("username") != null) {
				try {
					if(UserDAO.getInstance().changeUsername(request.getParameter("username"), (int)session.getAttribute("userID"))) {
						user.setUsername(request.getParameter("username"));
						session.setAttribute("username",request.getParameter("username"));
						session.setAttribute("updateProfile", "Username Changed");
						return "myProfile";
					}
				} catch (UserException e) {
					session.setAttribute("updateProfile", "Username Not Changed");
					e.printStackTrace();
				}
			}
			return "myProfile";	
		} else {
			request.getSession().invalidate();
			return "login";
		}
	}

	@RequestMapping(value="/changePassword", method = RequestMethod.GET)
	public String changePasswordGET(Model model, HttpServletRequest request, HttpSession session) {
		if(request.getSession().getId() != null) {
			return "changePassword";	
		} else {
			request.getSession().invalidate();
			return "login";
		}
	}

	@RequestMapping(value="/sendEmail", method = RequestMethod.GET)
	public String testT(Model model, HttpServletRequest request, HttpSession session) {
		System.err.println("GETTTTTTTTT EMAIL");

		return "sendEmail";	
	}
	@RequestMapping(value="/errorRegister", method = RequestMethod.GET)
	public String errorRegister(Model model, HttpServletRequest request, HttpSession session) {

		return "errorRegister";	
	}

	@RequestMapping(value="/changePassword", method = RequestMethod.POST)
	public String changePasswordPOST(Model model, HttpServletRequest request, HttpSession session) {
		if(request.getSession().getId() != null) {
			try {
				User user = (User) session.getAttribute("user");
				if(UserDAO.getInstance().checkForUser((String) session.getAttribute("email"), request.getParameter("oldPassword"))) {
					if(UserDAO.getInstance().changePassword(request.getParameter("newPassword"), (int)session.getAttribute("userID"))) {
						session.setAttribute("errorChangePass", null);
						session.setAttribute("updateProfile", "Password Changed");
						return "myProfile";
					}
				} else {
					session.setAttribute("errorChangePass", "Your password is wrong!");
					return "changePassword";
				}
			} catch (UserException e) {
				e.printStackTrace();
			}
			return "changePassword";	
		} else {
			request.getSession().invalidate();
			return "login";
		}
	}

	@RequestMapping(value="/uploadPicture", method=RequestMethod.POST)
	public String changeAvatar(@RequestParam("picture") MultipartFile multiPartFile,HttpServletResponse response, Model model,HttpServletRequest request, HttpSession session) {
		if(request.getSession().getId() != null) {
			
			try {
				User user = null;
				int userID = (int)session.getAttribute("userID");

				File file = new File(AVATAR_URL + userID +"-profile-pic." + multiPartFile.getContentType().split("/")[1]);
				Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
				try {
					UserDAO.getInstance().addProfilePic(user);
					model.addAttribute("profilePic", file.getAbsolutePath());
				} catch (SQLException | UserException e) {
					e.printStackTrace();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			session.setAttribute("updateProfile", "Avatar Changed");
			return "myProfile";
		} else {
			request.getSession().invalidate();
			return "login";
		}
	}

	@RequestMapping(value="/posts", method = RequestMethod.GET)
	public String posts(Model model, HttpServletRequest request) {

		return "posts";	
	}


	@RequestMapping(value="/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword(Model model, HttpServletRequest request) {

		return "forgotPassword";	
	}


	@RequestMapping(value="/myFollowers", method = RequestMethod.GET)

	public String myFollowers(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		User user = (User) session.getAttribute("user");
		System.err.println(user.getUserID());
		LinkedHashSet<User> followers = UserDAO.getInstance().getFollowers(user);
		model.addAttribute("followers", followers);
		return "myFollowers";
	}
	
	
	@RequestMapping(value="/findUser", method = RequestMethod.GET)
	public String findUser(Model model, HttpServletRequest request) {

		return "findUser";	
	}
	
	
	@RequestMapping(value="/getUsers", method = RequestMethod.GET)
	public void getUsers(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//if(request.getSession().getId() != null) {
		int numberOfEmotions = 0;
		//String name = request.getParameter("oldPassword");

		//List<String> list = UserDAO.getInstance().getUsers();

		
		
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("user");
		List<User> list = UserDAO.getInstance().getUsersObject(username);
		System.err.println(username);
		if (list != null ) {
			try {
				PrintWriter p =  response.getWriter();
				System.out.println(new Gson().toJson(list));
				response.getWriter().print(new Gson().toJson(list));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("[]");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
	}
	
	
	
}
