package org.jaeu.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
	public String encode(CharSequence rawPassword) {
		log.warn("before encode : "+ rawPassword);
		
		return rawPassword.toString();
	}
	
	public boolean matches(CharSequence rowPassword, String encodedPassword) {
		log.warn("matches: " + rowPassword + " : " + encodedPassword);
		return rowPassword.toString().equals(encodedPassword);
	}
}
