<%@page import="jobja.board.vo.BoardNewsVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/news.css">
<link rel="stylesheet" type="text/css" href="/resources/css/search.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
	
	.hot-recruit-item{
		display:flex;
	}
	.hot-recruit-title {
		margin-bottom:0;
	}
</style>
<div class="cen">
  	
  	<div class="search-main">
  	
	<div class="search-main-left">
		<div class="recruits">
			<div class="div-top">
				<p class="bold">취업 뉴스</p>
				
				<div class="p-20 ml-auto">
	
					<sec:authorize access="hasRole('ROLE_ADMIN')">		
						<button onclick="location.href='/news/create'" class="btn p-14 hover_sig btn-sm ml-auto">뉴스등록</button>
					</sec:authorize>
				</div>
			</div>
			<div class="recruit-list">
<!-- 				<p class="bold p-18 flex align-center justify-center empty-recruit">해당 검색어에 해당하는 채용 공고가 없습니다.</p> -->
				<c:forEach var="boardNewsVO" items="${info.content }">
					<div class="recruit-list-item">
						<div class="recruit-grid" onclick="window.location.href='/news/detail?boardId=${boardNewsVO.boardId}'">
							<div class="recruit-logo pointer" >
							
								<c:choose>
									<c:when test="${boardNewsVO.atchFileVO.atchFileDetailVOList[0].afdSaveNm != null && boardNewsVO.atchFileVO.atchFileDetailVOList[0].afdSaveNm != '' }">
										<img alt="" src="/resources/upload/${boardNewsVO.atchFileVO.atchFileDetailVOList[0].afdSaveNm}">										
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/images/ent-logo.png">
									</c:otherwise>
								</c:choose>
								
							</div>
							<div>
								<p class="ent-keyword-area p-15 bold mb-5 one-line-ellipsis">
									${boardNewsVO.boardTitle}
								</p>
								<p class="time txt-gray p-11 mt-9 mb-9">${boardNewsVO.boardWritingDt }</p>
								<p class="p-13 two-line-ellipsis">
									${boardNewsVO.boardCntnt }
								</p>
							</div>
						</div>
					</div>
				
				</c:forEach>
				
			</div>
			
			<div class="pagez">
				${info.getPagingArea5() }
			</div>
			
		</div>
		
		
	</div>
	
	<div class="search-main-right">
		<div class="hot-recruit">
			<p class="p-18 bold mb-20">실시간 뜨는 뉴스</p>
			<div class="hot-recruit-list">
				
				<c:forEach var="boardNewsVO" items="${popularList }" varStatus="cnt">
					<div class="hot-recruit-item" onclick="window.location.href='/news/detail?boardId=${boardNewsVO.boardId}'">
						<div class="idx">
							<span class="bold
								<c:if test="${cnt.count <= 3 }">
								txt-skyblue
								</c:if>
								">${cnt.count}</span> 
						</div>
						<c:if test="${cnt.count == 1 }">
							<div class="hot-ent-logo">  
								<c:choose>
									<c:when test="${boardNewsVO.atchFileVO != null }">
										<img alt="" src="/resources/upload/${boardNewsVO.atchFileVO.atchFileDetailVOList[0].afdSaveNm} ">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/images/ent-logo.png">
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
						<div class="hot-recruit-cont">
							<p class="hot-recruit-title
								<c:choose>
									<c:when test="${cnt.count == 1 }">
										two-line-ellipsis
									</c:when>
									<c:otherwise>
										one-line-ellipsis
									</c:otherwise>
								</c:choose>
							">${boardNewsVO.boardTitle}</p>
						</div>
					</div>
				</c:forEach>
				
				
			</div>
			
		</div>
			
	</div>
	
  	</div>
  </div>
<script type="text/javascript">

let time = document.querySelectorAll(".time");

console.log(time);

for (let i = 0; i < time.length; i++) {
	console.log(time[i].innerText);
	let year = time[i].innerText.split(" ")[5];
	console.log(year);
	let month = time[i].innerText.split(" ")[1];
	if (month == "Jan") {
		month = '1';
	} else if (month == "Feb") {
		month = '2';
	} else if (month == "Mar") {
		month = '3';
	} else if (month == "Apr") {
		month = '4';
	} else if (month == "May") {
		month = '5';
	} else if (month == "Jun") {
		month = '6';
	} else if (month == "Jul") {
		month = '7';
	} else if (month == "Aug") {
		month = '8';
	} else if (month == "Sep") {
		month = '9';
	} else if (month == "Oct") {
		month = '10';
	} else if (month == "Nov") {
		month = '11';
	} else if (month == "Dec") {
		month = '12';
	}
	let day = time[i].innerText.split(" ")[2];
	console.log(day);

	time[i].innerText = year + "-" + month + "-" + day
}

</script>