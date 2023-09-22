package org.jaeu.controller;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;
import org.jaeu.domain.PageDTO;
import org.jaeu.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	@GetMapping(value = "/list/{pageNum}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public List<BoardVO> list(@PathVariable("pageNum") int pageNum){
		
		Criteria cri = new Criteria(pageNum, 10);
		
		
		return service.getWithPaging(cri);
		
		
		
	}
}

//@GetMapping("/list")
//public void list(Criteria cri, Model model) {
//
//	log.info("list: " + cri);
//	model.addAttribute("list", service.getList(cri));
//	// model.addAttribute("pageMaker", new PageDTO(cri, 123));
//
//	int total = service.getTotal(cri);
//
//	log.info("total: " + total);
//
//	model.addAttribute("pageMaker", new PageDTO(cri, total));
//
//}