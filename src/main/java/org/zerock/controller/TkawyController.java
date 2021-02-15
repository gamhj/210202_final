package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.TkawyVO;
import org.zerock.service.TkawyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/tkawy/*")
@AllArgsConstructor
public class TkawyController {

	
	private TkawyService service;
	
	//--플라스틱 방앗간 소개 메인페이지--//
	@GetMapping("/main")
	public void tkawyMain() {
		
	}
	
//	//--회원전용--//
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
//	//--관리자 전용내역--//
	@GetMapping("/admin/list")
	public void listAdmin(Criteria cri, Model model) {
		
		log.info("listAdmin: " + cri);
		model.addAttribute("listAdmin", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(TkawyVO tkawy, RedirectAttributes rttr) {
		
		log.info("register: " + tkawy);
		
		service.register(tkawy);
		
		rttr.addFlashAttribute("result", tkawy.getT_bno());
		
		return "redirect:/tkawy/admin/list";	//전체목록 말고 등록 후 등록번호만 나오고 신청이 완료되었습니다. 나와야함
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + t_bno);
		if (service.remove(t_bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("Keyword", cri.getKeyword());
		
		return "redirect:/tkawy/list";	//삭제가 완료되었습니다 화면만 나오도록 따로 설계
	}
	
	@PostMapping("/admin/remove")
	public String removeAdmin(@RequestParam("t_bno") String t_bno, Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + t_bno);
		if (service.remove(t_bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/tkawy/admin/list" + cri.getListLink();	
	}
	
	
	@GetMapping("/get")
	public void get(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get");
		model.addAttribute("tkawy", service.get(t_bno));
		
	}
	
	@GetMapping({"/admin/get", "/admin/modify", "/admin/modifydone"})
	public void getAdmin(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/admin/get");
		model.addAttribute("tkawy", service.get(t_bno));
		
	}
	
	
	
	@PostMapping("/admin/modify")
	public String modifyAdmin(TkawyVO tkawy, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + tkawy);
		
		if (service.modify(tkawy)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/tkawy/admin/list" + cri.getListLink();
		
	}
	


	@PostMapping("/admin/modifydone")
	public String modifyDone(TkawyVO tkawy, Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify done..." + tkawy);
		
		if (service.modifyDone(tkawy)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/tkawy/admin/list" + cri.getListLink();	
	}
	
	
	@PostMapping("/admin/modifycanceled")
	public String modifyCanceled(@RequestParam("t_bno") String t_bno, Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify canceled..." + t_bno);
		if (service.modifyCanceled(t_bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/tkawy/admin/list" + cri.getListLink();	
	}
}
