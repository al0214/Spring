package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

//@Data
//public class TodoDTO{
//	
//	private String title;
//	
//	@DateTimeFormat(pattern = "yyyy/MM/dd")
//	private Date dueDate;
//}

@Data
public class TodoDTO {
	
	private String title;
	private Date dueDate;
}