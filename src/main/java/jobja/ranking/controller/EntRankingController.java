package jobja.ranking.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jobja.board.vo.BoardQNAVO;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.ranking.service.EntRankingService;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/entRanking")
@Controller
public class EntRankingController {

	@Autowired
	EntRankingService entRankingService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		// 복지 및 급여 높은순 끌어오기
		List<EnterpriseVO> entWelfareDescList = entRankingService.entWelfareDesc();
		// 승진 기회 및 가능성 높은순 끌어오기
		List<EnterpriseVO> entChancesDescList = entRankingService.entChancesDesc();
		// 업무와 삶의 균형 높은순 끌어오기
		List<EnterpriseVO> entBalanceDescList = entRankingService.entBalanceDesc();
		// 사내 문화 높은순 끌어오기
		List<EnterpriseVO> entCultureDescList = entRankingService.entCultureDesc();
		// 경영진 높은순 끌어오기
		List<EnterpriseVO> entManagerDescList = entRankingService.entManagerDesc();
		
		// 총 만족도 평균 높은순  끌어오기
		List<EnterpriseVO> entAvgDescList = entRankingService.entAvgDesc();

		log.info("entWelfareDescList", entWelfareDescList);
		log.info("entChancesDescList", entChancesDescList);
		log.info("entBalanceDescList", entBalanceDescList);
		log.info("entCultureDescList", entCultureDescList);
		log.info("entManagerDescList", entManagerDescList);
		log.info("entAvgDescList", entAvgDescList);

		model.addAttribute("entWelfareDescList", entWelfareDescList);
		model.addAttribute("entChancesDescList", entChancesDescList);
		model.addAttribute("entBalanceDescList", entBalanceDescList);
		model.addAttribute("entCultureDescList", entCultureDescList);
		model.addAttribute("entManagerDescList", entManagerDescList);
		model.addAttribute("entAvgDescList", entAvgDescList);
		
		return "ranking/list";
	}
	
	@GetMapping("/sortList")
	public String sortList(Model model,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "size", required = false, defaultValue = "10") int size,
			@RequestParam(value = "sort", required = false, defaultValue = "reviewCount") String sort,
			@RequestParam(value = "currentPage",required = false, defaultValue = "1") int currentPage) {

		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("sort", sort);
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		log.info("map : " + map);
		
		size = 10;
		
		// 해당 정렬 조건에 맞는 기업 리스트
		List<EnterpriseVO> enterpriseVOList = entRankingService.getList(map);
		log.info("enterpriseVOList : " + enterpriseVOList);
		
		// 해당 정렬 조건에 맞는 기업의 수
		int total = this.entRankingService.getTotal(map);
		log.info("list->total : " + total);
		
		// 로그인한 회원의 관심 기업 리스트
		List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
		log.info("interestEntVOList : " + interestEntVOList);

		ArticlePage<EnterpriseVO> data = new ArticlePage<EnterpriseVO>(total, currentPage, size, enterpriseVOList,sort);

		log.info("data : " + data);
		
		data.setUrl("/entRanking/sortList");

		model.addAttribute("data",data);
		model.addAttribute("total",total);
		model.addAttribute("interestEntVOList",interestEntVOList);

		return "ranking/sortList";
	}
	

}
