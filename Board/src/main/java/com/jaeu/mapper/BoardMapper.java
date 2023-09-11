package com.jaeu.mapper;

import java.util.List;

import com.jaeu.domain.BoardVO;

public interface BoardMapper {
	
//	@Select("select * from boardExam")
	public List<BoardVO> getList();
	
}
