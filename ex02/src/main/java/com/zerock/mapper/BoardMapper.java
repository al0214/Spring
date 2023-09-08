package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.BoardVO;

public interface BoardMapper {
	
//	@Select("select * from BOARD")
	public List<BoardVO> getList();

	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);

	public int update(BoardVO board);

	public String delete(long l);
	
	
}
