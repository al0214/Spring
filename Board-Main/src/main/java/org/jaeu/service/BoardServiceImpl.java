package org.jaeu.service;


import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;
import org.jaeu.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getWithPaging(Criteria cri){
		
		return mapper.getWithPaging(cri);
	}

	@Override
	public void register(BoardVO board) {
		
		log.info("register..................");
		
		mapper.insertSelectKey(board);
		
	}
	
	@Override
	public BoardVO detail(Long bno) {
		
		return mapper.detail(bno);
	}
	
	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}
	
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify "+ board);
		
		return mapper.update(board) == 1;
	}
	
}
