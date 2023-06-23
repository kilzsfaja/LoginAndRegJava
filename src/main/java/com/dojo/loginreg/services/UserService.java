package com.dojo.loginreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.dojo.loginreg.models.LoginUser;
import com.dojo.loginreg.models.User;
import com.dojo.loginreg.repositories.UserRepository;

@Service
public class UserService {
	
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public User createUser(User registerUser) {
		String hashed = BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt());
		registerUser.setPassword(hashed);
		return userRepository.save(registerUser);
	}
	
	public User getUser(String Email) {
		Optional<User> maybeUser = userRepository.findByEmail(Email);
		return maybeUser.isPresent() ? maybeUser.get() : null;
		
	}
	
	public User getUser(Long id) {
		Optional<User> maybeUser = userRepository.findById(id);
		return maybeUser.isPresent() ? maybeUser.get() : null;
		
	}
	
	public User login(LoginUser loginUser, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return null;
		}
		User existingUser = getUser(loginUser.getEmail());
		if(existingUser == null) {
			bindingResult.rejectValue("email", "unique", "Bad Credentials.");
			return null;
		}
		if(!BCrypt.checkpw(loginUser.getPassword(), existingUser.getPassword())) {
			bindingResult.rejectValue("email", "unique", "Bad Credentials.");
		}
		return existingUser;
	}
	
}
