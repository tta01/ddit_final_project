package jobja.mypage.member.mapper;

import java.util.List;
import java.util.Map;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.vo.AcademicCareerVO;
import jobja.mypage.member.vo.AwardsVO;
import jobja.mypage.member.vo.CareerVO;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.mypage.member.vo.LanguageDTVO;
import jobja.mypage.member.vo.LanguageVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.mypage.member.vo.ResultVO;
import jobja.mypage.member.vo.ResumeVO;

public interface MemberMapper {
	
	//시큐리티 login
	public MemberVO detail(String username);
	
	//일반회원등록
	public int createPost(MemberVO memberVO);

	// 회원 이력서 생성
	public int createResumePost(ResumeVO resumeVO);

	// 어학 공통코드 리스트 
	public List<ComDetCodeInfoVO> getComDetLangList();

	// 공통코드 리스트
	public List<ComCodeInfoVO> getComCodeVOList();

	// 공통상세코드 리스트
	public List<ComDetCodeInfoVO> getComDetCode(String comCd);

	// 로그인한 멤버의 학력 가져오기
	public List<AcademicCareerVO> getMemAcademicCareerList(String memId);

	// 이력서에 경력 넣기
	public int createCareerPost(CareerVO careerVO);

	// 이력서에 성과 넣기
	public int createResultPost(ResultVO resultVO);

	// 이력서에 활동 및 수상 넣기
	public int createAwardsPost(AwardsVO awardsVO);

	// 이력서에 어학 넣기
	public int createLangPost(LanguageVO languageVO);

	// 이력서에 어학에 어학상세 넣기
	public int createLangDetPost(LanguageDTVO languageDTVO);

	// 멤버의 이력서 리스트 출력
	public List<ResumeVO> resumeList(Map<String, Object> map);

	// 멤버의 이력서 리스트 총 갯수
	public int getTotal(Map<String, Object> map);
	
	// 멤버 이력서 상세 멤버
	public MemberVO resumeMemberDetail(Map<String, Object> map);

	// 멤버 이력서 상세 학력
	public List<AcademicCareerVO> resumeAcademicCareerDetail(Map<String, Object> map);

	// 멤버 이력서 상세 이력서정보
	public List<ResumeVO> resumeResumeDetail(Map<String, Object> map);

	// 멤버 이력서 상세 경력
	public List<CareerVO> resumeCareerDetail(Map<String, Object> map);

	// 멤버 이력서 상세 성과
	public List<ResultVO> resumeResultDetail(Map<String, Object> map);

	// 멤버 이력서 상세 어학
	public List<LanguageVO> resumeLanguageDetail(Map<String, Object> map);

	// 멤버 이력서 상세 수상
	public List<AwardsVO> resumeAwardsDetail(Map<String, Object> map);

	// 멤버 이력서 어학 상세 삭제
	public int memberDeleteResumeLangDET(Map<String, Object> map);

	// 멤버 이력서  어학 삭제
	public int memberDeleteResumeLang(Map<String, Object> map);

	// 멤버 이력서 수상 삭제
	public int memberDeleteResumeAWD(Map<String, Object> map);

	// 멤버 이력서 성과 삭제
	public int memberDeleteResumeRES(Map<String, Object> map);

	// 멤버 이력서 경력 삭제
	public int memberDeleteResumeCAR(Map<String, Object> map);

	// 멤버 이력서 삭제
	public int memberDeleteResumeR(Map<String, Object> map);

	// 멤버 이력서 목록 첨부파일 리스트
	public List<AtchFileDetailVO> atchList(Map<String, Object> map);

	// 내가 선택한 대표 이력서 말고 나머지를 일반이력서로 set
	public int setResumeRepreComm(Map<String, Object> map);

	// 내가 선택한 이력서를 대표이력서로 set
	public int setResumeRepre(Map<String, Object> map);
	
	// 추천 인재 리스트
	public List<MemberVO> getRecommMemList(Map<String, Object> map);

	public int getRecommMemCount(Map<String, Object> map);

	// 기업 첨부파일함 리스트
	public List<AtchFileDetailVO> atchDtList(String memId);

	// ajax 기업 첨부파일함 목록
	public List<AtchFileDetailVO> atchFileDtVO(String memId);
	
	//기업으로 회원가입한 회원 등록
	public int createPostEnt(MemberVO memberVO);
	
	public int memberDeleteResumeAprv(Map<String, Object> map);

	public int memberDeleteResumeAPPL(Map<String, Object> map);

	// 상담사 신청 테이블 목록 가져오기
	public ConAprvVO selectConAprvVO(Map<String, Object> map);

	// 상담사 신청 테이블 삭제
	public int memberDeleteConAprv(Map<String, Object> map);

	// 상담사 신청 테이블 insert
	public int insertConAprv(Map<String, Object> conAprvMap);

	public List<MemberVO> memList(Map<String, Object> map);

	public MemberVO getMemberById(String memId);


}
