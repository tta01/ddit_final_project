package jobja.mypage.enterprise.controller;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.enterprise.service.EntProfileService;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.recruit.vo.RecruitVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/entAccount")
@Slf4j
@Controller
public class EnterAccountController {
	
	@Autowired
	EntProfileService entProfileService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 기업 - 개인 프로필 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@GetMapping("/entmypage")
	public String list(Principal principal, Model model) {
		
		String memId = principal.getName();
		log.info("profile -> detail : " + memId);
		
		MemberVO memberVO = this.entProfileService.detail(memId);
		
		// 직급가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.entProfileService.comDetCode();
		
		// 산업군 가져오기
		List<ComCodeInfoVO> comCodeInfoVOList = this.entProfileService.comSector();
		// 관심키워드 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = this.entProfileService.comIntWord();
		
		model.addAttribute("comDetCodeInfoVOList1",comDetCodeInfoVOList);	// 직급
		model.addAttribute("comCodeInfoVOList",comCodeInfoVOList);			// 산업군(직군)
		model.addAttribute("comDetCodeInfoVOList",comDetCodeInfoVOList2);	// 관심키워드
		model.addAttribute("memberVO",memberVO);
		
		return "mypageEnt/entProfile";
	}

	
	@GetMapping("/changePw")
	public String changePw(Principal principal, Model model) {
		
		//직군,관심카테고리 가져오기.
		List<ComDetCodeInfoVO> comDetCodeInfoVO = this.memProfileService.comDetCode();
		
		log.info("memberMyPage -> comDetCodeInfoVO : " + comDetCodeInfoVO);
		
		String memId = principal.getName();
		
		log.info("memberMyPage -> memId : " + memId);
		
		MemberVO memberVO = this.memProfileService.detail(memId);
		
		log.info("memberMyPage -> memberVO : " + memberVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("comDetCode", comDetCodeInfoVO);
		
		return "mypageEnt/entChangePw";
	}
	

	@GetMapping("/files")
	public String list(Model model, @RequestParam(value = "currentPage",required = false,defaultValue="1")int currentPage) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		int size = 5;
		
		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		
		List<AtchFileDetailVO> memAtch = this.memberService.atchList(map);

		memberVO.setAtchfileDetailVO(memAtch);
		
		model.addAttribute("memberVO", memberVO);
		
		return "mypageEnt/entFiles";
	}

	
	/**
	 * 기업 - 개인 프로필 조회
	 * @param principal
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	@ResponseBody
	public MemberVO detail(Principal principal, Model model) {
		
		String memId = principal.getName();
		log.info("profile -> detail : " + memId);
		
		MemberVO memberVO = this.entProfileService.detail(memId);
		
		// 직급가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.entProfileService.comDetCode();
		memberVO.setComDetCodeInfoVOList(comDetCodeInfoVOList);
		
		// 산업군 가져오기
		List<ComCodeInfoVO> comCodeInfoVOList = this.entProfileService.comSector();
		// 관심키워드 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = this.entProfileService.comIntWord();
		
		model.addAttribute("comDetCodeInfoVOList1",comDetCodeInfoVOList);	// 직급
		model.addAttribute("comCodeInfoVOList",comCodeInfoVOList);			// 산업군(직군)
		model.addAttribute("comDetCodeInfoVOList",comDetCodeInfoVOList2);	// 관심키워드
		model.addAttribute("memberVO",memberVO);
		
		return memberVO;
	}

	/**
	 * 일반 프로필 저장
	 * @param principal
	 * @param memberVO
	 * @return
	 */
	@PostMapping("/updatePost")
	public String updatePost(Principal principal, MemberVO memberVO) {
		
		int result = this.entProfileService.updatePost(memberVO);
		
		log.info("updatePost => result : "+result);
		
		return "redirect:/entAccount/entmypage";
	}
	
	/**
	 * 기업 프로필 조회
	 * @param principal
	 * @return
	 */
	@GetMapping("/entDetail")
	@ResponseBody
	public EnterpriseVO entDetail(Principal principal) {
		
		EnterpriseVO enterpriseVO = entProfileService.entDetail(principal.getName());
		
		// 산업군 가져오기
		List<ComCodeInfoVO> comCodeInfoVOList = entProfileService.comSector();
		enterpriseVO.setComCodeInfoVOList(comCodeInfoVOList);
		
		// 관심키워드 가져오기
		List<ComDetCodeInfoVO> comDetCodeInfoVOList2 = entProfileService.comIntWord();
		enterpriseVO.setComDetCodeInfoVOList(comDetCodeInfoVOList2);
		
		return enterpriseVO;
	}

	/**
	 * 기업 프로필 저장
	 * @param principal
	 * @param memberVO
	 * @return
	 */
	@PostMapping("/entUpdatePost")
	public String entUpdatePost(Principal principal, EnterpriseVO enterpriseVO ) {
		
		int result = this.entProfileService.entUpdatePost(enterpriseVO);
		
		log.info("updatePost => result : "+result);
		return "redirect:/entAccount/entmypage";
	}
}

