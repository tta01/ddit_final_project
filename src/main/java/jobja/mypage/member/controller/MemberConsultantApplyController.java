package jobja.mypage.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.member.service.PortfolioService;
import jobja.member.service.ResumeService;
import jobja.member.vo.PortfolioVO;
import jobja.mypage.member.service.ConAprvService;
import jobja.mypage.member.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberConsultantApplyController {
	
	
	@Autowired
	ResumeService resumeService;
	
	@Autowired
	PortfolioService portfolioservice;
	
	@Autowired
	ConAprvService conAprvService;
	
	
	//내가선택한 이력서 가져오기.
	@PostMapping("/ajaxgetMyResume")
	@ResponseBody
	public ResumeVO ajaxgetMyResume(@RequestBody ResumeVO resumeVO) {
		
		log.info("선택한 이력서ㅓㅓㅓㅓ" + resumeVO);
		
		resumeVO = this.resumeService.getCheckResume(resumeVO.getResumeNo());
		
		log.info("resumeVO 뭘까용????????" + resumeVO);
		
		return resumeVO;
	}
	
	//내가 선택한 포토폴리오 가져오기.
	@PostMapping("/ajaxgetMyportfolio")
	@ResponseBody
	public PortfolioVO ajaxgetMyportfolio(@RequestBody PortfolioVO portfolioVO) {
		
		log.info("선택한 자소서" + portfolioVO);
		
		portfolioVO = this.portfolioservice.getCheckPortfolio(portfolioVO.getPtflNo());
		
		log.info("portfolioVO 뭘까용????????" + portfolioVO);
		
		return portfolioVO;
	}
	
	@PostMapping("/ajaxApplyCon")
	@ResponseBody
	public int ajaxApplyCon(@RequestBody Map<String, String> condata,Principal principal) {
		
		log.info("dhkdb???? ?와???제출 상ㄷ마사 제발 와ㅏㅏㅏㅏ");
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		String resumeNo = condata.get("resumeNo");
		String ptflNo = condata.get("ptflNo");
		
		log.info("컨트롤러 이력서 번호 : " + resumeNo);
		log.info("컨트롤러 자소서 번호 : " + ptflNo);
		
		map.put("resumeNo", resumeNo);
		map.put("ptflNo", ptflNo);
		map.put("memId", principal.getName());
		
		log.info("ajaxApplyCon -> map : " +map);
		
		int result = this.conAprvService.ajaxApplyCon(map);
		
		log.info(" ajaxApplyCon ==== result : " + result);
		
		return result;
		
	}
	
	
	
}
