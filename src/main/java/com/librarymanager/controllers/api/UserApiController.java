package com.librarymanager.controllers.api;

import java.beans.Encoder;

import com.librarymanager.models.Book;
import com.librarymanager.models.User;
import com.librarymanager.repository.UserRepo;
import com.librarymanager.services.UsersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserApiController {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private UsersService userService;

	/*
	 * user CREATE API
	 */
	@PostMapping("/users")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ResponseEntity<Object> saveUser(User user) {
		System.out.println(user);
		if (userRepo.findByUsername(user.getUsername()).isPresent()) {
			System.err.println("working"); // for debug
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Username taken by someone ");
		}
		if (!userRepo.findByStudent_id(user.getStudent_id()).isEmpty()) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Dublicate Student id");
		}
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		try {
			User result = userRepo.save(user);
			if (result.getId() > 0) {
				return ResponseEntity.status(HttpStatus.CREATED).body(user);
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error not found");
	}

	/*
	 * UPDATE user API
	 */
	@PatchMapping("/user/{id}")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ResponseEntity<Object> updateUser(@PathVariable Long id, User user) {

		if (!userRepo.existsById(id)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("user not found");
		}
		if (userRepo.existsByStudentIdExcludingId(user.getStudent_id(), id)
				|| userRepo.existsByUsernameExcludingId(user.getUsername(), id)) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("Username or Student id already taken by someone");
		}

		try {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			userRepo.save(user);
			return ResponseEntity.ok("user update successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating user " + e.getMessage());
		}
	}

	/*
	 * DELETE user API
	 */
	@DeleteMapping("/user/{id}")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public ResponseEntity<Object> deleteUser(@PathVariable Long id) {

		if (!userRepo.existsById(id)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
		}

		try {
			userRepo.deleteById(id);
			return ResponseEntity.ok("user deleted successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deleting book: " + e.getMessage());
		}
	}

	/*
	 * UPDATE user settings API
	 */
	@PatchMapping("/updateUserSettings")
	@PreAuthorize("hasAuthority('ROLE_ADMIN') or hasAuthority('ROLE_USER')")
	public ResponseEntity<Object> updateUserSetting(@RequestParam String oldpassword, @RequestParam String password) {
		User user = userService.getLoggedInUserDetails();
		try {
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("your data is not able to detect in server, Contact your library Admin");
						
			} else {
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				boolean isPasswordMatch = passwordEncoder.matches(oldpassword, user.getPassword());
				
				if(isPasswordMatch) {
					user.setPassword( passwordEncoder.encode(password));
					userRepo.save(user);
					return ResponseEntity.ok("Your password is updated Successfully");					
				}else {
					return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("Your old password is wrong");
				}
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Settings can't be update, due to server issue, Contact your Library ADMIN");
		}
	}
}
