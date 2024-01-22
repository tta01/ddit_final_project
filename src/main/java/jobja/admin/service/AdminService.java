package jobja.admin.service;

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

public interface AdminService {

   //일반회원 리스트
   public List<MemberVO> getMember(Map<String,Object> map);

   //일반회원 총 수
   public int getTotalMem(Map<String,Object> map);
    
   //멤버 디테일
   public MemberVO getMem(Map<String,Object> map);

   //멤버 삭제
   public int deleteAjax(String memId);

   //멤버 일정관리 삭제
   public int deleteSchedule(String memId);

   //관심기업테이블 멤버 삭제
   public int deleteInterestEnt(String memId);

   //알림 테이블 멤버 삭제
   public int deleteAlarm(String memId);

   //자격증 테이블 멤버 삭제
   public int deleteCertificate(String memId);

   //자기소개서 테이블 멤버 삭제
   public int deletePortfolio(String memId);

   //관심공고 테이블 멤버 삭제
   public int deleteInterestRecruit(String memId);

   //권한 테이블 멤버 삭제
   public int deleteAuth(String memId);
   
   //상품결제 테이블 멤버 삭제
   public int deleteProduct(String memId);

   //상담사회원 총 카운트수
   public int getTotalCounsel(Map<String, Object> map);

   //상담사회원 리스트 
   public List<MemberVO> getCounselor(Map<String, Object> map);

   //상담사회원 신청한 회원 총원수
   public int getTotalCounselOffer(Map<String, Object> map);

   //상담사회원 신청하거나 한적이있는 회원 리스트
   public List<MemberVO> getCounselorOffer(Map<String, Object> map);

   //상담사회원 승인상태 변경
   public int updateYn(Map<String,Object> map);

   //상담사 회원 신청 승인된 인원수
   public int getcsCompleTeCount(Map<String, Object> map);

   //상담사 회원 대기 인원수
   public int getcsWaitCount(Map<String, Object> map);

   //상담사 신청 승인취소 인원수
   public int getcsFalseCount(Map<String, Object> map);

   //상담사 신청 승인된 회원의 리스트
   public List<MemberVO> getCounselorSuccess(Map<String, Object> map);

   //상담사 신청 대기인 회원의 리스트
   public List<MemberVO> getCounselorWaiting(Map<String, Object> map);

   //상담사 신청 취소된 회원의 리스트
   List<MemberVO> getAdminFalseList(Map<String, Object> map);

   //기업회원 총 카운트수
   public int getTotalEnter(Map<String, Object> map);

   //기업회원 리스트
   public List<MemberVO> getEnter(Map<String, Object> map);

   //기업회원신청한 총 인원수
   public int getTotalEnterOffer(Map<String, Object> map);

   //기업회원 신청대기 총 인원
   public int getEnterWaitCount(Map<String, Object> map);

   //기업회원 신청취소 총 인원
   public int getEnterFalseCount(Map<String, Object> map);

   //기업회원 신청한 총 리스트
   public List<MemberVO> getEnterOffer(Map<String, Object> map);

   //기업회원 승인 변경시에 yn바꾸는 코드
   public int updateYn2(Map<String, Object> map);

   //기업회원 승인 대기 리스트 
   public List<MemberVO> getEnterWaiting(Map<String, Object> map);

   //기업회원 승인 거절 리스트
   public List<MemberVO> getAdminEnterFalseList(Map<String, Object> map);

   //총 공고수 가지고오는거
   public int getTotalRecruit(Map<String, Object> map);

   //총 공고 리스트 가지고오는거 
   public List<RecruitVO> getRecruitVOList(Map<String, Object> map);

   //각 채용공고의 직군 직업 가지고오기
   public ComCodeInfoVO getComCode(Map<String, Object> map);

   //선택한 채용공고 삭제하기 
   public int deleteRecruitAjax(String recruitNo);

   //마감임박순 채용공고 리스트
   public List<RecruitVO> getDeadLineRecruitVOList(Map<String, Object> map);

   //연봉순 채용공고 리스트
   public List<RecruitVO> getMoneyRecruitVOList(Map<String, Object> map);

   //총 신고 건수 
   public int getTotalReport(Map<String, Object> map);

   //총 신고 리스트 가지고오기 
   public List<RecruitVO> getReporttVOList(Map<String, Object> map);

   //멤버에서 신고상태 변경
   public int updateReportMem(Map<String, Object> map);

   //신고테이블에서 신고상태 변경
   public int updateReport(Map<String, Object> map);

   //신고테이블에서 신고비고 업데이트
   public int updateReportCnt(Map<String, Object> map);

   //신고테이블에서 신고 승인된 건수
   public int getReport(Map<String, Object> map);

   //신고테이블에서 승인 대기중인 건수
   public int getReportWating(Map<String, Object> map);

   //신고테이블에서 승인 취소인 건수
   public int getReportNo(Map<String, Object> map);

   //신고테이블에서 승인된 리스트
   public List<RecruitVO> getReportSuccessVOList(Map<String, Object> map);

   //신고테이블에서 대기중인 리스트
   public List<RecruitVO> getReportWaitingVOList(Map<String, Object> map);

   //신고테이블에서 취소된 리스트
   public List<RecruitVO> getReportFalseVOList(Map<String, Object> map);

   //블랙리스트로 되어있는 회원의 총인원수
   public int getBlackLists(Map<String, Object> map);

   //신고테이블에서 승인한 후 블랙리스트 테이블에 들어가는쿼리
   public int insertBlackList(Map<String, Object> map);

   //블랙리스트 리스트
   public List<BlackListVO> getBlackList(Map<String, Object> map);

   //블랙리스트 참고사항 업데이트
   public int updateBlackListNote(Map<String, Object> map);

   //블랙리스트 해제 후 멤버테이블에서 상태 바꾸기
   public int updateMemState(Map<String, Object> map);

   //블랙리스트 해제후 블랙리스트 테이블 해제 여부 업데이트
   public int updateBlackList(Map<String, Object> map);

   //블랙리스트 기간 연장
   public int updateBltClrDt(Map<String, Object> map);

   //기간 연장할경우 다시 멤버테이블에서 블랙리스트로 상태 바꾸기
   public int updateMemState2(Map<String, Object> map);

   //기간이 끝나서 블랙리스트 테이블에서 yn 여부가 바뀌는것
   public int updateBlackList2(Map<String, Object> map);

   //공지사항 총 갯수
   public int getTotalNotice(Map<String, Object> map);

   //공지사항 리스트 가지고오기
   public List<NoticeBoardVO> getNoticeBoardList(Map<String, Object> map);
   
   //공지사항 삭제
   public int deleteNotice(Map<String, Object> map);

   //1:1문의 게시글 총 갯수
   public int getTotalInquiry(Map<String, Object> map);

   //1:1문의 게시글 리스트 가지고오기
   public List<BoardInquiryVO> getBoardInquiry(Map<String, Object> map);

   //1:1문의 답변 업로드하기
   public int updateBoardInquiry(Map<String, Object> map);

   //1:1문의 삭제 
   public int deleteBoardInquiry(Map<String, Object> map);

   //1:1문의 답변대기 리스트 count
   public int getTotalWaitInquiry(Map<String, Object> map);

   //1:1문의 답변대기 리스트
   public List<BoardInquiryVO> getWaitInquiryVOList(Map<String, Object> map);

   //1:1문의 답변완료 리스트 count
   public int getTotalPosibleInquiry(Map<String, Object> map);

   //1:1문의 답변완료 리스트
   public List<BoardInquiryVO> getPosibleInquiryVOList(Map<String, Object> map);

   //QnA 리스트 count
   public int getTotalQNA(Map<String, Object> map);

   //QnA 리스트
   public List<BoardQNAVO> getBoardQNAVOList(Map<String, Object> map);

   //QnA 지우기
   public int deleteQnA(Map<String, Object> map);

   //QnA cnt순 리스트
   public List<BoardQNAVO> getBoardQNACntVOList(Map<String, Object> map);

   //QnA like순 리스트
   public List<BoardQNAVO> getBoardQNALikeVOList(Map<String, Object> map);

   //현직자 인터뷰 카운트
   public int getTotalInterview(Map<String, Object> map);

   //현직자 인터뷰 리스트
   public List<BoardInterViewVO> getInterviewList(Map<String, Object> map);

   //현직자 인터뷰 삭제기능
   public int deleteInterview(Map<String, Object> map);

   //강의클래스 카운트
   public int getTotalClass(Map<String, Object> map);

   //강의 클래스 리스트
   public List<BoardClassVO> getClassList(Map<String, Object> map);

   //강의 클래스 직군 가지고오기
   public String getcode(String code);

   //강의 클래스 삭제 
   public int deleteClass(Map<String, Object> map);

   //취업뉴스 카운트
   public int getTotalNews(Map<String, Object> map);

   //취업뉴스 리스트
   public List<BoardNewsVO> getNewsList(Map<String, Object> map);

   //취업뉴스 삭제
   public int deleteNews(Map<String, Object> map);

   //취업상담 리스트
   public List<BoardEmplConsultVO> adminBoardConsult(Map<String, Object> map);

   //취업상담 카운트
   public int getTotalConsult(Map<String, Object> map);
   
   //취업상담 삭제
   public int deleteConsulting(Map<String, Object> map);
   
   //일반회원이 상담사 신청할 때 제출한 이력서
   public String setSubmitResumeNo(String memId);

   //기업직군 가지고오기
   public String getEntSector(String memberId);

   //기업상세
   public MemberVO getEnterDetail(Map<String, Object> map);

   //상담상품 리스트 가지고오기
   public List<ItemVO> getConsultList();

   //일반회원 상세
   public MemberVO getMem2(Map<String, Object> map);

   //상담사회원 상세
   public MemberVO getMem3(Map<String, Object> map);

   //상품테이블 수정
   public int updateitemVO(ItemVO itemVO);

   //상담상품 추가할경우 
   public int insertItemNo(ItemVO itemVO);

   //상담상품 삭제
   public int deleteCItem(ItemVO itemVO);

   //기업상품 리스트
   public List<ItemVO> getEntertList();

   //기업상품 리스트2
   public List<ItemVO> getEnterList2();

   //기업 배너상품 추가
   public int insertBItems(ItemVO itemVO);

   //기업 채용공고상품 추가 
   public int insertRItems(ItemVO itemVO);

   //상담사회원 신천한 사람들 전부 디테일
   public MemberVO getCMem(Map<String, Object> map);

   //매월 새로 가입한 기업회원수
   public List<MemberVO> adminEnterChart();

   //배너광고1주카운트
   public int getb1();

   //배너광고2주카운트
   public int getb2();

   //배너광고3주카운트
   public int getb3();

   //상위노출1주카운트
   public int getr1();

   //상위노출2주카운트
   public int getr2();

   //상위노출3주카운트
   public int getr3();

   //관심기업 5개 리스트가지고오기
   public List<InterestEnterpriseVO> enterInterList();

   //상담사회원이 많은 직군 리스트 가지고오기
   public List<MemberVO> adminCounselChart();

   //상담사회원이 적은 직군 리스트 가지고오기
   public List<MemberVO> adminCounselDChart();

   //3회 상담 상품 구매수 
   public int getc1();

   //5회 상담 상품 구매수
   public int getc2();

   //10회 상담 상품 구매수
   public int getc3();

   //매월 상품으로 버는 매출
   public List<PaymentVO> monthTotal();

   //매월 상담사 상품으로 버는 매출
   public List<PaymentVO> monthCoun();

   //매월 기업 상품으로 버는 매출
   public List<PaymentVO> monthEnter();
   
   //상품을 많이 구매한 기업 
   public List<PaymentVO> enterRank();

   //제일 많은 상담을 하고있는 상담사 
   public List<PaymentVO> counRank();

   //상담사 상품별 총매출 및 총건수
   public List<PaymentVO> counselItemRank();

   //상담사로 회원 변경시 auth 변경
   public int updateAuthC(Map<String, Object> map);

   //상담사회원이 다시 일반회원 으로 될경우 auth변경
   public int updateAuthM(Map<String, Object> map);

   //기업승인 받고 난후 auth변경
   public int updateAuthE(Map<String, Object> map);

   //기업승인 받고 난후  aprv테이블 업데이트
   public int updateAprv(Map<String, Object> map);

   //승인에서 다시 대기할경우 aprv테이블 업데이트
   public int updateAprvW(Map<String, Object> map);

   //승인에서 다시 취소할경우 aprv테이블 업데이트
   public int updateAprvC(Map<String, Object> map);

   //상담사신청후 결과가 update되면 상담사신청테이블 업데이트
   public int updateConApr(Map<String, Object> map);

   //기업회원 승인시 enterprise테이블 승인날짜 업데이트
   public int updateEnterprise(Map<String, Object> map);

   //기업 사업자번호
   public String getEntNo(String memId);

   // 상담사 신청시 받는 자기소개서 열람
   public ConAprvVO ConAprv(Map<String, Object> map);

   //승인요청테이블
   public int updateEnt(Map<String, Object> map);


}