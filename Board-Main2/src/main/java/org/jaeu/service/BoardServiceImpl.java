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
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getWithPaging(Criteria cri){
		// 리스트 페이지
		return mapper.getWithPaging(cri);
	}
	
	@Override
	public BoardVO detail(Long bno) {
		// 조회 및 수정 페이지
		return mapper.detail(bno);
	}
	
	@Override
	public int register(BoardVO board) {
		// 등록 페이지
		return mapper.insertSelectKey(board);
		
	}
	
	@Override
	public boolean update(BoardVO board) {
		// 수정 구현
		return mapper.update(board) == 1;
	}
	
	
	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}

	@Override
	public boolean remove(Long bno) {
		
		return mapper.remove(bno) == 1;
		
	}

	@Override
	public int allremove(BoardVO board) {
		
		return mapper.allremove(board);
		
	}
	
}
