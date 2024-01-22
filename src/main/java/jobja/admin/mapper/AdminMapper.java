package jobja.admin.mapper;

import java.util.List;
import java.util.Map;

import jobja.blacklist.vo.BlackListVO;
import jobja.board.vo.BoardClassVO;
import jobja.board.vo.BoardEmplConsultVO;
import jobja.board.vo.BoardInquiryVO;
import jobja.board.vo.BoardInterViewVO;
import jobja.board.vo.BoardNewsVO;
import jobja.board.vo.BoardQNAVO;
import jobja.board.vo.NoticeBoardVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.member.vo.InterestEnterpriseVO;
import jobja.mypage.member.vo.ConAprvVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.vo.RecruitVO;

public interface AdminMapper {

	public List<MemberVO> getMember(Map<String,Object> map);

	public int getTotalMem(Map<String,Object> map);

	public MemberVO getMem(Map<String,Object> map);

	public int deleteAjax(String memId);

	public int deleteSchedule(String memId);

	public int deleteInterestEnt(String memId);

	public int deleteAlarm(String memId);

	public int deleteCertificate(String memId);

	public int deletePortfolio(String memId);

	public int deleteInterestRecruit(String memId);

	public int deleteAuth(String memId);

	public int deleteProduct(String memId);

	public int getTotalCounsel(Map<String, Object> map);

	public List<MemberVO> getCounselor(Map<String, Object> map);

	public int getTotalCounselOffer(Map<String, Object> map);

	public List<MemberVO> getCounselorOffer(Map<String, Object> map);

	public int updateYn(Map<String,Object> map);

	public int getcsCompleTeCount(Map<String, Object> map);

	public int getcsWaitCount(Map<String, Object> map);

	public int getcsFalseCount(Map<String, Object> map);

	public List<MemberVO> getCounselorSuccess(Map<String, Object> map);

	public List<MemberVO> getCounselorWaiting(Map<String, Object> map);

	public List<MemberVO> getAdminFalseList(Map<String, Object> map);

	public int getTotalEnter(Map<String, Object> map);

	public List<MemberVO> getEnter(Map<String, Object> map);

	public int getTotalEnterOffer(Map<String, Object> map);

	public int getEnterWaitCount(Map<String, Object> map);

	public int getEnterFalseCount(Map<String, Object> map);

	public List<MemberVO> getEnterOffer(Map<String, Object> map);

	public int updateYn2(Map<String, Object> map);

	public List<MemberVO> getEnterWaiting(Map<String, Object> map);

	public List<MemberVO> getAdminEnterFalseList(Map<String, Object> map);

	public int getTotalRecruit(Map<String, Object> map);

	public List<RecruitVO> getRecruitVOList(Map<String, Object> map);

	public ComCodeInfoVO getComCode(Map<String, Object> map);

	public int deleteRecruitAjax(String recruitNo);

	public List<RecruitVO> getDeadLineRecruitVOList(Map<String, Object> map);

	public List<RecruitVO> getMoneyRecruitVOList(Map<String, Object> map);

	public int getTotalReport(Map<String, Object> map);

	public List<RecruitVO> getReporttVOList(Map<String, Object> map);

	public int updateReportMem(Map<String, Object> map);

	public int updateReport(Map<String, Object> map);

	public int updateReportCnt(Map<String, Object> map);

	public int getReport(Map<String, Object> map);

	public int getReportWationg(Map<String, Object> map);

	public int getReportNo(Map<String, Object> map);

	public List<RecruitVO> getReportSuccessVOList(Map<String, Object> map);

	public List<RecruitVO> getReportWaitingVOList(Map<String, Object> map);

	public List<RecruitVO> getReportFalseVOList(Map<String, Object> map);

	public int getBlackLists(Map<String, Object> map);

	public int insertBlackList(Map<String, Object> map);

	public List<BlackListVO> getBlackList(Map<String, Object> map);

	public int updateBlackListNote(Map<String, Object> map);

	public int updateMemState(Map<String, Object> map);

	public int updateBlackList(Map<String, Object> map);

	public int updateBltClrDt(Map<String, Object> map);

	public int updateMemState2(Map<String, Object> map);

	public int updateBlackList2(Map<String, Object> map);

	public int getTotalNotice(Map<String, Object> map);

	public List<NoticeBoardVO> getNoticeBoardList(Map<String, Object> map);
	
	public int deleteNotice(Map<String, Object> map);

	public int getTotalInquiry(Map<String, Object> map);

	public List<BoardInquiryVO> getBoardInquiry(Map<String, Object> map);

	public int updateBoardInquiry(Map<String, Object> map);

	public int deleteBoardInquiry(Map<String, Object> map);

	public int getTotalWaitInquiry(Map<String, Object> map);

	public List<BoardInquiryVO> getWaitInquiryVOList(Map<String, Object> map);

	public int getTotalPosibleInquiry(Map<String, Object> map);

	public List<BoardInquiryVO> getPosibleInquiryVOList(Map<String, Object> map);

	public int getTotalQNA(Map<String, Object> map);

	public List<BoardQNAVO> getBoardQNAVOList(Map<String, Object> map);

	public int deleteQnA(Map<String, Object> map);

	public List<BoardQNAVO> getBoardQNACntVOList(Map<String, Object> map);

	public List<BoardQNAVO> getBoardQNALikeVOList(Map<String, Object> map);

	public int getTotalInterview(Map<String, Object> map);

	public List<BoardInterViewVO> getInterviewList(Map<String, Object> map);

	public int deleteInterview(Map<String, Object> map);

	public int getTotalClass(Map<String, Object> map);

	public List<BoardClassVO> getClassList(Map<String, Object> map);

	public String getcode(String code);

	public int deleteClass(Map<String, Object> map);

	public int getTotalNews(Map<String, Object> map);

	public List<BoardNewsVO> getNewsList(Map<String, Object> map);

	public int deleteNews(Map<String, Object> map);

	public List<BoardEmplConsultVO> adminBoardConsult(Map<String, Object> map);

	public int getTotalConsult(Map<String, Object> map);

	public int deleteConsulting(Map<String, Object> map);

	//일반회원이 상담사 신청할 때 제출한 이력서
	public String setSubmitResumeNo(String memId);

	public String getEntSector(String memberId);

	public MemberVO getEnterDetail(Map<String, Object> map);

	public List<ItemVO> getConsultList();

	public MemberVO getMem2(Map<String, Object> map);

	public MemberVO getMem3(Map<String, Object> map);

	public int updateitemVO(ItemVO itemVO);

	public int insertItemNo(ItemVO itemVO);

	public int deleteCItem(ItemVO itemVO);

	public List<ItemVO> getEntertList();

	public List<ItemVO> getEnterList2();

	public int insertBItems(ItemVO itemVO);

	public int insertRItems(ItemVO itemVO);

	public MemberVO getCMem(Map<String, Object> map);

	public List<MemberVO> adminEnterChart();

	public int getb1();

	public int getb2();

	public int getb3();

	public int getr1();

	public int getr2();

	public int getr3();

	public List<InterestEnterpriseVO> enterInterList();

	public List<MemberVO> adminCounselChart();

	public List<MemberVO> adminCounselDChart();

	public int getc1();

	public int getc2();

	public int getc3();

	public List<PaymentVO> monthTotal();

	public List<PaymentVO> monthCoun();

	public List<PaymentVO> monthEnter();

	public List<PaymentVO> enterRank();

	public List<PaymentVO> counRank();

	public List<PaymentVO> counselItemRank();

	public int updateAuthC(Map<String, Object> map);

	public int updateAuthM(Map<String, Object> map);

	public int updateAuthE(Map<String, Object> map);

	public int updateAprv(Map<String, Object> map);

	public int updateAprvW(Map<String, Object> map);

	public int updateAprvC(Map<String, Object> map);

	public int updateConApr(Map<String, Object> map);

	public int updateEnterprise(Map<String, Object> map);

	public String getEntNo(String memId);

	public ConAprvVO ConAprv(Map<String, Object> map);

	public int updateEnt(Map<String, Object> map);


}
