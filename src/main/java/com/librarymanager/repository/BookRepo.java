package com.librarymanager.repository;

import com.librarymanager.models.Book;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.security.access.prepost.PreAuthorize;

@RepositoryRestResource(collectionResourceRel = "books", path = "books")
public interface BookRepo extends JpaRepository<Book, Long>{
	
	@Query("FROM Book b WHERE LOWER(b.title) LIKE %:keyword%")
    Page<Book> findByTitleContainingIgnoreCase(String keyword, Pageable pageable);
	
	@Override
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    void deleteById(Long id);
}
