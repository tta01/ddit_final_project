package jobja.mypage.member.controller;

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

import jobja.member.service.PortfolioService;
import jobja.member.vo.PortfolioBasicVO;
import jobja.member.vo.PortfolioFreeVO;
import jobja.member.vo.PortfolioVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.MemberVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/memberPortfolio")
@Controller
public class MemberPortfolioController {
	
	@Autowired
	PortfolioService portfolioService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	MemberService memberService;
	
	// 자기소개서 목록
	@GetMapping("/portfolioList")
	public String list(PortfolioVO portfolioVO, Model model,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			) {
		
		log.info("list->keyword : " + keyword);
		log.info("list->currentPage : " + currentPage);
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		int size = 5;
		int pageSize = 5;
		
		log.info("@#@@@@@memId : " + memId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword",keyword);
		map.put("currentPage",currentPage);
		map.put("memId",memId);
		map.put("size",size);
		
		log.info("currentPage @@@ : " + currentPage);
		
		
		List<PortfolioVO> portfolioVOList = this.portfolioService.list(map);
		
		log.info("list -> portfolioVOList : "+portfolioVOList);
		
		int total = this.portfolioService.getTotal(map);
		log.info("list->total : " + total);

		ArticlePage<PortfolioVO> data 
				= new ArticlePage<PortfolioVO>(total, currentPage, size,pageSize, portfolioVOList);
		
		data.setUrl("/memberPortfolio/portfolioList");
		
		model.addAttribute("data",data);
		model.addAttribute("keyword",keyword);
		model.addAttribute("portfolioVOList",portfolioVOList);
		
		return "mypageMem/portfolioList";
	}
	
	// 자기소개 기본양식 등록 화면
	@GetMapping("/portfolioCreate")
	public String create(PortfolioVO portfolioVO, PortfolioBasicVO portfolioBasicVO, Model model) {
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		model.addAttribute("memId",memId);
		
		return "mypageMem/portfolioCreate";
	}
	
	// 자기소개 자유양식 등록 화면
	@GetMapping("/portfolioFreeCreate")
	public String freeCreate(Model model) {
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		model.addAttribute("memId",memId);
		
		return "mypageMem/portfolioFreeCreate";
	}
	
	// 자기소개서 등록
	@PostMapping("/portfolioCreateForm")
	public String createForm(PortfolioVO portfolioVO, PortfolioBasicVO portfolioBasicVO, Model model) {
		
		String ptflNo = this.portfolioService.getPtflNo();
		log.info("createForm -> ptflNo : " + ptflNo);
		 
		portfolioVO.setPtflNo(ptflNo);
		portfolioBasicVO.setPtflNo(ptflNo);
		log.info("createForm -> ptflNo : " + ptflNo);
		
		portfolioVO.setPortfolioBasicVO(portfolioBasicVO);
		
		int result = this.portfolioService.createForm(portfolioVO);
		log.info("createForm -> result : " + result);
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		model.addAttribute("memId",memId);
		
		return "redirect:/memberPortfolio/portfolioList";
	}

	// 자기소개서 자유양식 등록
	@PostMapping("/portfolioFreeCreateForm")
	public String freeCreateForm(PortfolioVO portfolioVO , Model model) {
		//PortfolioVO(ptflNo=null, memId=a111, ptflTitle=자기소개서 제목, ptflWritingDt=null, ptflUpdtDt=null, rnum=null, uploadFile=null, portfolioBasicVO=null, portfolioFreeVOList=[
		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문1, ptflFreea=답변2), 
		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문2, ptflFreea=답변2)])
		log.info("portfolioVO : " + portfolioVO);
		
		String ptflNo = this.portfolioService.getPtflNo();
		log.info("freeCreateForm -> ptflNo : " + ptflNo);
		portfolioVO.setPtflNo(ptflNo);
		
		PortfolioFreeVO portfolioFreeVO = new PortfolioFreeVO();
		portfolioFreeVO.setPtflNo(ptflNo);
		log.info("freeCreateForm -> ptflNo : " + ptflNo);	
		
		int result = this.portfolioService.freeCreateForm(portfolioVO);
		log.info("freeCreateForm -> result : " + result);
		
		//redirect
		return "redirect:/memberPortfolio/portfolioList";
	}
	
	// 자기소개서 상세보기
	@GetMapping("/portfolioDetail")
	public String detail(PortfolioVO portfolioVO, Model model) {
		log.info("portfolioVO -> detail : "+portfolioVO);
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		PortfolioVO portVO = this.portfolioService.detail(portfolioVO.getPtflNo());
		log.info("portVO -> detail : "+portVO);

		model.addAttribute("memId",memId);
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("portfolioVO",portVO);
		
		 return "mypageMem/portfolioDetail";
	}
	
	// 자기소개서 자유양식 상세보기
	@GetMapping("portfolioFreeDetail")
	public String freeDetail(PortfolioVO portfolioVO, Model model) {
		log.info("freeDetail -> detail : "+portfolioVO);
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		PortfolioVO portfolioFreeVO = this.portfolioService.freeDetail(portfolioVO.getPtflNo());
		log.info("freeFormVO -> detail : "+portfolioFreeVO);

		model.addAttribute("memId",memId);
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("portfolioVO",portfolioFreeVO);
		
		 return "mypageMem/portfolioFreeDetail";
		
	}
	
	// 자기소개서 수정 화면
	@GetMapping("/portfolioUpdate")
	public String update(PortfolioVO portfolioVO, Model model) {
		
		PortfolioVO portfolioVO2 = this.portfolioService.detail(portfolioVO.getPtflNo());
		log.info("portfolioVO -> update : "+portfolioVO2);

		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("portfolioVO",portfolioVO2);
		
		return "mypageMem/portfolioUpdate";
	}
	
	// 자기소개서 수정
	@PostMapping("/portfolioUpdatePost")
	public String updatePost(PortfolioVO portfolioVO, PortfolioBasicVO portfolioBasicVO) {
		log.info("updatePost->portfolioVO : " + portfolioVO);
		
		int result = this.portfolioService.updatePost(portfolioVO);
		log.info("updatePost->result : " + result);
		
			result += this.portfolioService.portBasicUpdate(portfolioBasicVO);
		
		return "redirect:/memberPortfolio/portfolioDetail?ptflNo="+portfolioVO.getPtflNo();
	}
	
	// 자기소개서 자유양식 수정 화면
	@GetMapping("/portfolioFreeUpdate")
	public String freeUpdate(PortfolioVO portfolioVO, Model model) {
			
		PortfolioVO portfolioVO2 = this.portfolioService.freeDetail(portfolioVO.getPtflNo());
		log.info("portfolioVO -> freeUpdate : "+portfolioVO2);

		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		model.addAttribute("memberVO",memberVO);
		model.addAttribute("portfolioVO",portfolioVO2);
		
		return "mypageMem/portfolioFreeUpdate";
	}
	
	// 자기소개서 자유양식 수정
	@PostMapping("/portfolioFreeUpdatePost")
	public String freeUpdatePost(PortfolioVO portfolioVO, PortfolioFreeVO portfolioFreeVO) {
		/*
		freeUpdatePost->portfolioVO : PortfolioVO(ptflNo=PTF00020, memId=b111, ptflTitle=11122, ptflWritingDt=null, ptflUpdtDt=null, rnum=null
		, gubun=null, uploadFile=null, portfolioBasicVO=null, portfolioFreeVOList=[
			PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=1, ptflFreea=11), 
			PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=2, ptflFreea=22)])
		 */
		log.info("freeUpdatePost->portfolioVO : " + portfolioVO);
		
		int result = this.portfolioService.freeUpdatePost(portfolioVO);
		log.info("freeUpdatePost->result : " + result);
		
		return "redirect:/memberPortfolio/portfolioFreeDetail?ptflNo="+portfolioVO.getPtflNo();
	}
	
	// 자기소개 삭제
	@PostMapping("/portfolioDeletePost")
	public String deletePost(PortfolioVO portfolioVO) {
		log.info("deletePost -> portfolioVO : " + portfolioVO);
		
		int result = this.portfolioService.deletePost(portfolioVO);
		log.info("deletePost -> result : " + result);
		
		return "redirect:/memberPortfolio/portfolioList";
	}

}
