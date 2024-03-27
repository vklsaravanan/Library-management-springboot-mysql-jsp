package com.librarymanager.config;

import java.util.Optional;

import com.librarymanager.models.User;
import com.librarymanager.repository.UserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Configuration
public class UserInfoDetailsService implements UserDetailsService{

	@Autowired
	UserRepo userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Optional<User> user = userRepo.findByUsername(username);
		return user.map(UserInfoDetails::new).orElseThrow(()->new UsernameNotFoundException("your user name is not found"));
	} 

}
