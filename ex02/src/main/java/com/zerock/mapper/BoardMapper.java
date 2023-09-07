package com.zerock.mapper;

import java.util.List;

import com.zerock.domain.BoardVO;

public interface BoardMapper {
	
//	@Select("select * from BOARD")
	public List<BoardVO> getList();
	

}
