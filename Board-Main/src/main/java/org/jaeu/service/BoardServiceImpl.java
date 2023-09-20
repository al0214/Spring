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
	public void register(BoardVO board) {
		// 등록 페이지
		mapper.insertSelectKey(board);
		
	}
	
	@Override
	public void update(BoardVO board) {
		// 수정 구현
		mapper.update(board);
	}
	
	
	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}
	
}
