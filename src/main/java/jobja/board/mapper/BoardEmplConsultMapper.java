package jobja.board.mapper;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardEmplConsultVO;

public interface BoardEmplConsultMapper {

	// 게시판 리스트
	public List<BoardEmplConsultVO> list(Map<String,Object> map);

	// 글 생성
	public int createPost(BoardEmplConsultVO boardEmplConsultVO);
	
	// 전체 행
	public int getTotal(Map<String, Object> map);

	// 조회수 증가
	public int countUpHit(BoardEmplConsultVO boardEmplConsultVO);

	// 게시글 상세
	public BoardEmplConsultVO detail(String boardId);

	//파일 삭제
	public int delAtch(String boardId);
	
	//파일 dt테이블 삭제
	public int delAtchdt(String boardId);

	// 게시글 수정
	public int updatePost(BoardEmplConsultVO boardEmplConsultVO);

	// 게시글 삭제
	public int deletePost(BoardEmplConsultVO boardEmplConsultVO);
	
}
