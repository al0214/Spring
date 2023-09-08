package org.jaeu.service;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;

public interface BoardService {
	
//	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	public void register(BoardVO board);

}
