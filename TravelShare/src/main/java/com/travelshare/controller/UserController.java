package com.travelshare.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import com.travelshare.model.User;
import com.travelshare.model.UserDAO;
import com.travelshare.util.UserException;

@Controller
@RequestMapping(value="/login")
@SessionAttributes("user")
public class UserController {

//	@Autowired
//	private UserDAO userDAO = new UserDAO();
//
//	@Autowired
//	private User user2;

	@RequestMapping(method = RequestMethod.GET)
	public String redirect(Model model, HttpServletRequest request) {
		System.err.println("GET Tuk sum !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
			User user = new User();
			model.addAttribute(user);
			//System.out.println(request.getAttribute("test"));

		return "login";
	}


	@RequestMapping(method = RequestMethod.POST)
	public String registerUser(@ModelAttribute User user, Model model, HttpServletRequest request, HttpServletResponse response) {
		//UserDAO userDAO = new UserDAO();
		System.err.println("Metod Tuk sum !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		//System.out.println("requesta "+request.toString());
		//System.out.println(request.getParameter("user_email"));
		System.out.println(user.getFirstName());
		System.out.println(user.getEmail());
		System.out.println(user.getLastName());
		System.out.println(user.getPassword());
		model.addAttribute("name",user.getFirstName());
		User u = user;
		System.out.println(u.getFirstName());


		//		user = new User(request.getParameter("uname"),
		//				request.getParameter("password"),
		//				request.getParameter("user_email"),
		//				request.getParameter("user_firstname"),
		//				request.getParameter("user_lastname"),
		//				"abv");
		try {
			System.err.println("Tuk sum !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			UserDAO.getInstance().registerUser(user);
			request.getSession().setAttribute("userID", user.getUserID());
			request.getSession().setAttribute("user", user);
			String username = request.getParameter("name");
			response.addCookie(new Cookie("username", user.getFirstName()));
		} catch (UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.err.println("Tuk sum !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		return "index";

	}

}
