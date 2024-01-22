<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">
<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<style>

.body-sub-con{
	height: 700px;
	overflow-y: scroll; 
}
.ent-list-item{
	text-align: center;
}
</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">관심정보</div>
		<ul>
			<li class="active"><a href="/memberInterest/myEnterpriseList">관심 기업</a></li>
			<li><a href="/memberInterest/myRecruit">관심 채용공고</a></li>
		</ul>
	</div>
	
	<div class="mypage-body-con">
	
		<div class="mypage-body-con">
			<div class="sub-title-area">
				<div class="body-sub-title">
					관심기업
				</div>
			</div>
				
			<div class="body-sub-con">
				<!-- 여기서부터 시작 -->
				<c:forEach var="enterpriseVO" items="${data}">
					<div class="ent-list-item">
						<div class="ent-list-left">
							<div class="ent-logo">
								<c:choose>
									<c:when test="${enterpriseVO.entLogo != null && enterpriseVO.entLogo != ''}">
										<img alt="" src="/resources/upload/${enterpriseVO.entLogo}">
									</c:when>
									<c:otherwise>
										<a class="hover_underline" href="/enterprise/${enterpriseVO.entNo}/info">						
												<img alt="" src="/resources/images/ent-logo.png">
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="ent-cont">
								<div class="ent-name">
									<p class="bold">
										<a class="hover_underline" href="/enterprise/${enterpriseVO.entNo}/info">
											${enterpriseVO.entNm}
										</a>
									</p>
									<span class="interest-ent active">
										
									</span>
									<input type="hidden" name="entNo" value="${enterpriseVO.entNo}"/>
								</div>
								<div class="ent-info">
									<p>${enterpriseVO.entSector}</p>
									<div class="v-div-line"></div>
									<p>${fn:split(enterpriseVO.entAddr,' ')[0]} ${fn:split(enterpriseVO.entAddr,' ')[1]}</p>
								</div>
							</div>
						</div>
						
						<div class="ent-list-right">
							<p class="p-13">
									${enterpriseVO.reviewCount}개의 리뷰
							</p>
							<div class="flex align-center justify-center">
								<span class="star star-ssm">
									★★★★★
						            <span style="width: 20%;">★★★★★</span>
						            <input type="range" value="1" step="1" min="1" max="5">
								</span>
								
								<span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.entAvgRate}" pattern="0.0"/></span>
								
							</div>
						
						</div>
						
					</div> <!-- end ent-list-item -->
				</c:forEach>
				
				<div class="pagez">
            		 ${info.getPagingArea()}
          		</div>
			</div>	<!-- end body-sub-con -->
		</div>
	</div>
</div>


<script type="text/javascript">

$(document).ready(function() {
	let rate = document.querySelectorAll(".rate");
	for(let i = 0; i < rate.length; i++){		
		let star =rate[i].previousElementSibling.children[0];
		star.style.width = rate[i].innerText * 20 +'%'; 
	}
	
	$(document).on("click",".interest-ent",function(e) {
		
		let entNo = e.target.parentElement.children.entNo.value;
		console.log("???? : " + entNo);
		
		let data = {
				"entNo" : entNo,
				"memId" : "${getCurrentLoginVO.memId}"
		}
	
		if($(this).hasClass('active')) {
	        $(this).removeClass('active'); // 이미 선택된 경우 클래스 제거
	        
	        $.ajax({
				url: '/memberInterest/ajaxdeleteEnterprise',
				contentType : "application/json;charset=utf-8",
				dataType: 'json',
				type: 'post',
				data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
					alert("삭제 됨");
				},
				error:function(xhr, status, error){
					console.log('Error:', xhr, status, error);
					
				}
				
			});
	        
        
   		 } else {
    	
	        $(this).addClass('active'); // 선택되지 않은 경우 클래스 추가
	        
	        $.ajax({
	        	url: '/memberInterest/ajaxinsertEnterprise',
	        	contentType: "application/json;charset=utf-8",
	        	dataType: 'json',
				type: 'post',
				data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
					alert("다시 들어감");
				},
				error:function(xnr,status,error){
					console.log('Error:', xhr, status, error);
				}
	        });
        
    	}
	
	});
	
});

</script>

