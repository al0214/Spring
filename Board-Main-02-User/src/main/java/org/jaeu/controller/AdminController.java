package org.jaeu.controller;

import java.security.Principal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin")
@RestController
@Log4j
@AllArgsConstructor
public class AdminController {

	// 어드민 페이지
	@GetMapping("/page")
	public ModelAndView adminPage(Principal principal) {
		ModelAndView mav = new ModelAndView("board/admin");
		mav.addObject("username", principal.getName());
		return mav;
	}
}