package com.librarymanager.controllers.api;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.librarymanager.models.Book;
import com.librarymanager.models.BookUserHistory;
import com.librarymanager.models.User;
import com.librarymanager.repository.BookRepo;
import com.librarymanager.repository.BookUserHistoryRepo;
import com.librarymanager.repository.UserRepo;
import com.librarymanager.services.BookUserHistoryService;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookUserHistoryApiController {

	@Autowired
	private BookRepo bookRepo;

	@Autowired
	private UserRepo userRepo;

	@Value("${library.user.bookTakenMaxCount}")
	private int maxBookBorrowCount;

	@Autowired
	private BookUserHistoryRepo bookUserHistoryRepo;

	@Autowired
	private BookUserHistoryService bookUserHistoryService;

	/*
	 * CREATE record if student take book
	 */
	@PostMapping("/bookUserHistory")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> bookHistoryForm(@RequestParam("studentSelect") Long studentId,
			@RequestParam("bookSelect") Long bookId, @RequestParam("numberInput") Long dueDays) {
		// check user is exist or not
		User user = userRepo.findById(studentId).get();

		// use have eligible to take this book
		// check user take books below maximum books count per user
		List<BookUserHistory> historys = bookUserHistoryRepo.getAllHistoryBookTakenByUser(user);
		if (historys.size() > maxBookBorrowCount) {
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("User taken maximum books");
		}
		// check is user already have requested book or not
		for (BookUserHistory bookUserHistory : historys) {
			if (bookUserHistory.getBook_id().getId() == bookId) {
				return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("User already have this book");
			}
		}
		// check is book is available to taken
		Book book = bookRepo.findById(bookId).get();
		if (!(book.getAvl_count() > 0)) {
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("Currently Book Not Available");
		}

		// check use given days is eligible or not
		if (!(dueDays > 0 && dueDays < 16)) {
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("Due date is must be 1 to 15 days");
		}
		// save new history
		bookUserHistoryService.saveNewHisotry(user, book, dueDays);

		return ResponseEntity.ok("book borrowed successfully");
	}

	/*
	 * UPDATE API Return book
	 */
	@PatchMapping("/userBookHistory")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<String> handleFormSubmission(@RequestParam Long historyId) {
		System.out.println(historyId);
		try {

			BookUserHistory bookUserHistory = bookUserHistoryRepo.findById(historyId).get();
			
			if(bookUserHistory.getReturned_at() != null) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
						.body("book was already Returned !");				
			}

			long currentTimeMillis = System.currentTimeMillis();
			Date currentDate = new Date(currentTimeMillis);
			Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
			
			int days = bookUserHistoryService.getDaysDifference(bookUserHistory.getBorrowed_at(),
					currentTimestamp);
			if (days > 0) {
				bookUserHistory.setPaid(days * -1);
			}
			// setting time for returned date

			bookUserHistory.setReturned_at(currentTimestamp);
			bookUserHistory.setModified_at(currentTimestamp);
			bookUserHistoryRepo.save(bookUserHistory);
			// increase book count
			Book book = bookUserHistory.getBook_id();
			book.setAvl_count(book.getAvl_count()+1);
			bookRepo.save(book);
			
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("book not Return due to server error !");
		}

		return ResponseEntity.ok("book Returned successfully");
	}
}
