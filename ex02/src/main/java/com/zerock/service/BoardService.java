package com.zerock.service;

import java.util.List;

import com.zerock.domain.BoardVO;

public interface BoardService {	
	public List<BoardVO> getList();

	public Object get(long l);

	public String remove(long l);

	public String modify(BoardVO board);

}
