package org.jaeu.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jaeu.domain.BoardDTO;
import org.jaeu.domain.CriteriaVO;
import org.jaeu.domain.PageVO;
import org.jaeu.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardMemberController {
	private BoardService service;
	
	@GetMapping("/list")
	public ModelAndView manage() {
		ModelAndView mav = new ModelAndView("board/list");
		return mav;
	}

	@GetMapping(value = "/register")
	public ModelAndView viewcreate(Principal principal) {
		ModelAndView mav = new ModelAndView("board/register");
		mav.addObject("username", principal.getName());
		return mav;
	}

	@GetMapping(value = "/list/pages/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page) {
		Map<String, Object> response = new HashMap<>();
		Map<String, Object> response1 = new HashMap<>();
		Map<String, Object> response2 = new HashMap<>();

		int total = service.getTotal();
		CriteriaVO cri = new CriteriaVO(page, 10);
		List<BoardDTO> getWithPage = service.getWithPaging(cri);

		PageVO pageVO = new PageVO(cri, total);

		response1.put("data", getWithPage);
		response2.put("pageDTO", pageVO);
		response2.put("total", total);

		response.put("TableData", response1);
		response.put("ListData", response2);
		log.info(cri);

		log.info(cri.getPageNum());
		log.info(service.getWithPaging(cri));

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@DeleteMapping(value = "/list")
	public void alldel(BoardDTO board) {
		log.info("All Remove Board Object");
		service.allremove(board);
	}

	@PostMapping(value = "/register", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void create(@RequestBody BoardDTO board) {
		log.info("Send Register : " + board);
		log.info(board);
		service.increase();
		service.register(board);
	}

}
