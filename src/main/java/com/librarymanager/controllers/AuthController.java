package com.librarymanager.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

	@RequestMapping(value = "/lsdogin")
	public String login() {
		return "home";
	}
}
