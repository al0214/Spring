package org.jaeu.controller;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;
import org.jaeu.domain.PageDTO;
import org.jaeu.service.BoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/board/*")
@RestController
@Log4j
@AllArgsConstructor
public class BoardRestController {
	private BoardService service;
	
	@GetMapping(value = "/pages/{page}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<BoardVO>> getList(@PathVariable("page") int page){
		
		int total = service.getTotal();
		
		Criteria cri = new Criteria(page, total);
		new PageDTO(cri, total);
		
		log.info(cri);
		
		log.info(cri.getPageNum());
		log.info(service.getWithPaging(cri));
		return new  ResponseEntity<>(service.getWithPaging(cri), HttpStatus.OK);
		
	}
	
	@GetMapping(value="/pages/total", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public int total() {
		
		return service.getTotal();
	}
	

}
