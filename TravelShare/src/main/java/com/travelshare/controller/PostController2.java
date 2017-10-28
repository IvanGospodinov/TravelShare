
package com.travelshare.controller;

import java.io.IOException;
import java.time.LocalDate;

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
		
		String category = request.getParameter("category");
		int category_id=Integer.parseInt(category);
		
		String title = request.getParameter("title");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		

		Post post = new Post(title, description, LocalDate.now(),  LocalDate.now(), 2,category_id,location);
	//	long time=0;
		int result =0;
		try {
			result = PostDAO.getInstance().createPost(post);
		} catch (com.travelshare.model.UserException e) {
			System.out.println("Tyka Grymna");
		}
		System.out.println("result");
		
		
		//req.getRequestDispatcher("").forward(req, resp);
		return "index";





		//doGet(request, response);






	}


}
