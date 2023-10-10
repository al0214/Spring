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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("*")
@RestController
@Log4j
@AllArgsConstructor
public class BoardRestController {
	private BoardService service;

	// 메인 페이지 호출
	@GetMapping("/board")
	public ModelAndView manage() {
		ModelAndView mav = new ModelAndView("board/mainPage/MainPage");
		return mav;
	}

	// 리스트 페이지 호출
	@PostMapping(value = "/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("board/jsp/ListPage");

		return mav;
	}

	// 등록 페이지 호출
	@PostMapping(value = "/register/page")
	public ModelAndView viewcreate() {
		ModelAndView mav = new ModelAndView("board/jsp/RegisterPage");
		
		return mav;
	}

	// 상세 및 수정 삭제 페이지 호출
	@PostMapping(value = "/detail/page")
	public ModelAndView detailpage() {
		ModelAndView mav = new ModelAndView("board/jsp/DetailModifyPage");
		
		return mav;
	}

	// 페이징 기능
	@GetMapping(value = "/list/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
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
	
	// 기능
	
	// 데이터 전부 삭제
	@DeleteMapping(value = "/remove/all")
	public void alldel(BoardVO board) {
		log.info("All Remove Board Object");
		service.allremove(board);
	}

	// 상세 페이지 데이터
	@GetMapping(value = "/detail/{bno}.json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BoardVO> detail(@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(service.detail(bno), HttpStatus.OK);
	}

	// 등록 기능
	@PostMapping(value = "/register", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void create(@RequestBody BoardVO board) {
		log.info("Send Register : " + board);
		log.info(board);
		service.register(board);
	}

	// 수정 기능
	@PutMapping(value = "/modify/update")
	public void update(@RequestBody BoardVO board) {
		log.info("수정 : " + board);
		service.update(board);
	}

	// 삭제 기능
	@DeleteMapping(value = "/remove/{bno}")
	public void delete(@PathVariable Long bno) {
		log.info("삭제 : " + bno);
		service.remove(bno);
	}

}
