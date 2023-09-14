package com.jaeu.controller;

import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;
import com.jaeu.domain.PageDTO;
import com.jaeu.service.BoardService;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.xml.soap.Detail;

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
	public void Detail(@RequestParam("bno") Long bno, Model model) {
		
		log.info("detail......");
		
		model.addAttribute("board", service.detail(bno));
	}
	
	@GetMapping("/register")
	public void GetRegister() {
		
	}
	
	@PostMapping("/register")
	public String PostRegister(BoardVO board, RedirectAttributes rttr) {
		
		log.info("PostRegister.........");
		service.register(board);
		
		
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/modify")
	public void modify() {
		// 상세 페이지 테스트
		log.info("modify........");
	}
	
}
