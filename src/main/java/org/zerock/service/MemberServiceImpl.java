package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	// spring 4.3 이상에서 자동 처리
	private MemberMapper member_mapper;

	@Override
	public void register(MemberVO member) {
		
		log.info("register......" + member);

		member_mapper.insert(member);		
	}

	@Override
	public MemberVO get(String m_num) {
		
		log.info("get........" + m_num);

		return member_mapper.read(m_num);
	}

	@Override
	public boolean remove(String m_num) {
		
		log.info("remove........" + m_num);
	
		return member_mapper.delete(m_num) == 1;
	}

	@Override
	public boolean modify(MemberVO member) {
		
		log.info("modify............" + member);
		
		return member_mapper.update(member) == 1;
	}

	@Override
	public List<MemberVO> getList() {
		
		log.info("getList.........");

		return member_mapper.getList();
	}

	@Override
	public int idCheck(String m_email) throws Exception {
		
		return member_mapper.idCheck(m_email);
	}



}
