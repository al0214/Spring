package org.jaeu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;
import org.jaeu.domain.PageDTO;
import org.jaeu.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@RestController
@Log4j
@AllArgsConstructor
public class BoardRestController {
	private BoardService service;

	@RequestMapping("/list")
	public ModelAndView manage() {
		ModelAndView mav = new ModelAndView("board/list");
		return mav;
	}
	
	@GetMapping(value = "/register")
	public ModelAndView viewcreate() {
		ModelAndView mav = new ModelAndView("board/register");
		return mav;
	}
	

	@GetMapping(value = "/list/pages/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page) {
		Map<String, Object> response1 = new HashMap<>();
		Map<String, Object> response2 = new HashMap<>();
		Map<String, Object> response = new HashMap<>();

		int total = service.getTotal();
		Criteria cri = new Criteria(page, 10);
		List<BoardVO> getWithPage = service.getWithPaging(cri);
		PageDTO pageDTO = new PageDTO(cri, total);

		response1.put("data", getWithPage);

		response2.put("pageDTO", pageDTO);
		response2.put("total", total);

		response.put("TableData", response1);
		response.put("ListData", response2);
		log.info(cri);

		log.info(cri.getPageNum());
		log.info(service.getWithPaging(cri));

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@DeleteMapping(value = "/list")
	public void alldel(BoardVO board) {
		log.info("All Remove Board Object");
		service.allremove(board);
	}

	@PostMapping(value = "/register", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void create(@RequestBody BoardVO board) {
		log.info("Send Register : " + board);
		log.info(board);
		service.register(board);
	}
	
	
	@GetMapping(value = "/list/{bno}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BoardVO> detail(@PathVariable Long bno) {
		
		log.info("Open Detail Page : " + bno+"번");
		
		return new ResponseEntity<>(service.detail(bno), HttpStatus.OK);
	
	}
	
	

}
