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

	// 리스트 페이지
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		int total = service.getTotal();

		log.info("C : list Page");
		model.addAttribute("list", service.getWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("bno") Long bno, Model model) {
		// 조회 / 수정 페이지 테스트
		log.info("C : Detail or Modify Page");
		model.addAttribute("board", service.detail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("controller " + board);
		
		service.update(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}

	@GetMapping("/register")
	public void GetRegister() {
		// 페이지를 보여줄때 사용
		log.info("C : Open Register");
	}
	
	@PostMapping("/register")
	public String PostRegister(BoardVO borad, RedirectAttributes rttr) {

		log.info("C : Register -> " + borad);

		service.register(borad);

		// addFlashAttribute는 일회성으로 데이터를 넘길때 사용한다 ex) list?pageNum=5&amount=10
		rttr.addFlashAttribute("result", borad.getBno());

		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String PostRemove(BoardVO board, RedirectAttributes rttr) {
		
		log.info("C : Remove -> " + board);
		
		service.remove(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
}
