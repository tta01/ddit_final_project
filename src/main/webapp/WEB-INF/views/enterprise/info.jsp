<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">

<div class="bg-white">
	<div class="cen">
		
		<div class="ent-logo-box">
			<c:choose>
				<c:when test="${enterpriseVO.entLogo != null}">
					<img alt="" src="/resources/upload/${enterpriseVO.entLogo }">
				</c:when>
				<c:otherwise>
					<img alt="" src="/resources/images/ent-logo.png">				
				</c:otherwise>		
			</c:choose>
		</div>
		<p class="bold p-30 mt-20 mb-9">
			${enterpriseVO.entNm }
		</p>
		<div class="about-company">
			<img alt="" src="/resources/images/star.svg">
			<p class="avg-rate">
				<fmt:formatNumber value="${enterpriseVO.entAvgRate }" pattern="0.0"/>
			</p>
			<div class="info">
				<span>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01000'}">개발</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01001'}">경영/비즈니스</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01002'}">마케팅/광고</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01003'}">디자인</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01004'}">영업</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01005'}">고객 서비스</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01006'}">미디어 콘텐츠</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01007'}">엔지니어링/설계</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01008'}">HR</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01009'}">게임/제작</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01010'}">금융</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01011'}">제조/생산</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01012'}">의료/제약/바이오</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01013'}">교육</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01014'}">물류/무역</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01015'}">법률/법집행</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01016'}">식/음료</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01017'}">건설/시설</c:when> --%>
<%-- 						<c:when test="${enterpriseVO.entSector == 'MWJ01018'}">공공/복지</c:when> --%>
<%-- 					</c:choose> --%>
					${enterpriseVO.comDetCodeInfoVOList[0].comDetCdNm }
				</span>
				<span class="dot">·</span>
				<a class="link-to" href="http://${enterpriseVO.entUrl }">${enterpriseVO.entUrl }</a>
			</div>
		</div>
		
	</div>
	<div class="ent-menu-wrap">
		<div class="cen" style="padding:0">
			<ul class="ent-menu">
				<li class="active"><a href="/enterprise/${enterpriseVO.entNo }/info">기업 정보</a></li>
				<li><a href="/enterprise/${enterpriseVO.entNo }/review">리뷰 <span class="list-length">${totalReviewCount }</span></a></li>
				<li><a href="/enterprise/${enterpriseVO.entNo }/recruit">채용 공고 <span class="list-length">${fn:length(recruitVOList) }</span></a></li>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<div class="ml-auto flex align-center">
						<button class="btn btn-sm bg-sig" onclick="window.location.href='/compare/index?entNo=${enterpriseVO.entNo}'">
							<i class="fa-solid fa-building" style="color: #ffffff; font-size:15px;"></i>
							<span class="color-white bold p-15 ml-7">기업 비교</span>
						</button>
						<button class="btn btn-sm ml-7 p-15 bold
	   						<c:if test='${fn:contains(interestEntVOList, enterpriseVO.entNo)}'>
	   							active
	   						</c:if>
						" id="interest-ent">
							관심기업
						</button>
					</div>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_CONSULTANT')">
					<div class="ml-auto flex align-center">
						<button class="btn btn-sm bg-sig" onclick="window.location.href='/compare/index?entNo=${enterpriseVO.entNo}'">
							<i class="fa-solid fa-building" style="color: #ffffff; font-size:15px;"></i>
							<span class="color-white bold p-15 ml-7">기업 비교</span>
						</button>
						<button class="btn btn-sm ml-7 p-15 bold
	   						<c:if test='${fn:contains(interestEntVOList, enterpriseVO.entNo)}'>
	   							active
	   						</c:if>
						" id="interest-ent">
							관심기업
						</button>
					</div>
				</sec:authorize>
			</ul>
		</div>
	</div>
	
</div>

<div class="cen">
	<div class="ent-tit">
		기업 정보
	</div>
	
	<div class="ent-wrap">
		<div class="ent-info-top">
			<div class="ent-info-top-sector">
				<i class="fa-solid fa-screwdriver-wrench" style="color: #5c5c5c;"></i>
				<div class="ent-info-top-sector-right">
					<p class="ent-info-tit">${enterpriseVO.comDetCodeInfoVOList[0].comDetCdNm }</p>
					<p class="ent-info-sub">산업</p>
				</div>
			</div>
			<div class="ent-info-top-sector">
				<i class="fa-solid fa-person" style="color: #5c5c5c;"></i>
				<div class="ent-info-top-sector-right">
					<p class="ent-info-tit">${enterpriseVO.entEmpcnt }명</p>
					<p class="ent-info-sub">사원수</p>
				</div>
			</div>
			<div class="ent-info-top-sector">
				<i class="fa-solid fa-money-bill-wave" style="color: #5c5c5c;"></i>
				<div class="ent-info-top-sector-right">
					<p class="ent-info-tit">₩ <fmt:formatNumber value="${enterpriseVO.entSales }" pattern="#,###" /> </p>
					<p class="ent-info-sub">매출액</p>
				</div>
			</div>
			<div class="ent-info-top-sector">
				<i class="fa-solid fa-calendar-days" style="color: #5c5c5c;"></i>
				<div class="ent-info-top-sector-right">
					<p class="ent-info-tit">	
						<fmt:formatDate value="${enterpriseVO.entBday }" pattern="yyyy.MM.dd"/>
					</p>
					<p class="ent-info-sub">설립일</p>
				</div>
			</div>
		</div>
		
		<div class="ent-info-bot-sector">
			<div class="ent-info-line">
				<p class="ent-info-subject">대표</p>
				<c:if test="${enterpriseVO.entCeonm == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<p class="ent-info-cont">${enterpriseVO.entCeonm }</p>
			</div>
			<div class="ent-info-line">
				<p class="ent-info-subject">매출</p>
				<c:if test="${enterpriseVO.entSales == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<p class="ent-info-cont"><fmt:formatNumber value="${enterpriseVO.entSales }" pattern="#,###" />원</p>
			</div>
			<div class="ent-info-line">
				<p class="ent-info-subject">팩스번호</p>
				<c:if test="${enterpriseVO.entFax == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<p class="ent-info-cont">${enterpriseVO.entFax}</p>
			</div>
			<div class="ent-info-line">
				<p class="ent-info-subject">주소</p>
				<c:if test="${enterpriseVO.entAddr == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<p class="ent-info-cont">${enterpriseVO.entAddr } ${enterpriseVO.entAddr2 }</p>
			</div>
			<div class="ent-info-line">
				<p class="ent-info-subject">웹사이트</p>
				<c:if test="${enterpriseVO.entUrl == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<p class="ent-info-cont">${enterpriseVO.entUrl }</p>
			</div>
			<div class="ent-info-line">
				<p class="ent-info-subject">소개</p>
				<c:if test="${enterpriseVO.entIntrcn == null}">
					<p class="ent-info-cont">-</p>
				</c:if>
				<pre class="ent-info-cont">${enterpriseVO.entIntrcn }</pre>
			</div>
		</div>
		
	</div>
	<!-- Modal structure -->
	<div id="modal-alert"> <!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
	    <section>
			<p class="alert bold"></p>
        </section>
	</div>
	
</div>

<script type="text/javascript">
	let interestEntBtn = document.querySelector("#interest-ent");
	let entNo = "${enterpriseVO.entNo }";
	let memId = "${getCurrentLoginVO.memId}";
	console.log(interestEntBtn);
	console.log(entNo);
	console.log(memId);
	
	console.log("${interestRecruitVOList}");

	interestEntBtn.addEventListener("click", function(){
		
		if(${getCurrentLoginVO == null}){
			alert("로그인 한 회원만 관심기업을 등록할 수 있습니다.");
			return;
		};
		
		
		interestEntBtn.classList.toggle("active");
		
		data = {
			"entNo" : "${enterpriseVO.entNo }",
			"memId" : "${getCurrentLoginVO.memId}"
		}
		console.log(data);
		$.ajax({
			url : "/enterprise/ajaxInterestEnt",
			data : JSON.stringify(data),
			type : "post",
    		contentType : "application/json;charset=utf-8",
    		dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				console.log("res", res);

				if(res == 1){
					$(".alert").text("관심기업에 추가되었습니다.");
					$("#modal-alert").iziModal('open');					
				}else{
					$(".alert").text("관심기업에서 제거되었습니다.");
					$("#modal-alert").iziModal('open');	
				}
				
			}

		})
		
	})
	
</script>
<script type="text/javascript" src="/resources/js/enterprise.js"></script>