package com.jaeu.service;


import java.util.List;

import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;
import com.jaeu.mapper.BoardMapper;
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
	public int getTotal() {
		
		return mapper.getTotal();
	}

	@Override
	public BoardVO detail(Long bno) {

		return mapper.detail(bno);
	}


	@Override
	public void register(BoardVO board) {
		
		mapper.insertSelectKey(board);
		
	}
	
}
