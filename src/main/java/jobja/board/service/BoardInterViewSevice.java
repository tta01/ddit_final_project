package jobja.board.service;

import java.util.List;
import java.util.Map;

import jobja.board.vo.BoardInterViewQNACodeVO;
import jobja.board.vo.BoardInterViewQNAVO;
import jobja.board.vo.BoardInterViewVO;
import jobja.common.vo.ComCodeInfoVO;

public interface BoardInterViewSevice {
	
	//직군코드 가져오기.
	public List<ComCodeInfoVO> comJob();
	
	//인터뷰 리스트
	public List<BoardInterViewVO> listAll(Map<String, Object> map);
	
	public int getTotal(Map<String, Object> map);
	
	public List<BoardInterViewVO> codeList(Map<String, Object> map);
	
	//인터뷰상세내역
	public BoardInterViewVO detail(BoardInterViewVO boardInterViewVO);
	
	//질문코드,내용 가져오기.
	public List<BoardInterViewQNACodeVO> QNACodeList();
	
	//인터뷰 등록
	public int createForm(BoardInterViewVO boardInterViewVO);
	
	//게시물번호 가져오기.
	public String getBoardId();
	
	//인터뷰상세 가져오기.
	public BoardInterViewVO selectUpdate(BoardInterViewVO boardInterViewVO);
	
	//인터뷰상세 수정
	public int updatePost(BoardInterViewVO boardInterViewVO);
	
	//인터뷰 삭제
	public int delete(BoardInterViewVO boardInterViewVO);
	
	//조회수 증가
	public int countUp(String boardId);
	

}
