package com.librarymanager.repository;

import com.librarymanager.models.Genre;

import org.springframework.data.jpa.repository.JpaRepository;

public interface GenreRepo extends JpaRepository<Genre, Integer>{

}
