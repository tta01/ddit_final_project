<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/inquiry.css">
<link rel="stylesheet" href="/resources/css/mypage.css"></link>
<style>

.sub-title {
    display: flex;
    justify-content: space-evenly;
}

</style>


<div class="cen pt-25">
	<div class="mypage-div">
		<div class="mypage-left">
			<div class="mypage-left-tit">고객센터</div>
			<ul>
				<li><a href="/noticeBoard/list">공지사항</a></li>
				<li class="active"><a href="/boardInquiry/list">1:1 문의사항</a></li>
				
			</ul>
		</div>
		<div class="mypage-body-con">
			<div class="sub-title-area">
			   <div class="body-sub-title">
			      	1:1 문의사항
			   </div>
			</div>
		      
			<div class="body-sub-con">
				
				<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ENTERPRISE', 'ROLE_CONSULTANT')">		
					<a class="btn btn-sm bg-sig txt-white mb-7" href="/boardInquiry/create">글 작성</a>
				</sec:authorize>
	
				<table class="table1">
					<colgroup>
						<col width="20%">
						<col width="60%">
						<col width="20%">
					</colgroup>
					<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="boardInquiryVO" items="${data}">
						<tr>
							<td ><a href="/boardInquiry/detail?boardId=${boardInquiryVO.boardId}">${boardInquiryVO.boardTitle}</a></td>
							<td style="text-align:center;">${boardInquiryVO.memId}</td>
							<td style="text-align:center;"><fmt:formatDate pattern="yyyy년  MM월 dd일" value="${boardInquiryVO.wirtDt}" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="pagez">
					${info.getPagingArea()}
				</div>
			</div>
		</div>
	</div>
</div>

