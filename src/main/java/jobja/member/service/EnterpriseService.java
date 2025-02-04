package jobja.member.service;

import java.util.List;
import java.util.Map;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.board.vo.BoardEntReviewVO;
import jobja.member.vo.EntAprvVO;
import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.report.vo.ReportVO;

public interface EnterpriseService {
	
	//기업회원등록.
	public int createPost(EnterpriseVO enterpriseVO,MemberVO memberVO);

	public List<EnterpriseVO> getAjaxEntList(EnterpriseVO enterpriseVO);

	public List<EnterpriseVO> list(Map<String, Object> map);

	public List<EnterpriseVO> list5(Map<String, Object> map);

	public List<InterestEnterpriseVO> getInterestEnt(MemberVO memberVO);
	
	public int ajaxInterestEnt(InterestEnterpriseVO interestEnterpriseVO);

	public int ajaxInterestEntAdd(InterestEnterpriseVO interestEnterpriseVO);

	public int ajaxInterestEntDel(InterestEnterpriseVO interestEnterpriseVO);

	public int getStoredEnt(InterestEnterpriseVO interestEnterpriseVO);

	public int count(Map<String, Object> map);

	public EnterpriseVO getOne(Map<String, Object> map);

	public EnterpriseVO getAjaxEntOne(EnterpriseVO enterpriseVO);

	public List<EnterpriseVO> ajaxGetEntOneYearly(EnterpriseVO enterpriseVO);
	
	//마이페이지 스크랩했던 관심기업 가져오기.
	public List<EnterpriseVO> myEntList(Map<String, Object> map);
	
	//마이페이지 스크랩했던 관심기업 삭제.
	public int ajaxdeleteEnterprise(InterestEnterpriseVO interestEnterpriseVO);
	
	//마이페이지 삭제했던 관심기업 다시 추가.
	public int ajaxinsertEnterprise(InterestEnterpriseVO interestEnterpriseVO);

	public int getTotal(Map<String, Object> map);
	
	// 기업 리뷰 목록 가져오기
	public List<BoardEntReviewVO> brdEnterpriseVOList(String entNo);

	// 기업 리뷰 통계 가져오기
	public EnterpriseVO entReviewAvg(String memId);
	
	//마이페이지 스크랩했던 관심기업 총 갯수
	public int getMytotal(Map<String, Object> map);

	//회사이름 가져오기
	public String getEntNm(String entNo);

	//기업회원 신청 리스트 
	public List<EnterpriseVO> getEntOfferList(String memId);

	//기업회원 신고 리스트
	public List<ReportVO> getReportVo(Map<String, Object> map);


}   
