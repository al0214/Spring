package org.jaeu.controller;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;
import org.jaeu.domain.PageDTO;
import org.jaeu.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		int total = service.getTotal();
		
		log.info("log.......");
		model.addAttribute("list", service.getWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("bno") Long bno, Model model) {
		// 조회 페이지 테스트
		log.info("detail........");
		model.addAttribute("board", service.detail(bno));
	}
	
	@GetMapping("/modify")
	public void modify() {
		// 상세 페이지 테스트
		log.info("modify........");
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
