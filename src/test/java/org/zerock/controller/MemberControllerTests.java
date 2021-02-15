package org.zerock.controller;

import javax.mail.internet.MimeMessage;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
public class MemberControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;
	
	@Autowired
    JavaMailSenderImpl mailSender;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	@Test
//	public void testListAdmin() throws Exception {
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/member/admin/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}

	
//	@Test
//	public void testRegister() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/member/signUp").param("m_email", "ddd@ddd.com")
//						.param("m_password", "dd00").param("m_name", "디디디").param("m_ncnm", "디디디")
//						.param("m_contact", "010-4444-4444").param("m_birth", "1999-05-06"))
//				.andReturn().getModelAndView().getViewName();
//
//		log.info(resultPage);
//	}
	
	

//	@Test
//	public void testGet() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/member/get")
//				.param("m_num",  "U100021"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	

//	@Test
//	public void testModify() throws Exception {
//		
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/member/modify")
//						.param("m_num", "U100022")
//						.param("m_password", "bb00")
//						.param("m_ncnm", "비비비비")
//						.param("m_contact", "010-5555-5555")
//						.param("m_birth", "2017-07-03")
//						.param("m_point", "200"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	

//	@Test
//	public void testRemove() throws Exception{
//		//삭제전 데이터베이스에서 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/remove")
//				.param("m_num", "R1000029")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}

	
	  // MimeMessage 객체를 직접 생성하여 메일을 발송하는 방법
    @Test
    public void mailSendTest() throws Exception{
        
        
    	String subject = "<얼쑤[EARTH]좋다> 이메일 인증번호를 입력해주세요.";
        String content = "<img src=\"https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r2.png\">"+"메일 테스트 내용";
        String from = "얼쑤[EARTH]좋다 <goodforearth@goodforearth.com>";
        String to = "2dahm@daum.net";
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }


	
}
