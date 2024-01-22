package jobja.search.controller;

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
import jobja.common.mapper.ComCodeMapper;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.mapper.InterestRecruitMapper;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.RecruitVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/search")
@Controller
public class SearchController {

	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	ComCodeMapper comCodeMapper;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;

	@Autowired
	InterestRecruitMapper interestRecruitMapper;
	
	@GetMapping("/list")
	public String list(@RequestParam(value = "keyword" ,required = false) String keyword,
			   @RequestParam(value = "currentPage" ,required = false, defaultValue = "1") int currentPage,
			   @RequestParam(value = "sortBy" ,required = false, defaultValue = "recent") String sortBy,
						Model model) {
		
		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
	    
		int size = 10;
		int pageSize = 5;
		
		// keyword => 검색어
		log.info("keyword : " + keyword);
		log.info("currentPage : " + currentPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		log.info("map : " + map);
		
		// 해당 키워드에 맞는 기업 리스트 5개 불러오기
		List<EnterpriseVO> enterpriseVOList = enterpriseService.list5(map);
		log.info("enterpriseVOList : " + enterpriseVOList);

		// 해당 키워드에 맞는 채용공고 리스트
		List<RecruitVO> recruitVOList = recruitService.getSrchList(map);
		log.info("recruitVOList : " + recruitVOList);
		
		// 해당 키워드에 맞는 채용공고 총 개수
		int total = this.recruitService.getSrchTotal(map);
		log.info("total : " + total);
		
		// 인기 채용 공고 5개
		List<RecruitVO> popularRecVOList = recruitService.getPopular5();
		log.info("popularRecVOList : " + popularRecVOList);
		
		// 페이지네이션을 위한 ArticlePage 객체 생성
		ArticlePage<RecruitVO> data = new ArticlePage<RecruitVO>(total, currentPage, size,pageSize, recruitVOList);
		
		data.setKeyword(keyword);
		data.setUrl("/search/list");
		data.setSort(sortBy);

		
		// 로그인한 회원의 관심 채용공고 리스트
		List<InterestRecruitVO> interestRecruitVOList = recruitService.getInterestRecruit(memberVO);
		log.info("interestRecruitVOList : " + interestRecruitVOList);

		// 로그인한 회원의 관심 기업 리스트
		List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
		log.info("interestEntVOList : " + interestEntVOList);
		
		model.addAttribute("enterpriseVOList",enterpriseVOList);
		model.addAttribute("recruitVOList",recruitVOList);
		model.addAttribute("data",data);
		model.addAttribute("sort",sortBy);
		model.addAttribute("interestRecruitVOList",interestRecruitVOList);
		model.addAttribute("interestEntVOList",interestEntVOList);
		model.addAttribute("popularRecVOList",popularRecVOList);
		
		return "search/list";
		
	}
	
}
