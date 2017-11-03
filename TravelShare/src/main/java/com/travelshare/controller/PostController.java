
package com.travelshare.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.Random;

import javax.mail.Session;
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


@Controller
public class PostController {

	final String POST_URL = "/Users/Ivan/Desktop/images/POSTS/";

	@RequestMapping(value= "/newPost", method = RequestMethod.GET)
	protected String newPost(HttpSession session,Model model, HttpServletRequest request, HttpServletResponse response) {
		//if(session.getAttribute("user") != null) {
			System.err.println("POST GET METHOD");
			return "newPost";
		/*} else {
			session.setAttribute("errorRegister", "Your session is inactive, please login!");
			return "login";
		}*/
	}



		@RequestMapping(value= "/newPost",method = RequestMethod.POST)
		protected String addPost(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("picture") MultipartFile multiPartFile) throws ServletException, IOException {
			//if(session.getAttribute("userID") == null) {
				int random = new Random().nextInt(100)*13;
				File file = new File(POST_URL + session.getAttribute("userID") + "/" + session.getAttribute("userID") + random +
						"-post-pic."+ multiPartFile.getContentType().split("/")[1]);
				String urlDB = POST_URL + session.getAttribute("userID") + "/" + session.getAttribute("userID") + random + 
						"-post-pic." + multiPartFile.getContentType().split("/")[1];
				try {
					Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
				model.addAttribute("profilePic", file.getAbsolutePath());


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
					result = PostDAO.getInstance().createPost(post, urlDB);
				} catch (UserException e) {
					e.printStackTrace();
					System.err.println("Tyka Grymna");
					session.setAttribute("postErr", "We are sorry but there was an issue uploading the post. Can you try again!");
					return "newPost";
				}
				System.err.println(result);
				return "home";
//			}
//			session.setAttribute("errorRegister", "Your session is inactive, please login!");
//			return "login";
		}

		@RequestMapping(value= "/postsByCategoryNature", method = RequestMethod.GET)
		protected String postsByCategoryNature(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			if(session.getAttribute("user") == null) {
				return "login";
			}
			session.setAttribute("category", "Nature");
			return "postsByCategoryNature";
		}
		@RequestMapping(value= "/postsByCategoryAnimals", method = RequestMethod.GET)
		protected String postsByCategoryAnimals(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			if(session.getAttribute("user") == null) {
				return "login";
			}
			session.setAttribute("category", "Animals");
			return "postsByCategoryAnimals";
		}
		@RequestMapping(value= "/postsByCategoryFood", method = RequestMethod.GET)
		protected String postsByCategoryFood(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			if(session.getAttribute("user") == null) {
				return "login";
			}
			session.setAttribute("category", "Food");
			return "postsByCategoryFood";
		}
		@RequestMapping(value= "/postsByCategoryPeople", method = RequestMethod.GET)
		protected String postsByCategoryPeople(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			if(session.getAttribute("user") == null) {
				return "login";
			}
			session.setAttribute("category", "People");
			return "postsByCategoryPeople";
		}
		
		@RequestMapping(value= "/myPosts", method = RequestMethod.GET)
		protected String myPosts(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			if(session.getAttribute("user") == null) {
				return "login";
			}
			session.setAttribute("userID", request.getSession().getAttribute("userID"));
			System.err.println("MY POSTS GET! USER ID - " + session.getAttribute("userID"));

			return "myPosts";
		}
		

	}
