package org.zerock.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class auctionMapperTests {

	@Setter(onMethod_ = @Autowired)
	private auctionMapper auMapper;
	
//	@Test
//	public void testGetList() {
//		auMapper.aucList().forEach(auc -> log.info(auc));
//	}
	
//	@Test
//	public void testInsert() {
//		
//		aucShipVO auc = new aucShipVO();
//		
//		auc.setA_bno("A2021-02-12-120");
//		auc.setC_num("C000000");
//		auc.setM_num("M100000");
//		auc.setS_shpng_addr("사창동");
//		auc.setS_shpng_cntct("010-0000-0000");
//		auc.setS_shpng_stts("배송준비중");
//		
//		auMapper.shipInsert(auc);
//		
//		log.info(auc);
//		
//	}
	
//	@Test
//	public void testRead() {
//		
//		aucShipVO auc = auMapper.shipSelect("A2021-02-12-120");
//		
//		log.info(auc);
//		
//	}
//	
//	@Test
//	public void testDelete() throws Exception {
//		
//		log.info("DELETE COUNT : " + auMapper.bidDelete("M100001", 4000));
//		
//	}
	
	@Test
	public void testUpdate() {
		
		auctionVO auc = new auctionVO();
		
		auc.setA_bno("A2021-02-10");
		auc.setA_versifier(500);
		auc.setA_wnng_prc(19000);
		auc.setA_prgrs_prd(new Date());
		
		int a = auMapper.aucUpdate(auc);
		
		log.info("success : " + a);
	}
//	
//	@Test
//	public void testNow() {
//		
//		String test = auMapper.bidNowMember();
//		
//		log.info("닉네임 : " + test);
//	}
	
}
