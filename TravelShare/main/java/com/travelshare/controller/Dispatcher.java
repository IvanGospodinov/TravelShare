package com.travelshare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.travelshare.model.User;


@Controller
@RequestMapping(value="/index")
public class Dispatcher {

	@RequestMapping()
	public String sayHello(Model model,  HttpSession session) {
 		if(session.getAttribute("userID") == null) {
 			User user = new User();
 			model.addAttribute(user);
			return "redirect:login";
		}
		return "index";
	}

}
