package com.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String detail;
	private Date create_date;
	private Date change_date;
}

// 데이터 형식대로 불러오는 곳