package jobja.recruit.service;

import java.util.List;
import java.util.Map;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.item.vo.PaymentVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.vo.BenefitsVO;
import jobja.recruit.vo.RecruitFormVO;
import jobja.recruit.vo.RecruitVO;



public interface RecruitService {

	//곧통코드 (직군) 가지고오기
	public List<ComCodeInfoVO> getComCode();
	
	//공통코드 (직업) 가지고오기
	public List<ComDetCodeInfoVO> getComDetCode(String comCd);
	
	//공통코드 (학력) 가지고오기
	public List<ComDetCodeInfoVO> getComCodeInfoa();

	//공통코드 (고용형태) 가지고오기
	public List<ComDetCodeInfoVO> getComCodeInfob();
	
	//공통코드 (직급) 가지고오기
	public List<ComDetCodeInfoVO> getComCodeInfod();
	
	//채용공고 
	public int createPost(RecruitFormVO recruitFormVO);

	public List<InterestRecruitVO> getInterestRecruit(MemberVO memberVO);

	public List<RecruitVO> getList(Map<String,Object> map);

	public String getEntNo(String memId);

	public List<RecruitVO> getEntNm();
	
	//필터처리 
	public List<RecruitVO> getFilterList(List<String> selectStudies, List<String> recruitLevels, List<String> recruitLocations, List<String> recruitJobs, String memId,int currentPage);
	
	//총 행수가지고오기
	public int getTotal(Map<String, Object> map);
	
	//스크랩순으로 리스트 가지고오기
	public List<RecruitVO> getScrapList(Map<String, Object> map);
	
	public List<RecruitVO> getByEntNo(Map<String, Object> map);


	//마감순으로 리스트가지고오기
	public List<RecruitVO> getDeadlineList(Map<String, Object> map);
	
	//조건에 맞는 총 행수가지고오기
	public int getConditionTotal(Map<String, Object> map);

	// 해당 recruitNo에 맞는 채용 공고 하나 가져오기
	public RecruitVO getByRecNo(String recruitNo);

	public List<BenefitsVO> getBenefits(String recruitNo);
	
	//마이페이지 내가 스크랩한  채용공고 가져오기.
	public List<RecruitVO> myRecruitList(Map<String, Object> map);
	
	//마이페이지 내가 스크랩했던 채용공고 삭제
	public int ajaxdeleteRecruit(InterestRecruitVO interestRecruitVO);
	
	//마이페이지 내가 스크랩했던 채용공고 삭제 후 북마크 체크하면 다시 등록
	public int ajaxinsertRecruit(InterestRecruitVO interestRecruitVO);
	
	public List<RecruitVO> getSrchList(Map<String, Object> map);

	public int getSrchTotal(Map<String, Object> map);

	public List<RecruitVO> getPopular5();

	public List<RecruitVO> getPopularDesc();

	// 목록
	public List<RecruitVO> recruitList(Map<String, Object> map);
	
	//채용공고 상품구매한 기업 LIST 랜덤으로 가져오기.
	public List<PaymentVO> getRecruititemEntList();
	
	//마이페이지 내가 스크랩한 채용공고 총 갯수
	public int getMyTotal(Map<String, Object> map);
	
	public List<RecruitVO> recruitListByMap(Map<String, Object> map);

	public int recruitListCount(Map<String, Object> map);

}
