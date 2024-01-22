package jobja.mypage.member.mapper;

import java.util.List;

import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.mypage.member.vo.MemberVO;

public interface MemProfileMapper {

	//회원상세정보가져오기.
	public MemberVO detail(String memId);
	
	//직군, 관심키워드 가져오기.
	public List<ComDetCodeInfoVO> comDetCode();
	
	//프로필 수정
	public int mypagePost(MemberVO memberVO);
	
	//기존프로필사진 삭제
	public int delAtch(String boardId);

	//프로필사진 등록
	public int insertAtch(String memId);
	
	//회원테이블에 파일 저장명 추가
	public int updateMyProfile(AtchFileDetailVO atchFileDetailVO);  

}
