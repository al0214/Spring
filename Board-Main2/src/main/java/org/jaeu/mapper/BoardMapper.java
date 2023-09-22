package org.jaeu.mapper;

import java.util.List;

import org.jaeu.domain.BoardVO;
import org.jaeu.domain.Criteria;

public interface BoardMapper {
	
	public BoardVO detail(Long bno);
	public List<BoardVO> getWithPaging(Criteria cri);
	public int insertSelectKey(BoardVO board);
	public int getTotal();
	public int update(BoardVO board);
	public int remove(Long bno);
	public int allremove(BoardVO board);
}
