package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.TkawyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TkawyServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private TkawyService service;

//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}

//	@Test
//	public void testRegister() {
//		
//		TkawyVO tkawy = new TkawyVO();
//
//		tkawy.setT_contact("010-1222-1212");
//		tkawy.setT_plastic_cap(7);
//		tkawy.setT_vstng_cmpny("123상점");
//		tkawy.setT_date_vist("02-28-2021");
//		
//		service.register(tkawy);
//		
//		log.info("생성된 게시물의 번호: " + tkawy.getT_bno());
//	}

	@Test
	public void testGetList() {
		
//		service.getList().forEach(board -> log.info(board));
		
		service.getList(new Criteria(2, 10)).forEach(tkawy -> log.info(tkawy));
	}

//	@Test
//	public void testDelete() {
//		
//		//게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove("RB2021-02-07-1050"));
//		
//	}

//	@Test
//	public void testGet() {
//		
//		log.info(service.get("RB2021-02-07-1049"));
//	}

//	@Test
//	public void testUpdate() {
//
//		TkawyVO tkawy = service.get("RB2021-02-07-1053");
//
//		if (tkawy == null) {
//			return;
//		}
//
//		tkawy.setT_plastic(10);
//		tkawy.setT_plastic_cap(3);
//		tkawy.setT_vstng_cmpny("지구메롱");
//		tkawy.setT_date_vist("2021-03-02");
//		tkawy.setT_progress("수거완료");
//		log.info(service.modify(tkawy));
//
//	}

//	@Test
//	public void testUpdateDone() {
//
//		TkawyVO tkawy = service.get("T2021-02-11-1112");
//
//		if (tkawy == null) {
//			return;
//		}
//
//		tkawy.setM_num("M100000");
//		tkawy.setT_plastic(10);
//		tkawy.setT_plastic_cap(3);
//		log.info(service.modifyDone(tkawy));
//
//	}

}