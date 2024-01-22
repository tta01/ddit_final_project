package jobja.mypage.enterprise.mapper;

import java.util.List;

import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.member.vo.EnterpriseVO;
import jobja.mypage.member.vo.MemberVO;

public interface EntProfileMapper {

	// 직급 가져오기
	public List<ComDetCodeInfoVO> comDetCode();
	
	// 산업군 가져오기
	public List<ComCodeInfoVO> comSector();
	
	// 관심키워드 가져오기
	public List<ComDetCodeInfoVO> comIntWord();
	
	// 일반회원 정보 가져오기
	public MemberVO detail(String memId);

	// 기업정보 가져오기
	public EnterpriseVO entDetail(String memId);

	// 일반정보 수정
	public int updatePost(MemberVO memberVO);

	// 기업정보 수정
	public int entUpdatePost(EnterpriseVO enterpriseVO);

	// 첨부파일 삭제
	public int delAtch(String memId);

	// 프로필 등록
	public int insertAtch(String memId);
	
	// 기업 로고 등록
	public int entInsertAtch(String entNo);

	// 프로필 썸네일로 등록
	public int updateThumb(MemberVO memberVO);

	// 기업 로고 썸네일로 등록
	public int entUpdateThumb(EnterpriseVO enterpriseVO);

}
