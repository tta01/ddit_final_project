package jobja.board.mapper;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardNewsVO;

public interface BoardNewsMapper {

	//등록
	public int createPost(BoardNewsVO boardNewsVO);

	//리스트
	public List<BoardNewsVO> list(Map<String,Object> map);
	
	//조회수 정렬후 리스트
	public List<BoardNewsVO> listOrderBy();

	//디테일
	public BoardNewsVO detail(String boardId);

	//조회수 ++
	public int countUpHit(BoardNewsVO boardNewsVO);

	//전체행수
	public int getTotal(Map<String, Object> map);

	//수정
	public int updatePost(BoardNewsVO boardNewsVO);

	//파일 삭제
	public int delAtch(String boardId);
	
	//파일 dt테이블 삭제
	public int delAtchdt(String boardId);

	//취업 뉴스테이블 삭제
	public int deletePost(BoardNewsVO boardNewsVO);

	public List<BoardNewsVO> getPopularList();
}
