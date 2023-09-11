package com.jaeu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaeu.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // Controller라고 선언
@RequestMapping("/board/*") //매핑을 localhost:8060/board/*로 모음
@AllArgsConstructor
@Log4j
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list") // Get 메서드로  localhost:8060/board/list로 매핑
	public void list(Model model) {
		
		log.info("list......");
		
		model.addAttribute("list", service.getList());
	}
}

// Service를 어떤 URL로 메핑 할건지 결정하는 부분
