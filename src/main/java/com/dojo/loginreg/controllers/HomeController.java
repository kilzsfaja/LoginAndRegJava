package com.dojo.loginreg.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dojo.loginreg.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	private final UserService userService;
	public HomeController(UserService userService) {
		this.userService = userService;
		
	}
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		if(session.getAttribute("user_id")== null) {
			return "redirect:/users/login/register";
		}
		model.addAttribute("loggedInUser", userService.getUser((Long)session.getAttribute("user_id")));
		return "main/index.jsp";
	}

}
