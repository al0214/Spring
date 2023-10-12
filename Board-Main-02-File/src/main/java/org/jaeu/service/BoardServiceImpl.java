package org.jaeu.service;

import java.util.List;

import org.jaeu.domain.BoardDTO;
import org.jaeu.domain.CriteriaVO;
import org.jaeu.domain.FileDTO;
import org.jaeu.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public List<BoardDTO> getWithPaging(CriteriaVO cri) {
		// 리스트 페이지
		return mapper.getWithPaging(cri);
	}

	@Override
	public BoardDTO detail(Long bno) {
		// 조회 및 수정 페이지
		return mapper.detail(bno);
	}

	@Override
	public void register(BoardDTO board) {
		// 등록 페이지
		mapper.insertSelectKey(board);

	}

	@Override
	public boolean update(BoardDTO board) {
		// 수정 구현
		return mapper.update(board) == 1;
	}

	@Override
	public int getTotal() {

		return mapper.getTotal();
	}

	@Override
	public boolean remove(Long bno) {

		return mapper.remove(bno) == 1;

	}

	@Override
	public void allremove(BoardDTO board) {

		mapper.allremove(board);

	}

	@Override
	public void registerFile(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		mapper.registerFile(fileDTO);
	}

	@Override
	public void increase() {
		mapper.increase();

	}

	@Override
	public List<FileDTO> getfiles(Long bno) {
		// TODO Auto-generated method stub
		return mapper.getFiles(bno);
	}

}
