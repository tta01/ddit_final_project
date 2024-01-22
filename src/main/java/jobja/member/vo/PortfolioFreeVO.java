package jobja.member.vo;

import lombok.Data;

/**
 * 자기소개서 자유양식
 */
@Data
public class PortfolioFreeVO {

	private String ptflNo;			// 자기소개서 번호
	private String memId;			// 자기소개 작성자
	private String ptflFreeq;		// 자기소개서 자유 질문
	private String ptflFreea;		// 자기소개서 자유 답변
	private String ptflTitle;		// 자소서 제목

	
}
