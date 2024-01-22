package jobja.item.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jobja.atchfile.mapper.AtchFileDetailMapper;
import jobja.atchfile.vo.AtchFileDetailVO;
import jobja.atchfile.vo.AtchFileVO;
import jobja.item.mapper.ItemMapper;
import jobja.item.service.ItemService;
import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	ItemMapper itemMapper;
	
	@Autowired
	AtchFileDetailMapper atchFileDetailMapper;

	@Autowired
	String uploadFolder;
	
	//배너상품 목록 가져오기.
	@Override
	public List<ItemVO> getBannerItemList() {
		return this.itemMapper.getBannerItemList();
	}
	
	//채용공고상품 목록 가져오기.
	@Override
	public List<ItemVO> getRecruitItemList() {
		return this.itemMapper.getRecruitItemList();
	}
	
	//로그인한 회원의 기업정보
	@Override
	public MemberVO getLoginEntInfo(String name) {
		return this.itemMapper.getLoginEntInfo(name);
	}
	//기업회원상품 구매시 PAYMENT 테이블에 INSERT
	@Override
	public int ajaxinsertEntPay(PaymentVO paymentVO) {
		return this.itemMapper.ajaxinsertEntPay(paymentVO);
	}

	@Override
	public List<ItemVO> getConsultItemList() {
		
		return this.itemMapper.getConsultItemList();
	}

	@Override
	public int insertMemPayMent(PaymentVO paymentVO) {
		
		return this.itemMapper.insertMemPayMent(paymentVO);
	}
	
	//배너광고 결제한 기업 정보 가져오기.
	@Override
	public PaymentVO getBannerPayEnt(PaymentVO paymentVO) {
		return this.itemMapper.getBannerPayEnt(paymentVO);
	}
	
	//기업배너사진 없로드
	@Override
	public int ajaxinsertEntFile(PaymentVO paymentVO) {
		
		MultipartFile uploadFile = paymentVO.getUploadFile();
		
		int result = uploadFile(uploadFile, paymentVO.getPayNo());
		
		return result;
	}
	
	//배너 광고 구매 기업 배너이미지
	@Override
	public PaymentVO getBannerImg() {
		return this.itemMapper.getBannerImg();
	}
	
	
	//기업이 구매한 상품 내역
	@Override
	public List<PaymentVO> getEntPayTotalList(Map<String, Object> map) {
		return this.itemMapper.getEntPayTotalList(map);
	}
	
	//기업이 총 구매한 금액
	@Override
	public PaymentVO getEntPayTotalMoney(String entNo) {
		return this.itemMapper.getEntPayTotalMoney(entNo);
	}
	
	@Override
	public int getEntpayTotal(Map<String, Object> map) {
		return this.itemMapper.getEntpayTotal(map);
	}
	
	
	//일반회원이 구매한 상담 상품 내역
	@Override
	public List<PaymentVO> getmemPayitems(Map<String, Object> map) {
		return this.itemMapper.getmemPayitems(map);
	}
	
	@Override
	public int getMyTotal(Map<String, Object> map) {
		return this.itemMapper.getMyTotal(map);
	}
	
	//일반회원이 총 구매한 금액
	@Override
	public PaymentVO getmemPayTotalMoney(String memId) {
		return this.itemMapper.getmemPayTotalMoney(memId);
	}
	
	
	
	
	public int uploadFile(MultipartFile uploadFile, String atchFileId) {
	    log.info("sadfsadf atfileId : " + atchFileId);
	    int result = 0;

	    File uploadPath = new File(uploadFolder, getFolder());
	    if (!uploadPath.exists()) {
	        uploadPath.mkdirs();
	    }

	    if (uploadFile.getOriginalFilename().length() > 0) {
	        AtchFileVO atchFileVO = new AtchFileVO();
	        atchFileVO.setAfId(atchFileId);
	        int a = this.atchFileDetailMapper.insertAtchFile(atchFileVO);
	        log.info("a : " + a);

	        String uploadFileName = uploadFile.getOriginalFilename();
	        UUID uuid = UUID.randomUUID();
	        uploadFileName = uuid.toString() + "_" + uploadFileName;
	        
	        log.info("여기에 uploadFileName : " + uploadFileName);
	        
	        File saveFile = new File(uploadPath, uploadFileName);

	        try (FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "t_" + uploadFileName))) {
	            uploadFile.transferTo(saveFile);

	            AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
	            atchFileDetailVO.setAfId(atchFileId);
	            atchFileDetailVO.setAfdSeq(0);
	            atchFileDetailVO.setAfdSavePath(uploadPath + "/" + uploadFileName);
	            atchFileDetailVO.setAfdSaveNm(getFolder().replaceAll("\\\\", "/") + "/" + uploadFileName);
	            atchFileDetailVO.setAfdOriginNm(uploadFile.getOriginalFilename());
	            atchFileDetailVO.setAfdExtsn(uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1));
	            atchFileDetailVO.setAfdCntnt("");
	            atchFileDetailVO.setAfdFileSize(uploadFile.getSize());

	            result += this.atchFileDetailMapper.insertAtchFileDetail(atchFileDetailVO);
	        } catch (IllegalStateException | IOException e) {
	            log.error(e.getMessage());
	        }
	    }

	    return result;
	}



	private boolean checkImagetype(File file) {
		
		String contentType;
		
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);		
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		
		return false;
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}

	@Override
	public List<PaymentVO> getConsultSales(Map<String, Object> map) {
		return this.itemMapper.getConsultSales(map);
	}

	@Override
	public int getConsultSalesTotal(Map<String, Object> map) {
		return this.itemMapper.getConsultSalesTotal(map);
	}

	@Override
	public Integer getConsultSalesTotalMoney(String memId) {
		return this.itemMapper.getConsultSalesTotalMoney(memId);
	}

	

	


}
