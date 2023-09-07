package com.jaeu.controller;


import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;
import com.jaeu.domain.PageDTO;
import com.jaeu.service.BoardService;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("log.......");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 200));
	}
	
	@GetMapping("/register")
	public void RegisterableService() {
		// 페이지를 보여줄때 사용
	}
	
	@PostMapping("/register")
	public String register(BoardVO borad, RedirectAttributes rttr) {
		
		log.info("register : " + borad);
		
		service.register(borad);
		
		// addFlashAttribute는 일회성으로 데이터를 넘길때 사용한다 ex) list?pageNum=5&amount=10
		rttr.addFlashAttribute("result", borad.getBno());
		
		return "redirect:/board/list";
	}
}
