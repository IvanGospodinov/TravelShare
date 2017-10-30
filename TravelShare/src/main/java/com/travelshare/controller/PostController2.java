
package com.travelshare.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.travelshare.model.Post;
import com.travelshare.model.PostDAO;
import com.travelshare.model.User;
import com.travelshare.util.UserException;


@MultipartConfig
@Controller
public class PostController2 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7985015971859803829L;



	@RequestMapping(value= "/newPost", method = RequestMethod.GET)
	protected String newPost(Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("POST GET METHOD");
		return "newPost";
	}
	
	

	@RequestMapping(value= "/newPost",method = RequestMethod.POST)
	protected String addPost(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("picture") MultipartFile multiPartFile) throws ServletException, IOException {
		User user = (User) session.getAttribute("user");
		System.err.println("POST SUBMIT");
		
		String category = request.getParameter("category");
		System.err.println("BEFORE PARSE CATEGORY " + category);
		System.err.println("BEFORE PARSE TITLE " + request.getParameter("title"));
		System.err.println("BEFORE PARSE LOCATION " + request.getParameter("location"));
		System.err.println("BEFORE PARSE USER ID " + user.getUserID());
		System.err.println("BEFORE PARSE DESCRIPTION " + request.getParameter("description"));
		int category_id = Integer.valueOf(category);
		
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		

		Post post = new Post(title, description, LocalDate.now(),  LocalDate.now(), category_id, user.getUserID(), location);
	//	long time=0;
		int result = 0;
		try {
			result = PostDAO.getInstance().createPost(post);
		} catch (UserException e) {
			e.printStackTrace();
			System.err.println("Tyka Grymna");
			return "newPost";
		}
		System.err.println(result);
		
		
		//req.getRequestDispatcher("").forward(req, resp);
		return "home";

	}


}
