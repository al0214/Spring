package com.jaeu.service;

import java.util.List;

import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;

public interface BoardService {
	
//	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	public void register(BoardVO board);

}
