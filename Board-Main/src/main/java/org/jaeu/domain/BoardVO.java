package org.jaeu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;
	private String title;
	private String detail;
	private Date createDate;
	private Date changeDate;
}
