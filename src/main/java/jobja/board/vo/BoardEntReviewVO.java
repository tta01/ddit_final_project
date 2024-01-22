package jobja.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.likes.vo.LikesVO;
import jobja.member.vo.EnterpriseVO;
import lombok.Data;

@Data
public class BoardEntReviewVO {

	private String entRevNo;
	private String entNo;
	private String memId;
	private String entRevWorkYn;
	private String entRevWorkLoc;
	private String jobCategoryCd;
	private String jobCd;
	private int boardLike;
	private String entRevEmplType;
	private String entRevShortReview;
	private String entRevPros;
	private String entRevCons;
	private String entRevWishes;
	private String entRevChances;
	private String entRevWelfare;
	private String entRevBalance;
	private String entRevCulture;
	private String entRevManager;
	private String entRevCeoView;
	private String entRevPotential;
	private String entRevRecomendYn;
	
	private String reviewCount;
	
	private EnterpriseVO enterpriseVO;
	
	private ComCodeInfoVO comCodeVO;				//직군공통코드VO
	private ComDetCodeInfoVO comDetCodeVO;			//직업공통코드VO
	
	private List<LikesVO> likeVOList;				//좋아요 List
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;
	
	private String entNm;			//리뷰남긴 기업이름
	private String memNm;
	
	private String entReviewAvg;	// 리뷰 평균
	
	private int rnum;				// 순번
}