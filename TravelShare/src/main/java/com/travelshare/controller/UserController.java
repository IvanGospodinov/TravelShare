package com.travelshare.controller;

import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.travelshare.model.User;
import com.travelshare.model.UserDAO;
import com.travelshare.util.UserException;

@Controller
@RequestMapping(value="/login")
@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserDAO userDAO;


	@RequestMapping(method = RequestMethod.GET)
	public String redirect(Model model, HttpServletRequest request) {
		User user = new User();
		model.addAttribute(user);
		return "login";
	}


	@RequestMapping(method = RequestMethod.POST)
	public String registerUser(@ModelAttribute User user, Model model, HttpServletRequest request, HttpServletResponse response) {
		//model.addAttribute("name",user.getFirstName());

		try {
			if(user.getLastName() == null && user.getFirstName() == null && user.getUsername() == null) {
				System.err.println("Log in");
				boolean userExists = false;
				userExists = userDAO.checkForUser(user);
				if(userExists) {
					User u = userDAO.getUser(user);
					System.err.println("V if sa sym");
					request.getSession().setAttribute("user", u);
					request.getSession().setAttribute("userID", u.getUserID());
					response.addCookie(new Cookie("username", u.getUsername()));
					return "index";
				} else {
					System.err.println("V Else sa sym " + user.getEmail());
					//User u = userDAO.getUser(user);
					request.getSession().setAttribute("user", null);
					request.getSession().setAttribute("userID", null);
					response.addCookie(new Cookie("username", null));
					return "login";
				}
			} else {
				userDAO.registerUser(user);
				request.getSession().setAttribute("userID", user.getUserID());
				request.getSession().setAttribute("user", user);
				response.addCookie(new Cookie("username", user.getUsername()));
			}
		} catch (UserException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("EXIT");
		return "index";

	}

}
