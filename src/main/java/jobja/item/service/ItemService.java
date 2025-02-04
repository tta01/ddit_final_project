package jobja.item.service;

import java.util.List;
import java.util.Map;

import jobja.item.vo.ItemVO;
import jobja.item.vo.PaymentVO;
import jobja.mypage.member.vo.MemberVO;

public interface ItemService {
	
	//배너상품 목록 가져오기
	public List<ItemVO> getBannerItemList();
	//채용공고상품 목록 가져오기
	public List<ItemVO> getRecruitItemList();
	//로그인한 회원의 기업정보
	public MemberVO getLoginEntInfo(String name);
	
	//기업회원상품 구매시 PAYMENT 테이블에 INSERT
	public int ajaxinsertEntPay(PaymentVO paymentVO);

	//상담상품 목록 가져오기
	public List<ItemVO> getConsultItemList();
	
	//상품결제 테이블 insert
	public int insertMemPayMent(PaymentVO paymentVO);
	
	//배너광고 결제한 기업 정보 가져오기.
	public PaymentVO getBannerPayEnt(PaymentVO paymentVO);
	
	//기업 배너 사진 업로드
	public int ajaxinsertEntFile(PaymentVO paymentVO);
	
	//배너광고 구매 기업 배너 이미지
	public PaymentVO getBannerImg();
	
	//기업이 구매한 상품내역
	public List<PaymentVO> getEntPayTotalList(Map<String, Object> map);
	
	//기업이 총 구매한 금액
	public PaymentVO getEntPayTotalMoney(String entNo);
	
	//일반회원이 구입한 상담상품내역
	public List<PaymentVO> getmemPayitems(Map<String, Object> map);
	
	//일반회원이 총 구매한 금액
	public PaymentVO getmemPayTotalMoney(String name);
	
	//일반회원이 구입한 상담상품 총 갯수
	public int getMyTotal(Map<String, Object> map);
	
	//기업회원 상품 구매 총 갯수
	public int getEntpayTotal(Map<String, Object> map);
	
	// 상담회원이 판매한 상품 리스트
	public List<PaymentVO> getConsultSales(Map<String, Object> map);
	
	// 상담회원이 판매한 상품 수
	public int getConsultSalesTotal(Map<String, Object> map);
	
	// 상담회원이 벌어들인 총 금액
	public Integer getConsultSalesTotalMoney(String memId);

}
