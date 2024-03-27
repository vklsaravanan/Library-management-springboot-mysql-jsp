package com.librarymanager.controllers;

import java.util.List;
import java.util.Optional;

import com.librarymanager.models.Book;
import com.librarymanager.models.BookUserHistory;
import com.librarymanager.models.Genre;
import com.librarymanager.repository.BookRepo;
import com.librarymanager.repository.BookUserHistoryRepo;
import com.librarymanager.repository.GenreRepo;
import com.librarymanager.repository.UserRepo;
import com.librarymanager.services.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookController {
	@Autowired
	private BookRepo bookRepository;
	
	@Autowired
	private GenreRepo genreRepo;
	
	@Autowired
	private BookUserHistoryRepo bookUserHistoryRepo;
	
	@Autowired
	private RoleService roleService;
	
	public BookController(RoleService roleService) {
		this.roleService = roleService;
	}
	/*
	 *  Showing ALL BOOKS
	 */
	@GetMapping({ "/books", "/books/" })
	public String showBooks(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "") String keyword) {
		Page<Book> bookPage = bookRepository.findByTitleContainingIgnoreCase(keyword, PageRequest.of(page, 10));
//	        System.out.println(bookPage);
//	        for (Book book : bookPage) {
//				System.out.println(book.getGenre_id());
//			}
		
		model.addAttribute("books", bookPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", bookPage.getTotalPages());
		model.addAttribute("keyword", keyword);
		return "books";
	}
	
	/*
	 * show book CREATING form page
	 */
	@GetMapping("/book/addBook")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ModelAndView showAddBookForm() {
		ModelAndView mv = new ModelAndView();
		List<Genre> genre = genreRepo.findAll();
		mv.addObject("genres", genre);
		mv.setViewName("books/addBook");
		return mv;
	}
	
	/*
	 * Get book Details READ page
	 */
	@GetMapping("book/{id}")
	public ModelAndView showBookDetails(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView();
		Optional<Book> book = bookRepository.findById(id);
		if(book.isEmpty()) {
			mv.addObject("errorMessage", "Book Not Found");
			mv.setViewName("books");
			return mv;
		}
		mv.addObject("book", book.get());
		if (book.isPresent()) {
			if(roleService.isCurrentUserRoleis("ROLE_ADMIN")) {
				List<BookUserHistory> bookUserHistory = bookUserHistoryRepo.getAllHistoryByBookId(book.get());
				mv.addObject("bookUserHistory",bookUserHistory); 
			}
		}else {
			mv.setViewName("/books");
			return mv;
		}
		mv.setViewName("books/bookDetails");
		return mv;
	}

	/*
	 * return book UPDATING page
	 */
	@GetMapping({ "/books/update/{id}" })
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ModelAndView updateBook(@PathVariable Long id) {
		ModelAndView mv = new ModelAndView();
		System.err.println("updating book ..,");
		Optional<Book> book = bookRepository.findById(id);
		List<Genre> genre = genreRepo.findAll();
		
		if(book.isEmpty()) {
			mv.addObject("errorMessage", "Book Not Found");
			mv.setViewName("books");
			return mv;
		}
		
		mv.addObject("genres", genre);
		mv.addObject("book", book.get());
		mv.setViewName("books/updateBook");
		return mv;
	}



}
