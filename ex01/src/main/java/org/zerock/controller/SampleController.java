package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

// 자동으로 빈 객체에 등록
// 그 이유는 servlet-context.xml에 <context:component-scan base-package="org.zerock.controller" /> 태그가 존재하기 때문

@Controller
@RequestMapping("/sample/*") // 모든 메서드들의 기본적인 URL 경로 지정
@Log4j
public class SampleController {
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	
	// http://localhost:8060/sample/
	@RequestMapping("")
	public void basic(){
		
		log.info("basic.......................................");
	}
	
	// http://localhost:8060/sample/basicOnlyGet
	@GetMapping("/basicOnlyGet")
	public void basicGet2(){
		
		log.info("basic get only get..........................");
	}
	
	// http://localhost:8060/sample/ex01?name=AAA&age=10
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto){
		
		log.info("" + dto);
		
		return "ex01";
		
	}
	
	// http://localhost:8060/sample/ex02?name=AAA&age=10
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age){
		log.info("name: " + name);
		log.info("age: " + age);
		
		return "ex02";
	}
	
	// http://localhost:8060/sample/ex02List?ids=111&ids=222&ids=333
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids){
		
		log.info("ids: " + ids);
		
		return "ex02List";
	}
	
	// http://localhost:8060/sample/ex02Array?ids=111&ids=222&ids=333
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids){
		
		log.info("array ids: " + Arrays.toString(ids));
		
		return "ex02Array";
	}
	
	// %5B = [ 
	// %5D = ]
	// http://localhost:8060/sample/ex02Bean?list%5B0%5D.name=aaa&list%5B2%5D.name=bbb
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list){
		
		log.info("list dtos: " + list);
		
		return "ex02Bean";
	}
	
	// http://localhost:8060/sample/ex03?title=test&dueDate=2018-01-01
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo){
		
		log.info("todo: " + todo);
		return "ex03";
	}
	
	
	// http://localhost:8060/sample/ex04?name=aaa&age=11&page=1
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page){
		
		log.info("dto: " + dto);
		log.info("page: " + page);
		
		return "/sample/ex04";
	}
	
	// http://localhost:8060/sample/ex05
	// void 타입 : JSP 이름과 /ex05와 같을때 사용
	// 에러가 나는 이유는 servlet-context.xml의 설정과 같이 맞물려 처리해서 생기는 결과이다
	@GetMapping("/ex05")
	public void ex05() {
		log.info("/ex05.........................");
	}
	
	// http://localhost:8060/sample/ex06
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		
		log.info("/ex06...............");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		return dto;
	}
	
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		
		log.info("/ex07...........................");
		
		// {"name": "홍길동"}
		String msg = "{\"nmae\": \"홍길동\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg,header, HttpStatus.OK);
	}
	
	@GetMapping("/exUpload")
	public void exUpload() {
		
		log.info("/exUpload..........................");
	}
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files){
		
		files.forEach(file -> {
			log.info("------------------------");
			log.info("name: " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
			
		});
	}
	
}
