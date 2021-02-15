package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.auctionVO;
import org.zerock.service.auctionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/auc/*")
@AllArgsConstructor
public class AuctionController {

	private auctionService service;
	
	//진행페이지
	@GetMapping("/now")
	public void now(Model model) {
		
		log.info("now");
		model.addAttribute("now", service.nowGetList());
		
	}
	
	//진행 등록
	@PostMapping("/now_register")
	public String apply(auctionVO auctionvo, RedirectAttributes rttr) {
		
		log.info("register: " + auctionvo);
		
		service.nowRegi(auctionvo);
		
		rttr.addFlashAttribute("result", auctionvo.getAa_bno());
		
		return "redirect:/auc/now";
	}
	
	@GetMapping("/now_get")
	public void get(@RequestParam("a_bno") String a_bno, Model model) {
		
		log.info("/now_get");
		model.addAttribute("auctionVO", service.nowGet(a_bno));
		
	}
	
	@PostMapping("/now_modify")
	public String modify(auctionVO auctionvo, RedirectAttributes rttr) {
		log.info("modify:" + auctionvo);
		
		if(service.nowMod(auctionvo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/now";
		
	}
	
	@PostMapping("/now_remove")
	public String remove(@RequestParam("a_bno") String a_bno, RedirectAttributes rttr) {
		
		log.info("remove..." + a_bno);
		
		if(service.nowRemove(a_bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/now";
		
	}
}
