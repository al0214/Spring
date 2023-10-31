package org.jaeu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@RequestMapping("/main")
@Controller
@Log4j
public class mainController {
	// 로그인 페이지
	@GetMapping("/login")
	public ModelAndView customLogin(String error, String logout) {
		ModelAndView mav = new ModelAndView("board/login");
		log.info("error : " + error);
		log.info("logout : " + logout);

		if (error != null) {
			mav.addObject("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			mav.addObject("logout", "Logout!!");
		}
		return mav;
	}

	// 로그아웃 페이지
	@GetMapping("/logout")
	public ModelAndView logoutPage() {
		ModelAndView mav = new ModelAndView("board/logout");
		return mav;
	}

	// 접근 제한 페이지
	@GetMapping("/accessError")
	public ModelAndView accessError() {
		ModelAndView mav = new ModelAndView("/board/accessError");
		return mav;
	}
}
