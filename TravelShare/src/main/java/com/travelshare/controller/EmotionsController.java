package com.travelshare.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travelshare.model.User;

@Controller
public class EmotionsController {

	@RequestMapping(value= "/ajax", method = RequestMethod.GET)
	protected String postsByCategoryFood(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		 String text = "some text";

		    response.setContentType("text/html");  // Set content type of the response so that jQuery knows what it can expect.
		    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		    try {
				response.getWriter().write(text);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}       // Write response body.
		return "mapTest";
	}
	
	
	
	
	
}
