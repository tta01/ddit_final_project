<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">

<style>
body {
	font-weight: 400;
	font-size: 1rem;
	line-height: 1.6;
	color: #052c52;
	text-rendering: optimizelegibility;
	background-color: #0000;
}

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
</style>


<div class="lectureCen">
	<div class="lectureBoard">
		<h1 class="lecture-main-tit">공지사항 등록</h1>
		<div class="lec-h-div-line"></div>

		<form class="pd-20" name="frm" action="/noticeBoard/createForm?${_csrf.parameterName}=${_csrf.token}"
			method="post" enctype="multipart/form-data" >
			
			<p> <input type="hidden" name="memId" value="${getCurrentLoginVO.memId}" /> </p>
			
			<p class="title">공지지사항 제목</p>
			<p> <input class="notice-title-input" type="text" name="boardTitle" placeholder="공지사항 제목입력" required /> </p>
			
			<div>
				<p class="title">공지사항 내용</p>
				<textarea id="editor" name="boardCntnt" required ></textarea>
			</div>

			<div class="form-file" >
				<p class="title">공지사항 파일</p>
				<input type="file" id="uploadFile" name="uploadFile" alt="" multiple />
			</div>

			<p>
				<button type="submit" class="btn btn-sm list-btn bg-sig txt-white">등록</button>
				<button type="reset" class="btn btn-sm list-btn">초기화</button>
				<button type="button" onclick="location.href='/noticeBoard/list'" class="list-btn btn btn-sm" >목록 </button>
			</p>

			<sec:csrfInput />
		</form>
	</div>
</div>

<script type="text/javascript">

// 에디터로 생성
CKEDITOR.replace('editor');

//html 태그 사라지는 오류 해결
CKEDITOR.config.allowedContent = true;
//내용 미리 넣기
// CKEDITOR.instances.editor.setData('<p>공지에 무조건 넣을거 있나요~~</p>'); 


</script>
