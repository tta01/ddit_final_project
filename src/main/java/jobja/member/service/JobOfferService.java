package jobja.member.service;

import java.util.List;
import java.util.Map;

import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.JobOfferVO;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.report.vo.ReportVO;

public interface JobOfferService {

	List<JobOfferVO> getOffers(MemberVO memberVO);
	
	//마이페이지 일반회원이 제안받은 목록 가져오기
	public List<JobOfferVO> myJobOffer(Map<String, Object> map);
	
	//마이페이지 받은제안 목록에서 클릭한 기업 정보 가져오기.
	public EnterpriseVO ajaxgetJobOfferEnt(String entNo);
	
	//마이페이지 받은제안 총 갯수
	public int getMyJobOfferTotal(Map<String, Object> map);

	//신청리스트
	List<ConAprvVO> getConAprvVo(Map<String, Object> map);

	//신고리스트 
	List<ReportVO> getReportVo(Map<String, Object> map);

}
