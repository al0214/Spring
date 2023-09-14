package com.jaeu.mapper;

import java.util.List;

import com.jaeu.domain.BoardVO;
import com.jaeu.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getWithPaging(Criteria cri);
	public void insertSelectKey(BoardVO board);
	public int getTotal();
	public BoardVO detail(Long bno);
}
