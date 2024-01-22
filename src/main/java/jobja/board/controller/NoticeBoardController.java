package jobja.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.board.service.NoticeBoardService;
import jobja.board.vo.NoticeBoardVO;
import jobja.util.ArticlePage;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/noticeBoard")
@Controller
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardService noticeBoardService;
	
	@Autowired
	ModelAttributeUtil modelAttributeUtil;
	
	// 공지사항 목록
	 @GetMapping("/list")
	   public String list(Model model,
			   @RequestParam(value="keyword",required=false) String keyword,	
			   @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			   ) {
			//list->keyword : null
			log.info("list->keyword : " + keyword);
			log.info("list->currentPage : " + currentPage);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("keyword",keyword);
			map.put("currentPage",currentPage);
			
			List<NoticeBoardVO> noticeVOList = this.noticeBoardService.list(map);
			log.info("list->noticeVOList : " + noticeVOList);
			
			int total = this.noticeBoardService.getTotal(map);
			log.info("list->total : " + total);
			
			ArticlePage<NoticeBoardVO> data 
				= new ArticlePage<NoticeBoardVO>(total, currentPage, 10, 5, noticeVOList);

			data.setUrl("/noticeBoard/list");
			
			model.addAttribute("keyword", keyword);
			model.addAttribute("data", data);
			
	      return "noticeBoard/list";
	   }
	 
	 @GetMapping("/create")
	 public String create() {
		 
		 return "noticeBoard/create";
	 }
	 
	 // 공지사항 등록
	 @PostMapping("/createForm")
	 public String createForm(NoticeBoardVO noticeVO) {
		 
		String boardId = this.noticeBoardService.getBoardId();
		log.info("createForm -> BoardId : " + boardId);
		 
		noticeVO.setBoardId(boardId);
		log.info("createForm -> noticeVO : " + noticeVO);
		 
		int result = this.noticeBoardService.createForm(noticeVO);
		log.info("noticeVO : " + result);
		
		return "redirect:/noticeBoard/list";
	 }
	 
	 // 공지사항 상세보기
	 @GetMapping("/detail")
	 public String detail(NoticeBoardVO noticeBoardVO, Model model, String boardId) {
		 log.info("noticeBrd => detail : "+ noticeBoardVO);
		 
		 // 이전글,다음글 가져오기
		 NoticeBoardVO noticeVO = this.noticeBoardService.detail(noticeBoardVO);
		 log.info("noticeBrd => detail : " + noticeVO);
		 
		 model.addAttribute("data", noticeVO);
	 
		 return "noticeBoard/detail";
	 }
	 
	 // 공지사항 이전글, 다음글 번호 가져오기
	 @ResponseBody
	 @PostMapping("/detailPreNext")
	 public NoticeBoardVO detailPreNext(@RequestBody NoticeBoardVO noticeBoardVO) {
		 log.info("detailPreNext => noticeBoardVO : "+ noticeBoardVO);
		 
		 // 이전글,다음글 가져오기
		 NoticeBoardVO noticeVO = this.noticeBoardService.detailPreNext(noticeBoardVO);
		 log.info("detailPreNext => noticeBoardVO : " + noticeVO);
		 
		 return noticeVO;
	 }

	// 공지사항 수정 화면
	 @GetMapping("/detailUpdate")
	public String detailUpdate(NoticeBoardVO noticeBoardVO, Model model) {
		
		noticeBoardVO = this.noticeBoardService.detail(noticeBoardVO);
		
		log.info("detailUpdate -> noticeBoardVO :" + noticeBoardVO);
		
		model.addAttribute("noticeBoardVO", noticeBoardVO);
		
		return "noticeBoard/update";
	}
	 
	 // 공지사항 수정
	@PostMapping("/updatePost")
	public String updatePost(NoticeBoardVO noticeVO) {
		log.info("updatePost->noticeVO : " + noticeVO);
		
		int result = this.noticeBoardService.updatePost(noticeVO);
		
		log.info("updatePost->result : " + result);
		
		//redirect : URI재요청
		return "redirect:/noticeBoard/detail?boardId="+noticeVO.getBoardId();
	}
	 
	// 공지사항 삭제
	@PostMapping("/deletePost")
	public String deletePost(NoticeBoardVO noticeVO) {
		log.info("deletePost->noticeVO : vovovovovo " + noticeVO);
		
		//첨부파일테이블 삭제 후 근무테이블 삭제
		int result = this.noticeBoardService.deletePost(noticeVO);
		log.info("deletePost->result : rrrr " + result);
		
		//redirect : URI재요청
		return "redirect:/noticeBoard/list";
	}

}
