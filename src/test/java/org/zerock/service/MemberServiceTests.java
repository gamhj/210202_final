package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class MemberServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;

//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}

//	@Test
//	public void testRegister() {
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
//		service.register(member);
//		
//		log.info("생성된 회원의 회원번호: " + member.getM_num());
//	}

	
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(board -> log.info(board));
//	}
	

	@Test
	public void testDelete() {
		
		//게시물 번호의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("U100028"));
		
	}

	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get("U100021"));
//	}

	
//	@Test
//	public void testUpdate() {
//
//		MemberVO member = service.get("U100022");
//
//		if (member == null) {
//			return;
//		}
//
//		
//		member.setM_num("U100022");
//		member.setM_password("bb00");
//		member.setM_ncnm("비비비");
//		member.setM_contact("010-1212-2121");
//		member.setM_birth("1987-01-29");
//		member.setM_point(100);
//		
//		log.info(service.modify(member));
//
//	}

}