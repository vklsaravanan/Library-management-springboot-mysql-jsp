package com.librarymanager.services;

import com.librarymanager.models.User;
import com.librarymanager.repository.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class UsersService {

	@Autowired
	private UserRepo userRepo;
	
 
    public User getLoggedInUserDetails() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getName());
        if (auth != null) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            String username = userDetails.getUsername();
            User user = userRepo.findByUsername(username).get();
            if(user != null) {
            	return user;
            }
        }
        return null;
    }
}
