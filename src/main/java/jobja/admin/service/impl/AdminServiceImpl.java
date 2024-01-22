package jobja.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jobja.admin.mapper.AdminMapper;
import jobja.admin.service.AdminService;
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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> getMember(Map<String,Object> map) {
		
		return this.adminMapper.getMember(map);  
	}

	@Override
	public int getTotalMem(Map<String,Object> map) {
		
		return this.adminMapper.getTotalMem(map);
	}

	@Override
	public MemberVO getMem(Map<String,Object> map) {
		
		return this.adminMapper.getMem(map);
	}

	@Override
	public int deleteAjax(String memId) {
		
		return this.adminMapper.deleteAjax(memId);
	}

	@Override
	public int deleteSchedule(String memId) {
		
		return this.adminMapper.deleteSchedule(memId);
	}

	@Override
	public int deleteInterestEnt(String memId) {
		
		return this.adminMapper.deleteInterestEnt(memId);
	}

	@Override
	public int deleteAlarm(String memId) {
		
		return this.adminMapper.deleteAlarm(memId);
	}

	@Override
	public int deleteCertificate(String memId) {
		
		return this.adminMapper.deleteCertificate(memId);
	}

	@Override
	public int deletePortfolio(String memId) {
		
		return this.adminMapper.deletePortfolio(memId);
	}

	@Override
	public int deleteInterestRecruit(String memId) {
		
		return this.adminMapper.deleteInterestRecruit(memId);
	}

	@Override
	public int deleteAuth(String memId) {
		
		return this.adminMapper.deleteAuth(memId);
	}

	@Override
	public int deleteProduct(String memId) {
		
		return this.adminMapper.deleteProduct(memId);
	}

	@Override
	public int getTotalCounsel(Map<String, Object> map) {
		
		return this.adminMapper.getTotalCounsel(map);
	}

	@Override
	public List<MemberVO> getCounselor(Map<String, Object> map) {
		
		return this.adminMapper.getCounselor(map);
	}

	@Override
	public int getTotalCounselOffer(Map<String, Object> map) {
		
		return this.adminMapper.getTotalCounselOffer(map);
	}

	@Override
	public List<MemberVO> getCounselorOffer(Map<String, Object> map) {
		
		return this.adminMapper.getCounselorOffer(map);
	}

	@Override
	public int updateYn(Map<String,Object> map) {
		
		return this.adminMapper.updateYn(map);
	}

	@Override
	public int getcsCompleTeCount(Map<String, Object> map) {
		
		return this.adminMapper.getcsCompleTeCount(map);
	}

	@Override
	public int getcsWaitCount(Map<String, Object> map) {
		
		return this.adminMapper.getcsWaitCount(map);
	}

	@Override
	public int getcsFalseCount(Map<String, Object> map) {
		
		return this.adminMapper.getcsFalseCount(map);
	}

	@Override
	public List<MemberVO> getCounselorSuccess(Map<String, Object> map) {
		
		return this.adminMapper.getCounselorSuccess(map);
	}

	@Override
	public List<MemberVO> getCounselorWaiting(Map<String, Object> map) {
		
		return this.adminMapper.getCounselorWaiting(map);
	}

	@Override
	public List<MemberVO> getAdminFalseList(Map<String, Object> map) {
		
		return this.adminMapper.getAdminFalseList(map);
	}

	@Override
	public int getTotalEnter(Map<String, Object> map) {
		
		return this.adminMapper.getTotalEnter(map);
	}

	@Override
	public List<MemberVO> getEnter(Map<String, Object> map) {
		
		return this.adminMapper.getEnter(map);
	}

	@Override
	public int getTotalEnterOffer(Map<String, Object> map) {
		
		return this.adminMapper.getTotalEnterOffer(map);
	}

	@Override
	public int getEnterWaitCount(Map<String, Object> map) {
		
		return this.adminMapper.getEnterWaitCount(map);
	}

	@Override
	public int getEnterFalseCount(Map<String, Object> map) {
		
		return this.adminMapper.getEnterFalseCount(map);
	}

	@Override
	public List<MemberVO> getEnterOffer(Map<String, Object> map) {
		
		return this.adminMapper.getEnterOffer(map);
	}

	@Override
	public int updateYn2(Map<String, Object> map) {
		
		return this.adminMapper.updateYn2(map);
	}

	@Override
	public List<MemberVO> getEnterWaiting(Map<String, Object> map) {
		
		return this.adminMapper.getEnterWaiting(map);
	}

	@Override
	public List<MemberVO> getAdminEnterFalseList(Map<String, Object> map) {
		
		return this.adminMapper.getAdminEnterFalseList(map);
	}

	@Override
	public int getTotalRecruit(Map<String, Object> map) {
		
		return this.adminMapper.getTotalRecruit(map);
	}

	@Override
	public List<RecruitVO> getRecruitVOList(Map<String, Object> map) {
		
		return this.adminMapper.getRecruitVOList(map);
	}

	@Override
	public ComCodeInfoVO getComCode(Map<String, Object> map) {
		
		return this.adminMapper.getComCode(map);
	}

	@Override
	public int deleteRecruitAjax(String recruitNo) {
		
		return this.adminMapper.deleteRecruitAjax(recruitNo);
	}

	@Override
	public List<RecruitVO> getDeadLineRecruitVOList(Map<String, Object> map) {
		
		return this.adminMapper.getDeadLineRecruitVOList(map);
	}

	@Override
	public List<RecruitVO> getMoneyRecruitVOList(Map<String, Object> map) {

		return this.adminMapper.getMoneyRecruitVOList(map);
	}

	@Override
	public int getTotalReport(Map<String, Object> map) {
		
		return this.adminMapper.getTotalReport(map);
	}

	@Override
	public List<RecruitVO> getReporttVOList(Map<String, Object> map) {
		
		return this.adminMapper.getReporttVOList(map);
	}

	@Override
	public int updateReportMem(Map<String, Object> map) {
		
		return this.adminMapper.updateReportMem(map);
	}

	@Override
	public int updateReport(Map<String, Object> map) {
		
		return this.adminMapper.updateReport(map);
	}

	@Override
	public int updateReportCnt(Map<String, Object> map) {
		
		return this.adminMapper.updateReportCnt(map);
	}

	@Override
	public int getReport(Map<String, Object> map) {
		
		return this.adminMapper.getReport(map);
	}

	@Override
	public int getReportWating(Map<String, Object> map) {
		
		return this.adminMapper.getReportWationg(map);
	}

	@Override
	public int getReportNo(Map<String, Object> map) {
		
		return this.adminMapper.getReportNo(map);
	}

	@Override
	public List<RecruitVO> getReportSuccessVOList(Map<String, Object> map) {
		
		return this.adminMapper.getReportSuccessVOList(map);
	}

	@Override
	public List<RecruitVO> getReportWaitingVOList(Map<String, Object> map) {
		
		return this.adminMapper.getReportWaitingVOList(map);
	}

	@Override
	public List<RecruitVO> getReportFalseVOList(Map<String, Object> map) {
		
		return this.adminMapper.getReportFalseVOList(map);
	}

	@Override
	public int getBlackLists(Map<String, Object> map) {
		
		return this.adminMapper.getBlackLists(map);
	}

	@Override
	public int insertBlackList(Map<String, Object> map) {
	
		return this.adminMapper.insertBlackList(map);
	}

	@Override
	public List<BlackListVO> getBlackList(Map<String, Object> map) {
		
		return this.adminMapper.getBlackList(map);
	}

	@Override
	public int updateBlackListNote(Map<String, Object> map) {
		
		return this.adminMapper.updateBlackListNote(map);
	}

	@Override
	public int updateMemState(Map<String, Object> map) {
		
		return this.adminMapper.updateMemState(map);
	}

	@Override
	public int updateBlackList(Map<String, Object> map) {
		
		return this.adminMapper.updateBlackList(map);
	}

	@Override
	public int updateBltClrDt(Map<String, Object> map) {
		
		return this.adminMapper.updateBltClrDt(map);
	}

	@Override
	public int updateMemState2(Map<String, Object> map) {
		
		return this.adminMapper.updateMemState2(map);
	}

	@Override
	public int updateBlackList2(Map<String, Object> map) {
		
		return this.adminMapper.updateBlackList2(map);
	}

	@Override
	public int getTotalNotice(Map<String, Object> map) {
		
		return this.adminMapper.getTotalNotice(map);
	}

	@Override
	public List<NoticeBoardVO> getNoticeBoardList(Map<String, Object> map) {
		
		return this.adminMapper.getNoticeBoardList(map);
	}
	
	@Override
	public int deleteNotice(Map<String, Object> map) {
	
		return this.adminMapper.deleteNotice(map);
	}


	@Override
	public int getTotalInquiry(Map<String, Object> map) {
		
		return this.adminMapper.getTotalInquiry(map);
	}

	@Override
	public List<BoardInquiryVO> getBoardInquiry(Map<String, Object> map) {
		
		return this.adminMapper.getBoardInquiry(map);
	}

	@Override
	public int updateBoardInquiry(Map<String, Object> map) {
		
		return this.adminMapper.updateBoardInquiry(map);
	}

	@Override
	public int deleteBoardInquiry(Map<String, Object> map) {
		
		return this.adminMapper.deleteBoardInquiry(map);
	}

	@Override
	public int getTotalWaitInquiry(Map<String, Object> map) {
		
		return this.adminMapper.getTotalWaitInquiry(map);
	}

	@Override
	public List<BoardInquiryVO> getWaitInquiryVOList(Map<String, Object> map) {
		
		return this.adminMapper.getWaitInquiryVOList(map);
	}

	@Override
	public int getTotalPosibleInquiry(Map<String, Object> map) {
	
		return this.adminMapper.getTotalPosibleInquiry(map);
	}

	@Override
	public List<BoardInquiryVO> getPosibleInquiryVOList(Map<String, Object> map) {
		
		return this.adminMapper.getPosibleInquiryVOList(map);
	}

	@Override
	public int getTotalQNA(Map<String, Object> map) {
		
		return this.adminMapper.getTotalQNA(map);
	}

	@Override
	public List<BoardQNAVO> getBoardQNAVOList(Map<String, Object> map) {
		
		return this.adminMapper.getBoardQNAVOList(map);
	}

	@Override
	public int deleteQnA(Map<String, Object> map) {
		
		return this.adminMapper.deleteQnA(map);
	}

	@Override
	public List<BoardQNAVO> getBoardQNACntVOList(Map<String, Object> map) {
		
		return this.adminMapper.getBoardQNACntVOList(map);
	}

	@Override
	public List<BoardQNAVO> getBoardQNALikeVOList(Map<String, Object> map) {
		
		return this.adminMapper.getBoardQNALikeVOList(map);
	}

	@Override
	public int getTotalInterview(Map<String, Object> map) {
		
		return this.adminMapper.getTotalInterview(map);
	}

	@Override
	public List<BoardInterViewVO> getInterviewList(Map<String, Object> map) {
		
		return this.adminMapper.getInterviewList(map);
	}

	@Override
	public int deleteInterview(Map<String, Object> map) {
		
		return this.adminMapper.deleteInterview(map);
	}

	@Override
	public int getTotalClass(Map<String, Object> map) {
		
		return this.adminMapper.getTotalClass(map);
	}

	@Override
	public List<BoardClassVO> getClassList(Map<String, Object> map) {
		
		return this.adminMapper.getClassList(map);
	}

	@Override
	public String getcode(String code) {
		
		return this.adminMapper.getcode(code);
	}

	@Override
	public int deleteClass(Map<String, Object> map) {
	
		return this.adminMapper.deleteClass(map);
	}

	@Override
	public int getTotalNews(Map<String, Object> map) {
		
		return this.adminMapper.getTotalNews(map);
	}

	@Override
	public List<BoardNewsVO> getNewsList(Map<String, Object> map) {
		
		return this.adminMapper.getNewsList(map);
	}

	@Override
	public int deleteNews(Map<String, Object> map) {
		
		return this.adminMapper.deleteNews(map);
	}

	@Override
	public List<BoardEmplConsultVO> adminBoardConsult(Map<String, Object> map) {
		
		return this.adminMapper.adminBoardConsult(map);
	}

	@Override
	public int getTotalConsult(Map<String, Object> map) {
		
		return this.adminMapper.getTotalConsult(map);
	}

	@Override
	public int deleteConsulting(Map<String, Object> map) {
		
		return this.adminMapper.deleteConsulting(map);
	}

	@Override
	public String setSubmitResumeNo(String memId) {
		
		return this.adminMapper.setSubmitResumeNo(memId);
	}

	@Override
	public String getEntSector(String memberId) {
		
		return this.adminMapper.getEntSector(memberId);
	}

	@Override
	public MemberVO getEnterDetail(Map<String, Object> map) {
	
		return this.adminMapper.getEnterDetail(map);
	}

	@Override
	public List<ItemVO> getConsultList() {
		
		return this.adminMapper.getConsultList();
	}

	@Override
	public MemberVO getMem2(Map<String, Object> map) {
		
		return this.adminMapper.getMem2(map);
	}

	@Override
	public MemberVO getMem3(Map<String, Object> map) {
		
		return this.adminMapper.getMem3(map);
	}

	@Override
	public int updateitemVO(ItemVO itemVO) {
		
		return this.adminMapper.updateitemVO(itemVO);
	}

	@Override
	public int insertItemNo(ItemVO itemVO) {
	
		return this.adminMapper.insertItemNo(itemVO);
	}

	@Override
	public int deleteCItem(ItemVO itemVO) {
		
		return this.adminMapper.deleteCItem(itemVO);
	}

	@Override
	public List<ItemVO> getEntertList() {
		
		return this.adminMapper.getEntertList();
	}

	@Override
	public List<ItemVO> getEnterList2() {
		
		return this.adminMapper.getEnterList2();
	}

	@Override
	public int insertBItems(ItemVO itemVO) {
		
		return this.adminMapper.insertBItems(itemVO);
	}

	@Override
	public int insertRItems(ItemVO itemVO) {
		
		return this.adminMapper.insertRItems(itemVO);
	}

	@Override
	public MemberVO getCMem(Map<String, Object> map) {
		
		return this.adminMapper.getCMem(map);
	}

	@Override
	public List<MemberVO> adminEnterChart() {
		
		return this.adminMapper.adminEnterChart();
	}

	@Override
	public int getb1() {
		
		return this.adminMapper.getb1();
	}

	@Override
	public int getb2() {
		
		return this.adminMapper.getb2();
	}

	@Override
	public int getb3() {
		
		return this.adminMapper.getb3();
	}

	@Override
	public int getr1() {
		
		return this.adminMapper.getr1();
	}

	@Override
	public int getr2() {
		
		return this.adminMapper.getr2();
	}

	@Override
	public int getr3() {
		
		return this.adminMapper.getr3();
	}

	@Override
	public List<InterestEnterpriseVO> enterInterList() {
		
		return this.adminMapper.enterInterList();
	}

	@Override
	public List<MemberVO> adminCounselChart() {
		
		return this.adminMapper.adminCounselChart();
	}

	@Override
	public List<MemberVO> adminCounselDChart() {
		
		return this.adminMapper.adminCounselDChart();
	}

	@Override
	public int getc1() {
		
		return this.adminMapper.getc1();
	}

	@Override
	public int getc2() {
		
		return this.adminMapper.getc2();
	}
	
	@Override
	public int getc3() {
		
		return this.adminMapper.getc3();
	}

	@Override
	public List<PaymentVO> monthTotal() {
		
		return this.adminMapper.monthTotal();
	}

	@Override
	public List<PaymentVO> monthCoun() {
		
		return this.adminMapper.monthCoun();
	}

	@Override
	public List<PaymentVO> monthEnter() {
		
		return this.adminMapper.monthEnter();
	}

	@Override
	public List<PaymentVO> enterRank() {
		
		return this.adminMapper.enterRank();
	}

	@Override
	public List<PaymentVO> counRank() {
		
		return this.adminMapper.counRank();
	}

	@Override
	public List<PaymentVO> counselItemRank() {
	
		return this.adminMapper.counselItemRank();
	}

	@Override
	public int updateAuthC(Map<String, Object> map) {
	
		return this.adminMapper.updateAuthC(map);
	}

	@Override
	public int updateAuthM(Map<String, Object> map) {
		
		return this.adminMapper.updateAuthM(map);
	}

	@Override
	public int updateAuthE(Map<String, Object> map) {
		
		return this.adminMapper.updateAuthE(map);
	}

	@Override
	public int updateAprv(Map<String, Object> map) {
		
		return this.adminMapper.updateAprv(map);
	}

	@Override
	public int updateAprvW(Map<String, Object> map) {
	
		return this.adminMapper.updateAprvW(map);
	}

	@Override
	public int updateAprvC(Map<String, Object> map) {
		
		return this.adminMapper.updateAprvC(map);
	}

	@Override
	public int updateConApr(Map<String, Object> map) {
		
		return this.adminMapper.updateConApr(map);
	}

	@Override
	public int updateEnterprise(Map<String, Object> map) {
		
		return this.adminMapper.updateEnterprise(map);
	}

	@Override
	public String getEntNo(String memId) {
		
		return this.adminMapper.getEntNo(memId);
	}

	@Override
	public ConAprvVO ConAprv(Map<String, Object> map) {
		return this.adminMapper.ConAprv(map);
	}

	@Override
	public int updateEnt(Map<String, Object> map) {
		
		return this.adminMapper.updateEnt(map);
	}

}
