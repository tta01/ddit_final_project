package jobja.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jobja.member.mapper.PortfolioMapper;
import jobja.member.service.PortfolioService;
import jobja.member.vo.PortfolioBasicVO;
import jobja.member.vo.PortfolioFreeVO;
import jobja.member.vo.PortfolioVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PortfolioServiceImpl implements PortfolioService {
	
	@Autowired
	PortfolioMapper portfolioMapper;
	
	// 자기소개서 목록
	@Override
	public List<PortfolioVO> list(Map<String, Object> map) {
		return this.portfolioMapper.list(map);
	}

	// 총 페이지 수
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.portfolioMapper.getTotal(map);
	}
	
	// 자기소개서 기본양식 등록
	@Transactional
	@Override
	public int createForm(PortfolioVO portfolioVO) {

	    // 공통 등록
	    int result = this.portfolioMapper.createForm(portfolioVO);
	    log.debug("portfolioVO : {}", portfolioVO);
	    
	    // 기본양식 등록
	    	result += this.portfolioMapper.portBasicCreate(portfolioVO.getPortfolioBasicVO());
	    	log.debug("portfolioVO.getPortfolioBasicVO : {}", portfolioVO.getPortfolioBasicVO());

	    return result;
	}

	// 자기소개서 자유양식 등록
	@Transactional
	@Override
	public int freeCreateForm(PortfolioVO portfolioVO) {
		//PortfolioVO(ptflNo=null, memId=a111, ptflTitle=자기소개서 제목, ptflWritingDt=null, ptflUpdtDt=null, rnum=null, uploadFile=null, portfolioBasicVO=null, portfolioFreeVOList=[
		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문1, ptflFreea=답변2), 
		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문2, ptflFreea=답변2)])
	    // 공통 등록
	    int result = this.portfolioMapper.createForm(portfolioVO);
	    //PortfolioVO(ptflNo=PTF00010, memId=a111, ptflTitle=자기소개서 제목, ptflWritingDt=null, ptflUpdtDt=null, rnum=null, uploadFile=null, portfolioBasicVO=null, portfolioFreeVOList=[
  		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문1, ptflFreea=답변2), 
  		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문2, ptflFreea=답변2)])
  	    // 공통 등록

	    	    
	    // 자유 등록
	    //	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문1, ptflFreea=답변2), 
  		//	PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=질문2, ptflFreea=답변2)])
	    List<PortfolioFreeVO> portfolioFreeVOList = portfolioVO.getPortfolioFreeVOList();
	    
	    for(PortfolioFreeVO portfolioFreeVO : portfolioFreeVOList) {
	    	portfolioFreeVO.setPtflNo(portfolioVO.getPtflNo());
	    	portfolioFreeVO.setMemId(portfolioVO.getMemId());
	    	
		    result += this.portfolioMapper.portFreeCreate(portfolioFreeVO);
	    	log.debug("portfolioVO.portfolioVO : {}", portfolioVO);
	    }
	    
	    return result;
	}
	
	// 자기소개서 기본키 +1
	@Override
	public String getPtflNo() {
		return this.portfolioMapper.getPtflNo();
	}

	// 자기소개서 상세보기
	@Override
	public PortfolioVO detail(String ptflNo) {
		return this.portfolioMapper.detail(ptflNo);
	}

	// 자기소개서 자유양식 상세보기
	@Override
	public PortfolioVO freeDetail(String ptflNo) {
		return this.portfolioMapper.freeDetail(ptflNo);
	}
	
	// 자기소개 공통 수정
	@Override
	public int update(PortfolioVO portfolioVO) {
		return this.portfolioMapper.update(portfolioVO);
	}

	// 자기소개서 수정
	@Transactional
	@Override
	public int updatePost(PortfolioVO portfolioVO) {
		
		int result = this.portfolioMapper.update(portfolioVO);
		
		 	result += this.portfolioMapper.portBasicUpdate(portfolioVO.getPortfolioBasicVO());
		
		return result;
	}

	// 자기소개서 자유양식 수정
	@Transactional
	@Override
	public int freeUpdatePost(PortfolioVO portfolioVO) {
		//1) 자기소개서 변경
		/*
		freeUpdatePost->portfolioVO : PortfolioVO(ptflNo=PTF00020, memId=b111, ptflTitle=11122, ptflWritingDt=null, ptflUpdtDt=null, rnum=null
		, gubun=null, uploadFile=null, portfolioBasicVO=null, portfolioFreeVOList=[
			PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=1, ptflFreea=11), 
			PortfolioFreeVO(ptflNo=null, memId=null, ptflFreeq=2, ptflFreea=22)])
		 */
    	int result = this.portfolioMapper.update(portfolioVO);
    	log.info("freeUpdatePost => update : "+portfolioVO);
    	
    	List<PortfolioFreeVO> portfolioFreeVOList = portfolioVO.getPortfolioFreeVOList();
    	log.info("freeUpdatePost => portfolioFreeVO : "+portfolioFreeVOList);

    	//2) 자기소개서 자유 양식 삭제
    	result += this.portfolioMapper.portFreeDelete(portfolioVO);
    	
    	for(PortfolioFreeVO portfolioFreeVO : portfolioFreeVOList ) {
    		//PortfolioFreeVO(ptflNo=PTF00020, memId=null, ptflFreeq=1, ptflFreea=11),
    		portfolioFreeVO.setPtflNo(portfolioVO.getPtflNo());
    		//PortfolioFreeVO(ptflNo=PTF00020, memId=b111, ptflFreeq=1, ptflFreea=11),
	    	portfolioFreeVO.setMemId(portfolioVO.getMemId());
	    	
	    	log.info("freeUpdatePost => portfolioFreeVO : " + portfolioFreeVO);
    		//3) 질문답변들 추가
	    	result += this.portfolioMapper.portFreeCreate(portfolioFreeVO);
    	}
			
		return result;
	}

	// 자기소개서 삭제
	@Override
	public int deletePost(PortfolioVO portfolioVO) {
		
		int result = this.portfolioMapper.deletePost(portfolioVO);
		
		return result;
	}

	// 자기소개서 기본양식 등록
	@Override
	public int portBasicCreate(PortfolioBasicVO portfolioBasicVO) {
		return this.portfolioMapper.portBasicCreate(portfolioBasicVO);
	}
	
	// 자기소개서 기본양식 수정
	@Override
	public int portBasicUpdate(PortfolioBasicVO portfolioBasicVO) {
		return this.portfolioMapper.portBasicUpdate(portfolioBasicVO);
	}

	// 자기소개서 자유양식 수정
	@Override
	public int portFreeUpdate(PortfolioFreeVO portfolioFreeVO) {
		return this.portfolioMapper.portFreeUpdate(portfolioFreeVO);
	}
	
	//마이페이지 상담사신청 -> 자기소개서 가져오기.
	@Override
	public List<PortfolioVO> myPortfolio(String memId) {
		return this.portfolioMapper.myPortfolio(memId);
	}
	
	//마이페이지 상담사 신청 -> 내가 선택한 자소서 가져오기.
	@Override
	public PortfolioVO getCheckPortfolio(String ptflNo) {
		return this.portfolioMapper.getCheckPortfolio(ptflNo);
	}

//	자기소개서(베이직) 모달
	@Override
	public PortfolioBasicVO appPortfolioBasic(PortfolioBasicVO portfolioBasicVO) {
		return this.portfolioMapper.appPortfolioBasic(portfolioBasicVO);
	}

	//자기소개서(자유) 모달
	@Override
	public List<PortfolioFreeVO> appPortfolioFree(PortfolioFreeVO portfolioFreeVO) {
		return this.portfolioMapper.appPortfolioFree(portfolioFreeVO);
	}

}
