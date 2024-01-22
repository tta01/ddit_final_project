package jobja.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.vo.AtchFileVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.mypage.member.vo.MemberVO;
import lombok.Data;

@Data
public class BoardEmplConsultVO {
	
	private String boardId;						// 게시물 ID
	private String memId;						// 작성자 ID
	private String boardTitle;					// 게시물 제목
	private String boardCntnt;					// 게시물 내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardWritingDt;				// 작성일시
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date boardUpdtDt;					// 마지막 수정일시
	private String emplConsultAfId;				// 취업상담첨부파일ID
	private int boardCnt;						// 조회수
	private int boardLike;						// 공감수
	private String jobCategoryCd;				// 직군 카테고리 
	
	private MultipartFile[] uploadFile;			
	
	private AtchFileVO atchFileVO;
	
	private String passedTime;
	
	private MemberVO memberVO;
	
	private List<ComCodeInfoVO> comCodeInfoVOList;
	
}
