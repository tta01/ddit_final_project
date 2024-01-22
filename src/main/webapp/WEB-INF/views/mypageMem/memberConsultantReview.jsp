<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.sub-con-inner{
	width: 880px;
	margin: auto;
}
.review-list-con{
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 16px 24px;
	margin-bottom: 16px;
}
.review-pre{
	min-height: 80px;
    overflow-y: auto;
}
.review-hr{
	width: 100%;
	color: #444;
	margin: 16px 0px;
}
</style>



<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">활동내역</div>
		<ul>
			<li><a href="/memberMyActivity/myBoardInquiry">일대일 문의</a></li>
			<li><a href="/memberMyActivity/myBoardQNA">취업 Q&A</a></li>
			<li><a href="/memberMyActivity/myEntReview">기업리뷰</a></li>
			<li class="active"><a href="/memberMyActivity/consultantReview">상담리뷰</a></li>
			<li><a href="/memberMyActivity/counselOffer">상담사회원 신청 내역</a></li>
			<li><a href="/memberMyActivity/reportOffer">신고 신청 내역</a></li>
		</ul>
	</div>
	

	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title"> 
				상담 리뷰
			</div>
		</div>
			
		<div class="body-sub-con">
			
			<div class="sub-con-inner">
			
				<c:forEach var="conReviewVO" items="${consultantReviewVOList}">
					<div class="review-list-con">
						<div class="mb-12 p-15 detail-one-line">
							<p class="bold">이름</p>	 
							<p class="">${conReviewVO.memNm}</p>
						</div>
						<div class="mb-12 p-15 detail-one-line">
							<p class="bold">상담사 이름</p>	 
							<p class="">${conReviewVO.conNm}</p>
						</div>
						<div class="mb-12 p-15 detail-one-line">
							<p class="bold">구매상품</p>	 
							<p class="">${conReviewVO.itemVO.itemIntrcn }</p>
	<%-- 						<p class="">${conReviewVO.itemVO.itemNm}</p> --%>
						</div>
						<div class="mb-12 p-15 detail-one-line">
							<p class="bold">리뷰작성날짜</p>	 
							<p class="">
							<fmt:formatDate value="${conReviewVO.reviewRegDt}" pattern="yyyy-MM-dd"/>
							</p>
						</div>
						<hr class="review-hr"/>
						
						<div class="mb-12 p-15 detail-one-line">
							<p class="bold">리뷰내용</p>	 
							<pre class="review-pre">${conReviewVO.reviewCntnt} </pre>
						</div>
					
					</div>
				</c:forEach>
				
				
			</div><!-- end sub-con-inner -->
			
		</div><!-- end body-sub-con -->
		<div class="pagez">
             ${info.getPagingArea()}
        </div>
		
	</div><!-- end myPagebody-con -->


</div>

