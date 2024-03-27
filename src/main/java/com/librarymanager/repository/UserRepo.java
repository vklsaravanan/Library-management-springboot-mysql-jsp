package com.librarymanager.repository;

import java.util.List;
import java.util.Optional;

import com.librarymanager.models.Book;
import com.librarymanager.models.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepo extends JpaRepository<User, Long> {

//	@Query(value = "select * from users where username = ?1", nativeQuery = true)
	Optional<User> findByUsername(String username);

	@Query(value = "select * from users where student_id = ?1", nativeQuery = true)
	List<User> findByStudent_id(String student_id);

	@Query("SELECT COUNT(u) > 0 FROM User u WHERE u.username = ?1 AND u.id != ?2")
	boolean existsByUsernameExcludingId(String username, Long id);

	@Query("SELECT COUNT(u) > 0 FROM User u WHERE u.student_id = ?1 AND u.id != ?2")
	boolean existsByStudentIdExcludingId(String student_id, Long id);

	@Query("FROM User b WHERE LOWER(b.student_id) LIKE %:keyword%")
    Page<User> findByStudentIdContainingIgnoreCase(String keyword, Pageable pageable);
	
}
