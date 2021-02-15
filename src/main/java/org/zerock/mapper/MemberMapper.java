package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();

	public void insert(MemberVO member);
	
	public MemberVO read(String m_num);
	
	public int delete(String m_num);	
	
	public int update(MemberVO member);
	
	// 아이디 중복 검사 
	public int idCheck(String m_email);
	
}
