<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/resources/css/resume.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<style>
	.footer-bot {
		margin-bottom:88px;
	}
	
	.rsm_hgroup input{
		padding:5px 10px;
	}
	.input_ent_salary {
		text-align:right;
	}
</style>

<div class="mypage-body-con">
	<div class="body-sub-con">
		<p class="main-h1">이력서 작성</p>

		<div class="inner-box">
			<div class="rsm_section">
				<div class="photo_use_row">
					<div class="input_resume_basic photo_use_basic">
						<div class="resume-name">
							${memberVO.memNm}
						</div>
						<div class="resume-one-line">
							<div class="with_icon">
								<i class="fa-regular fa-envelope"></i> 
								<p>${memberVO.memEmail}</p>
								<div class="v-div-line ml-15 mr-15"></div>
								<div class="with_icon">
									<i class="fa-solid fa-mobile-screen"></i> 
									<p>${memberVO.memTel}</p>
								</div>
							</div>
						</div>

						<div class="resume-one-line">
							<div class="with_icon">
								<i class="fa-regular fa-user"></i>
								<c:if test="${memberVO.memGen == '0'}">
									<p>남자</p>
								</c:if>
								<c:if test="${memberVO.memGen == '1'}">
									<p>여자</p>
								</c:if>
								
								<div class="v-div-line ml-15 mr-15"></div>
								
								<i class="fa-regular fa-calendar"></i>
								<p>
									<fmt:formatDate pattern="yyyy년생"
										value="${memberVO.memBirth}" />
								</p>
								
								<div class="v-div-line ml-15 mr-15"></div>
								
								<p>
									${fn:split(memberVO.memAddr,' ')[0]} ${fn:split(memberVO.memAddr,' ')[1]}
								</p>
								
							</div>
						</div>
						
						<div class="resume_addphoto" for="resume_addphoto_id">
							<c:choose>
								<c:when test="${memberVO.memAfId  != null}">
									<img alt="" src="/resources/upload/${memberVO.memAfId }">
								</c:when>
								<c:otherwise>
									<img alt="" src="/resources/images/empty-profile.png }">																			
								</c:otherwise>
							</c:choose>
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
									<span class="rsm_ttl__valid">*</span>소개글
								</h3>
							</div>
						</div>

						<div class="rsm_body">
							<div class="rsm_half_cell">
								<label class="cssel_ty1">
									<a class="btn_sel false">${memberVO.memIntrcn}</a>
								</label>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>	<!-- class="inner-box" -->
	</div>	<!-- class="body-sub-con" -->
</div>	<!-- class="mypage-body-con" -->


<form id="frm" name="frm" action="/memberResume/resumeCreatePost" method="post" enctype="multipart/form-data">
	
	<div class="mypage-body-con mt-35">
		<div class="body-sub-con">
			<div class="inner-box">
			
				<!-- 이력서 제목 시작  -->
				<div class="mb-20">
					<p class="bold p-22 mb-40">이력서 제목 : <span class="p-15 ml-9"><input class="input01 input-sm" type="text" name="resumeTitle" placeholder="이력서 제목을 입력하세요" onkeydown="handleEnter(event)"></span></p>
				</div>
				<!-- 이력서 제목 끝  -->
				
				<!-- 직종 선택 시작 -->
				<div class="rsm_hgroup">
					<div class="rsm-vertical-center">
						<span class="rsm_ttl">직종</span>
					</div>
				</div>
				
				<div class="resume-two-div">
					<select name="resumeOccp" class="input01" id="comCd" style="width:80%">
						<c:forEach var="comCodeInfoVOList" items="${comCodeInfoVOList}">
							<c:choose>
								<c:when test="${comCodeInfoVOList.comCd == resumeVOList[0].resumeOccp}" >
									<option class="select-comCode" selected value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option>
								</c:when>
								<c:otherwise>
									<option class="select-comCode" value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select> 
					<select name="resumeJob" class="input01" id="comDetCdJob" style="width:80%">
						<c:forEach var="comDetCodeInfoVOList" items="${comDetCodeInfoVOList}">
							<c:choose>
								<c:when test="${comDetCodeInfoVOList.comDetCd == resumeVOList[0].resumeJob}" >
									<option class="select-comCode" selected value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option>
								</c:when>
								<c:otherwise>
									<option class="select-comCode" value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option> 
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<option name="resumeJob" value="MWJ01000">개발</option><option name="resumeJob" value="MWJ0100001">개발.소프트웨어 엔지니어</option><option name="resumeJob" value="MWJ0100002">개발.프론트엔드 개발자</option><option name="resumeJob" value="MWJ0100003">개발.웹 개발자</option><option name="resumeJob" value="MWJ0100004">개발.서버 개발자</option><option name="resumeJob" value="MWJ0100005">개발.자바 개발자</option><option name="resumeJob" value="MWJ0100006">개발.C/C++ 개발자</option><option name="resumeJob" value="MWJ0100007">개발.파이썬 개발자</option><option name="resumeJob" value="MWJ0100008">개발.머신러닝 엔지니어</option><option name="resumeJob" value="MWJ0100009">개발.데이터 엔지니어</option><option name="resumeJob" value="MWJ0100010">개발.시스템/ 네트워크 관리자</option><option name="resumeJob" value="MWJ0100011">개발.Node js 개발자</option><option name="resumeJob" value="MWJ0100012">개발.안드로이드 개발자</option><option name="resumeJob" value="MWJ0100013">개발.IOS 개발자</option><option name="resumeJob" value="MWJ0100014">개발.DBA</option><option name="resumeJob" value="MWJ0100015">개발.빅데이터 엔지니어</option>
					</select>
				</div>
				<!-- 직종 선택 끝 -->
				
				<!-- 업무 및 스킬 시작 -->
				<div style="margin-bottom: 60px;">
					<div class="rsm_hgroup">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">내 업무 및 스킬</h3>
						</div>
					</div>

					
					<ul class="rsm_sub_info mb-12">
						<li>업무와 관련된 스킬을 추가해 보세요</li>
						<li>1개 입력 시 이력서 작성률이 10%, 3개 입력 시 20%, 5개 이상 입력 시 30% 높아져요</li>
					</ul>
					<div class="rsm_body" style="margin-top:20px;">
						<div class="tagging_wrap">
							<div class="input_group frow_ty1 rtag_auto_list">
								<label for="resumeSkills"> 
									<input type="text" class="tag_input input01 input-sm" name="resumeSkills" id="resumeSkills" onkeydown="handleEnter(event)"  placeholder="스킬을 입력해 주세요 " value="" /> 
									<input type="hidden" name="resumeSkill" id="resumeSkill" value="">
								</label>
							</div>
							<div class="tag_group">
							   <div id="wordContainer">
							   </div>
							</div>
						</div>
					</div>
				</div>
				<!-- 업무 및 스킬 끝 -->
				
				<!-- 경력, 학력, 성과, 활동 및 수상, 어학 및 어학상세정보 시작 -->
				<div class="rsm_hgroup">
					<div class="rsm-vertical-center">
						<h3 class="rsm_ttl">경력(인턴 포함)</h3>
					</div>
					
					<ul class="rsm_sub_info">
						<li>수행한 업무와 성과 기반으로 작성해 보세요</li>
						<li>기업명과 경력 상세 내용을 30자 이상 입력하면 작성률이 20% 높아져요</li>
					</ul>
					
					<!-- 경력 시작 -->
					<div class="career-div-career" id="career-div-career" style="margin-top:20px;">
						<div class="trash-icon talign-right mb-7">
							<button type="button" class="btn-plus mr-9" id="career-btn-plus">+ 추가</button> 
							<button type="button" class="btn-minus" id="career-btn-minus">- 삭제</button>
						</div>
						
						<div class="flex certi-career-div">
							<div class="career-left-div">
								<div class="group-date">
									<input type="date" name="careerVOList[0].companyEntranceDt" />
									<span>~</span>
									<input type="date" name="careerVOList[0].companyLeaveDt"  />
								</div>
								<div class="group_check__box">
									<label class="btn_check">
										<input name="careerVOList[0].companyEmpStatus" class="cscheck" type="checkbox" value="0" onchange="updateCheckboxValue(this)"> 
										<span class="check_txt">재직중</span>
									</label>
								</div>
							</div>
							<div class="career-right-div" id="career-right-divv">
								<div class="enterprise-name">
									<input class="input_resume_text1" type="text" name="careerVOList[0].companyNm" placeholder="기업명" >
								</div>
								<div class="enterprise-dept-position">
									<div class="enterprise-dept">
										<input class="input_ent_dept p-15" type="text" name="careerVOList[0].companyDept" placeholder="부서" >
									</div>
									<div class="enterprise-position">
										<input class="input_ent_position p-15" type="text" name="careerVOList[0].companyPosition" placeholder="직책" >
									</div>
								</div>
								<div class="enterprise-job-sal">
									<div>
										<input class="input_ent_job p-15" type="text" name="careerVOList[0].companyJob" placeholder="직무">
									</div>
									<div>
										<input class="input_ent_salary p-15" onkeyup="numberComma(this)" type="text" name="careerVOList[0].companySalary" placeholder="연봉(선택사항)" >
									</div>
								</div>
								<div class="flexible_textarea">
									<textarea name="careerVOList[0].companyDetCareer" class="medit" placeholder="경력사항을 입력해보세요."></textarea>
								</div>
							</div>
						</div>
					</div>	<!-- class="career-div-career" 경력 끝 -->
					
					<!-- 학력 시작 -->
					<div class="rsm_hgroup" style="margin-top: 80px;">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">학력</h3>
						</div>
					</div>
					<c:forEach var="academicCareerVOList" items="${academicCareerVOList}">
						<div class="acd-career-div">
							<div class="acd-career-left-div">
								<div class="group-date">
									<fmt:formatDate pattern="yyyy년  MM월" value="${academicCareerVOList.acdmcrEntranceDt}" />
									<span>~</span> 
									<fmt:formatDate pattern="yyyy년  MM월" value="${academicCareerVOList.acdmcrGrdtnDt}" />
								</div>
							</div>
							<div class="acd-career-right-div">
								<div class="enterprise-name">
									<p>${academicCareerVOList.acdmcrNm}</p>
								</div>
								<div class="enterprise-dept-position career-three-div">
									<div class="enterprise-dept">
										<p>${academicCareerVOList.acdmcrMajor}</p>
									</div>
									<div class="enterprise-position">
										<p>${academicCareerVOList.acdmcrDegree}</p>
									</div>
									<div>
										<p>${academicCareerVOList.acdmcrPoint}</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 학력 끝 -->
					
					<!-- 성과 시작 -->
					<div class="rsm_hgroup" style="margin-top: 80px;">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">성과</h3>
						</div>
					</div>
	
					<div class="trash-icon talign-right mb-7">
						<button type="button" class="btn-plus mr-9" id="result-btn-plus">+ 추가</button> 
						<button type="button" class="btn-minus" id="result-btn-minus">- 삭제</button>
					</div>
					<div id="result-div">
						<div class="result-div">
							<div class="result-div-left-div">
								<div class="group-date">
									<input type="date" name="resultVOList[0].resultStdt" />
									<span>~</span>
									<input type="date" name="resultVOList[0].resultEddt" />
								</div>
							</div>
							<div class="result-div-right-div">
								<div class="enterprise-name">
									<input type="text" class="input_resume_text1" name="resultVOList[0].resultTitle" placeholder="성과명">
								</div>
								<div class="flexible_textarea">
									<textarea name="resultVOList[0].resultCntnt" class="medit" placeholder="성과에 대한 설명을 입력하세요"></textarea>
								</div>
							</div>
						</div>
					</div>
					<!-- 성과 끝 -->
					
					<!-- 활동 및 수상 시작 -->
					<div class="rsm_hgroup" style="margin-top: 80px;">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">활동 및 수상</h3>
						</div>
					</div>

					<div class="trash-icon talign-right mb-7">
						<button type="button" class="btn-plus mr-9" id="awards-btn-plus">+ 추가</button> 
						<button type="button" class="btn-minus" id="awards-btn-minus">- 삭제</button>
					</div>
					
					<div id="awards-career-div">
						<div class="awards-career-div">
							<div class="awards-career-left-div">
								<div class="group-date">
									<input type="date" name="awardsVOList[0].awdDt" />
								</div>
							</div>
							<div class="awards-career-right-div">
								<div class="enterprise-name">
									<input class="input_resume_text1"  name="awardsVOList[0].awdNm" type="text" placeholder="활동 및 수상명">
								</div>
								<div class="flexible_textarea">
									<textarea name="awardsVOList[0].awdCntnt" class="medit" placeholder="활동 및 수상에 대한 설명 입력"></textarea>
								</div>
								<div class="enterprise-name">
									<input type="text" class="input_resume_text1" name="awardsVOList[0].awdOrg" placeholder="수여 기관">
								</div>
							</div>
						</div>
					</div>
					<!-- 활동 및 수상 끝 -->
					
					
					<!-- 어학 및 어학 상세 시작 -->
					<div class="rsm_hgroup" style="margin-top: 80px;">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">어학 및 어학 상세정보</h3>
						</div>
					</div>
					<div class="trash-icon talign-left mb-7">
						<button type="button" class="btn-plus mr-9" id="lang-btn-plus">+ 어학추가</button> 
						<button type="button" class="btn-minus" id="lang-btn-minus">- 어학삭제</button>
					</div>
					
					<!-- 어학 시작 -->
					<div class="lang-div-true">
						<div class="lang-div">
							<div class="lang-div-left">
								<div class="lang-select-div">
									<select class="lang-select" name="languageVOList[0].langKind">
										<option value="한국어">한국어</option>
										<option value="영어">영어</option>
										<option value="일본어">일본어</option>
										<option value="중국어">중국어</option>
										<option value="프랑스어">프랑스어</option>
										<option value="스페인어">스페인어</option>
										<option value="아랍어">아랍어</option>
										<option value="러시아어">러시아어</option>
										<option value="기타">기타</option>
									</select> 
									<select class="lang-select" name="languageVOList[0].langLevel">
										<option value="상">상</option>
										<option value="중">중</option>
										<option value="하">하</option>
									</select>
								</div>
							</div>
							<div class="lang-div-right">	<!-- 어학 및 어학 상세 시작 -->
								<div class="trash-icon talign-right mb-7">
									<button type="button" class="btn-plus mr-9 lang-det-btn-plus" >+ 어학상세추가</button> 
									<button type="button" class="btn-minus lang-det-btn-minus" >- 어학상세삭제</button>
								</div>
								<div class="lang-det-div">
									<div class="flex" style="margin-bottom:12px">
										<div class="lang-det-div-left">
											<div class="lang-date-text">
												<p>취득일자</p>
												<p>만료일자</p>
											</div>
											<div class="group-date">
												<input type="date" name="languageVOList[0].languageDTVOList[0].langDetailAcqDt" />
												<span>~</span>
												<input type="date" name="languageVOList[0].languageDTVOList[0].langDetailExpDt" />
											</div>
										</div>
										<div class="lang-det-div-right">
											<div>
												<input class="bold" name="languageVOList[0].languageDTVOList[0].langDetailScore" placeholder="어학점수" type="text" value="" />
											</div>
											<div class="flexible_textarea">
												<textarea class="medit" name="languageVOList[0].languageDTVOList[0].langDetailName" placeholder="관련 상세 사항"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>	<!-- 어학 및 어학 상세 끝 -->
						</div>
					</div>
					<!-- 어학 끝 -->
					
				</div>	<!-- class="rsm_hgroup" -->
				<!-- 경력, 학력, 성과, 활동 및 수상, 어학 및 어학상세정보 시작 -->
				
			</div>	<!-- class="inner-box" -->
		</div>	<!-- class="body-sub-con" -->
	</div>	<!-- class="mypage-body-con mt-35" -->
	<div class="fixed-footer">
		<div class="cen">
			<button type="button" id="resume-complete" class="p-17 bold txt-white btn btn-big bg-sig">자동완성</button>
			<button type="submit" class="p-17 bold txt-white btn btn-big bg-sig">이력서 등록</button>
		</div>
	</div>
	<sec:csrfInput />
</form>

<script type="text/javascript" src="/resources/js/func.js"></script>
<script type="text/javascript">

	// 경력사항 카운트 전역변수
	let cntCrer = 0
	
	// 성과 카운트 전역변수
	let cntResult = 0;
	
	// 수상 카운트 전역변수
	let cntAwards = 0;
	
	// 입력된 단어들 저장하기 위한 변수
	let storedWords = '';
	
	// 경력사항 추가 버튼
	$(document).on("click", "#career-btn-plus", function() {
		++cntCrer;
		
    	let strCrer = '<div class="flex certi-career-div">';
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
		strCrer += '<input class="input_ent_salary" onkeyup="numberComma(this)" placeholder="연봉(선택사항)" name="careerVOList['+cntCrer+'].companySalary" type="text"  value="" >'; 
		strCrer += '</div>'; 
		strCrer += '</div>'; 
		strCrer += '<div class="flexible_textarea">'; 
		strCrer += '<textarea class="medit" name="careerVOList['+cntCrer+'].companyDetCareer" placeholder="경력사항을 입력해보세요."></textarea>'; 
		strCrer += '</div>'; 
		strCrer += '</div>'; 
		strCrer += '</div>'; 
		
		$("#career-div-career").append(strCrer);
	});
	
	// 경력사항 삭제 버튼
	$(document).on("click", "#career-btn-minus", function() {
		
    	if (cntCrer < 1) {
    		alert("경력사항 한 개는 남기세요.");
    		return;
    	}
    	$("#career-div-career").children().last().remove();
    	
    	--cntCrer;
		
	});
	
	// 성과 추가 버튼
	$(document).on("click", "#result-btn-plus", function() {
    	++cntResult;
    	
    	let strCerti = '<div class="result-div">';
    		strCerti += '<div class="result-div-left-div">';
    		strCerti += '<div class="group-date">';
    		strCerti += '<input type="date" name="resultVOList['+cntResult+'].resultStdt" />';
    		strCerti += '<span>~</span>';
    		strCerti += '<input type="date" name="resultVOList['+cntResult+'].resultEddt" />';
    		strCerti += '</div>';
    		strCerti += '</div>';
    		strCerti += '<div class="result-div-right-div">';
    		strCerti += '<div class="enterprise-name">';
    		strCerti += '<input type="text" class="input_resume_text1" name="resultVOList['+cntResult+'].resultTitle" placeholder="성과명">';
    		strCerti += '</div>';
    		strCerti += '<div class="flexible_textarea">';
    		strCerti += '<textarea class="medit" name="resultVOList['+cntResult+'].resultCntnt" placeholder="성과에 대한 설명을 입력하세요"></textarea>';
    		strCerti += '</div>';
    		strCerti += '</div>';
    		strCerti += '</div>';

    	$("#result-div").append(strCerti);
	});
	
	// 성과 삭제 버튼
	$(document).on("click", "#result-btn-minus", function() {
		
    	if(cntResult < 1){
    		
    		alert("수상 하나는 냄겨라..");
    		
    		return;
    	}
    	
    	$("#result-div").children().last().remove();
    	
    	--cntResult;
	});
	
	// 활동 및 수상 추가 버튼
	$(document).on("click", "#awards-btn-plus", function() {
    	++cntAwards;
    	
    	let strAwards = '<div class="awards-career-div">';
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
	$(document).on("click", '#awards-btn-minus', function() {
		
    	if(cntAwards < 1){
    		
    		alert("수상 하나는 냄겨라..");
    		return;
    	}
    	
    	$("#awards-career-div").children().last().remove();
    	
    	--cntAwards;
	});
	
	// 어학 추가 버튼
	$(document).on("click", "#lang-btn-plus", function(e) {
		
		// 현재 요소에 대한 참조 가져오기
// 		var currentElement = document.getElementById('lang-btn-plus');
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let lengthOfChildren = childrenOfNextSibling.length;
		
// 		let parentValue = $(this).parent().parent().children().length - 15;
		
		let strLang = '<div class="lang-div">';
		strLang += '<div class="lang-div-left">';
		strLang += '<div class="lang-select-div">';
		strLang += '<select class="lang-select" name="languageVOList['+lengthOfChildren+'].langKind">';
		strLang += '<option value="한국어">한국어</option>';
		strLang += '<option value="영어">영어</option>';
		strLang += '<option value="일본어">일본어</option>';
		strLang += '<option value="중국어">중국어</option>';
		strLang += '<option value="프랑스어">프랑스어</option>';
		strLang += '<option value="스페인어">스페인어</option>';
		strLang += '<option value="아랍어">아랍어</option>';
		strLang += '<option value="러시아어">러시아어</option>';
		strLang += '<option value="기타">기타</option>';
		strLang += '</select> ';
		strLang += '<select class="lang-select" name="languageVOList['+lengthOfChildren+'].langLevel">';
		strLang += '<option value="상">상</option>';
		strLang += '<option value="중">중</option>';
		strLang += '<option value="하">하</option>';
		strLang += '</select>';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '<div class="lang-div-right">';
		strLang += '<div class="trash-icon talign-right mb-7">';
		strLang += '<button type="button" class="btn-plus mr-9 lang-det-btn-plus" >+ 어학상세추가</button> ';
		strLang += '<button type="button" class="btn-minus lang-det-btn-minus" >- 어학상세삭제</button>';
		strLang += '</div>';
		strLang += '<div class="lang-det-div">';
		strLang += '<div class="flex" style="margin-bottom:12px">';
		strLang += '<div class="lang-det-div-left">';
		strLang += '<div class="lang-date-text">';
		strLang += '<p>취득일자</p>';
		strLang += '<p>만료일자</p>';
		strLang += '</div>';
		strLang += '<div class="group-date">';
		strLang += '<input type="date" name="languageVOList['+lengthOfChildren+'].languageDTVOList[0].langDetailAcqDt" />';
		strLang += '<span>~</span>';
		strLang += '<input type="date" name="languageVOList['+lengthOfChildren+'].languageDTVOList[0].langDetailExpDt" />';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '<div class="lang-det-div-right">';
		strLang += '<div>';
		strLang += '<input class="bold" name="languageVOList['+lengthOfChildren+'].languageDTVOList[0].langDetailScore" placeholder="어학점수" type="text" value="" />';
		strLang += '</div>';
		strLang += '<div class="flexible_textarea">';
		strLang += '<textarea class="medit" name="languageVOList['+lengthOfChildren+'].languageDTVOList[0].langDetailName" placeholder="관련 상세 사항"></textarea>';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '</div>';
		strLang += '</div>';
	
	$(".lang-div-true").append(strLang);
	
	});
	
	// 어학 삭제 버튼
	$(document).on("click", "#lang-btn-minus", function(e) {
		
		// 현재 요소에 대한 참조 가져오기
// 		var currentElement = document.getElementById('lang-btn-plus');
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let lengthOfChildren = childrenOfNextSibling.length;
		
        if(lengthOfChildren < 2) {
            
            alert("어학 하나는 냄겨라..");
            
            return;
         }
    	
    	$(".lang-div-true").children().last().remove();
	});
	
	// 어학 상세 추가 버튼
	$(document).on("click", ".lang-det-btn-plus", function(e) {
		
		
		let parentIndex = $(this).parent().parent().parent().parent().children().length - 1;
		
		// 어학상세 index
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let lengthOfChildren = childrenOfNextSibling.length;
		
		let strLangDet = '<div class="flex">';
		strLangDet += '<div class="lang-det-div-left">';
		strLangDet += '<div class="lang-date-text">';
		strLangDet += '<p>취득일자</p>';
		strLangDet += '<p>만료일자</p>';
		strLangDet += '</div>';
		strLangDet += '<div class="group-date">';
		strLangDet += '<input type="date" name="languageVOList['+parentIndex+'].languageDTVOList['+lengthOfChildren+'].langDetailAcqDt" />';
		strLangDet += '<span>~</span>';
		strLangDet += '<input type="date" name="languageVOList['+parentIndex+'].languageDTVOList['+lengthOfChildren+'].langDetailExpDt" />';
		strLangDet += '</div>';
		strLangDet += '</div>';
		strLangDet += '<div class="lang-det-div-right">';
		strLangDet += '<div>';
		strLangDet += '<input class="bold" name="languageVOList['+parentIndex+'].languageDTVOList['+lengthOfChildren+'].langDetailScore" placeholder="어학점수" type="text" value="" />';
		strLangDet += '</div>';
		strLangDet += '<div class="flexible_textarea">';
		strLangDet += '<textarea class="medit" name="languageVOList['+parentIndex+'].languageDTVOList['+lengthOfChildren+'].langDetailName" placeholder="관련 상세 사항"></textarea>';
		strLangDet += '</div>';
		strLangDet += '</div>';
		strLangDet += '</div>';
		
		$(this).parent().next().append(strLangDet);
	});
	
	// 어학 상세 삭제 버튼
	$(document).on("click", ".lang-det-btn-minus", function(e) {
		
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let lengthOfChildren = childrenOfNextSibling.length;
		
		if ( $(this).parent().parent().children().length < 3) {
			alert("한개는 남기세요");
			
			return;
		}
		
		$(this).parent().parent().children().last().remove();
	});
	
	
	
	// Enter 누를 때 자동제출 이벤트 막기 시작
    function handleEnter(event) {
        if (event.key === 'Enter') {
        	
        	event.preventDefault();
        	
            displayAndStoreWord();
        }
    }
	// Enter 누를 때 자동제출 이벤트 막기 끝
	
	// 직군 선택했을 때 직업 나오는 Ajax 시작
	$(document).on("change", "#comCd", function(){
    	
    	let selectedValue = $("#comCd option:selected").val();
    	
    	console.log("selectedValue",selectedValue);
    	
    	let data = {
    			"comCd" :selectedValue
    	};
    	
    	
		$.ajax({
    		url:"/memberResume/resumeCreateAjax",
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
    				
	    			let strComDetInfo = '<option name="resumeJob" value='+rslt[index].comDetCd+'>'+rslt[index].comDetCdNm+'</option>';
	    			
	    			$('#comDetCdJob').append(strComDetInfo);
    			});
			}
   		})
	});
	// 직군 선택했을 때 직업 나오는 Ajax 끝
	
	// 내 업무 및 스킬 단어 추가 메서드 시작
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
	// 내 업무 및 스킬 단어 추가 메서드 끝

	// 내 업무 및 스킬 단어 수정 메서드 시작
    function updateStoredWords() {
    	
        const wordElements = document.querySelectorAll('.wordButton');
        
        storedWords = Array.from(wordElements).map(element => element.textContent.replace('x', '').trim()).join(', ');
        
//         document.getElementById("resumeSkills").value = storedWords;
        document.getElementById("resumeSkill").value = storedWords;
        
        resumeSkills.value = '';
        
        console.log('Updated Stored Words:', storedWords);
        
    }
	// 내 업무 및 스킬 단어 수정 메서드 끝

	// X 버튼 눌렀을 때 삭제 메서드 시작
    $(document).on('click', '.deleteIcon', function () {
        $(this).closest('.wordButton').remove();
    });
	// X 버튼 눌렀을 때 삭제 메서드 끝
    
    $(document).ready(function () {
        // 동적으로 생성된 버튼에 클릭 이벤트 연결
        $(document).on('click', '.removeButton', function () {
            $(this).closest('.skillItem').remove(); // 클릭된 버튼의 부모 요소를 찾아서 제거하여 사라지게 만듭니다.
        });
    });
	
	function updateCheckboxValue(checkbox) {
		
		if (checkbox.checked) {
			checkbox.value = "1";
		} else {
			checkbox.value = "0";
		}
	}
	
	$(document).on("click", "#resume-complete", function() {
		
// 		$('input[name=acdmcrNm]').attr('value',"한남대학교");
// 		$('select[name=acdmcrAttnd]').val("1");
// 		$('select[name=acdmcrEducation]').val("2");
// 		$('select[name=acdmcrDegree]').val("학사");
// 		$('input[name=acdmcrMajor]').attr('value',"컴퓨터공학");
// 		$('input[name=acdmcrEntranceDt]').attr('value',"2011-03-01");
// 		$('input[name=acdmcrPoint]').attr('value',"4.0");
// 		$('input[name=acdmcrGrdtnDt]').attr('value',"2016-12-31");
// 		$('input[name=acdmcrYn]').attr('checked',true);
		
		$('input[name=resumeTitle]').attr('value',"크리스피드 이력서");
		$('select[name=resumeOccp]').val("MWJ01000");
		$('select[name=resumeJob]').val("MWJ0100001");
		$('input[name=resumeSkills]').attr('value',"Spring");
		displayAndStoreWord();
		
		var companyEntranceDt = "careerVOList[0].companyEntranceDt";
		var companyLeaveDt = "careerVOList[0].companyLeaveDt";
		var companyNm = "careerVOList[0].companyNm";
		var companyDept = "careerVOList[0].companyDept";
		var companyPosition = "careerVOList[0].companyPosition";
		var companyJob = "careerVOList[0].companyJob";
		var companySalary = "careerVOList[0].companySalary";
		
		var inputs1 = document.getElementsByName(companyEntranceDt);
		var inputs2 = document.getElementsByName(companyLeaveDt);
		var inputs3 = document.getElementsByName(companyNm);
		var inputs4 = document.getElementsByName(companyDept);
		var inputs5 = document.getElementsByName(companyPosition);
		var inputs6 = document.getElementsByName(companyJob);
		var inputs7 = document.getElementsByName(companySalary);
		
		inputs1[0].value = "2022-01-01";
		inputs2[0].value = "2023-12-25";
		inputs3[0].value = "현대건설";
		inputs4[0].value = "개발팀";
		inputs5[0].value = "대리";
		inputs6[0].value = "개발";
		inputs7[0].value = "38,000,000만원";
		
		$('textarea[name="careerVOList[0].companyDetCareer"]').val(`
현대건설 백엔드 개발자.

개발팀 대리 2년 근무
`);
		
		
		$('input[name="resultVOList[0].resultStdt"]').attr('value',"2019-09-01");
		$('input[name="resultVOList[0].resultEddt"]').attr('value',"2019-12-24");
		$('input[name="resultVOList[0].resultTitle"]').attr('value',"캡스톤 프로젝트 ");
		$('textarea[name="resultVOList[0].resultCntnt"]').val(`
정보보안 캡스톤 프로젝트

대상 수상
`);
		
		$('input[name="awardsVOList[0].awdDt"]').attr('value',"2023-04-05");
		$('input[name="awardsVOList[0].awdNm"]').attr('value',"코드 경진대회");
		$('textarea[name="awardsVOList[0].awdCntnt"]').val(`코드 경진대회 1등`)
		$('input[name="awardsVOList[0].awdOrg"]').attr('value',"ACM ICPC");
		
		$('select[name="languageVOList[0].langKind"]').val("영어");
		$('select[name="languageVOList[0].langLevel"]').val("상");
		$('input[name="languageVOList[0].languageDTVOList[0].langDetailAcqDt"]').attr('value',"2022-07-23");
		$('input[name="languageVOList[0].languageDTVOList[0].langDetailExpDt"]').attr('value',"2024-07-23");
		$('input[name="languageVOList[0].languageDTVOList[0].langDetailScore"]').attr('value',"935");
		$('textarea[name="languageVOList[0].languageDTVOList[0].langDetailName"]').val(`ETS
토익 935점`);
		$('input[name="languageVOList[0].languageDTVOList[1].langDetailAcqDt"]').attr('value',"2023-02-15");
		$('input[name="languageVOList[0].languageDTVOList[1].langDetailExpDt"]').attr('value',"2025-02-15");
		$('input[name="languageVOList[0].languageDTVOList[1].langDetailScore"]').attr('value',"Advanced Low");
		$('textarea[name="languageVOList[0].languageDTVOList[1].langDetailName"]').val(`ACTFL
오픽 Advanced Low`);
		
		$('select[name="languageVOList[1].langKind"]').val("일본어");
		$('select[name="languageVOList[1].langLevel"]').val("상");
		$('input[name="languageVOList[1].languageDTVOList[0].langDetailAcqDt"]').attr('value',"2022-05-07");
		$('input[name="languageVOList[1].languageDTVOList[0].langDetailExpDt"]').attr('value',"2022-05-07");
		$('input[name="languageVOList[1].languageDTVOList[0].langDetailScore"]').attr('value',"N1");
		$('textarea[name="languageVOList[1].languageDTVOList[0].langDetailName"]').val(`JLPT 일본어 능력시험
N1`);
		
		
		
		
	});
	
</script>
