package jobja.recruit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.controller.FileController;
import jobja.common.mapper.ComCodeMapper;
import jobja.common.vo.ComCodeInfoVO;
import jobja.common.vo.ComDetCodeInfoVO;
import jobja.item.vo.PaymentVO;
import jobja.member.vo.InterestRecruitVO;
import jobja.mypage.member.vo.MemberVO;
import jobja.recruit.mapper.RecruitMapper;
import jobja.recruit.service.RecruitService;
import jobja.recruit.vo.BenefitsVO;
import jobja.recruit.vo.RecruitFormVO;
import jobja.recruit.vo.RecruitVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class RecruitServiceImpl implements RecruitService {

   @Autowired
   ComCodeMapper comCodeMapper;
   
   @Autowired
   RecruitMapper recruitMapper;
   
   @Autowired
   FileController fileController;
   
   @Override
   public List<ComCodeInfoVO> getComCode() {

      return this.recruitMapper.getComCodeInfo();
      
   }

   @Override
   public List<ComDetCodeInfoVO> getComDetCode(String comCd) {
      
      return this.recruitMapper.getComDetCode(comCd);
   }

   @Override
   public List<ComDetCodeInfoVO> getComCodeInfoa() {
      
      return this.recruitMapper.getComCodeInfoa();
   }

   @Override
   public List<ComDetCodeInfoVO> getComCodeInfob() {
      
      return this.recruitMapper.getComCodeInfob();
   }
   
   // 공통코드 직급 가져오기
   @Override
   public List<ComDetCodeInfoVO> getComCodeInfod() {
	   
	   return this.recruitMapper.getComCodeInfod();
   }

   @Override
   public int createPost(RecruitFormVO recruitFormVO) {

      int result = 0;
      // 채용공고 db에 넣고  recruitNo 가져온
      String recruitThumb = "";
   
      result += this.recruitMapper.createPost(recruitFormVO.getRecruitVO());
      
      
      MultipartFile[] uploadFile1 = recruitFormVO.getRecruitVO().getUploadFile1();
      
      result += this.fileController.uploadFile(recruitFormVO.getRecruitVO().getUploadFile(),recruitFormVO.getRecruitVO().getRecruitNo());
      
      recruitThumb += this.fileController.saveFileInTomcat(uploadFile1,recruitFormVO.getRecruitVO().getRecruitNo());
      
      recruitFormVO.getRecruitVO().setRecruitThumb(recruitThumb);
      
      log.info("이거 여기까지 와야하는데., : " + recruitFormVO);
      
      result +=this.recruitMapper.updateThumb(recruitFormVO.getRecruitVO());
      
      String recruitNo  =recruitFormVO.getRecruitVO().getRecruitNo();
      // 채용공고에서 혜택VO리스트 가져옴
      List<String> BenCDList = recruitFormVO.getBenCd();
      log.info("bencd list ~~~~ : " +BenCDList);
      
      // 가져온 혜택VO들을 db에 넣어줌
      
         recruitFormVO.setBenCd(BenCDList);
         recruitFormVO.setRecruitNo(recruitNo);
         log.info("recruitNo : ~~~~!!@@" +recruitNo);
         result += this.recruitMapper.createBenefits(recruitFormVO);
            
      
      return result;
   }

   @Override
   public List<InterestRecruitVO> getInterestRecruit(MemberVO memberVO) {
      return this.recruitMapper.getInterestRecruit(memberVO);
   }

   @Override
   public List<RecruitVO> getList(Map<String,Object> map) {
      return this.recruitMapper.getList(map);
   }

   @Override
   public String getEntNo(String memId) {

      return this.recruitMapper.getEntNo(memId);
   }

   @Override
   public List<RecruitVO> getEntNm() {
      
      return this.recruitMapper.getEntNm();
   }


   @Override
   public int getTotal(Map<String, Object> map) {
      
      return this.recruitMapper.getTotal(map);
   }

   @Override
   public List<RecruitVO> getScrapList(Map<String, Object> map) {

      return this.recruitMapper.getScrapList(map);
   }

   @Override
   public List<RecruitVO> getDeadlineList(Map<String, Object> map) {
      
      return this.recruitMapper.getDeadlineList(map);
   }

   @Override
   public int getConditionTotal(Map<String, Object> map) {
      
      return this.recruitMapper.getConditionTotal(map);
   }

   @Override
   public List<RecruitVO> getByEntNo(Map<String, Object> map) {
      return recruitMapper.getByEntNo(map);
   }

	@Override
	public RecruitVO getByRecNo(String recruitNo) {
		return recruitMapper.getByRecNo(recruitNo);
	}

	@Override
	public List<BenefitsVO> getBenefits(String recruitNo) {
		return recruitMapper.getBenefits(recruitNo);
	}
	
	//마이페이지 내가 스크랩한 채용공고 가져오기.
	@Override
	public List<RecruitVO> myRecruitList(Map<String, Object> map) {
		return this.recruitMapper.myRecruitList(map);
	}
	
	//마이페이지 내가 스크랩한 채용공고 총 갯수
	@Override
	public int getMyTotal(Map<String, Object> map) {
		return this.recruitMapper.getMyTotal(map);
	}
	
	//마이페이지 내가 스트랩했던 채용공고 삭제
	@Override
	public int ajaxdeleteRecruit(InterestRecruitVO interestRecruitVO) {
		return this.recruitMapper.ajaxdeleteRecruit(interestRecruitVO);
	}
	
	//마이페이지 내가 스크랩했던 채용공고 삭제 후 북마크 체크하면 다시 등록
	@Override
	public int ajaxinsertRecruit(InterestRecruitVO interestRecruitVO) {
		return this.recruitMapper.ajaxinsertRecruit(interestRecruitVO);
	}

	@Override
	public List<RecruitVO> getSrchList(Map<String, Object> map) {
		return recruitMapper.getSrchList(map);
	}

	@Override
	public int getSrchTotal(Map<String, Object> map) {
		return recruitMapper.getSrchTotal(map);
	}

	@Override
	public List<RecruitVO> getPopular5() {
		return recruitMapper.getPopular5();
	}

	@Override
	public List<RecruitVO> getFilterList(List<String> selectStudies, List<String> recruitLevels,
			List<String> recruitLocations, List<String> recruitJobs, String memId, int currentPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RecruitVO> getPopularDesc() {
		return recruitMapper.getPopularDesc();
	}

	@Override
	public List<RecruitVO> recruitList(Map<String, Object> map) {
		return this.recruitMapper.recruitList(map);
	}
	
	//채용공고 상품구매한 기업 LIST 랜덤으로 가져오기.
	@Override
	public List<PaymentVO> getRecruititemEntList() {
		return this.recruitMapper.getRecruititemEntList();
	}
	
	@Override
	public List<RecruitVO> recruitListByMap(Map<String, Object> map) {
		return this.recruitMapper.recruitListByMap(map);
	}

	@Override
	public int recruitListCount(Map<String, Object> map) {
		return recruitMapper.recruitListCount(map);
	}


}










