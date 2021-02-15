package org.zerock.mapper;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper member_mapper;
	
	

	
//	@Test
//	public void testGetList() {
//		
//		member_mapper.getList().forEach(board -> log.info(board));
//	}
	
	

	
//	@Test
//	public void testInsert() {
//		
//		MemberVO member = new MemberVO();
//		
//		member.setM_email("ddd@ddd.com");
//		member.setM_password("dd00");
//		member.setM_name("이름디");
//		member.setM_ncnm("디디디");
//		member.setM_contact("010-4444-1233");
//		member.setM_birth("1998-01-12");
//		
//		member_mapper.insert(member);
//		
//		log.info(member);
//	}
	


	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + member_mapper.delete("U100026"));
//	}
	

	
//	@Test
//	public void testRead() {
//		
//		MemberVO member = member_mapper.read("U100022");
//		
//		log.info(member);
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		MemberVO member = new MemberVO();
//		
//		member.setM_num("U100021");
//		member.setM_password("aa00");
//		member.setM_ncnm("에이");
//		member.setM_contact("010-1112-1111");
//		member.setM_birth("1988-08-18");
//		member.setM_point(10);
//		
//		int count = member_mapper.update(member);
//		log.info("UPDATE COUNT: " + count);
//		
//		
//		
//	}
	
	
	// 아이디 중복검사 
	@Test 
	public void memberIdChk() throws Exception{ 
		String id = "test@test.com"; // 존재하는 아이디 
		String id2 = "test123"; // 존재하지 않는 아이디 
		member_mapper.idCheck(id); 
		member_mapper.idCheck(id2); 
		
	}
	
}
