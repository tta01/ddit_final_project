<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<link rel="stylesheet" href="/resources/css/resume.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>


<form action="/memberResume/memberUpdateResumePost" method="get" id="frm" class="no-border">
	<input type="hidden" name="memId" value="${memberVO.memId}" /> 
	<input type="hidden" name="resumeNo" value="${resumeVOList[0].resumeNo}" />
	<div class="mypage-body-con">
		<div class="body-sub-con">

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
			</div>
		</div>
	</div>
		
		<div class="mypage-body-con mt-35">
			<div class="body-sub-con">
				<div class="inner-box">
					<div class="mb-20">
						<p class="bold p-22 mb-40">이력서 제목 <input type="text" class="input01 ml-9" name="resumeTitle" value="${resumeVOList[0].resumeTitle}"></p>
					</div>
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
	<%-- 										<option name="" class="select-comCode" selected value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option> --%>
										<option class="select-comCode" selected value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option> --%>
									</c:when>
									<c:otherwise>
	<%-- 										<option name="" class="select-comCode" value="${comCodeInfoVOList.comCd}">${comCodeInfoVOList.comCdNm}</option> --%>
										<option class="select-comCode" value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option> --%>
									</c:otherwise>
								</c:choose>
	<%-- 								<option class="select-comCode" value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option> --%>
							</c:forEach>
						</select>
					</div>
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
										<input type="text"
											class="tag_input input01 input-sm" onkeydown="handleEnter(event)"
											name="resumeSkills" id="resumeSkills"
											placeholder="스킬을 입력해 주세요 " value="" /> 
											<input type="hidden" name="resumeSkill" id="resumeSkill" value="">
									</label>
								</div>
								<div class="tag_group">
								   <div id="wordContainer">
								      <c:forEach var="skill" items="${resumeVOList[0].resumeSkill.split(',')}">
								         <div class="wordButton">
								            ${skill}
								            <div class="deleteIcon"></div>
								         </div>
								      </c:forEach>
								   </div>
								</div>
							</div>
						</div>
						
					</div>
	
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
					<c:forEach var="careerVOList" items="${careerVOList}" varStatus="stat">
						<div class="flex certi-career-div">
							<div class="career-left-div">
								<div class="group-date">
									<fmt:formatDate pattern="yyyy-MM-dd" var="companyEntranceDt" value="${careerVOList.companyEntranceDt}" />
									<input type="date" name="careerVOList[${stat.index}].companyEntranceDt" value="${companyEntranceDt}" />
									<span>~</span>
									<fmt:formatDate pattern="yyyy-MM-dd" var="companyLeaveDt" value="${careerVOList.companyLeaveDt}" />
									<input type="date" name="careerVOList[${stat.index}].companyLeaveDt" value="${companyLeaveDt}" />
								</div>
								<div class="group_check__box">
									<label class="btn_check">
										<input name="check_new" class="cscheck" type="checkbox"
										<c:if test="${careerVOList.companyEmpStatus == '1'}">
											checked
										</c:if>
										>
										<span class="check_txt">재직중</span>
									</label>
								</div>
							</div>
							<div class="career-right-div" id="career-right-divv">
								<div class="enterprise-name">
									<input class="input_resume_text1" type="text" value="${careerVOList.companyNm}"
										name="careerVOList[${stat.index}].companyNm" >
								</div>
								<div class="enterprise-dept-position">
									<div class="enterprise-dept">
										<input class="input_ent_dept p-15" type="text" value="${careerVOList.companyDept}" name="careerVOList[${stat.index}].companyDept"  >
									</div>
									<div class="enterprise-position">
										<input class="input_ent_position p-15" type="text" value="${careerVOList.companyPosition}" name="careerVOList[${stat.index}].companyPosition"  >
									</div>
								</div>
								<div class="enterprise-job-sal">
									<div>
										<input class="input_ent_job p-15" type="text" value="${careerVOList.companyJob}"  name="careerVOList[${stat.index}].companyJob">
									</div>
									<div>
										<input class="input_ent_salary p-15" type="text" value="${careerVOList.companySalary}" name="careerVOList[${stat.index}].companySalary" >
									</div>
								</div>
								<div class="flexible_textarea">
									<textarea name="careerVOList[${stat.index}].companyDetCareer" class="medit"><c:out value="${fn:trim(careerVOList.companyDetCareer)}" /></textarea>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
					
					<!-- 학력 시작 -->
					<div class="rsm_hgroup" style="margin-top: 80px;">
						<div class="rsm-vertical-center">
							<h3 class="rsm_ttl">학력</h3>
						</div>
					</div>
					
					<c:forEach var="academicCareerVOList" items="${academicCareerVOList}">
						<div class="acd-career-div" >
							<div class="acd-career-left-div">
								<div class="group-date">
									<fmt:formatDate pattern="yyyy년 MM월" value="${academicCareerVOList.acdmcrEntranceDt}" />
									<span>~</span>
									<fmt:formatDate pattern="yyyy년 MM월" value="${academicCareerVOList.acdmcrGrdtnDt}" />
								</div>
							</div>
							<div class="acd-career-right-div">
								<div class="enterprise-name">
									<input class="input_resume_text1" style="width:205px;" placeholder="학교명" type="text" value="${academicCareerVOList.acdmcrNm}" >
								</div>
								<div class="career-three-div">
									<div class="enterprise-dept">
										<input  placeholder="전공" type="text" value="${academicCareerVOList.acdmcrMajor}" >
									</div>
									<div class="enterprise-position">
										<input placeholder="학위" type="text" value="${academicCareerVOList.acdmcrDegree}" >
									</div>
									<div>
										<input class="input_acd-score" placeholder="학점" type="text" value="${academicCareerVOList.acdmcrPoint}"  >
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 학력 끝 -->
	
					<!-- 성과 시작-->
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
						<c:forEach var="resultVOList" items="${resultVOList}" varStatus="stat">
							<div class="result-div">
								<div class="result-div-left-div">
									<div class="group-date">
										<fmt:formatDate pattern="yyyy-MM-dd" var="resultStdt" value="${resultVOList.resultStdt}" />
										<input type="date" name="resultVOList[${stat.index}].resultStdt" value="${resultStdt}" />
										<span>~</span>
										<fmt:formatDate pattern="yyyy-MM-dd" var="resultEddt" value="${resultVOList.resultEddt}" />
										<input type="date" name="resultVOList[${stat.index}].resultEddt" value="${resultEddt}" />
									</div>
								</div>
								<div class="result-div-right-div">
									<div class="enterprise-name">
										<input type="text" class="input_resume_text1" value="${resultVOList.resultTitle}"
											 name="resultVOList[${stat.index}].resultTitle">
									</div>
									<div class="flexible_textarea">
										<textarea name="resultVOList[${stat.index}].resultCntnt" class="medit"><c:out value="${fn:trim(resultVOList.resultCntnt)}" /></textarea>
									</div>
								</div>
							</div>
						</c:forEach>
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
						<c:forEach var="awardsVOList" items="${awardsVOList}" varStatus="stat">
							<div class="awards-career-div">
								<div class="awards-career-left-div">
									<div class="group-date">
										<fmt:formatDate pattern="yyyy-MM-dd" var="awdDt" value="${awardsVOList.awdDt}" />
										<input type="date" name="awardsVOList[${stat.index}].awdDt" value="${awdDt}" />
									</div>
								</div>
								<div class="awards-career-right-div">
									<div class="enterprise-name">
										<input class="input_resume_text1" value="${awardsVOList.awdNm}"
											 name="awardsVOList[${stat.index}].awdNm" type="text">
									</div>
									<div class="flexible_textarea">
										<textarea name="awardsVOList[${stat.index}].awdCntnt" class="medit"><c:out value="${fn:trim(awardsVOList.awdCntnt)}"/></textarea>
									</div>
									<div class="enterprise-name">
										<input type="text" class="input_resume_text1" value="${awardsVOList.awdOrg}"
											name="awardsVOList[${stat.index}].awdOrg">
									</div>
								</div>
							</div>
						</c:forEach>
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
					<div class="lang-div-true">
						<c:forEach var="languageVOList" items="${languageVOList}" varStatus="stat">
							<div class="lang-div">
								<div class="lang-div-left">
									<div class="lang-select-div">
										<c:set var="langKind" value="${languageVOList.langKind}"></c:set>
										<select class="lang-select" name="languageVOList[${stat.index}].langKind">
											<option value="한국어" <c:if test="${langKind eq '한국어'}">selected</c:if>>한국어</option>
											<option value="영어" <c:if test="${langKind eq '영어'}">selected</c:if>>영어</option>
											<option value="일본어" <c:if test="${langKind eq '일본어'}">selected</c:if>>일본어</option>
											<option value="중국어" <c:if test="${langKind eq '중국어'}">selected</c:if>>중국어</option>
											<option value="프랑스어" <c:if test="${langKind eq '프랑스어'}">selected</c:if>>프랑스어</option>
											<option value="스페인어" <c:if test="${langKind eq '스페인어'}">selected</c:if>>스페인어</option>
											<option value="아랍어" <c:if test="${langKind eq '아랍어'}">selected</c:if>>아랍어</option>
											<option value="러시아어" <c:if test="${langKind eq '러시아어'}">selected</c:if>>러시아어</option>
											<option value="기타" <c:if test="${langKind eq '기타'}">selected</c:if>>기타</option>
										</select> 
										<c:set var="langLevel" value="${languageVOList.langLevel}"></c:set>
										<select class="lang-select" name="languageVOList[${stat.index}].langLevel">
											<option value="상" <c:if test="${langLevel eq '상'}">selected</c:if>>상</option>
											<option value="중" <c:if test="${langLevel eq '중'}">selected</c:if>>중</option>
											<option value="하" <c:if test="${langLevel eq '하'}">selected</c:if>>하</option>
										</select>
									</div>
								</div>
								<div class="lang-div-right">	<!-- 어학 및 어학 상세 시작 -->
									<div class="trash-icon talign-right mb-7">
										<button type="button" class="btn-plus mr-9 lang-det-btn-plus" >+ 어학상세추가</button> 
										<button type="button" class="btn-minus lang-det-btn-minus" >- 어학상세삭제</button>
									</div>
									<c:forEach var="languageDTVOList" items="${languageVOList.languageDTVOList}" varStatus="statt">
										<div class="lang-det-div">
											<div class="flex" style="margin-bottom:12px">
												<div class="lang-det-div-left">
													<div class="lang-date-text">
														<p>취득일자</p>
														<p>만료일자</p>
													</div>
													<div class="group-date">
														<fmt:formatDate pattern="yyyy-MM-dd" var="langDetailAcqDt" value="${languageDTVOList.langDetailAcqDt}" />
														<input type="date" name="languageVOList[${stat.index}].languageDTVOList[${statt.index}].langDetailAcqDt" value="${langDetailAcqDt}" />
														<span>~</span>
														<fmt:formatDate pattern="yyyy-MM-dd" var="langDetailExpDt" value="${languageDTVOList.langDetailExpDt}" />
														<input type="date" name="languageVOList[${stat.index}].languageDTVOList[${statt.index}].langDetailExpDt" value="${langDetailExpDt}" />
													</div>
												</div>
												<div class="lang-det-div-right">
													<div>
														<input class="bold" name="languageVOList[${stat.index}].languageDTVOList[${statt.index}].langDetailScore" type="text" value="${languageDTVOList.langDetailScore}" />
													</div>
													<div class="flexible_textarea">
														<textarea class="medit" name="languageVOList[${stat.index}].languageDTVOList[${statt.index}].langDetailName" ><c:out value="${fn:trim(languageDTVOList.langDetailName)}" /></textarea>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>	<!-- 어학 및 어학 상세 끝 -->
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
		
		
	</div>
	<div class="fixed-footer">
		<div class="cen">
			<button type="submit" class="p-17 btn btn-big" id="btnResumeRepre">저장</button>
			<button type="button" id="delete" class="btn btn-big btn-primary p-17  bg-red color-white  btn-user btn-block">취소</button>
		</div>
	</div>
	<sec:csrfInput />
</form>

<script type="text/javascript">

	// 경력사항 카운트 전역변수
// 	let cntCrer = 0
	
	// 성과 카운트 전역변수
// 	let cntResult = 0;
	
	// 수상 카운트 전역변수
// 	let cntAwards = 0;
	
	// 입력된 단어들 저장하기 위한 변수
	let storedWords = '';
	
	// 경력사항 추가 버튼
	$(document).on("click", "#career-btn-plus", function() {
// 		++cntCrer;

		let cntCrer = $(this).parent().parent().children().length - 1;
		
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
	
	// 경력사항 삭제 버튼
	$(document).on("click", "#career-btn-minus", function() {
		
		if (($(this).parent().parent().children().length - 1) < 1) {
			
			alert("경력사항 한 개는 남기세요.");
			return;
		}
		$("#career-div-career").children().last().remove();
		
		
	});
	
	// 성과 추가 버튼
	$(document).on("click", "#result-btn-plus", function(e) {
// 		++cntResult;
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let cntResult = childrenOfNextSibling.length;
		
// 		let cntResult = $(this).parent().parent().children().length - 1;
		
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
	
	// 성과 추가 버튼
	$(document).on("click", "#result-btn-minus", function() {
		
		if(($(this).parent().parent().children().length - 1) < 1){
			
			alert("수상 하나는 냄겨라..");
			
			return;
		}
		
		$("#result-div").children().last().remove();
		
	});
	
	// 활동 및 수상 추가 버튼
	$(document).on("click", "#awards-btn-plus", function(e) {
// 		++cntAwards;
		let currentElement = e.target;
		// 부모 요소 가져오기
		let parentElement = currentElement.parentNode;
		// 부모의 다음 형제 요소 가져오기
		let nextSibling = parentElement.nextElementSibling;
		// 다음 형제의 자식 요소 목록 가져오기
		let childrenOfNextSibling = nextSibling.children;
		// 자식 요소의 개수 (length) 가져오기
		let cntAwards = childrenOfNextSibling.length;
		
// 		let cntAwards = $(this).parent().parent().children().length - 1;
		
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
		
		if(($(this).parent().parent().children().length - 1) < 1){
			
			alert("수상 하나는 냄겨라..");
			return;
		}
		
		$("#awards-career-div").children().last().remove();
		
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
		let lengthOfChildren = $(this).parent().parent().children().length - 1;
		
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
		
		$(this).parent().parent().last().append(strLangDet);
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
	
</script>
