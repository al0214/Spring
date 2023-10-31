package org.jaeu.controller;

import org.jaeu.domain.BoardDTO;
import org.jaeu.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	private BoardService service;
	
	// 게시판 데이터 전부 지우기
	@DeleteMapping(value = "/list")
	public void alldel(BoardDTO board) {
		log.info("All Remove Board Object");
		service.allremove(board);
	}
}
