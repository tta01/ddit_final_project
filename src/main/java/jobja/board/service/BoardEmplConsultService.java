package jobja.board.service;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardEmplConsultVO;
import jobja.board.vo.BoardNewsVO;

public interface BoardEmplConsultService {

	// 게시글 리스트 출력
	public List<BoardEmplConsultVO> list(Map<String,Object> map);
	
	// 게시글 등록
	public int createPost(BoardEmplConsultVO boardEmplConsultVO);
	
	//전체 행수 가지고오기
	public int getTotal(Map<String, Object> map);

	//조회수 증가
	public int countUpHit(BoardEmplConsultVO boardEmplConsultVO);

	// 게시글 디테일
	public BoardEmplConsultVO detail(String boardId);

	// 게시글 수정
	public int updatePost(BoardEmplConsultVO boardEmplConsultVO);

	// 게시글 삭제
	public int deletePost(BoardEmplConsultVO boardEmplConsultVO);
}
