package jobja.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.board.service.BoardEntReviewService;
import jobja.board.vo.BoardEntReviewVO;
import jobja.common.mapper.ComCodeMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.member.service.EnterpriseService;
import jobja.member.vo.EntAprvVO;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.mapper.InterestRecruitMapper;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.RecruitVO;
import jobja.sort.vo.SearchVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/enterprise")
@Controller
public class EnterpriseController {
   
   @Autowired
   EnterpriseService enterpriseService;
   
   @Autowired
   PasswordEncoder encoding;
   
   @Autowired
   RecruitService recruitService;
   
   @Autowired
   ComCodeMapper comCodeMapper;
   
   @Autowired
   ModelAttributeUtil modelAttributeUtil;
   
   @Autowired
   BoardEntReviewService boardEntReviewService;

   @Autowired
   InterestRecruitMapper interestRecruitMapper;
   
   
   @PostMapping("/createPost")
   public String createPost(EnterpriseVO enterpriseVO, MemberVO memberVO) {
      
      log.info("enterpriseVO uploadFile : " + enterpriseVO.getUploadFile().toString());
      
      //회원의 비밀번호를 가져옴.(비밀번호 암호화 하기 위해)
      String memPass = memberVO.getMemPass();
      
      log.info("memPass : " + memPass);
      
      String intWord = memberVO.getMemIntWord();
      
      String entNo = enterpriseVO.getEntNo();
      log.info("entNo : " + entNo);
      
      String memId = memberVO.getMemId();
      
      memberVO.setEntNo(entNo);
      
      //관심키워드 value로 관심키워드 nm가지고 오는 쿼리
      
      //비밀번호 암호화
      memberVO.setMemPass(encoding.encode(memPass));

      log.info("enterpriseVO : " + enterpriseVO);
      log.info("memberVO : " + memberVO);
      
      int result = this.enterpriseService.createPost(enterpriseVO,memberVO);
      
      log.info("Enterprise ->  createPost :  " + result);
      
      return "redirect:/login";
   }
   
   @GetMapping("/list")
   public String list(
         @RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
         @RequestParam(value="sort", required = false, defaultValue = "reviewCountDesc") String sort,
         Model model) {

      // 현재 로그인한 회원 정보
      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
      
      // keyword => 검색어
      log.info("keyword : " + keyword);
      // sort => 정렬 조건
      log.info("sort : " + sort);

      int size = 10;
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("keyword", keyword);
      map.put("currentPage", currentPage);
      map.put("size", size);      
      map.put("sort", sort);
      
      log.info("map : " + map);
      
      // 해당 조회조건에 맞는 기업 리스트         
      List<EnterpriseVO> enterpriseVOList = enterpriseService.list(map);
      log.info("enterpriseVOList : " + enterpriseVOList);
      
      // 해당 키워드에 맞는 기업 총 개수
      int total = this.enterpriseService.getTotal(map);
      log.info("total : " + total);
	
      // 페이지네이션을 위한 ArticlePage 객체 생성
      ArticlePage<EnterpriseVO> data = new ArticlePage<EnterpriseVO>(total, currentPage, 10, enterpriseVOList);
		
      data.setKeyword(keyword);
      data.setUrl("/enterprise/list");
      data.setSort(sort);
      
      // 로그인한 회원의 관심 기업 리스트
      List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
      log.info("interestEntVOList : " + interestEntVOList);
      
      model.addAttribute("enterpriseVOList",enterpriseVOList);
      model.addAttribute("interestEntVOList",interestEntVOList);
      model.addAttribute("sort",sort);
      model.addAttribute("data",data);
      model.addAttribute("total",total);
      
      return "enterprise/list";
      
   }
   
   @ResponseBody
   @PostMapping("/ajaxInterestEnt")
   public int ajaxInterestRecruit(@RequestBody InterestEnterpriseVO interestEnterpriseVO) {
      
      log.info("interestEnterpriseVO : "+ interestEnterpriseVO);
      
      int res = enterpriseService.ajaxInterestEnt(interestEnterpriseVO);
      
      log.info("res : " + res);
      
      if(res == 0) {
         res = enterpriseService.ajaxInterestEntAdd(interestEnterpriseVO);
         log.info("add -> res : " + res);
         res = 1;
      }else {
         res = enterpriseService.ajaxInterestEntDel(interestEnterpriseVO);
         log.info("del -> res : " + res);
         res = 0;
      }
      
      int count = enterpriseService.getStoredEnt(interestEnterpriseVO);
      log.info("count : " + count);
      return res;
   }

   @GetMapping("/{entNo}/info")
   public String info(
         @PathVariable String entNo,
         @RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
         @RequestParam(value="sort", required = false, defaultValue = "newest") String sort,
         Model model) {
      
      // keyword => 검색어
      log.info("keyword : " + keyword);

      int size = 5;
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("keyword", keyword);
      map.put("currentPage", currentPage);
      map.put("size", size);      
      map.put("sortBy", sort);
      map.put("entNo", entNo);
      
      EnterpriseVO enterpriseVO = enterpriseService.getOne(map);
      
      List<RecruitVO> recruitVOList = recruitService.getByEntNo(map);
      
      List<BoardEntReviewVO> entReviewVOList = boardEntReviewService.getByEntNo(map);

      int totalReviewCount = boardEntReviewService.getTotalCount(entNo);

      // 현재 로그인한 회원 정보
      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
      
      // 로그인한 회원의 관심 채용 공고 목록
      List<InterestRecruitVO> interestRecruitVOList = recruitService.getInterestRecruit(memberVO);
      log.info("interestRecruitVOList : " + interestRecruitVOList);
      
      // 로그인한 회원의 관심 기업 리스트
      List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
      log.info("interestEntVOList : " + interestEntVOList);
      
      model.addAttribute("enterpriseVO", enterpriseVO);
      model.addAttribute("recruitVOList", recruitVOList);
      model.addAttribute("entReviewVOList", entReviewVOList);
      model.addAttribute("totalReviewCount", totalReviewCount);
      model.addAttribute("interestRecruitVOList", interestRecruitVOList);
      model.addAttribute("interestEntVOList", interestEntVOList);
      
      return "enterprise/info";
      
   }
   
   @GetMapping("/{entNo}/review")
   public String review(
         @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
         @RequestParam(value="sort", required = false, defaultValue = "newest") String sort,
         @RequestParam(value="scrollY", required = false, defaultValue = "0") String scrollY,
         @PathVariable String entNo, Model model) {
      
      log.info("list -> currentPage : " + currentPage);
      log.info("list -> sort : " + sort);
      
      int size = 10;
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("currentPage", currentPage);
      map.put("size", size);      
      map.put("sortBy", sort);   
      map.put("entNo", entNo);      
      
      EnterpriseVO enterpriseVO = enterpriseService.getOne(map);
      
      List<RecruitVO> recruitVOList = recruitService.getByEntNo(map);
      
      List<BoardEntReviewVO> entReviewVOList = boardEntReviewService.getByEntNo(map);
      
      int totalReviewCount = boardEntReviewService.getTotalCount(entNo);
      
      log.info("@@@entReviewVOList : " + entReviewVOList);
      
      String comCode = "MWJ01";
      
      ComCodeInfoVO comCodeInfoVO =  comCodeMapper.getComCodeInfo(comCode);
      
      log.info("comCodeInfoVO : " + comCodeInfoVO);

      // 현재 로그인한 회원 정보
      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
      if (memberVO != null) {
    	  String memId = memberVO.getMemId();
    	  model.addAttribute("memId", memId);
      }

      // 로그인한 회원의 관심 채용 공고 목록
      List<InterestRecruitVO> interestRecruitVOList = recruitService.getInterestRecruit(memberVO);
      log.info("interestRecruitVOList : " + interestRecruitVOList);
      
      // 로그인한 회원의 기업 목록
      List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
      log.info("interestEntVOList : " + interestEntVOList);
      
      model.addAttribute("enterpriseVO", enterpriseVO);
      model.addAttribute("recruitVOList", recruitVOList);
      model.addAttribute("entReviewVOList", entReviewVOList);
      model.addAttribute("comCodeInfoVO", comCodeInfoVO);
      model.addAttribute("scrollY", scrollY);
      model.addAttribute("totalReviewCount", totalReviewCount);
      model.addAttribute("interestEntVOList", interestEntVOList);
      
      return "enterprise/review";
      
	}

	@ResponseBody
	@PostMapping("/{entNo}/ajaxReview")
	public List<BoardEntReviewVO> ajaxReview(
			@RequestBody SearchVO searchVO,
			@PathVariable String entNo, Model model) {
		log.info("ajaxReview -> searchVO : " + searchVO);
		log.info("ajaxReview -> currentPage : " + searchVO.getCurrentPage());
		log.info("ajaxReview -> sortBy : " + searchVO.getSortBy());
		
		int size = 10;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", searchVO.getCurrentPage());
		map.put("size", size);		
		map.put("sortBy", searchVO.getSortBy());	
		map.put("entNo", entNo);		
		
		List<BoardEntReviewVO> entReviewVOList = boardEntReviewService.getByEntNo(map);
		
		return entReviewVOList;
		
	}

	@ResponseBody
	@PostMapping("/ajaxGetEntOne")
	public EnterpriseVO ajaxGetEntOne(@RequestBody EnterpriseVO enterpriseVO) {
		
		log.info("ajaxGetEntOne -> enterpriseVO : " + enterpriseVO);

		EnterpriseVO entVO = enterpriseService.getAjaxEntOne(enterpriseVO);
		
		log.info("ajaxGetEntOne -> entVO : " + entVO);
		
		return entVO;
	}
	
	@ResponseBody
	@PostMapping("/ajaxGetEntOneYearly")
	public List<EnterpriseVO> ajaxGetEntOneYearly(@RequestBody EnterpriseVO enterpriseVO) {
		
		log.info("ajaxGetEntOne -> enterpriseVO : " + enterpriseVO);

		List<EnterpriseVO> entVOList = enterpriseService.ajaxGetEntOneYearly(enterpriseVO);
		
		log.info("ajaxGetEntOne -> entVOList : " + entVOList);
		
		return entVOList;
	}
	   
	
	   @GetMapping("/{entNo}/recruit")
	   public String recruit(
	         @RequestParam(value="keyword", required = false, defaultValue = "") String keyword,
	         @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage,
	         @RequestParam(value="sort", required = false, defaultValue = "recent") String sort,
	         @RequestParam(value="magam", required = false, defaultValue = "false") String magam,
	         @PathVariable String entNo, Model model) {

	      int size = 5;
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("keyword", keyword);
	      map.put("currentPage", currentPage);
	      map.put("size", size);      
	      map.put("sortBy", sort);
	      map.put("entNo", entNo);
	      map.put("magam", magam);
	      
	      log.info("map : " + map);

	      // 해당 사업자번호의 기업 정보
	      EnterpriseVO enterpriseVO = enterpriseService.getOne(map);
	      
	      // 해당 기업의 채용 공고 리스트
	      List<RecruitVO> recruitVOList = recruitService.getByEntNo(map);
	      
	      // 해당 기업의 총 리뷰 개수
	      int totalReviewCount = boardEntReviewService.getTotalCount(entNo);
	      
	      // 로그인한 회원 VO
	      MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
	      
	      // 로그인한 회원의 관심 채용 공고 목록
	      List<InterestRecruitVO> interestRecruitVOList = recruitService.getInterestRecruit(memberVO);
	      log.info("interestRecruitVOList : " + interestRecruitVOList);
	      
	      // 로그인한 회원의 기업 목록
	      List<InterestEnterpriseVO> interestEntVOList = enterpriseService.getInterestEnt(memberVO);
	      log.info("interestEntVOList : " + interestEntVOList);
	      
	      model.addAttribute("enterpriseVO", enterpriseVO);
	      model.addAttribute("recruitVOList", recruitVOList);
	      model.addAttribute("totalReviewCount", totalReviewCount);
	      model.addAttribute("interestRecruitVOList", interestRecruitVOList);
	      model.addAttribute("interestEntVOList", interestEntVOList);
	      
	      return "enterprise/recruit";
	   }
         
      
}