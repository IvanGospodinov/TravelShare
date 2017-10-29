
package com.travelshare.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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


@MultipartConfig
@Controller
public class PostController2 {

	@RequestMapping(value= "/newPost", method = RequestMethod.GET)
	protected String doGet(Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("POST GET METHOD");
		return "newPost";
	}
	
	

	@RequestMapping(value= "/newPost",method = RequestMethod.POST)
	protected String doPost(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("POST SUBMIT");
		
		String category = request.getParameter("category");
		System.err.println("BEFORE PARSE " + category);
		System.err.println("BEFORE PARSE " + request.getParameter("title"));
		System.err.println("BEFORE PARSE " + request.getParameter("location"));
		int category_id = Integer.valueOf(category);
		
		String title = request.getParameter("title");
		System.err.println("BEFORE PARSE " + title);
		System.err.println(request.getParameter("title"));
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		

		Post post = new Post(title, description, LocalDate.now(),  LocalDate.now(), 2, category_id,location);
	//	long time=0;
		int result = 0;
		try {
			result = PostDAO.getInstance().createPost(post);
		} catch (UserException e) {
			e.printStackTrace();
			System.out.println("Tyka Grymna");
			return "newPost";
		}
		System.out.println("result");
		
		
		//req.getRequestDispatcher("").forward(req, resp);
		return "home";

	}


}
