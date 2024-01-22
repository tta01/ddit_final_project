<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/news.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<script type="text/javascript">
$(function(){
$("#delete").on("click",function(){
	
	$("#frm").attr("method","POST");
	$("#frm").attr("action","/news/deletePost");
	
	let result = confirm("삭제하시겠습니까?");
	
	if(result>0){
		$("#frm").submit();
	}else{
		alert("삭제가 취소되었습니다");
	}
	});
});
</script>

<form action="/news/detailUpdate" method="get" id="frm">
<input type="hidden" name="boardId" value="${boardNewsVO.boardId}" />
<div class="bg-white">
	<div class="cen">
		<div class="board01">
			<div class="board-top">
				<p id="title" name="boardTitle" class="boardTitle" >
					${boardNewsVO.boardTitle}
				</p>
				<div class="flex">
					<p class="board-writeDt">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${boardNewsVO.boardWritingDt}" />
					</p>
					<p class="board-cnt">
						조회수 ${boardNewsVO.boardCnt}
					</p>
				</div>
			</div>
	
	
			<div class="board-cont">
				<div class="board-img">
					<c:forEach var="fileNm"
						items="${boardNewsVO.atchFileVO.atchFileDetailVOList}">
						<img 
						src="http://localhost/file/download.do?afId=${fileNm.afId }&afdSeq=${fileNm.afdSeq}"
							alt=""> 
					</c:forEach>
				</div>
				
				<pre name="boardCntnt" disabled
					class="ph-cont resize-none inp-transparent">${boardNewsVO.boardCntnt}</pre>
		
				<div class="flex mt-auto" style="gap:10px">
					<div class="ml-auto">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="submit" id="edit"
							class="btn btn-sm hover_sig ml-auto">수정</button>
						<button type="button" id="delete"
							class="btn btn-sm hover_red">삭제</button>
					</sec:authorize>
						<button type="button" class="listbtn btn btn-sm" onclick="window.location.href='/news/list'" >목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<sec:csrfInput />
</form>

