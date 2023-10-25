package org.jaeu.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserDTO {
	private String userId;
	private String userPw;
	private String userName;
	private Date createDate;
	private Date changeDate;
	private boolean enable;
	
	private List<AuthDTO> authList;
}
