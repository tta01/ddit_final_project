package jobja.mypage.consultant.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.vo.BoardEntReviewVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.item.service.ConsultService;
import jobja.item.service.ItemService;
import jobja.item.vo.ConsultantLogVO;
import jobja.item.vo.ConsultantReviewVO;
import jobja.item.vo.PaymentVO;
import jobja.member.service.PortfolioService;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.PortfolioBasicVO;
import jobja.member.vo.PortfolioFreeVO;
import jobja.member.vo.PortfolioVO;
import jobja.mypage.member.service.MemProfileService;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.AcademicCareerVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.report.service.ReportService;
import jobja.report.vo.ReportVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/consultantMyPage")
@Controller
public class ConsultantMyPageController {

	@Autowired
	MemProfileService memProfileService;
	
	@Autowired
	MemberService memberService;

	@Autowired
	PortfolioService portfolioService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	@Autowired
	ConsultService consultService;
	
	@Autowired
	ReportService reportService;

	@Autowired
	ItemService itemService;
	
	////////////////////////// 프로필 //////////////////////////////////
	/**
	 * 상담사 프로필
	 * @param model
	 * @return
	 */
	@GetMapping("/profile")
	public String profile(Principal principal, Model model) {

		//직군,관심카테고리 가져오기.
		List<ComDetCodeInfoVO> comDetCodeInfoVO = this.memProfileService.comDetCode();
		
		log.info("memberMyPage -> comDetCodeInfoVO : " + comDetCodeInfoVO);
		
		String memId = principal.getName();
		
		log.info("memberMyPage -> memId : " + memId);
		
		MemberVO memberVO = this.memProfileService.detail(memId);
		
		log.info("memberMyPage -> memberVO : " + memberVO);
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("comDetCode", comDetCodeInfoVO);
		
		return "mypageCon/profile";
		
	}

	////////////////////////// 파일함 //////////////////////////////////
	/**
	 * 상담사 파일함
	 * @param model
	 * @return
	 */
	@GetMapping("/filepage")
	public String filePage(Model model) {
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		List<AtchFileDetailVO> atchDtVOList = this.memberService.atchDtList(memId);

		memberVO.setAtchfileDetailVO(atchDtVOList);
		
		log.info("list => atchDtVOList : " +atchDtVOList);
		log.info("list => memberVO : " +memberVO);
		
		model.addAttribute("memberVO",memberVO);
		
		return "mypageCon/saveFile";
	}
	

	////////////////////////// 이력서 //////////////////////////////////
	/**
	 * 이력서 create 페이지 호출하기 위한 메서드
	 * 
	 * @return
	 */
	@GetMapping("/createResume")
	public String resumeCreate(Model model) {

		String memId = "";

		// 로그인한 memberVO 정보 가져오기
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();

		// 공통상세코드
		List<ComCodeInfoVO> comCodeInfoVOList = this.memberService.getComCodeVOList();

		// 공통상세코드 (어학)
		List<ComDetCodeInfoVO> comDetCodeLangList = this.memberService.getComDetLangList();

		// 로그인한 사용자 memId 가져오기
		memId = memberVO.getMemId();

		log.info("resumeCreate -> memId : " + memId);

		// 멤버의 학력 가져오기
		List<AcademicCareerVO> academicCareerVOList = this.memberService.getMemAcademicCareerList(memId);

		log.info("resumeCreate -> academicCareerVOList : " + academicCareerVOList);

		log.info("resumeCreate -> comDetCodeLangList : " + comDetCodeLangList);

		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);

		model.addAttribute("comDetCodeLangList", comDetCodeLangList);

		model.addAttribute("memberVO", memberVO);

		model.addAttribute("academicCareerVOList", academicCareerVOList);

		log.info("resumeCreate -> memberVO : " + memberVO);

		return "mypageCon/createResume";
	}
	
	/**
	 * 이력서 create 하기 위한 메서드
	 * 
	 * @param memberVO 멤버안에 이력서, 경력, 학력, 등등 들어가있다
	 * @param model
	 * @return
	 */
	@Transactional
	@PostMapping("/resumeCreatePost")
	public String resumeCreatePost(ResumeVO resumeVO, Model model) {

		log.info("resumeCreatePost -> resumeVO : " + resumeVO);
		// 로그인한 memberVO 정보 가져오기
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		resumeVO.setMemId(memberVO.getMemId());
		
		int result = this.memberService.createResumePost(resumeVO);

		log.info("resumeCreatePost -> resumeVO : " + resumeVO);

		return "redirect:/consultantMyPage/resumeList";
	}

	@ResponseBody
	@PostMapping("/resumeCreateAjax")
	public List<ComDetCodeInfoVO> resumeCreateAjax(Model model, @RequestBody ComCodeInfoVO comCodeInfoVO) {

		String comCd = comCodeInfoVO.getComCd();

		log.info("resumeCreateAjax -> comCd : " + comCd);

		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.memberService.getComDetCode(comCd);

		log.info("resumeCreateAjax -> comDetCodeInfoVOList : " + comDetCodeInfoVOList);

		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);


		return comDetCodeInfoVOList;
	}
	
	

	@GetMapping("/resumeList")
	public String list(Model model, @RequestParam(value = "currentPage",required = false,defaultValue="1")int currentPage) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		int size = 5;
		int pageSize = 5;
		
		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		
		List<ResumeVO> data = this.memberService.resumeList(map);
		List<AtchFileDetailVO> memAtch = this.memberService.atchList(map);

		memberVO.setAtchfileDetailVO(memAtch);
		
		log.info("list -> memAtch : " +memAtch);
		log.info("list -> memberVO : " +memberVO);
		
		int total = this.memberService.getTotal(map);
		
		ArticlePage<ResumeVO> info 
			= new ArticlePage<ResumeVO>(total, currentPage, size, pageSize, data);
		
		info.setUrl("/consultantMyPage/resumeList");
		
		model.addAttribute("info", info);
		
		log.info("data : " + data);
	     
		model.addAttribute("data", data);
		model.addAttribute("memberVO", memberVO);
		
		
		return "mypageCon/resumeList";
	}
	
	////////////////////////// 자기소개서 //////////////////////////////////
	// 자기소개서 목록
	@GetMapping("/portfolioList")
	public String list(PortfolioVO portfolioVO, Model model,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			) {
		
		log.info("list->keyword : " + keyword);
		log.info("list->currentPage : " + currentPage);
		
		int size = 5;
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword",keyword);
		map.put("currentPage",currentPage);
		map.put("memId",memId);
		map.put("size",size);
		
		List<PortfolioVO> portfolioVOList = this.portfolioService.list(map);
		
		log.info("list -> portfolioVOList : "+portfolioVOList);
		
		int total = this.portfolioService.getTotal(map);
		log.info("list->total : " + total);

		ArticlePage<PortfolioVO> data 
				= new ArticlePage<PortfolioVO>(total, currentPage, 5,5, portfolioVOList);
		
		data.setUrl("/consultantMyPage/portfolioList");
		
		model.addAttribute("data",data);
		model.addAttribute("keyword",keyword);
		model.addAttribute("portfolioVOList",portfolioVOList);
		
		return "mypageCon/portfolioList";
	}
	
	// 자기소개 기본양식 등록 화면
	@GetMapping("/portfolioCreate")
	public String create(PortfolioVO portfolioVO, PortfolioBasicVO portfolioBasicVO, Model model) {
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		model.addAttribute("memId",memId);
		
		return "mypageCon/portfolioCreate";
	}
	
	// 자기소개 자유양식 등록 화면
	@GetMapping("/portfolioFreeCreate")
	public String freeCreate(Model model) {
		
		MemberVO memberVO = this.modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		model.addAttribute("memId",memId);
		
		return "mypageCon/portfolioFreeCreate";
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
		
		return "redirect:/consultantMyPage/portfolioList";
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
		return "redirect:/consultantMyPage/portfolioList";
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
		model.addAttribute("portfolioVO",portVO);
		
		 return "mypageCon/portfolioDetail";
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
		model.addAttribute("portfolioVO",portfolioFreeVO);
		
		 return "mypageCon/portfolioFreeDetail";
		
	}
	
	// 자기소개서 수정 화면
	@GetMapping("/portfolioUpdate")
	public String update(PortfolioVO portfolioVO, Model model) {
		
		PortfolioVO portfolioVO2 = this.portfolioService.detail(portfolioVO.getPtflNo());
		log.info("portfolioVO -> update : "+portfolioVO2);
		
		model.addAttribute("portfolioVO",portfolioVO2);
		
		return "mypageCon/portfolioUpdate";
	}
	
	// 자기소개서 수정
	@PostMapping("/portfolioUpdatePost")
	public String updatePost(PortfolioVO portfolioVO, PortfolioBasicVO portfolioBasicVO) {
		log.info("updatePost->portfolioVO : " + portfolioVO);
		
		int result = this.portfolioService.updatePost(portfolioVO);
		log.info("updatePost->result : " + result);
		
			result += this.portfolioService.portBasicUpdate(portfolioBasicVO);
		
		return "redirect:/consultantMyPage/portfolioDetail?ptflNo="+portfolioVO.getPtflNo();
	}
	
	// 자기소개서 자유양식 수정 화면
	@GetMapping("/portfolioFreeUpdate")
	public String freeUpdate(PortfolioVO portfolioVO, Model model) {
			
		PortfolioVO portfolioVO2 = this.portfolioService.freeDetail(portfolioVO.getPtflNo());
		log.info("portfolioVO -> freeUpdate : "+portfolioVO2);
		
		model.addAttribute("portfolioVO",portfolioVO2);
		
		return "mypageCon/portfolioFreeUpdate";
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
		
		return "redirect:/consultantMyPage/portfolioFreeDetail?ptflNo="+portfolioVO.getPtflNo();
	}
	
	// 자기소개 삭제
	@PostMapping("/portfolioDeletePost")
	public String deletePost(PortfolioVO portfolioVO) {
		log.info("deletePost -> portfolioVO : " + portfolioVO);
		
		int result = this.portfolioService.deletePost(portfolioVO);
		log.info("deletePost -> result : " + result);
		
		return "redirect:/consultantMyPage/portfolioList";
	}

	@GetMapping("/calendar")
	public String memCalendar() {
		return "mypageCon/memCalendar";
	}


	//상담사 상담기록 남긴 목록 보기.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@GetMapping("/consultantLog")
	public String consultantLog(Model model, 
			@RequestParam(value = "currentPage",required = false,defaultValue="1") int currentPage,
			@RequestParam(value = "keyword",required = false) String keyword,
			@RequestParam(value = "sort",required = false) String sort) {
		
		log.info("오는 거야? : " );

		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();

		int size = 10;
		int pageSize = 5;
		
		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		log.info("@@@map : " + map);

		List<ConsultantLogVO> consultantLogVOList = consultService.getLogById(map);
		
		int total = this.consultService.getTotalById(map);
		
		ArticlePage<ConsultantLogVO> data 
			= new ArticlePage<ConsultantLogVO>(total, currentPage, size, pageSize, consultantLogVOList, sort);
		
		data.setUrl("/consultantMyPage/consultantLog");
		
		log.info("data : " + data);
	     
		log.info("consultantLogVOList" + consultantLogVOList);

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("consultantLogVOList", consultantLogVOList);
		model.addAttribute("data", data);
		model.addAttribute("total", total);
		
		return "mypageCon/consultantLog";
		
	}

	
	@GetMapping("/consultantHistory")
	public String consultantHistory(Principal principal,Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1")int currentPage
			) {
		int size = 5;
		int pageSize = 5;
		String memId = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", size);
		map.put("memId", memId);
		map.put("currentPage", currentPage);
		

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		log.info("memberVO 기업 정보: " + memberVO);
		
		//기업이 구매한 상품 내역
		List<PaymentVO> paymentVOList = this.itemService.getConsultSales(map);
		
		log.info("ppaymentVOLista ㅇㅇㅇ: " + paymentVOList);
		
		int total = this.itemService.getConsultSalesTotal(map);
		 
		
		ArticlePage<PaymentVO> info = new ArticlePage<PaymentVO>(total, currentPage, size, pageSize, paymentVOList);
		
		//기업 총 구매 금액
		Integer consultTotalSales = this.itemService.getConsultSalesTotalMoney(memberVO.getMemId());
		
		log.info("consultTotalSales  : ㅇㅇ" + consultTotalSales );
		
		info.setUrl("/entPremium/payitems");
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("paymentVOList", paymentVOList);
		model.addAttribute("consultTotalSales", consultTotalSales);
		model.addAttribute("info", info);
		 
		return "mypageCon/consultSalesHistory";
	}
	
	
	@GetMapping("/myConsultReview")
	public String myConsultReview(Model model,
			@RequestParam(value = "currentPage",required = false,defaultValue="1") int currentPage
			) {

		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		int size = 10;
		
		int pageSize = 5;
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		
		List<ConsultantReviewVO> consultantReviewVOList = consultService.getConsultReview(map);
		
		int total = this.consultService.getRevTotalByCnsltntId(map);
		
		ArticlePage<ConsultantReviewVO> data 
		= new ArticlePage<ConsultantReviewVO>(total, currentPage, size, pageSize, consultantReviewVOList);

		data.setUrl("/consultantMyPage/myConsultReview");
		
		model.addAttribute("data", data);
		model.addAttribute("total", total);
		
		return "mypageCon/myConsultReview";
		
	}
	

	@GetMapping("/consultDetail")
	public String consultantLog(Model model, String cnsltntNo) {
			
		log.info("cnsltntNo : " + cnsltntNo);
	
		ConsultantLogVO consultantLogVO = consultService.getConsultBycnsltntNo(cnsltntNo);
		
		model.addAttribute("consultantLogVO", consultantLogVO);
		
		return "mypageCon/consultDetail";
		
	}
		

	@GetMapping("/consultReview")
	public String consultReview(Model model,
			@RequestParam(value = "currentPage",required = false,defaultValue="1") int currentPage,
			@RequestParam(value = "keyword",required = false) String keyword,
			@RequestParam(value = "sort",required = false) String sort) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		int size = 10;
		int pageSize = 5;
		
		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		map.put("keyword", keyword);
		map.put("sort", sort);
	

		log.info("@@@map : " + map);
		
		List<ConsultantReviewVO> consultantReviewVOList = consultService.getCnsltntRevByCnsltntId(map);
		
		int total = this.consultService.getRevTotalByCnsltntId(map);
		
		ArticlePage<ConsultantReviewVO> data 
			= new ArticlePage<ConsultantReviewVO>(total, currentPage, size, pageSize, consultantReviewVOList);
		
		data.setUrl("/consultantMyPage/consultReview");
		
		List<ReportVO> reportVOList = reportService.getReportListById(memId);

		model.addAttribute("consultantReviewVOList", consultantReviewVOList);
		model.addAttribute("reportVOList", reportVOList);
		model.addAttribute("data", data);
		
		return "mypageCon/cnsltntRevList";
		
	}
		

	/**
	 * 리뷰 상세보기
	 * @param model
	 * @return
	 */
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, String reviewNo) {
		
		// 현재 로그인한 회원 정보
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		String memId = memberVO.getMemId();
		
		// 리뷰 목록
		ConsultantReviewVO consultReviewVO = consultService.getConsultRevByReviewNo(reviewNo);
		
		model.addAttribute("memberVO",memberVO);
		model.addAttribute("consultReviewVO",consultReviewVO);
		
		return "mypageCon/consultReviewDetail";
	}

	
}
