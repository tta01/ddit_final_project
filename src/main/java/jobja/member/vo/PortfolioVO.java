package jobja.member.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
/**
 * 자기소개서 
 */
@Data
public class PortfolioVO { 
	
	private String ptflNo;		// 자기소개서번호
	private String memId;		// 자기소개
	private String ptflTitle;	// 자기소개제목
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ptflWritingDt;	// 작성날짜
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ptflUpdtDt;	// 작성일시\
	
	private String rnum;		// 순번
	
	private String gubun;	//basic과 free 구분
	
	// 파일객체
	private MultipartFile[] uploadFile;
	
	// 자기소개서 : 기본양식 = 1 : 1
	private PortfolioBasicVO portfolioBasicVO;
	
	// 자기소개서 : 자유양식 = 1 : N
	private List<PortfolioFreeVO> portfolioFreeVOList;
	
}
