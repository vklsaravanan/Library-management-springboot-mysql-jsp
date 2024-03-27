package com.librarymanager.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import com.librarymanager.models.Book;
import com.librarymanager.models.User;
import com.librarymanager.repository.UserRepo;
import com.librarymanager.services.RoleService;
import com.oracle.wls.shaded.org.apache.xalan.lib.Redirect;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/users")
public class UserController {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private RoleService roleService;

	public UserController(RoleService roleService) {
		this.roleService = roleService;
	}

	/*
	 * show user CREATE page
	 */
	@GetMapping(value = "/addUser")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String addUser() {
		return "users/addUser";
	}

	/*
	 * show ALL users
	 */
	@GetMapping
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String allUsers(Model model, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "") String keyword) {

		Page<User> userPage = userRepo.findByStudentIdContainingIgnoreCase(keyword, PageRequest.of(page, 10));

		List<User> user = userRepo.findAll();
		model.addAttribute("users", userPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", userPage.getTotalPages());
		model.addAttribute("keyword", keyword);
		return "users";
	}

	@GetMapping("/update/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public ModelAndView showUpdateUserForm(@PathVariable Long id) {
		Optional<User> user = userRepo.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/updateUser");
		mv.addObject("user", user.get());
		return mv;
	}

	/*
	 * User dashboard page
	 */
	@GetMapping("/{username}")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	public ModelAndView dashboard(@PathVariable String username, Principal principal) {
		// Check if the requested username matches the authenticated user's username
		boolean isAdmin = roleService.isCurrentUserRoleis("ROLE_ADMIN");
		if ((!username.equals(principal.getName())) && !isAdmin) {
			// Redirect to the authenticated user's dashboard
			return new ModelAndView("redirect:/users/" + principal.getName());
		}

		ModelAndView mv = new ModelAndView();
		Optional<User> user = userRepo.findByUsername(username);
		if (user.isPresent()) {
			User u = user.get();
			u.setPassword("*********");
			mv.addObject("user", u);
			mv.setViewName("users/userDashboard");
		} else {
			mv.setViewName("index");
		}
		return mv;
	}

	/*
	 * user settings
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/settings")
	public ModelAndView showSettings(Principal principal) {
		Optional<User> user = userRepo.findByUsername(principal.getName());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/userSettings");
		mv.addObject("user", user.get());
		return mv;
	}

	public User getLoggedInUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && auth.getPrincipal() instanceof User) {
			return (User) auth;
		}
		return null;
	}
}
