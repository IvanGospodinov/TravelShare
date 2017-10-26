package com.travelshare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/index")
public class Dispatcher {

	@RequestMapping()
	public String sayHello(Model model,  HttpSession session) {
 		if(session.getAttribute("user") == null) {
 			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return "login";
		}
		return "index";
	}
	
}
