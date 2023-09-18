package org.jaeu.service;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;

public interface BoardService {
	
	public BoardVO detail(Integer bno);
	
	public List<BoardVO> getWithPaging(Criteria cri);
	
	public void register(BoardVO board);

	public int getTotal();

	public void update(BoardVO board);
}
