package org.zerock.mapper;

import java.sql.Date;
import java.util.List;

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
public class TkawyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TkawyMapper tkawy_mapper;
	
	

	
//	@Test
//	public void testGetList() {
//		
//		tkawy_mapper.getList().forEach(board -> log.info(board));
//	}
	
	

	
//	@Test
//	public void testInsert() {
//		
//		TkawyVO tkawy = new TkawyVO();
//		tkawy.setT_contact("010-1234-1234");
//		tkawy.setT_plastic(4);
//		tkawy.setT_vstng_cmpny("더피커");
//		tkawy.setT_date_vist("03-26-2021");
//		tkawy_mapper.insert(tkawy);
//		
//		log.info(tkawy);
//	}
	


	
//	@Test
//	public void testUpdateDone() {
//		
//		TkawyVO tkawy = new TkawyVO();
//		
//		tkawy.setT_bno("T2021-02-11-1111");
//		tkawy.setM_num("M100015");
//		tkawy.setT_plastic(10);
//		tkawy.setT_plastic_cap(3);
//		
//		
//		int count = tkawy_mapper.updateDone(tkawy);
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + tkawy_mapper.delete("RB2021-02-07-1051"));
//	}
	

	
//	@Test
//	public void testRead() {
//		
//		TkawyVO tkawy = tkawy_mapper.read("RB2021-02-07-1049");
//		
//		log.info(tkawy);
//	}
	
	
//	@Test
//	public void testUpdate() {
//		
//		TkawyVO tkawy = new TkawyVO();
//		
//		tkawy.setT_bno("RB2021-02-07-1046");
//		tkawy.setT_plastic(10);
//		tkawy.setT_plastic_cap(3);
//		tkawy.setT_vstng_cmpny("한라봉");
//		tkawy.setT_date_vist("2021-03-02");
//		tkawy.setT_progress("수거완료");
//		
//		int count = tkawy_mapper.update(tkawy);
//		log.info("UPDATE COUNT: " + count);
//		
//		
//		
//	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<TkawyVO> list = tkawy_mapper.getListWithPaging(cri);
//		
//		list.forEach(tkawy -> log.info(tkawy.getT_bno()));
//	}
	
	
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("수거취소");
		cri.setType("P");
		
		List<TkawyVO> list = tkawy_mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	

	
}
