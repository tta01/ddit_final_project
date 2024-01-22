<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">

<style>

.justify-content-center {
	-ms-flex-pack: center !important;
	justify-content: center !important;
}

#editor {
	background-color: #0000; 
	border: none;
	padding: 10px;
}

.ck-content {
	height: 500px;
}

.title {
	text-align: left;
	margin: 10px 10px 10px 10px;
}

.list-btn {
	font-size: 14px;
	background-color: #0000;
	border-radius: 15px;
	border-color: #0000;
	cursor: pointer;
	display: inline-block;
	margin-right: 10px;
	margin-top: 10px;
	padding: 5px;
}

.list-btn:hover {
	padding:8px;
	background-color: rgba(143, 188, 143, 1);
	color: white;
}

.port-cntnt{
	text-align: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

.textarea {
	 overflow:hidden;
	 resize: none;
     border: 1px solid #c7c6c6;
     width: 100%;
     height:200px;;
     padding: 10px;
     box-sizing: border-box;
     border-radius: 5px;
     margin-bottom: 15px;
}

#wrapper {
	flex-wrap: wrap;
     justify-content: center;
     margin: 0 auto;
     padding: 20px;
     max-width: 1170px;
 }
 
</style>


<!-- 기본양식 수정 페이지 -->
<div class="lectureCen">
	<div class="lectureBoard">
		<h1 class="lecture-main-tit">자기소개서 수정</h1>
		<div class="lec-h-div-line"></div>
		
		<form class="mt-20" name="frm" action="/portfolio/updatePost?${_csrf.parameterName}=${_csrf.token}" method="post" >
			<sec:csrfInput />
			<p> <input type="hidden" name="memId" value="${portfolioVO.memId}" /> </p>
			<p> <input type="hidden" name="ptflNo" value="${portfolioVO.ptflNo}" /> </p>
			
			<div id="wrapper">
				<p class="port-cntnt">자기소개서 제목</p>
				<p> <input class="notice-title-input" type="text" name="ptflTitle" value="${portfolioVO.ptflTitle}"></p>
				<br />
				<p class="port-cntnt">성장과정</p>
				<textarea class="textarea" name="ptflGrowth" >${portfolioVO.portfolioBasicVO.ptflGrowth}</textarea>
	
				<p class="port-cntnt" >지원동기</p>
				<textarea class="textarea" name="ptflMotive" >${portfolioVO.portfolioBasicVO.ptflMotive}</textarea>
				
				<p class="port-cntnt">성격 및 장단점</p>
				<textarea class="textarea" name="ptflPersonality" >${portfolioVO.portfolioBasicVO.ptflPersonality}</textarea>
	
				<p class="port-cntnt">관련 업무 경험 및 경력</p>
				<textarea class="textarea" name="ptflJobExp" >${portfolioVO.portfolioBasicVO.ptflJobExp}</textarea>
	
				<p class="port-cntnt">프로젝트 경험</p>
				<textarea class="textarea" name="ptflProjExp" >${portfolioVO.portfolioBasicVO.ptflProjExp}</textarea>
	
				<p class="port-cntnt">입사 후 포부</p>
				<textarea class="textarea" name="ptflAspirations" >${portfolioVO.portfolioBasicVO.ptflAspirations}</textarea>
			</div>
				
			<p>
				<button type="submit" class="list-btn">저장</button>	
				<button type="reset" class="list-btn">초기화</button>
				<button type="button" onclick="location.href='/portfolio/list'" class="list-btn">목록 </button>
			</p>
		</form>
	</div>
</div>