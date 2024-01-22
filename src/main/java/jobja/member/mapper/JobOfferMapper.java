package jobja.member.mapper;

import java.util.List;
import java.util.Map;

import jobja.member.vo.EnterpriseVO;
import jobja.member.vo.JobOfferVO;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.report.vo.ReportVO;

public interface JobOfferMapper {

	List<JobOfferVO> getOffers(MemberVO memberVO);
	
	//마이페이지 받은제안 기업 가져오기 (받은제안)
	public List<JobOfferVO> myJobOffer(Map<String, Object> map);
	
	//마이페이지 받은제안 기업에서 클릭한 기업정보가져오기.
	public EnterpriseVO ajaxgetJobOfferEnt(String entNo);
	
	//마이페이지 받은제안 총 갯수
	public int getMyJobOfferTotal(Map<String, Object> map);

	List<ConAprvVO> getConAprvVO(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

	List<ReportVO> getReportVO(Map<String, Object> map);

}
