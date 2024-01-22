package jobja.mypage.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.service.MemberService;
import jobja.mypage.member.vo.AcademicCareerVO;
import jobja.mypage.member.vo.AwardsVO;
import jobja.mypage.member.vo.CareerVO;
import jobja.mypage.member.vo.LanguageVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResultVO;
import jobja.mypage.member.vo.ResumeVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/mypageMem")
@RequestMapping("/memberResume")
public class MemberResumeController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	/**
	 * 이력서 create 페이지 호출하기 위한 메서드
	 * 
	 * @return
	 */
	@GetMapping("/memberCreateResume")
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

		return "mypageMem/memberCreateResume";
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
		
//		return "redirect:/member/list";
		return "redirect:/memberResume/resumeList";
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
		
		map.put("currentPage", currentPage);
		map.put("memId", memId);
		map.put("size", size);
		
		List<ResumeVO> data = this.memberService.resumeList(map);
		List<AtchFileDetailVO> memAtch = this.memberService.atchList(map);

		memberVO.setAtchfileDetailVO(memAtch);
		
		log.info("memberListResume -> data" +data);
		
		log.info("list -> memAtch : " +memAtch);
		log.info("list -> memberVO : " +memberVO);
		
		int total = this.memberService.getTotal(map);
		
		ArticlePage<ResumeVO> info 
			= new ArticlePage<ResumeVO>(total, currentPage, 5, 5, data);
		
		info.setUrl("/memberResume/resumeList");
		
		model.addAttribute("info", info);
		
		log.info("data : " + data);

		model.addAttribute("data", data);
		model.addAttribute("memberVO", memberVO);
		
		return "mypageMem/memberListResume";
	}
	
	/** 선택한 이력서에 대한 Detail정보 가져오기
	 * @param model
	 * @param resumeNo
	 * @return
	 */
	@Transactional
	@GetMapping("/memberDetailResume")
	public String memberDetailResume(Model model, @RequestParam(value = "resumeNo", required = false, defaultValue="RSM00001")String resumeNo) {
		
		// Map 선언
		Map<String,Object> map = new HashMap<String,Object>();
		
		// 공통상세코드
		List<ComCodeInfoVO> comCodeInfoVOList = this.memberService.getComCodeVOList();

		// 현재 로그인한 멤버 아이디 가져오기
		MemberVO memberVO123 = modelAttributeUtil.getCurrentLoginName();
		
		String memId = memberVO123.getMemId();
		
		// map에 사용할 memId, resumeNo put
		map.put("memId", memId);
		map.put("resumeNo", resumeNo);
		
		log.info("memberDetailResume -> resumeNo olisof : " +resumeNo);
		
		// 1)멤버 정보
		MemberVO memberVO = this.memberService.resumeMemberDetail(map);
		// 2) 이력서
		List<ResumeVO> resumeVOList = this.memberService.resumeResumeDetail(map);
		// 3) 학력
		List<AcademicCareerVO> academicCareerVOList = this.memberService.resumeAcademicCareerDetail(map);
		// 4) 경력
		List<CareerVO> careerVOList = this.memberService.resumeCareerDetail(map);
		// 5) 성과
		List<ResultVO> resultVOList = this.memberService.resumeResultDetail(map);
		// 6) 어학
		List<LanguageVO> languageVOList = this.memberService.resumeLanguageDetail(map);
		// 7) 수상
		List<AwardsVO> awardsVOList = this.memberService.resumeAwardsDetail(map);
		
		log.info("memberDetailResume -> memberVO : " +memberVO);
		log.info("memberDetailResume -> resumeVOList : " +resumeVOList);

		String comCd = "";
		String comDetCd = "";
		
		// 이력서 하난데 List로 잘못 선언해서.. 바꾸기 좀 그렇다...
		for (ResumeVO resumeVO : resumeVOList) {
			comCd = resumeVO.getResumeOccp();
			comDetCd = resumeVO.getResumeJob();
		}
		
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.memberService.getComDetCode(comCd);
		
		
		// 1) 멤버
		model.addAttribute("memberVO", memberVO);
		// 2) 이력서
		model.addAttribute("resumeVOList", resumeVOList);
		// 3) 학력
		model.addAttribute("academicCareerVOList", academicCareerVOList);
		// 4) 경력
		model.addAttribute("careerVOList", careerVOList);
		// 5) 성과
		model.addAttribute("resultVOList", resultVOList);
		// 6) 어학
		model.addAttribute("languageVOList", languageVOList);
		// 7) 수상
		model.addAttribute("awardsVOList", awardsVOList);
		
		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);
		
		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);

		log.info("comCodeInfoVOList : " + comCodeInfoVOList);
		log.info("comDetCodeInfoVOList : " + comDetCodeInfoVOList);
		
		return "mypageMem/memberDetailResume";
	}

	@Transactional
	@ResponseBody
	@PostMapping("/ajaxMemberDetailResume")
	public Map<String, Object> ajaxMemberDetailResume(Model model , @RequestBody Map<String, Object> map) {

		log.info("ajaxMemberDetailResume -> map" + map);
		
		
		// 1)멤버 정보
		MemberVO memberVO = this.memberService.resumeMemberDetail(map);
		// 2) 이력서
		List<ResumeVO> resumeVOList = this.memberService.resumeResumeDetail(map);
		// 3) 학력
		List<AcademicCareerVO> academicCareerVOList = this.memberService.resumeAcademicCareerDetail(map);
		// 4) 경력
		List<CareerVO> careerVOList = this.memberService.resumeCareerDetail(map);
		// 5) 성과
		List<ResultVO> resultVOList = this.memberService.resumeResultDetail(map);
		// 6) 어학
		List<LanguageVO> languageVOList = this.memberService.resumeLanguageDetail(map);
		// 7) 수상
		List<AwardsVO> awardsVOList = this.memberService.resumeAwardsDetail(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		
		
		// 1) 멤버
		resultMap.put("memberVO", memberVO);
		// 2) 이력서
		resultMap.put("resumeVOList", resumeVOList);
		// 3) 학력
		resultMap.put("academicCareerVOList", academicCareerVOList);
		// 4) 경력
		resultMap.put("careerVOList", careerVOList);
		// 5) 성과
		resultMap.put("resultVOList", resultVOList);
		// 6) 어학
		resultMap.put("languageVOList", languageVOList);
		// 7) 수상
		resultMap.put("awardsVOList", awardsVOList);
		
		return resultMap;
	}
	
	@Transactional
	@GetMapping("/memberUpdateResume")
	public String memberUpdateResume(ResumeVO resumeVO, Model model, @RequestParam("resumeNo") String resumeNo){
		
		// Map 선언
		Map<String,Object> map = new HashMap<String,Object>();
		
		// 공통상세코드
		List<ComCodeInfoVO> comCodeInfoVOList = this.memberService.getComCodeVOList();
		
		// 현재 로그인한 멤버 아이디 가져오기
		MemberVO memberVO123 = modelAttributeUtil.getCurrentLoginName();
		
		String memId = memberVO123.getMemId();
		
		map.put("memId", memId);
		map.put("resumeNo", resumeNo);
		
		log.info("memberUpdateResume -> resume1111zzxxx : " +resumeNo);
		
		// 1)멤버 정보
		MemberVO memberVO = this.memberService.resumeMemberDetail(map);
		// 2) 이력서
		List<ResumeVO> resumeVOList = this.memberService.resumeResumeDetail(map);
		// 3) 학력
		List<AcademicCareerVO> academicCareerVOList = this.memberService.resumeAcademicCareerDetail(map);
		// 4) 경력
		List<CareerVO> careerVOList = this.memberService.resumeCareerDetail(map);
		// 5) 성과
		List<ResultVO> resultVOList = this.memberService.resumeResultDetail(map);
		// 6) 어학
		List<LanguageVO> languageVOList = this.memberService.resumeLanguageDetail(map);
		// 7) 수상
		List<AwardsVO> awardsVOList = this.memberService.resumeAwardsDetail(map);
		
		log.info("memberDetailResume -> memberVO : " +memberVO);
		
		String comCd = "";
		String comDetCd = "";
		
		// 이력서 하난데 List로 잘못 선언해서.. 바꾸기 좀 그렇다...
		for (ResumeVO resumeVOTemp : resumeVOList) {
			comCd = resumeVOTemp.getResumeOccp();
			comDetCd = resumeVOTemp.getResumeJob();
		}
		
		List<ComDetCodeInfoVO> comDetCodeInfoVOList = this.memberService.getComDetCode(comCd);
		
		model.addAttribute("resumeNo", resumeNo);
		
		// 1) 멤버
		model.addAttribute("memberVO", memberVO);
		// 2) 이력서
		model.addAttribute("resumeVOList", resumeVOList);
		// 3) 학력
		model.addAttribute("academicCareerVOList", academicCareerVOList);
		// 4) 경력
		model.addAttribute("careerVOList", careerVOList);
		// 5) 성과
		model.addAttribute("resultVOList", resultVOList);
		// 6) 어학
		model.addAttribute("languageVOList", languageVOList);
		// 7) 수상
		model.addAttribute("awardsVOList", awardsVOList);
		
		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);
		
		model.addAttribute("comDetCodeInfoVOList", comDetCodeInfoVOList);
		

		
		return "mypageMem/memberUpdateResume";
//		return "mypageMem/memberDetailResume/detail?resumeNo="+resumeNo;
	}
	
	@Transactional
	@RequestMapping(value = "/memberUpdateResumePost")
	public String memberUpdateResumePost(ResumeVO resumeVO, @RequestParam("memId") String memId, @RequestParam("resumeNo") String resumeNo) {
		
		// Map 선언
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memId", memId);
		map.put("resumeNo", resumeNo);
//		map.put("resumeVO", resumeVO);
		
		log.info("memberUpdateResumePost -> resumeVO111zzz : " +resumeVO);
		
		int result = this.memberService.memberUpdateResumePost(map, resumeVO);
		log.info("memberUpdateResumePost -> result : " +result);
		
		return "redirect:/memberResume/memberDetailResume?resumeNo="+resumeNo;
	}
	
	
	@Transactional
	@PostMapping("/memberDeleteResume")
	public String memberDeleteResume(ResumeVO resumeVO) {
		
		// Map 선언
		Map<String,Object> map = new HashMap<String,Object>();
		
		// 현재 로그인한 멤버 아이디 가져오기
		MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
		
		String memId = memberVO.getMemId();
		String resumeNo = resumeVO.getResumeNo();
		
		map.put("memId", memId);
		map.put("resumeNo", resumeNo);
		map.put("resumeVO", resumeVO);
		
		// 1) 어학상세 삭제
		int result = this.memberService.memberDeleteResumeLangDET(map);
		log.info("memberDeleteResumeLangDET1 -> result : " + result);
		
		// 2) 어학 삭제
		result += this.memberService.memberDeleteResumeLang(map);
		log.info("memberDeleteResumeLangDET2 -> result : " + result);
		
		// 3) 수상 삭제
		result += this.memberService.memberDeleteResumeAWD(map);
		log.info("memberDeleteResumeLangDET3 -> result : " + result);
		
		// 4) 성과 삭제
		result += this.memberService.memberDeleteResumeRES(map);
		log.info("memberDeleteResumeLangDET4 -> result : " + result);
		
		// 5) 경력 삭제
		result += this.memberService.memberDeleteResumeCAR(map);
		log.info("memberDeleteResumeLangDET5 -> result : " + result);
		
		// 6) 상담사 신청 삭제
		result += this.memberService.memberDeleteResumeAprv(map);
		log.info("memberDeleteResumeLangDET6 -> result : " + result);

		// 7) 입사지원 삭제
		result += this.memberService.memberDeleteResumeAPPL(map);
		log.info("memberDeleteResumeLangDET7 -> result : " + result);

		// 8) 이력서 삭제
		result += this.memberService.memberDeleteResumeR(map);
		log.info("memberDeleteResumeLangDET8 -> result : " + result);
		
		return "redirect:/memberResume/resumeList";
	}
	
    @PostMapping("/uploadFile")
    @ResponseBody
    public AtchFileDetailVO uploadFile(@RequestParam("uploadFile") MultipartFile[] uploadFile) {
    	
    	log.info("uploadFile -> uploadFile : " +uploadFile);
    	
    	MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
    	memberVO.setUploadFile(uploadFile);
    	
    	log.info("uploadFile -> aaaassssddd : " +memberVO.getUploadFile());
    	AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
        try {
            for (MultipartFile file : uploadFile) {
                if (!file.isEmpty()) {
                	
                	log.info("여기노셈??");
                	
                	atchFileDetailVO = memberService.uploadFileKeyCheck(memberVO);
                    
                    log.info("atchFileDetailVO : 파일으 들어가졌니? " +atchFileDetailVO);
                }
            }

            return atchFileDetailVO;
            
        } catch (Exception e) {
            e.printStackTrace();
            return atchFileDetailVO;
        }
    }
    
    /*
    AtchFileDetailVO(afdSeq=9, afId=a111, ...
     */
    @PostMapping("/deleteFileAjax")
    @ResponseBody
    public String deleteFileAjax(@RequestBody AtchFileDetailVO atchFileDetailVO) {
    	
//    	MemberVO memberVO = modelAttributeUtil.getCurrentLoginName();
    	
    	log.info("deleteFileAjax -> atchFileDetailVO : " +atchFileDetailVO);
    	
    	try {
    		// 서비스를 통해 파일을 데이터베이스에서 삭제
    		int result = memberService.deleteFileAjax(atchFileDetailVO);
    		log.info("deleteFileAjax->result : " + result);
    		
    		return "File deleted successfully!";
    	} catch (Exception e) {
    		e.printStackTrace();
    		return "File deletion failed.";
    	}
    }
    
    

    /** 대표 이력서 설정 메서드
     * @param requestData
     * @return
     */
    @Transactional
    @PostMapping("/resumeRepreAjax")
    public String resumeRepreAjax(@RequestBody Map<String, String> requestData) {
    	
		Map<String,Object> map = new HashMap<String,Object>();
    	
        String resumeNo = requestData.get("resumeNo");
        String memId = requestData.get("memId");
        
		map.put("resumeNo", resumeNo);
		map.put("memId", memId);
        
		log.info("resumeRepreAjax ->  map : " +map);
		
		// 내가 선택한 대표 이력서 말고 나머지를 일반이력서로 set
        int result = memberService.setResumeRepreComm(map);
        log.info("resumeRepreAjax ->  result1 : " +result);
        
        // 내가 선택한 이력서를 대표이력서로 set
        result += memberService.setResumeRepre(map);
        log.info("resumeRepreAjax ->  result2 : " +result);
        
    	
    	return "redirect:/memberResume/resumeList";
    }
    

}