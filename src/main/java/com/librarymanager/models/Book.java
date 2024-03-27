package com.librarymanager.models;

import com.librarymanager.models.Genre;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "Books")
@ToString
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private String author;
	@Column(unique = true)
	private String isbn;
	private int year;

	@ManyToOne
	@JoinColumn(name = "genre_id")
	private Genre genre_id;
	private int avl_count;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Genre getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(Genre genre_id) {
		this.genre_id = genre_id;
	}

	public int getAvl_count() {
		return avl_count;
	}

	public void setAvl_count(int avl_count) {
		this.avl_count = avl_count;
	}

}
