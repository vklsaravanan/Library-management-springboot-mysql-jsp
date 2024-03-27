package com.librarymanager.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import com.librarymanager.models.Book;
import com.librarymanager.models.BookUserHistory;
import com.librarymanager.models.User;
import com.librarymanager.repository.BookRepo;
import com.librarymanager.repository.BookUserHistoryRepo;
import com.librarymanager.repository.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private BookUserHistoryRepo bookUserHistoryRepo;

	@Autowired
	private BookRepo bookRepo;

	/*
	 * Admin DashBoard
	 */
	@GetMapping("/{username}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ModelAndView dashboard(@PathVariable String username, Principal principal) {
		// Check if the requested username matches the authenticated user's username
		if (!username.equals(principal.getName())) {
			// Redirect to the authenticated user's dashboard
			return new ModelAndView("redirect:/admin/" + principal.getName());
		}

		ModelAndView mv = new ModelAndView();
		Optional<User> user = userRepo.findByUsername(username);
		if (user.isPresent()) {
			User u = user.get();
			// Hide sensitive information like password
			u.setPassword("*********");
			mv.addObject("user", u);
			mv.setViewName("admin/adminDashboard");
		} else {
			// Handle case where user is not found
			mv.setViewName("index");
		}
		return mv;
	}

	/*
	 * admin settings
	 */
	@GetMapping("/settings")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ModelAndView showSettings(Principal principal) {
		Optional<User> user = userRepo.findByUsername(principal.getName());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminSettings");
		mv.addObject("user", user.get());
		return mv;
	}

	/*
	 * admin settings
	 */
	@GetMapping("/user/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ModelAndView showUserDetails(@PathVariable Long id, Principal principal) {
		Optional<User> user = userRepo.findById(id);
		List<BookUserHistory> userHistory = bookUserHistoryRepo.getAllHistoryByUserId(user.get());
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user.get());
		mv.addObject("userHistory", userHistory);
		mv.setViewName("userDetails");
		return mv;
	}

//	/*
//	 * new borrowing form
//	 */
//	@GetMapping("/borrowbook")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
//	public ModelAndView showBookBorrowForm() {
//
//		List<User> users = userRepo.findAll();
//		List<Book> books = bookRepo.findAll();
//
//		ModelAndView mv = new ModelAndView();
//
//		mv.addObject("users", users);
//		mv.addObject("books", books);
//		mv.setViewName("newBookUserHistoryAdder");
//		return mv;
//	}


}
