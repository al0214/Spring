package org.jaeu.mapper;

import org.jaeu.security.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
}
