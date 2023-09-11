package com.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zerock.domain.BoardVO;
import com.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList() {
		log.info("getList..........");

		return mapper.getList();
	}

	@Override
	public Object get(long l) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String remove(long l) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String modify(BoardVO board) {
		// TODO Auto-generated method stub
		return null;
	}


}
