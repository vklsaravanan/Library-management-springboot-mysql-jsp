package com.librarymanager.models;

import java.sql.Date;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class BookUserHistory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "book_id", nullable = false)
	private Book book_id;
	
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user_id;
	
	@Column(nullable = false)
	private Timestamp borrowed_at;
	
	@Column(nullable = false)
	private Timestamp due_at;
	
	private Timestamp returned_at;
	
	@Column(nullable = false)
	private Timestamp modified_at;
	
	@Column(nullable = true)
	private int paid;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Book getBook_id() {
		return book_id;
	}

	public void setBook_id(Book book_id) {
		this.book_id = book_id;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public Timestamp getBorrowed_at() {
		return borrowed_at;
	}

	public void setBorrowed_at(Timestamp borrowed_at) {
		this.borrowed_at = borrowed_at;
	}

	public Timestamp getDue_at() {
		return due_at;
	}

	public void setDue_at(Timestamp due_at) {
		this.due_at = due_at;
	}

	public Timestamp getReturned_at() {
		return returned_at;
	}

	public void setReturned_at(Timestamp returned_at) {
		this.returned_at = returned_at;
	}

	public Timestamp getModified_at() {
		return modified_at;
	}

	public void setModified_at(Timestamp modified_at) {
		this.modified_at = modified_at;
	}

	public int getPaid() {
		return paid;
	}

	public void setPaid(int paid) {
		this.paid = paid;
	}
}
