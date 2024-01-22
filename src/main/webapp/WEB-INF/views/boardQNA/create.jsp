<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="cen" style="margin: 50px auto;">
    <p class="main-h1">취업 Q&A</p>

    <div class="board">
    
        <p class="main-tit">글 작성</p>

        <div class="h-div-line"></div>
		
		<form action="/boardQNA/createForm?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		
	        <input id="title" name="boardTitle" type="text" class="input01 ph-tit w-100 inp-transparent" placeholder="제목을 입력해 주세요">
	
	        <textarea name="boardCntnt" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 500px;" placeholder="내용을 입력해 주세요"></textarea>
	        
	        <div class="flex align-center">
	            <div class="filebox bs3-primary preview-image flex" >
	                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
	
	                <label for="uploadFile" class="ml-7" style="margin-bottom:0;">업로드</label> 
	                <input type="file" id="uploadFile" name="uploadFile" class="upload-hidden"> 
	            </div>
	            
	            <button type="button" class="btn btn-write ml-auto" id = "QnA-complete">자동 완성</button>
	            <button type="submit" class="btn btn-write ml-9">게시글 작성</button>
	        </div>
	        
	        <div id="img-preview" class="mt-12"></div>
	        
	        
	        
	        <input type="hidden" name="memId" value="${getCurrentLoginVO.memId }" />
	        
			<sec:csrfInput />
			
		</form>

    </div>

</div>
<script src="/resources/js/boardQNACreate.js"></script>

<script type="text/javascript">

	$(document).on("click", "#QnA-complete", function() {
		
// 		$('input[name=acdmcrNm]').attr('value',"한남대학교");
// 		$('select[name=acdmcrAttnd]').val("1");
// 		$('select[name=acdmcrEducation]').val("2");
// 		$('select[name=acdmcrDegree]').val("학사");
// 		$('input[name=acdmcrMajor]').attr('value',"컴퓨터공학");
// 		$('input[name=acdmcrEntranceDt]').attr('value',"2011-03-01");
// 		$('input[name=acdmcrPoint]').attr('value',"4.0");
// 		$('input[name=acdmcrGrdtnDt]').attr('value',"2016-12-31");
// 		$('input[name=acdmcrYn]').attr('checked',true);
		
		$('input[name=boardTitle]').attr('value',"3년차 개발자 연봉 문의");
		$('textarea[name=boardCntnt]').val(`
		안녕하세요 여러분,
		
		저는 현재 3년차 개발자로 근무하고 있는데, 000회사의 연봉 수준에 대해 궁금합니다. 
		
		해당 회사에서의 연봉은 어느정도 수준인지 알고 싶어서 이렇게 문의드립니다. 
		
		혹시 이 회사에서 근무하시는 분들이나 관련 정보를 가지고 계신 분들이 있다면 공유 부탁드립니다.

		또한, 제가 현재 갖고 있는 기술 스택과 경험에 대한 정보를 추가로 기재하여 누군가가 답변할 때 더 구체적인 도움을 받을 수 있도록 도와주세요.
		
		현재 사용 중인 기술 스택: [예시: Java, Spring Framework, JavaScript, React]
		관련 경력 및 프로젝트: [예시: 대규모 프로젝트 경험, 클라이언트와의 협업 경험 등]
		
		감사합니다!`);
		
		console.log("dddddddd");
		
	});

</script>