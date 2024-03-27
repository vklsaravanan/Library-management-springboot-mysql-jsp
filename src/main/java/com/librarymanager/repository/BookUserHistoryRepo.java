package com.librarymanager.repository;

import java.util.List;

import com.librarymanager.models.Book;
import com.librarymanager.models.BookUserHistory;
import com.librarymanager.models.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface BookUserHistoryRepo extends JpaRepository<BookUserHistory, Long>{
	
	@Query("FROM BookUserHistory b where book_id = ?1 order by modified_at desc")
	public List<BookUserHistory> getAllHistoryByBookId(Book book_id);
	
	@Query("FROM BookUserHistory b where user_id = ?1 order by modified_at desc")
	public List<BookUserHistory> getAllHistoryByUserId(User user_id);
	
	@Query("FROM BookUserHistory b WHERE b.user_id = ?1 AND b.returned_at IS NULL")
	public List<BookUserHistory> getAllHistoryBookTakenByUser(User user_id);
	
	//create new history for book borrow
	

//	@Query("FROM Book b WHERE LOWER(b.title) LIKE %:keyword%")
//    Page<Book> findByStudentIdContainingIgnoreCase(String keyword, Pageable pageable);
}
