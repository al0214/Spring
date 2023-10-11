package org.jaeu.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("*")
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

	@PostMapping(value = "/detail/page")
	public ModelAndView detailpage() {
		ModelAndView mav = new ModelAndView("board/detail");

		return mav;
	}

	@GetMapping(value = "/detail/{bno}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ModelAndView detailView(@PathVariable Long bno) {

		ModelAndView mav = new ModelAndView("board/page");
		mav.addObject("bno", bno);
		log.info("Open Detail Page : " + bno + "번");

		return mav;

	}

	@GetMapping(value = "/detail/{bno}.json", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BoardVO> detail(@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(service.detail(bno), HttpStatus.OK);
	}

	@PostMapping(value = "/modify", produces = "application/text; charset=UTF-8")
	public ModelAndView modify() {
		ModelAndView mav = new ModelAndView("/board/modify");

		log.info("지나감");

		log.info(mav);
		return mav;
	}

	@PutMapping(value = "/modify/update")
	public void update(@RequestBody BoardVO board) {
		log.info("수정 : " + board);
		service.update(board);
	}

	@DeleteMapping(value = "/modify/delete/{bno}")
	public void delete(@PathVariable Long bno) {
		log.info("삭제 : " + bno);
		service.remove(bno);
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String string = sdf.format(date);

		return string.replace("-", File.separator);
	}

	@PostMapping(value = "/upload")
	public void uploadFormPost(MultipartFile[] uploadFile) {
		String uploadFolder = "D://UpLoadFile/main";

		File uploadPath = new File(uploadFolder, getFolder());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		log.info("지나감");
		log.info(uploadFile);
		for (MultipartFile multipartFile : uploadFile) {
			log.info("지나감");
			log.info(multipartFile.getOriginalFilename());
			File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				log.error(e.getMessage());

			}
		}
	}
};
