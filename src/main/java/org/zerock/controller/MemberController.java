package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService service;
	
	//--로그인 페이지--//
	@GetMapping("/logIn")
	public void memberMain() {
		
	}
	
	//--관리자전용 회원리스트 내역--//
	@GetMapping("/admin/list")
	public void listAdmin(Model model) {
		
		log.info("listAdmin");
		model.addAttribute("listAdmin", service.getList());
	}
	
	//--회원전용 가입페이지(register)--//
	
	//--개인정보이용내역 필수사항 체크, 카카오가입 혹은 일반가입--//
	@GetMapping("/beforeSignUp")
	public void beforeSignUp() {
		
	}
	
	//--회원가입 완료페이지--//
	@GetMapping("/afterSignUp")
	public void afterSignUp() {
		
	}
	
	@GetMapping("/signUp")
	public void signUp() {
		
	}
	
	@PostMapping("/signUp")
	public String signUp(MemberVO member, RedirectAttributes rttr) {
		
		log.info("signUp: " + member);
		
		service.register(member);
		
		rttr.addFlashAttribute("result", member.getM_email());
		
		return "redirect:/member/afterSignUp";	//전체목록 말고 등록 후 이메일아이디 알려주고 회원가입 완료되었습니다. 나와야함
	}
	
	
	//--회원전용탈퇴페이지--//
	@PostMapping("/remove")
	public String remove(@RequestParam("m_num") String m_num, RedirectAttributes rttr) {
		
		log.info("remove..." + m_num);
		if (service.remove(m_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/main";	//탈퇴가 완료되었습니다 화면만 나오도록 따로 설계
	}

	//--관리자 전용 회원탈퇴페이지--//
	@PostMapping("/admin/remove")
	public String removeAdmin(@RequestParam("m_num") String m_num, RedirectAttributes rttr) {
		
		log.info("remove..." + m_num);
		if (service.remove(m_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";	//삭제시키고 다시 목록으로 복귀
	}
	
	//--회원전용 정보조회(회원번호 안보임)--//
	@GetMapping("/get")
	public void get(@RequestParam("m_num") String m_num, Model model) {
		
		log.info("get............");
		model.addAttribute("get", service.get(m_num));
		
	}
	
	//--관리자전용 정보조회(회원번호 보임)--//
	@GetMapping("/admin/get")
	public void getAdmin(@RequestParam("m_num") String m_num, Model model) {
		
		log.info("getAdmin............");
		model.addAttribute("getAdmin", service.get(m_num));
		
	}
	
	
	//--회원전용 정보수정(포인트 내역 안보임)--//
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify:" + member);
		
		if (service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/main";	//수정하면 마이페이지 메인으로
		
	}
	
	
	//--관리자전용 회원정보수정(포인트 내역 포함)--//
		@PostMapping("/admin/modify")
		public String modifyAdmin(MemberVO member, RedirectAttributes rttr) {
			log.info("modify:" + member);
			
			if (service.modify(member)) {
				rttr.addFlashAttribute("result", "success");
			}
			
			return "redirect:/admin/list";	
			
		}
		
		
		//--이메일 인증번호 전송--//
		@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	    public void sendMailTest() throws Exception{
	        
	        String subject = "test 메일";
	        String content = "<img src=\"/resources/img/logo.png\">"+"메일 테스트 내용";
	        String from = "얼쑤[EARTH]좋다 <goodforearth@goodforearth.com>";
	        String to = "gooodforearth@gmail.com";
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
	            // true는 멀티파트 메세지를 사용하겠다는 의미
	            
	            /*
	             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
	             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	             */
	            
	            mailHelper.setFrom(from);
	            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
	            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
	            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
	            mailHelper.setTo(to);
	            mailHelper.setSubject(subject);
	            mailHelper.setText(content, true);
	            // true는 html을 사용하겠다는 의미입니다.
	            
	            /*
	             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	             */
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	    }

		/* 이메일 인증 */
	    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("메일주소 : " + email);
	        
	        
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        
	        log.info("인증번호" + checkNum);
	        
	        
	        /* 이메일 보내기 */
	        String setFrom = "얼쑤[EARTH]좋다 <gooodforearth@gamail.com>";
	        String toMail = email;
	        String title = "회원가입 인증 이메일입니다.";
	        String content =
	        		"홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        		
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        
	        String num = Integer.toString(checkNum);
	        
	        return num;
	    }
	    
	    
	    
	    /* 아이디 중복 검사  */
	    @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	    @ResponseBody
	    public String memberIdChkPOST(String m_email) throws Exception{
	    	
	    	//log.info("memberIdChk() 진입");
	    	
	    	int result = service.idCheck(m_email); 
	    	log.info("결과값 = " + result); 
	    	
	    	
	    	if(result != 0) { 
	    		return "fail"; // 중복 아이디가 존재 
	    	
	    	} else { 
	    		return "success"; // 중복 아이디 x }
	    	
	    	}

	    
	    }	
	
}
