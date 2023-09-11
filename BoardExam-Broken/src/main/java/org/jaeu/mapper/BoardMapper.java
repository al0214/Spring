package org.jaeu.mapper;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;

public interface BoardMapper {
	
//	public List<BoardVO> getList();
	public List<BoardVO> getWithPaging(Criteria cri);
}
