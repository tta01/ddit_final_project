<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">

<style>

body {
	background-color: white;
	
}
.paging-in-ul {
	display: flex;
	justify-content: center;
}

.paging-in-li {
	margin-right: 10px;
}
</style>

<div class="cen">
	
	<p class="main-h1">강의클래스</p>

	<div class="lecture-mid-tit mb-40 mt-20" style="">
	
		<div class="col-sm-3 col-lg-2 g-px-0--sm g-mb-30">
			<div class="lecture-menu">
				<button class="jobList" onclick="window.location.href='/boardClass/list'">전체</button>
				<c:forEach var="comCodeInfoVO" items="${comCodeInfoVOList}">
					<button class="jobList" style="padding:10px 0" data-value="${comCodeInfoVO.comCd}">${comCodeInfoVO.comCdNm}<span> (${comCodeInfoVO.jobCount})</span></button>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div style="font-size: 20px;" class="mb-20 mt-20 flex">
<!-- 		<ul class="lecture-link-list u-list-inline g-font-weight-500 mb-2"> -->
<!-- 			<li class="lecture-list-item"> -->
<!-- 				<a class="lecture-link g-color-gray-dark-v5 g-color-main--hover" href="/">홈</a> -->
<!-- 					<i class="lecture-icon fa fa-angle-right g-color-gray-light-v2"></i></li> -->
<!-- 			<li class="lecture-list-item"> -->
<!-- 				<a class="lecture-link g-color-gray-dark-v5 g-color-main--hover" href="#">커리어 성장</a> -->
<!-- 					<i class="lecture-icon fa fa-angle-right g-color-gray-light-v2"></i></li> -->
<!-- 			<li class="lecture-list-item"> -->
<!-- 				<a href="/boardClass/list" class="lecture-highlight">강의클래스</a> -->
<!-- 		</ul> -->
				
		<sec:authorize access="hasRole('ROLE_ADMIN')">		
		<button onclick="location.href='/boardClass/create'" class="btn p-14 hover_sig btn-sm ml-auto">강의등록</button>
		</sec:authorize>
	</div>

	<div class="content-lecture-box">
		<c:forEach var="brdclsVO" items="${data.content}">
			<div class="content-lecture-item" data-boardId="${brdclsVO.boardId}">
				<div class="content-lecture-img">
					<a href="${brdclsVO.classUrl}" target="_blank">
					<c:forEach var="fileVO" items="${brdclsVO.atchFileDetailVOList}">
							<img src="/resources/upload/${fileVO.afdSaveNm}" alt="">
						</c:forEach>
					</a>
				</div>

				<div class="content-lecture-cont">
					<p class="content-lecture-tit">${brdclsVO.boardTitle}</p>
					<p class="content-lecture-nmdt">
						<span class="content">${brdclsVO.boardCntnt}</span>
					</p>
				</div>

<!-- 					<div style="display: flex; justify-content: center; margin-top: 20px;" class="update_delete_btn"> -->
<%-- 						<button class="update-button" onclick="clickUpdateBtn('${brdclsVO.boardId}')">수정</button> --%>
<%-- 						<button class="delete-button" onclick="clickedDeleteBtn('${brdclsVO.boardId}')">삭제</button> --%>
<!-- 					</div> -->
			</div>
		</c:forEach>
	</div>

	<div class="pagez">${data.getPagingArea4()}</div>

</div>

<!-- <script src="/resources/js/boardClassList.js"></script> -->

<script type="text/javascript">


$(function(){
   	
		 $(".jobList").on("click", function() {

			var jobCategoryCd = $(this).data('value');
			
	        $.ajax({
	        	// cateCd로 controller에서 받아?옴
	            url: "/boardClass/listAjax?cateCd=" + jobCategoryCd,
				contentType: "application/json; charset=utf-8",
				type: "GET",
				dataType:'json',
		      	beforeSend : function(xhr) {
	                  xhr.setRequestHeader(
	                        "${_csrf.headerName}",
	                        "${_csrf.token}");
	            },
	            success: function(response) {
	            	/* 
	            	response : ArticlePage<BoardClassVO>
	            	*/
	                console.log("response : "+JSON.stringify(response));
	            	
	            	let str = "";

	            	//response.content : List<BoardClassVO> 
	            	$.each(response.content,function(idx,boardClassVO){
	            		str += "<div class='outer-container'>";
	            		str += `<div class='content-lecture-item' data-boardId="\${boardClassVO.boardId}">`;
	            		str += "<div class='content-lecture-img'>";
	            		if(boardClassVO.atchFileDetailVOList.length>0){//첨부파일이 있을 때만 처리
		            		str += "<a href='"+boardClassVO.classUrl+"' target='_blank'>";
		            		str += "<img src='/resources/upload/"+boardClassVO.atchFileDetailVOList[0].afdSaveNm+"' alt=''></a>";
	            		}
	            		str += "</div>";
	            		str += "<div class='content-lecture-cont'>";
	            		str += "<strong class='content-lecture-tit'>"+boardClassVO.boardTitle+"</strong>";
	            		str += "<p class='content-lecture-nmdt'>";
	            		str += "<span class='content'>"+boardClassVO.boardCntnt+"</span></p></div>";
// 	            		str += "<div style='display: flex; justify-content: center; margin-top: 20px;' class='update_delete_btn'>";
// 	            		str += `<button class="update-button" onclick="clickUpdateBtn('\${boardClassVO.boardId}')">수정</button>`;
// 	                    str += `<button class="delete-button" onclick="clickedDeleteBtn('\${boardClassVO.boardId}')">삭제</button>`;
// 	            		str += "</div>
						str += "</div></div>";
	            		
	            	});
	            	
 	            	$(".content-lecture-box").html(str);
 	            	
 					$(".lecture-page").html(response.pagingArea3);
	    	    },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error("전송실패", status, error);
	            }
	        });
	    });
	});

function clickedDeleteBtn(boardId){
	
	var delconfirm = confirm("삭제 하시겠습니까?");
	
	if(delconfirm) {
		location.href="/boardClass/delete?boardId=" + boardId;
	} else {
		alert("삭제 취소");
	}
}

function clickUpdateBtn(boardId) {
	
	location.href="/boardClass/update?boardId=" + boardId;
}

</script>
