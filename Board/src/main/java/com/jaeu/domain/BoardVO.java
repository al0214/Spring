package com.jaeu.domain;


import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String detail;
	private Date createDate;
	private Date changeDate;
}

// DB Table이랑 직접적인 소통을 함 및 Table이랑 똑같이 구성해줘야함
