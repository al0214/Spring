package com.jaeu.service;

import java.util.List;

import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;

public interface BoardService {
	
	public BoardVO detail(Long bno);

	public List<BoardVO> getWithPaging(Criteria cri);
	

	public int getTotal();

	public void register(BoardVO board);
}
