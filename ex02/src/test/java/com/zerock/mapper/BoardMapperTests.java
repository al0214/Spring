package com.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList(){
		mapper.getList().forEach(board->log.info(board));
	}
	
// 여기까지는 실행 
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("title");
		board.setDetail("detail");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글 select key");
		board.setDetail("새로운 내용 select key");
	
		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	

	@Test
	public void testDelete() {
		
	
		log.info("DELETE COUNT: " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setDetail("수정된 내용");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
}
