<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>

.mypage-body-con{
	background-color: #fff;
	border-radius: 30px;
 	padding: 24px; 
 	height: 800px;
}
.body-sub-title{
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}

.middle-tit {
	margin-bottom: 20px;
	margin-left: 20px;
}

.trNum {
	color: #329632;
}

/* .paging-in-ul { */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	margin: 30px; */
/* } */

/* .paging-in-li { */
/* 	margin-right: 10px; */
/* } */

.list-btn {
	font-size: 14px;
	background-color: #0000;
	border-radius: 15px;
	border-color: #0000;
	cursor: pointer;
	display: block;
	margin-right: 10px;
	margin-top: 10px;
	padding: 5px;
	margin-left: 90%;
}

.list-btn:hover {
	padding:8px;
	background-color: rgba(143, 188, 143, 1);
	color: white;
}

.port-search, .sel {
	display: flex;
    justify-content: flex-end;
    margin-bottom:30px;
}

.port-keyword {
	padding: 5px 5px;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}

.port-search-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding:5px;
}
.port-keyword:focus {
	 border: 1px solid green;
	 outline: none;
}

.port-search-btn:hover {
	border: 1px solid green;
}

.port-keyword:hover {
	 border: 1px solid green;
 }

.port-cntnt{
    display: flex;
    justify-content: space-evenly;
    text-align: center;
    margin: 5%;
    border-bottom: 1px solid #8FBC8F;
    align-items: center;
}

.form-btn {
	display: flex;
    justify-content: space-around;
}

.form-btn-basic, .form-btn-free {
	height: 40px;
    background-color: white;
    border: 1px solid;
    border-bottom-color: white;
    padding: 10px 362px 0px 50px
}

.port-tbody {
  border-collapse: separate;
  border-spacing: 20px;
}

.head {
	text-align: center;
	cursor: pointer;
}

.port-mid-tit {
	display: flex;
    justify-content: space-around;
    padding: 20px;
}

.port-tit{
	display: flex;
    justify-content: space-around;
    cursor: pointer;
}

.port-select{
	justify-content:right;
	display:flex;
}

#selectForm{
	border-color:gray;
	border-radius: 5px;
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
}

#selectForm:focus {
    box-sizing: border-box;
    border-radius: 10px;
    outline: 1px solid green;
    border-radius: 10px;
}

</style>


<!-- 자유양식 페이지 -->

<div class="mypage-body-con">
	<div class="sub-title-area">
		<div class="body-sub-title">자기소개서 목록</div>
		<br />
		<hr class="title-hr" />
	</div>
	<div class="body-sub-con">
		<br />
		<br />
		
		<form class="port-search">
			<input class="port-keyword" type="text" placeholder="검색어를 입력하세요"
				name="keyword" value="${keyword}" /> <input class="port-search-btn"
				type="submit" value="검색" />
		</form>

<!-- 		<br /> <br /> -->

<!-- 		<div class="sel"> -->
<!-- 			<div class="port-select"> -->
<!-- 				<select id="selectForm" name="selectForm"> -->
<!-- 					<option value="">양식을 선택해주세요</option> -->
<!-- 					<option value="basic">기본양식</option> -->
<!-- 					<option value="free">자유양식</option> -->
<!-- 				</select> -->
<!-- 			</div> -->

<!-- 			<div style="justify-content: right; display: flex;"> -->
<!-- 				<button type="button" id="btnSel" class="port-search-btn">등록</button> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<br /> <br /> -->

		<div class="port-mid-tit">
			<span>번호</span> <span>제목</span> <span>작성일</span>
		</div>

		<div class="port-content">
			<c:forEach var="portVO" items="${data.content}">
				<div class="port-cntnt">
					<p style="width: 50px;">${portVO.rnum}</p>
					<p style="width: 400px;">
						<c:if test="${portVO.gubun=='BASIC'}">
							<a href="/mypageMem/portfolioDetail?ptflNo=${portVO.ptflNo}">${portVO.ptflTitle}</a>
						</c:if>
						<c:if test="${portVO.gubun=='FREE'}">
							<a href="/mypageMem/portfolioFreeDetail?ptflNo=${portVO.ptflNo}">${portVO.ptflTitle}</a>
						</c:if>
					</p>
					<p style="width: 100px;">
						<fmt:formatDate value="${portVO.ptflWritingDt}"
							pattern="yyyy.MM.dd" />
					</p>
				</div>
			</c:forEach>
		</div>

		<div class="pagez mt-30">
			${data.getPagingArea4()}
		</div>
		
		
	</div>
</div>


<script type="text/javascript">

$(function(){
	//자기소개서 작성
	$("#btnSel").on("click",function(){
		let selectForm = $("#selectForm").val();
		console.log("selectForm : " + selectForm);
		
		if(selectForm==""){
			alert("작성할 양식을 선택해주세요");	
			return;
		}else{
			if(selectForm=="basic"){
				location.href="/mypageMem/portfolioCreate";
			}else{
				location.href="/mypageMem/portfolioFreeCreate";
			}
		}
	});
});

</script>
