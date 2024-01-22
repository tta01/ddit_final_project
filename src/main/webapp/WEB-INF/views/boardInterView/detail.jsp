<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>

.page-ct{
background-color: white;
border-radius: 30px;

}
ul,{
   margin:0; padding:0; 
}
ul{display:grid;
grid-template-columns: 1fr 1fr 1fr; text-align:center; 
}

.page-ct ul li a{
display: block;
padding: 10px 0px;
}

.search-Box{
padding-top: 30px;
padding-bottom: 10px;
}

.page-main-box{
border-radius: 30px;
}

.btn-keyword{
   background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 0 13px;
    height: 28px;
}
.page-main-box{
   display:grid;
   grid-template-columns: 1fr 1fr 1fr;
   gap : 20px;
}

.title-hr {
   margin: 8px 0px;
   width: 20px;
}

.title-bold {
   font-weight: 800;
   font-size: 20px;
   width: 275px;
}

.list-text-small {
    color: #888;
    font-size: 13px;
    font-weight: 500;
}

.list-text-small-name {
    color: #888;
    font-size: 13px;
    margin: 2px 0px;
}

.interview-content{
    position: relative;
    z-index: 1;
    min-height: 70vh;
}

.interview-intro {
    position: relative;
    height: 400px;
    overflow: hidden;
}

.interview-img {
   width: 700px;
   height: 400px;
   object-fit: cover;
}

.info-box {
   position: absolute;
    right: 0;
    top: 0;
    box-sizing: border-box;
    padding: 50px 30px 80px 40px;
    width: 360px;
    height: 400px;
    background: #514f5e;
}

.intro-icon{
   box-sizing: border-box;
    margin-top: -2px;
    margin-right: 9px;
    padding: 1px 8px 3px 8px;
    height: 24px;
    background: #f76a6a;
    color: #fff;
    font-size: 13px;
    letter-spacing: -1px;
    vertical-align: middle;
}

.in-first{
   display: flex;
    align-items: flex-end;
}

.in-title {
   padding-top: 9px;
    color: #fff;
    font-size: 30px;
    line-height: 42px;
    letter-spacing: -1px;
    word-break: break-all;
}

.in-company{
   font-size: 16px;
   color: #fff;
}

.intro-info{
    padding: 30px 0px 0px 0px;
}
.in-date {
    height: 12px;
    color: #e3e3e5;
    font-size: 14px;
    line-height: 11px;
    padding: 7px 0px 0px 0px;
}

.in-quote{
    width: 30px;
    height: 30px;
    text-align: center;
}

.top-title{
   position: relative;
    margin: 60px 0;
    padding: 40px 0 50px 0;
    text-align: center;
    color: #444;
    font-size: 30px;
    letter-spacing: -2px;
    line-height: 41px;
    word-wrap: break-word;
    word-break: break-all;
}
.in-mix-box{
    display: flex;
	padding-bottom: 40px;
}
.in-mix-box-question{
    box-sizing: border-box;
    padding-left: 16px;
    width: 370px;
    height: 392px;
    float: left;
    overflow: hidden;
}
.in-mix-box-con{
   color: #444;
    font-size: 18px;
    font-weight: bold;
    letter-spacing: -1px;
}

.in-mix-box-Qa{
   display: block;
    padding-bottom: 15px;
    color: #6174d1;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: 0;
    line-height: 18px;
}

.in-mix-box-img{
	height: 400px;
    width: 600px;
    object-fit: cover;
}

.in-mix-box-img img{
	width: 100%;
	height: 100%;
}
.inner-title{
	font-weight: bold;
	padding-bottom: 5px;
}
.box-inner{
	margin-bottom: 100px
}

.inter-update-box{
	display: flex;
	justify-content: right;
}

.inter-update-btn{
	width: 100px;
    height: 40px;
    margin-right: 8px;
    border : 1px solid #ccc;
    border-radius: 10px;
}

.inter-delete-btn{
	width: 100px;
    height: 40px;
    border : 1px solid #ccc;
    border-radius: 10px;
}
</style>


<div class="cen" style="margin:auto;">
	<div class="interview-content">
		<!-- 
		data : boardInterViewVO
		 -->
		<div class="interview-intro">
			<img class="interview-img" alt="인터뷰 사진" src="/resources/upload/${data.atchFileDetailVOList[0].afdSaveNm}">
			<div class="info-box">
				<div class="in-first">
					<span style="color: white;">${data.interEntNm}</span>
				</div>
				<p class="in-title">${data.boardCntnt}</p>
				<div class="intro-info">
					<p class="in-company">${data.interEntNm} &nbsp; ${data.interNm}</p>
					<p class="in-date"><fmt:formatDate value="${data.boardWritingDt}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp; 
					|&nbsp;&nbsp; 
					<i class="fa-regular fa-eye" style="color: #dcdcdc;"></i>&nbsp;&nbsp;
					${data.boardCnt} </p>
				</div>
<!-- 				<div  style="margin-top:56px;"> -->
<!-- 					<a href="https://www.naver.com/" class="in-company">www.naver.com</a> -->
<!-- 				</div> -->
			</div>
		</div>
		
		<input type="hidden" id="boardId" value="${data.boardId}" />
		<div class="main-content">
			<div class="top-title">
				<svg class="in-quote" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M96 224c-11.28 0-21.95 2.3-32 5.9V224c0-35.3 28.7-64 64-64 17.67 0 32-14.33 32-32s-14.3-32-32-32C57.42 96 0 153.4 0 224v96c0 53.02 42.98 96 96 96s96-42.98 96-96-43-96-96-96zm256 0c-11.28 0-21.95 2.305-32 5.879V224c0-35.3 28.7-64 64-64 17.67 0 32-14.33 32-32s-14.33-32-32-32c-70.58 0-128 57.42-128 128v96c0 53.02 42.98 96 96 96s96-42.98 96-96-43-96-96-96z" fill="#cccccc" class="fill-000000"></path></svg>
						<p>${data.boardSeTitle}</p>
				<svg class="in-quote" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M96 96c-53.02 0-96 42.1-96 96s42.98 96 96 96c11.28 0 21.95-2.305 32-5.879V288c0 35.3-28.7 64-64 64-17.67 0-32 14.33-32 32s14.33 32 32 32c70.58 0 128-57.42 128-128v-96c0-53.9-43-96-96-96zm352 96c0-53.02-42.98-96-96-96s-96 42.98-96 96 42.98 96 96 96c11.28 0 21.95-2.305 32-5.879V288c0 35.3-28.7 64-64 64-17.67 0-32 14.33-32 32s14.33 32 32 32c70.58 0 128-57.42 128-128v-96z" fill="#cccccc" class="fill-000000"></path></svg>
			</div>
		</div>
		
<%-- 		<p>${data}</p> --%>
		<!-- data : List<BoardInterViewVO> 
		vo : boardInterViewQNAVO
		-->
		<c:forEach var="boardInterViewQNAVO" items="${data.boardInterViewQNAVOList}" varStatus="stat">
			<c:if test="${stat.count<2}">
				<div class="in-mix-box">
					<div class="in-mix-box-img">
						<img alt="직무관련사진" src="/resources/upload/${data.atchFileDetailVOList[1].afdSaveNm}">
					</div>
					<div class="in-mix-box-question">
						<p class="in-mix-box-con">
							<em class="in-mix-box-Qa">${boardInterViewQNAVO.quQuestionNm}</em>
							<p class="inner-title">
							${boardInterViewQNAVO.quQuestion}
							</p>
							<pre class="in-mix-box-answer">${boardInterViewQNAVO.quAnswer}</pre>
						</p>
					</div>
				</div>
			</c:if>
			<c:if test="${stat.count>1}">
				<div class="box-inner">
					<div class="box-question">
						<p class="question">
							<em class="in-mix-box-Qa">${boardInterViewQNAVO.quQuestionNm}</em>
							<p class="inner-title">
							${boardInterViewQNAVO.quQuestion}
							</p>
						</p>
					</div>
					<pre class="in-mix-box-answer">${boardInterViewQNAVO.quAnswer}</pre>
				</div>
			</c:if>
		</c:forEach>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="inter-update-box">
				<button type="button" id="updateBtn" class="inter-update-btn btn-write" >수정</button>
				<button type="button" id="deleteBtn" class="inter-delete-btn btn-write" >삭제</button>
			</div>
		</sec:authorize>
	</div>
</div>
<script type="text/javascript">
$(function(){
	
	$("#updateBtn").on("click",function(){
		
		let boardId = $("#boardId").val();
		
		console.log(boardId);
		
		window.location.href = "/boardInterView/update?boardId=" + boardId;
	});
	
	
	$("#deleteBtn").on("click",function(){
		
		let boardId = $("#boardId").val();
		
		console.log("boardId : " +boardId);
		
		window.location.href = "/boardInterView/delete?boardId=" + boardId;
		
		
	});
	
	
});
	
</script>

    
