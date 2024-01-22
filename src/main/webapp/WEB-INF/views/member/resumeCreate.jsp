<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/resume.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<div class="cen" style="margin: 50px auto;">
	<p class="main-h1">이력서 작성</p>

	<div class="page-main-box">
	
		<!-- 처음 회원정보 불러오는  시작 div -->
		<div class="inner-box">
			<div class="rsm_hgroup rsm-vertical-center">
				<h3 class="rsm_ttl">
					<span class="rsm_ttl__valid">*</span>기본 정보
				</h3>
			</div>
			<hr/>
			
			<div class="rsm_section">
				<div class="photo_use_row">
					<div class="input_resume_basic photo_use_basic">
						<div class="set1">
							<input type="text" class="input_resume_name_kr" placeholder="이름"
								maxlength="15" value="${memberVO.memId}">
						</div>
						<div class="set2">
							<div class="with_icon">
								<i class="fa-regular fa-envelope"></i>
									<input type="text" class="input_resume_email" placeholder="이메일" maxlength="50" value="${memberVO.memEmail}">
							</div>
						</div>
						<div class="set2">
							<div class="with_icon">
								<i class="fa-solid fa-mobile-screen"></i>
								<input type="text" class="input_resume_phone" placeholder="전화번호" minlength="10" maxlength="11" value="${memberVO.memTel}">
							</div>
						</div>
						
						<div class="set2">
							<div class="with_icon">
								<i class="fa-solid fa-person-half-dress"></i>
								<c:if test="${memberVO.memGen == '1'}">
									<input type="text" class="input_resume_gender" value="남자" readonly>
								</c:if>
								<c:if test="${memberVO.memGen == '0'}">
									<input type="text" class="input_resume_gender" value="여자" readonly>
								</c:if>
								
								<i class="fa-regular fa-calendar-days"></i>
								<div style="width:300px;">
									<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${memberVO.memBirth}" />
								</div>
							</div>
						</div>
						<div class="resume_addphoto" for="resume_addphoto_id">
							<div class="resume_addphoto__no-image">
								<i class="jp-image">사진불러올거임</i>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="rsm_default_cont">
				<div class="rsm_cont_bd">
					<div class="rsm_section">
						<div class="rsm_hgroup">
							<div class="rsm-vertical-center">
								<h3 class="rsm_ttl">
									<span class="rsm_ttl__valid">*</span>주소
								</h3>
							</div>
						</div>
						<hr/>
						<div class="rsm_body">
							<div class="rsm_half_cell" style="margin:10px;">
								<label class="cssel_ty1"><a class="btn_sel false">${memberVO.memAddr}, ${memberVO.memAddr2}</a>
								</label>
							</div>
						</div>
					</div>
					<div class="rsm_section">
						<div class="rsm_hgroup">
							<div class="rsm-vertical-center">
								<h3 class="rsm_ttl">
									<span class="rsm_ttl__valid">*</span>소개글
								</h3>
							</div>
						</div>
						<hr/>
						<div class="rsm_body">
							<div class="rsm_half_cell" style="margin:10px;">
								<label class="cssel_ty1"><a class="btn_sel false">${memberVO.memIntrcn}</a>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 처음 회원정보 불러오는  끝 div -->
		
		
		
		
		
		
		
		
		
		
		
	<form id="frm" name="frm" action="/member/resumeCreatePost" method="post" enctype="multipart/form-data">
		<!-- 회원정보 이후 이력서 작성 div 시작  -->
		<div>
			<input type="text" name="resumeTitle" placeholder="이력서 제목을 입력하세요" >
		</div>
		<div class="inner-box">
			<div class="rsm_hgroup">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">
						<span class="rsm_ttl__valid">*</span>직종
					</h3>
				</div>
			</div>
			<hr/>
			<div style="margin-bottom:80px;">
				<select name="comCd" id="comCd" style="margin:10px;">
					<option  value="" selected>직군을 선택해주세요</option>
					<c:forEach var="comCodeInfoVOList" items="${comCodeInfoVOList}" >
						<option name="comCodeInfoVOList" class="select-comCode" value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option>
					</c:forEach>
				</select>
				
				<select name="comDetCdJob" id="comDetCdJob" >
					<option  value="" selected>직업을 선택해주세요</option>
				</select>
			</div>
			
			<div style="margin-bottom:80px;">
				<div class="rsm_hgroup">
					<div class="rsm-vertical-center">
						<h3 class="rsm_ttl">
							업무 및 스킬
						</h3>
					</div>
				</div>
				<hr/>
				<ul class="rsm_sub_info">
					<li>업무와 관련된 스킬을 추가해 보세요</li>
					<li>1개 입력 시 이력서 작성률이 10%, 3개 입력 시 20%, 5개 이상 입력 시 30% 높아져요</li>
				</ul>
				<div class="resume-recommend-skill">
					<div class="resume-recommend-skill__title">추천 스킬</div>
				</div>

				<div class="rsm_body" >
					<div class="tagging_wrap">
						<div class="input_group frow_ty1 rtag_auto_list">
							<label for="resumeSkills">
								<input type="text" class="tag_input" onkeydown="handleEnter(event)"
								name="resumeSkills" id="resumeSkills" placeholder="스킬을 입력해 주세요 " value="" >
								<input type="hidden" name="resumeSkill" id="resumeSkill" value="">
							</label>
						</div>
						<div class="tag_group">
							<div id="wordContainer"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="rsm_hgroup">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">
						경력(인턴 포함)
					</h3>
				</div>
			</div>
			<hr/>
			<ul class="rsm_sub_info">
				<li>수행한 업무와 성과 기반으로 작성해 보세요</li>
				<li>기업명과 경력 상세 내용을 30자 이상 입력하면 작성률이 20% 높아져요</li>
			</ul>
			
			<!-- 학력 시작 -->
			<div class="career-div-career" id="career-div-career">
				<div class="trash-icon talign-right mb-7" >
					<i class="fa-solid fa-poo" id="career-fa-poo"></i>
					<i class="fa-solid fa-trash-can" id="career-trash-icon"></i>
				</div>
				<div class="flex">
					<div class="career-left-div">
						<div class="group-date">
							<input class="input_resume" name="careerVOList[0].companyEntranceDt" type="date" />
							<span>~</span>
							<input class="input_resume" name="careerVOList[0].companyLeaveDt" type="date" />
						</div>
						<div class="group_check__box">
							<label class="btn_check">
								<input name="check_new" class="cscheck" type="checkbox">
								<span class="check_txt">재직중</span>
							</label>
						</div>
					</div>
					<div class="career-right-div" id="career-right-divv">
						<div class="enterprise-name">
							<input class="input_resume_text1" placeholder="기업명" type="text" name="careerVOList[0].companyNm" value="" >
						</div>
						<div class="enterprise-dept-position">
							<div class="enterprise-dept">
								<input class="input_ent_dept" placeholder="부서" type="text" name="careerVOList[0].companyDept" value="" >
							</div>
							<div class="enterprise-position">
								<input class="input_ent_position" placeholder="직책" type="text" name="careerVOList[0].companyPosition" value="" >
							</div>
						</div>
						<div class="enterprise-job-sal">
							<div>
								<input class="input_ent_job" placeholder="직무" type="text" name="careerVOList[0].companyJob" value="" >
							</div>
							<div>
								<input class="input_ent_salary" placeholder="연봉(선택사항)" type="text" name="careerVOList[0].companySalary" value="" >
							</div>
						</div>
						<div class="flexible_textarea">
							<textarea class="medit" name="careerVOList[0].companyDetCareer" placeholder="경력사항을 입력해보세요."></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="rsm_bottom">
				<div class="rsm_bottom__right">
					<label class="btn_check type-no-experience">
						<input name="check_new" class="cscheck" type="checkbox" checked="">
						<span class="check_icon"></span>
						<span class="check_txt">신입입니다</span>
					</label>
				</div>
			</div>
			
			<div class="rsm_hgroup" style="margin-top:80px;">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">
						학력
					</h3>
				</div>
			</div>
			<hr  style="margin-bottom: 30px;"/>
			
			<c:forEach var="academicCareerVOList" items="${academicCareerVOList}">
				<div class="acd-career-div" >
					<div class="flex">
						<div class="acd-career-left-div">
							<div class="group-date">
								<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${academicCareerVOList.acdmcrEntranceDt}" />
								<span>~</span>
								<fmt:formatDate pattern="yyyy년  MM월 dd일" value="${academicCareerVOList.acdmcrGrdtnDt}" />
							</div>
						</div>
						<div class="acd-career-right-div">
							<div class="enterprise-name">
								<input class="input_resume_text1" placeholder="학교명" type="text" value="${academicCareerVOList.acdmcrNm}" >
							</div>
							<div class="enterprise-dept-position">
								<div class="enterprise-dept">
									<input class="input_ent_dept" placeholder="전공" type="text" value="${academicCareerVOList.acdmcrMajor}" >
								</div>
								<div class="enterprise-position">
									<input class="input_ent_position" placeholder="학위" type="text" value="${academicCareerVOList.acdmcrDegree}" >
								</div>
							</div>
							<div class="enterprise-job-sal">
								<div>
									<input class="input_acd-score" placeholder="학점" type="text" value="${academicCareerVOList.acdmcrPoint}" style="text-align:center;" >점
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<div class="rsm_hgroup" style="margin-top:80px;">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">성과</h3>
				</div>
			</div>
			<hr  style="margin-bottom: 30px;"/>
			
			<div class="certi-career-div" id="certi-career-div">
				<div class="trash-icon talign-right mb-7" >
					<i class="fa-solid fa-poo" id="certi-fa-poo"></i>
					<i class="fa-solid fa-trash-can" id="certi-trash-icon"></i>
				</div>
				<div class="flex">
					<div class="certi-career-left-div">
						<div class="group-date">
							<input class="input_resume" name="resultVOList[0].resultStdt" type="date" />
							<span>~</span>
							<input class="input_resume" name="resultVOList[0].resultEddt" type="date" />
						</div>
					</div>
					<div class="certi-career-right-div">
						<div class="enterprise-name">
							<input class="input_resume_text1" placeholder="성과명" name="resultVOList[0].resultTitle" type="text" value="" >
						</div>
						<div class="flexible_textarea">
							<textarea class="medit" name="resultVOList[0].resultCntnt" placeholder="성과에 대한 설명을 입력하세요"></textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="rsm_hgroup" style="margin-top:80px;">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">활동 및 수상</h3>
				</div>
			</div>
			<hr  style="margin-bottom: 30px;"/>
			<div class="awards-career-div" id="awards-career-div">
				<div class="trash-icon talign-right mb-7" >
					<i class="fa-solid fa-poo" id="awards-fa-poo"></i>
					<i class="fa-solid fa-trash-can" id="awards-trash-icon"></i>
				</div>
				<div class="flex">
					<div class="awards-career-left-div">
						<div class="group-date">
							<input class="input_resume" name="awardsVOList[0].awdDt" type="date" />
						</div>
					</div>
					<div class="awards-career-right-div" id="awards-career-right-div">
						<div class="enterprise-name">
							<input class="input_resume_text1" name="awardsVOList[0].awdNm" placeholder="활동 및 수상명" type="text"  value="" >
						</div>
						<div class="flexible_textarea">
							<textarea class="medit" name="awardsVOList[0].awdCntnt" placeholder="활동 및 수상에 대한 설명 입력"></textarea>
						</div>
						<div class="enterprise-name">
							<input class="input_resume_text1" name="awardsVOList[0].awdOrg"  placeholder="수여 기관" type="text" value="" >
						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="rsm_bottom"> -->
<!-- 				<button type="button" name="btn-awards-career-add" id="btn-awards-career-add" class="button_plus">+ 추가</button> -->
<!-- 			</div> -->
			
			<div class="rsm_hgroup" style="margin-top:80px;">
				<div class="rsm-vertical-center">
					<h3 class="rsm_ttl">어학 및 어학 상세정보</h3>
				</div>
			</div>
			<hr  style="margin-bottom: 30px;"/>
			<div class="lang-career-div" >
				<div class="trash-icon mb-7" >
					<i class="fa-solid fa-poo lang-fa-poo" ></i>
					<i class="fa-solid fa-trash-can lang-trash-icon"></i>
				</div>
				<div class="flex">
					<div class="lang-career-left-div">
						<div class="lang-select-div">
							<select class="lang-select" name="languageVOList[0].langKind">
								<option value="">언어 종류를 선택해라</option>
								<c:forEach var="comDetCodeLangList" items="${comDetCodeLangList}" >
									<option name="comCodeDetInfoVO" class="selectLangDet" value="${comDetCodeLangList.comDetCd}">${comDetCodeLangList.comDetCdNm}</option>
								</c:forEach>
							</select>
							<select class="lang-select" name="languageVOList[0].langLevel">
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하">하</option>
							</select>
						</div>
					</div>
					<div class="lang-career-right-div">
						<div class="trash-icon talign-right mb-7" >
							<i class="fa-solid fa-poo lang-det-fa-poo"></i>
							<i class="fa-solid fa-trash-can lang-det-trash-icon"></i>
						</div>
						<div class="flex">
							<div class="lang-det-left-div">
								<div class="group-date">
									<label>취득일자</label>
									<label>~</label>
									<label>만료일자</label>
								</div>
								<div class="group-date">
									<input class="input_resume" name="languageVOList[0].languageDTVOList[0].langDetailAcqDt" type="date" />
									<span>~</span>
									<input class="input_resume" name="languageVOList[0].languageDTVOList[0].langDetailExpDt" type="date" />
								</div>
							</div>
							<div class="lang-det-right-div">
								<div class="enterprise-name">
									<input class="input_resume_text1" name="languageVOList[0].languageDTVOList[0].langDetailScore" 
										placeholder="어학점수" type="text" value="" >
								</div>
								<div class="flexible_textarea">
									<textarea class="medit" name="languageVOList[0].languageDTVOList[0].langDetailName" 
									 	placeholder="관련 상세 사항"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 			<div class="rsm_bottom"> -->
<!-- 				<button type="button" name="btn-lang-career-add" id="btn-lang-career-add" class="button_plus">+ 추가</button> -->
<!-- 			</div> -->
			
			
			<div class="flex" style="margin-top:80px;">
				<button type="submit" class="btn btn-write ml-auto">이력서 등록!</button>
			</div>
		</div>
		<!-- 회원정보 이후 이력서 작성 div 끝  -->
		<sec:csrfInput />
	</form>
	</div>
</div>

<script type="text/javascript">

	// 경력사항 카운트 전역변수
	let cntCrer = 0
	
	// 성과 카운트 전역변수
	let cntResult = 0;
	
	// 수상 카운트 전역변수
	let cntAwards = 0;
	
	// 어학 카운트 전역변수
	let cntLang = 0;
	
	// 어학 상세 카운트 전역변수
	let cntLangDet = 0;
	
	// 입력된 단어들 저장하기 위한 변수
	let storedWords = '';

    function previewFile() {
        var preview = document.getElementById('preview_img');
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
        	preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '미리보기 없음';
        }
    }
    
    
    // 경력 추가 버튼
    $("#career-fa-poo").on("click", function() {
    	++cntCrer;
    	
    	let strCrer = '<div class="flex">';
    		strCrer += '<div class="career-left-div">'; 
    		strCrer += '<div class="group-date">'; 
    		strCrer += '<input class="input_resume" name="careerVOList['+cntCrer+'].companyEntranceDt" type="date" />'; 
    		strCrer += '<span>~</span>'; 
    		strCrer += '<input class="input_resume" name="careerVOList['+cntCrer+'].companyLeaveDt" type="date" />'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="group_check__box">'; 
    		strCrer += '<label class="btn_check"><input name="check_new" class="cscheck" type="checkbox">'; 
    		strCrer += '<span class="check_icon"></span>'; 
    		strCrer += '<span class="check_txt">재직중</span></label>'; 
    		strCrer += '</div>'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="career-right-div" id="career-right-divv">'; 
    		strCrer += '<div class="enterprise-name">'; 
    		strCrer += '<input class="input_resume_text1" placeholder="기업명" name="careerVOList['+cntCrer+'].companyNm" type="text" value="" >'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="enterprise-dept-position">'; 
    		strCrer += '<div class="enterprise-dept">'; 
    		strCrer += '<input class="input_ent_dept" placeholder="부서" name="careerVOList['+cntCrer+'].companyDept" type="text" value="" >'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="enterprise-position">'; 
    		strCrer += '<input class="input_ent_position" placeholder="직책" name="careerVOList['+cntCrer+'].companyPosition"  type="text" value="" >'; 
    		strCrer += '</div>'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="enterprise-job-sal">'; 
    		strCrer += '<div>'; 
    		strCrer += '<input class="input_ent_job" placeholder="직무" name="careerVOList['+cntCrer+'].companyJob" type="text" value="" >'; 
    		strCrer += '</div>'; 
    		strCrer += '<div>'; 
    		strCrer += '<input class="input_ent_salary" placeholder="연봉(선택사항)" name="careerVOList['+cntCrer+'].companySalary" type="text"  value="" >'; 
    		strCrer += '</div>'; 
    		strCrer += '</div>'; 
    		strCrer += '<div class="flexible_textarea">'; 
    		strCrer += '<textarea class="medit" name="careerVOList['+cntCrer+'].companyDetCareer" placeholder="경력사항을 입력해보세요."></textarea>'; 
    		strCrer += '</div>'; 
    		strCrer += '</div>'; 
    		strCrer += '</div>'; 
    		
    	$("#career-div-career").append(strCrer);
    });
    
    // 경력 삭제버튼
    $("#career-trash-icon").on("click", function() {
    	
    	if (cntCrer < 1) {
    		alert("경력사항 하나는 냄겨라...");
    		return;
    	}
    	$("#career-div-career").children().last().remove();
    	
    	--cntCrer;
    	
    });
    
    // 성과 추가 버튼
    $("#certi-fa-poo").on("click", function() {
    	++cntResult;
    	
    	let strCerti = '<div class="flex">';
    		strCerti += '<div class="certi-career-left-div">';
    		strCerti += '<div class="group-date">';
    		strCerti += '<input class="input_resume" name="resultVOList['+cntResult+'].resultStdt" type="date" />';
    		strCerti += '<span>~</span>';
    		strCerti += '<input class="input_resume" name="resultVOList['+cntResult+'].resultEddt" type="date" />';
    		strCerti += '</div>';
    		strCerti += '</div>';
    		strCerti += '<div class="certi-career-right-div">';
    		strCerti += '<div class="enterprise-name">';
    		strCerti += '<input class="input_resume_text1" placeholder="성과명" name="resultVOList['+cntResult+'].resultTitle" type="text" value="" >';
    		strCerti += '</div>';
    		strCerti += '<div class="flexible_textarea">';
    		strCerti += '<textarea class="medit" name="resultVOList['+cntResult+'].resultCntnt" placeholder="성과에 대한 설명을 입력하세요"></textarea>';
    		strCerti += '</div>';
    		strCerti += '</div>';
    		strCerti += '</div>';

    	$("#certi-career-div").append(strCerti);
    });
    
    // 성과 삭제 버튼
    $("#certi-trash-icon").on("click", function() {
    	
    	if(cntResult < 1) {
    		alert("자격증 목록 하나는 냄겨라");
    		return;
    	}
    	
    	$("#certi-career-div").children().last().remove();
    	
    	--cntResult;
    	
    });
    
    // 활동 및 수상 추가 버튼
    $("#awards-fa-poo").on("click", function() {
    	++cntAwards;
    	
    	let strAwards = '<div class="flex">';
    		strAwards += '<div class="awards-career-left-div">';
    		strAwards += '<div class="group-date">';
    		strAwards += '<input class="input_resume" name="awardsVOList['+cntAwards+'].awdDt" type="date" />';
    		strAwards += '</div>';
    		strAwards += '</div>';
    		strAwards += '<div class="awards-career-right-div" id="awards-career-right-div">';
    		strAwards += '<div class="enterprise-name">';
    		strAwards += '<input class="input_resume_text1" name="awardsVOList['+cntAwards+'].awdNm" placeholder="활동 및 수상명" type="text"  value="" >';
    		strAwards += '</div>';
    		strAwards += '<div class="flexible_textarea">';
    		strAwards += '<textarea class="medit" name="awardsVOList['+cntAwards+'].awdCntnt" placeholder="활동 및 수상에 대한 설명 입력"></textarea>';
    		strAwards += '</div>';
    		strAwards += '<div class="enterprise-name">';
    		strAwards += '<input class="input_resume_text1" name="awardsVOList['+cntAwards+'].awdOrg"  placeholder="수여 기관" type="text" value="" >';
    		strAwards += '</div>';
    		strAwards += '</div>';
    		strAwards += '</div>';
			
    		$("#awards-career-div").append(strAwards);
    	
    });
    
    // 활동 및 수상 삭제 버튼
    $("#awards-trash-icon").on("click", function() {
    	
    	if(cntAwards < 1){
    		
    		alert("수상 하나는 냄겨라..");
    		return;
    	}
    	
    	$("#awards-career-div").children().last().remove();
    	
    	--cntAwards;
    });
    
    //어학 생성
    $(".lang-fa-poo").on("click", function() {
    	++cntLang;
    	
    	let strLang = '<div class="flex">';
    		strLang += '<div class="lang-career-left-div">';
    		strLang += '<div class="lang-select-div">';
    		strLang += '<select class="lang-select" name="languageVOList['+cntLang+'].langKind">';
    		strLang += '<option value="">언어 종류를 선택해라</option>';
    		strLang += '<c:forEach var="comDetCodeLangList" items="${comDetCodeLangList}" >';
    		strLang += '<option name="comCodeDetInfoVO" class="selectLangDet" value="${comDetCodeLangList.comDetCd}">${comDetCodeLangList.comDetCdNm}</option>';
    		strLang += '</c:forEach>';
    		strLang += '</select>';
    		strLang += '<select class="lang-select" name="languageVOList['+cntLang+'].langLevel">';
    		strLang += '<option value="상">상</option>';
    		strLang += '<option value="중">중</option>';
    		strLang += '<option value="하">하</option>';
    		strLang += '</select>';
    		strLang += '</div>';
    		strLang += '</div>';
    		strLang += '<div class="lang-career-right-div">';
    		strLang += '<div class="trash-icon talign-right mb-7" >';
    		strLang += '<i class="fa-solid fa-poo lang-det-fa-poo"></i>';
    		strLang += '<i class="fa-solid fa-trash-can lang-det-trash-icon"></i>';
    		strLang += '</div>';
    		strLang += '<div class="flex">';
    		strLang += '<div class="lang-det-left-div">';
    		strLang += '<div class="group-date">';
    		strLang += '<label>취득일자</label>';
    		strLang += '<label>~</label>';
    		strLang += '<label>만료일자</label>';
    		strLang += '</div>';
    		strLang += '<div class="group-date">';
    		strLang += '<input class="input_resume" name="languageVOList['+cntLang+'].languageDTVOList[0].langDetailAcqDt" type="date" />';
    		strLang += '<span>~</span>';
    		strLang += '<input class="input_resume" name="languageVOList['+cntLang+'].languageDTVOList[0].langDetailExpDt" type="date" />';
    		strLang += '</div>';
    		strLang += '</div>';
    		strLang += '<div class="lang-det-right-div">';
    		strLang += '<div class="enterprise-name">';
    		strLang += '<input class="input_resume_text1" name="languageVOList['+cntLang+'].languageDTVOList[0].langDetailScore" placeholder="어학점수" type="text" value="" >';
    		strLang += '</div>';
    		strLang += '<div class="flexible_textarea">';
    		strLang += '<textarea class="medit" name="languageVOList['+cntLang+'].languageDTVOList[0].langDetailName" placeholder="관련 상세 사항"></textarea>';
    		strLang += '</div>';
    		strLang += '</div>';
    		strLang += '</div>';
    		strLang += '</div>';
    		strLang += '</div>';
    		
    	$(".lang-career-div").append(strLang);
    	
    });
    
    //어학 삭제
    $(".lang-trash-icon").on("click", function() {
    	
    	if(cntLang < 1) {
    		
    		alert("어학 하나는 냄겨라.,.");
    		return;
    	}
    	
    	$(".lang-career-div").children().last().remove();
    	--cntLang;
    });
    
    //어학 상세 생성
    $(document).on("click", ".lang-det-fa-poo", function(e) {
    	
		++cntLangDet;
		
		let strLangDet = '<div class="flex">';
			strLangDet += '<div class="lang-det-left-div">';
			strLangDet += '<div class="group-date">';
			strLangDet += '<label>취득일자</label>';
			strLangDet += '<label>~</label>';
			strLangDet += '<label>만료일자</label>';
			strLangDet += '</div>';
			strLangDet += '<div class="group-date">';
			strLangDet += '<input class="input_resume" name="languageVOList['+cntLang+'].languageDTVOList['+cntLangDet+'].langDetailAcqDt" type="date" />';
			strLangDet += '<span>~</span>';
			strLangDet += '<input class="input_resume" name="languageVOList['+cntLang+'].languageDTVOList['+cntLangDet+'].langDetailExpDt" type="date" />';
			strLangDet += '</div>';
			strLangDet += '</div>';
			strLangDet += '<div class="lang-det-right-div">';
			strLangDet += '<div class="enterprise-name">';
			strLangDet += '<input class="input_resume_text1" name="languageVOList['+cntLang+'].languageDTVOList['+cntLangDet+'].langDetailScore" placeholder="어학점수" type="text" value="" >';
			strLangDet += '</div>';
			strLangDet += '<div class="flexible_textarea">';
			strLangDet += '<textarea class="medit" name="languageVOList['+cntLang+'].languageDTVOList['+cntLangDet+'].langDetailName" placeholder="관련 상세 사항"></textarea>';
			strLangDet += '</div>';
			strLangDet += '</div>';
			strLangDet += '</div>';
		
// 		$(".lang-career-right-div").append(strLangDet);
		$(this).parent().parent().append(strLangDet);
			
    });
    
    //어학 상세 삭제
    $(document).on("click",".lang-det-trash-icon", function() {
    	
    	if($(this).parent().parent().children().length < 3){
    		alert("어학 상세 목록 하나는 남겨라");
    		return;    		
    	}
    	
//     	if(cntLangDet < 1) {
    		
//     		alert("어학 상세 목록 하나는 남겨라");
//     		return;
//     	}
    	
    	//$(".lang-career-right-div").children().last().remove();
    	$(this).parent().parent().children().last().remove();
    	
    	--cntLangDet;
    }); 
    
    $(document).on("change", "#comCd", function(){
    	
    	let selectedValue = $("#comCd option:selected").val();
    	
    	console.log("selectedValue",selectedValue);
    	
    	let data = {
    			"comCd" :selectedValue
    	};
    	
    	
		$.ajax({
    		url:"/member/resumeCreateAjax",
    		contentType:"application/json;charset=utf-8",
    		data:JSON.stringify(data),
    		type:"post",
    		dataType:"json",
    		beforeSend : function(xhr) {
                xhr.setRequestHeader(
                      "${_csrf.headerName}",
                      "${_csrf.token}");
			},
    		success:function(rslt){
    			
    			$('#comDetCdJob').html("");
    			
    			$.each(rslt, function(index){
    				
	    			let strComDetInfo = '<option name="comDetCOdeInfoVO" value='+rslt[index].comDetCd+'>'+rslt[index].comDetCdNm+'</option>';
	    			
	    			$('#comDetCdJob').append(strComDetInfo);
    			});
			}
   		})
	});
    
    
    function handleEnter(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord();
        }
    }


    function displayAndStoreWord() {
        const resumeSkills = document.getElementById('resumeSkills');
        const wordContainer = document.getElementById('wordContainer');

        const word = resumeSkills.value.trim();

        if (word !== '') {
            const wordElement = document.createElement('div');
            wordElement.className = 'wordButton';
            wordElement.textContent = word;
            
            const deleteIcon = document.createElement('div');
            deleteIcon.className = 'deleteIcon';
            deleteIcon.textContent = 'x';

            deleteIcon.addEventListener('click', () => {
                wordContainer.removeChild(wordElement);
                updateStoredWords();
            });

            wordElement.appendChild(deleteIcon);

            wordContainer.appendChild(wordElement);
        }

        storedWords += (storedWords.length > 0 ? ', ' : '') + word;
        
        document.getElementById("resumeSkills").value = storedWords;
        document.getElementById("resumeSkill").value = storedWords;

        resumeSkills.value = '';

        console.log('Stored Words:', storedWords);
    }

    function updateStoredWords() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
        document.getElementById("resumeSkills").value = storedWords;
        document.getElementById("resumeSkill").value = storedWords;
        
        resumeSkills.value = '';
        
        console.log('Updated Stored Words:', storedWords);
        
    }
    
    
</script>
