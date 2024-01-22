package jobja.mypage.member.vo;

import java.util.List;

import jobja.common.vo.ComDetCodeInfoVO;
import lombok.Data;

@Data
public class LanguageVO {

	private String langNo;
	private String resumeNo;
	private String langKind;
	private String langLevel;
	private int langSeq;

	// LANGUAGE : LANGUAGE_DT = 1 : N
	private List<LanguageDTVO> languageDTVOList;

	// LANGUAGE : ComCodeInfoVO = 1 : N
	private List<ComDetCodeInfoVO> comDetCodeInfoVO;

}