package jobja.mypage.member.mapper;

import java.util.Map;

public interface ConAprvMapper {
	
	//마이페이지 상담사 신청
	public int ajaxApplyCon(Map<String, Object> map);
	
	//상담사 신청 후 회원테이블 승인 컬럼 승인 대기로 바꿈.
	public int updateMemApproval(String memId);
	

}
