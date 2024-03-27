package com.librarymanager.controllers;

import java.util.List;

import com.librarymanager.models.Book;
import com.librarymanager.models.User;
import com.librarymanager.repository.BookRepo;
import com.librarymanager.repository.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookUserHistoryController {
	@Autowired
	private UserRepo userRepo;

	@Autowired
	private BookRepo bookRepo;
	
	/*
	 *  show CREATE History page form
	 */
	@GetMapping("/new_book_borrow_form")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ModelAndView showForm() {
		ModelAndView mv =  new ModelAndView();
		List<User> users = userRepo.findAll();
		List<Book> books = bookRepo.findAll();
		mv.addObject("books", books);
		mv.addObject("users", users);
		mv.setViewName("library/newBorrowForm");
		return mv;
	}
}
