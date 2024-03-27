package com.librarymanager.services;

import com.librarymanager.models.Book;
import com.librarymanager.models.BookUserHistory;
import com.librarymanager.models.User;
import com.librarymanager.repository.BookRepo;
import com.librarymanager.repository.BookUserHistoryRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;

@Service
public class BookUserHistoryService {
	@Autowired
	private BookUserHistoryRepo bookUserHistoryRepo;

	@Autowired
	private BookRepo bookRepo;

	public void saveNewHisotry(User user, Book book, Long days) {
		System.out.println(user);

		BookUserHistory bookUserHistory = new BookUserHistory();
		bookUserHistory.setUser_id(user);
		bookUserHistory.setBook_id(book);
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

		long dueDate = days * 24 * 60 * 60 * 1000;

		Timestamp futureTimestamp = new Timestamp(currentTimestamp.getTime() + dueDate);

		bookUserHistory.setBorrowed_at(currentTimestamp);
		bookUserHistory.setDue_at(futureTimestamp);
		bookUserHistory.setModified_at(currentTimestamp);
		bookUserHistory.setPaid(0);

		// Save the BookUserHistory instance
		bookUserHistoryRepo.save(bookUserHistory);
		//letting down book count
		book.setAvl_count( book.getAvl_count()-1);
		bookRepo.save(book);
	}

	public int getDaysDifference(Timestamp timestamp1, Timestamp timestamp2) {
		long millis1 = timestamp1.getTime();
		long millis2 = timestamp2.getTime();

		long millisDifference = (millis2 - millis1);

		long daysDifference = millisDifference / (1000 * 60 * 60 * 24);

		return (int) daysDifference;
	}
}
