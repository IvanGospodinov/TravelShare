package com.travelshare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.travelshare.model.Post;
import com.travelshare.model.PostDAO;
import com.travelshare.model.User;
import com.travelshare.util.UserException;


@Controller
public class PostController {

	@RequestMapping(value= "/newPost", method = RequestMethod.GET)
	protected String doGet(Model model, HttpServletRequest request) {
		System.err.println("POST GET METHOD");
		Post post = new Post();
		model.addAttribute(post);
		return "newPost";
	}

	@RequestMapping(value= "/newPost",method = RequestMethod.POST)
	protected String doPost(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("POST SUBMIT");
		//String category = request.getParameter("category");
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		

		Post post = new Post(title, location, description);
		int result =0;
//		try {
//			result = PostDAO.getInstance().createPost(post);
//		} catch (UserException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//req.getRequestDispatcher("").forward(req, resp);
		return "index";





		//doGet(request, response);






	}


}
