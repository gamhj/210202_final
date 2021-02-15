package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for Controller
@WebAppConfiguration

@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class TkawyControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	@Test
//	public void testList() throws Exception {
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/tkawy/admin/list")
//				.param("pageNum", "1")
//				.param("amount", "10"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
	
//	@Test
//	public void testListAdmin() throws Exception {
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/tkawy/admin/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}

	
	
//	@Test
//	public void testRegister() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/tkawy/register").param("t_contact", "010-3333-4444").param("t_plastic", "3")
//						.param("t_vstng_cmpny", "컨트롤러상점").param("t_date_vist", "02-07-2021"))
//				.andReturn().getModelAndView().getViewName();
//
//		log.info(resultPage);
//	}
	
	
//	@Test
//	public void testGet() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/tkawy/get")
//				.param("t_bno",  "RB2021-02-07-1049"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	
	
//	@Test
//	public void testModify() throws Exception {
//		
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/tkawy/modify")
//						.param("t_bno", "RB2021-02-07-1046")
//						.param("t_plastic", "100")
//						.param("t_plastic_cap", "700")
//						.param("t_vstng_cmpny", "ㄱㅊ")
//						.param("t_date_vist", "2021-07-07")
//						.param("t_progress", "수거예정"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
	
	@Test
	public void testModifyDone() throws Exception {
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/tkawy/admin/modifydone")
						.param("t_bno", "T2021-02-12-1166")
						.param("m_num", "M100000")
						.param("t_plastic", "100")
						.param("t_plastic_cap", "700"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
//	@Test
//	public void testRemove() throws Exception{
//		//삭제전 데이터베이스에서 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/tkawy/remove")
//				.param("t_bno", "RB2021-02-07-1052")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	

}
