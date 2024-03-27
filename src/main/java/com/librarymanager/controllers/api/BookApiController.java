package com.librarymanager.controllers.api;

import java.util.Optional;

import com.librarymanager.models.Book;
import com.librarymanager.repository.BookRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookApiController {

	@Autowired
	private BookRepo bookRepo;

	/*
	 * CREATE new book API
	 */
	@PostMapping({ "/books", "/books/" })
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public String saveBook(Book book) {
		System.err.println("book storing ..,");
		try {
			Book new_book = bookRepo.save(book);
			return "redirect:/books/" + new_book.getId();
		} catch (Exception e) {
			return "// here if book is not saved mean redirect to book";
		}
	}
	
	/*
	 * DELETE book API
	 */
	@DeleteMapping("/book/{id}")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ResponseEntity<Object> deleteBook(@PathVariable Long id) {

		if (!bookRepo.existsById(id)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Book not found");
		}

		try {
			bookRepo.deleteById(id);
			return ResponseEntity.ok("Book deleted successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deleting book: " + e.getMessage());
		}
	}

	/*
	 * UPDATE book API
	 */
	@PatchMapping("/book/{id}")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ResponseEntity<Object> updateBook(@PathVariable Long id, Book book) {

		if (!bookRepo.existsById(id)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Book not found");
		}

		try {
			bookRepo.save(book);
			return ResponseEntity.ok("Book update successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating book " + e.getMessage());
		}
	}

}
