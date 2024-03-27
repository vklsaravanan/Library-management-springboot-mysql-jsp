package com.librarymanager.services;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
	 public Boolean isCurrentUserRoleis(String role) {
		 
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        
	        boolean isAdmin = authentication != null && authentication.getAuthorities().stream()
	                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals(role));

	        if (isAdmin) {
	            return true;
	        } else {
	            return false;
	        }
	    }
}
