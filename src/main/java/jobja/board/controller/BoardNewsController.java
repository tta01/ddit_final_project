package jobja.board.controller;

import java.util.Date;
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

import jobja.atchfile.vo.AtchFileVO;
import jobja.board.service.BoardNewsService;
import jobja.board.vo.BoardNewsVO;
import jobja.util.ArticlePage;
import jobja.util.TimeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/news")
public class BoardNewsController {
	
	@Autowired
	BoardNewsService boardNewsService;
	
	@Autowired
	TimeUtil timeUtil;
	
	@GetMapping("/create")
	public String create() {
		
		return "boardnews/newsCreate";
	}
	
	@PostMapping("/createPost")
	public String createPost(BoardNewsVO boardNewsVO) {
		
		log.info("createPost->boardNewsVO : " + boardNewsVO);
	
		int result = this.boardNewsService.createPost(boardNewsVO);
		
		return "redirect:/news/list";
	}
	

	@GetMapping("/list")
	public String list(Model model,@RequestParam(value = "currentPage",required = false,defaultValue="1")int currentPage) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("currentPage", currentPage);
		
		List<BoardNewsVO> data = this.boardNewsService.list(map);
		
		int total = this.boardNewsService.getTotal(map);
		
		ArticlePage<BoardNewsVO> info 
		= new ArticlePage<BoardNewsVO>(total, currentPage, 5, 5, data);
		
		info.setUrl("/news/list");
		
		
		List<BoardNewsVO> dataOrderBy = this.boardNewsService.listOrderBy();
		
		List<BoardNewsVO> popularList = boardNewsService.getPopularList();
		
	    Date date;
	      
	    String passedTime;
	    
		log.info("data : " + data);
	     
		for(int i = 0; i < data.size(); i++) {
	         date = data.get(i).getBoardWritingDt();
	         
	         passedTime = timeUtil.calculateTime(date);
	         
	         data.get(i).setPassedTime(passedTime);
		}
		
		for(int i = 0; i < dataOrderBy.size(); i++) {
			date = dataOrderBy.get(i).getBoardWritingDt();
     
     		passedTime = timeUtil.calculateTime(date);
     
     		dataOrderBy.get(i).setPassedTime(passedTime);
		}
		model.addAttribute("data", data);
		model.addAttribute("info", info);
		model.addAttribute("dataOrderBy", dataOrderBy);
		model.addAttribute("total", total);
		model.addAttribute("popularList", popularList);
		
		return "boardnews/newsList";
	}
	
	@GetMapping("/detail")
	public String detail(BoardNewsVO boardNewsVO,Model model) {
		
		log.info("asdfasdfasdfasdf:" + boardNewsVO);
		
		int hitresult = this.boardNewsService.countUpHit(boardNewsVO);
		
		boardNewsVO = this.boardNewsService.detail(boardNewsVO.getBoardId());
		
		log.info("asdfasdfasdfasdf:" + boardNewsVO);
		
		model.addAttribute("boardNewsVO", boardNewsVO);
		
		return "boardnews/newsDetail";
	}
	
	@GetMapping("/detailUpdate")
	public String detailUpdate(BoardNewsVO boardNewsVO,Model model) {
		
		boardNewsVO = this.boardNewsService.detail(boardNewsVO.getBoardId());
		log.info("asdfasdfasdfasdfzzzzzzzzzzz:" + boardNewsVO.getBoardId());
		model.addAttribute("boardNewsVO", boardNewsVO);
		
		return "boardnews/newsDetailUpdate";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(BoardNewsVO boardNewsVO) {
		
		log.info("boardNewsVO : " +boardNewsVO);
		
		int result = this.boardNewsService.updatePost(boardNewsVO);
		
		return "redirect:/news/detail?boardId="+boardNewsVO.getBoardId();
	}
	
	@PostMapping("/deletePost")
	public String deletePost(BoardNewsVO boardNewsVO) {
		
		int result = this.boardNewsService.deletePost(boardNewsVO);
		
		return "redirect:/news/list";
	}
	
	
	
}
