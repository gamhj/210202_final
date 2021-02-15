package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO member);
	
	public MemberVO get(String m_num);
	
	public boolean remove(String m_num);
	
	public boolean modify(MemberVO member);
	
	public List<MemberVO> getList();
	
	// 아이디 중복 검사 
	public int idCheck(String m_email) throws Exception;
	
}
