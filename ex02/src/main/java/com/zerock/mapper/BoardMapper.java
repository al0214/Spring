package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.BoardVO;

public interface BoardMapper {
	
//	@Select("select * from BOARD")
	public List<BoardVO> getList();
	
	public void insert(BoardVO boardVO);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
