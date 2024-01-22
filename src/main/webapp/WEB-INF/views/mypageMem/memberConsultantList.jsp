<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="/resources/css/resumeModal.css">

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

.title-hr{
	border: 1px solid #ccc;
	margin-bottom: 8px;
	width: 100%;
}
.sub-con-inner{
	width: 95%;
	margin: auto;
}
.review-list-con{
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 16px 24px;
	margin-top: 16px;
}
.review-pre{
	min-height: 80px;
    overflow-y: auto;
}
.review-hr{
	width: 100%;
	color: #444;
	margin: 16px 0px;
}
.term {
	text-align:center;
}
.counsel {
	border: 1px solid;
	margin-top: 50px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 수정된 부분 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 1060px; /* 수정된 부분 */
	max-height: 80vh; /* 추가된 부분 */
}

.close {
	color: #FFFFFF;
	/*   float: right; */
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 1300px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.resume-modal {
	width: 1060px;
	margin-left: 100px;
}

.skills-box {
	display: inline-block;
	padding: 5px;
	margin: 5px;
	border: 1px solid #000;
	background-color: #f0f0f0;
}

.picture-size-td{
	width:80px;
	height:80px;
}

.picture-size-img{
	width:100%;
	height:100%;
	object-fit: contain;
}

.num{
	text-align: center
}

.form-class{
	display: inline-block;
}
</style>
<div class="mypage-body-con">
	<div class="sub-title-area">
		<div class="body-sub-title">
			상담사 리스트
		</div>
		<hr class="title-hr"/>
	</div>
		
	<div class="body-sub-con">
		<div class="sub-con-inner">
			<div class="card">
				<form:form modelAttribute="memberVO" action="/member/consultantList" method="post">
					<div class="card-header border-0">
						<div class="card-tools" style="display: flex; justify-content: space-between;">
							<span>상담사 ${totalCounsel} 명</span>
							<div class="searchbox">
								<input class="serch-input" placeholder="이름을 검색해주세요." type="text" name="memNm" id="" value="" style="margin-left: auto;">
								<button type="submit" class="btn btn-secondary serch">검색</button>
							</div>
						</div>
					</div>
				</form:form>
				<table class="counsel">
					<colgroup>
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr class="uu_uu">
							<th scope="col" class="headdd"></th>
							<th scope="col" class="headdd">이름</th>
							<th scope="col" class="headdd">성별</th>
							<th scope="col" class="headdd">전화번호</th>
							<th scope="col" class="headdd">이메일</th>
							<th scope="col" class="headdd">분야</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="memberVO" items="${memberVOList}" varStatus="stat">
							<tr class="u_u">
								<c:choose>
									<c:when test="${memberVO.memAfId ne null && memberVO.memAfId  != ''}">
										<td class="picture-size-td">
											<img class="picture-size-img" alt="" src="/resources/upload/${memberVO.memAfId}">
										</td>
									</c:when>
									<c:otherwise>
										<td class="picture-size-td">
											<img class="picture-size-img" src="/resources/images/noimages.png">
										</td>
									</c:otherwise>
								</c:choose>
								<td class="num" scope="row">${memberVO.memNm}</td>
								<c:choose>
									<c:when test="${memberVO.memGen == '1'}">
										<td class="num" scope="row">남</td>
									</c:when>
									<c:otherwise>
										<td class="num" scope="row">여</td>
									</c:otherwise>
								</c:choose>
								<td class="memTel"><c:out value="${memberVO.memTel}" /></td>
								<td class="memEmail"><c:out value="${memberVO.memEmail}" /></td>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01000'}">
										<td class="term">개발<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01001'}">
										<td class="term">경영<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01002'}">
										<td class="term">마케팅/광고<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01003'}">
										<td class="term">디자인<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01004'}">
										<td class="term">영업<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01005'}">
										<td class="term">고객 서비스<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01006'}">
										<td class="term">미디어<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01007'}">
										<td class="term">엔지니어링<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01008'}">
										<td class="term">HR<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01009'}">
										<td class="term">게임/제작<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01010'}">
										<td class="term">금융<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01011'}">
										<td class="term">제조/생산<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01012'}">
										<td class="term">의료/제약/바이오<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01013'}">
										<td class="term">교육<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01014'}">
										<td class="term">물류/무역<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01015'}">
										<td class="term">법률/법집행<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01016'}">
										<td class="term">식/음료<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01017'}">
										<td class="term">건설/시설<br></td>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${memberVO.memWishJobCate == 'MWJ01018'}">
										<td class="term">공공/복지<br></td>
									</c:when>
								</c:choose>

								<td>
									<input type="hidden" class="memberId" value="${memberVO.memId}" /> 
									<input type="hidden" class="ComCodeInfoVO" value="${memberVO.memWishJobCate}" /> 
									<input type="hidden" class="ComDetInfoVO" value="${memberVO.memWishJob}" /> 
									<input type="hidden" class="ComDetInfoVO2" value="${memberVO.memIntWord}" /> 
									<input type="hidden" class="submitResumeNo" value="${memberVO.submitResumeNo}" /> 
									<a class="list-counting__applicants-btn showResume" style="margin-right:20px">이력서 보기</a> 
									<form:form modelAttribute="itemVO" action="/consult/items" method="post" class="form-class">
										<button type="submit" class="goPayment">결제하기</button>
										<input type="hidden" name="conMemId" value="${memberVO.memId}">
									</form:form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagez">${info.getPagingArea5()}</div>
			</div>
		</div><!-- end sub-con-inner -->
	</div><!-- end body-sub-con -->
</div><!-- end myPagebody-con -->

<!-- 모달 -->
<div id="myModal" class="modal">
	<div class="resume-modal">
		<span class="close">&times;</span>
		<div id="modalContent"></div>
	</div>
</div>


<script type="text/javascript">
	$(document).on("click", ".showResume", function() {

		/*
			멤버의 아이디는 가져오는데 이력서는 신청테이블에서 가져와야된다.
			
			근데 신청테이블에서 주는 이력서 번호가 없어서 임시로 넣고 함.
		 */
	
		let memId = $(this).parent().children('input:eq(0)')
				.val();
		let resumeNo = $(this).parent().children('input:eq(4)')
				.val();
	
		// 		console.log("20240102 -> resumeNo : ", resumeNo);
	
		let data = {
			"memId" : memId,
			"resumeNo" : resumeNo
		};
	
		// 		console.log("20240102 -> data : ", data);

		$.ajax({
			url : '/admin/getResume',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(
						"${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(mapMemberVO) {

				// 		    	console.log("20240102 아작스 -> mapMemberVO ", mapMemberVO);

				let memberVO = JSON.parse(mapMemberVO);
				let resumeVOList = memberVO.resumeVOList;
				let academicCareerVOList = memberVO.academicCareerVOList;
				let careerVOList = memberVO.careerVOList;
				let resultVOList = memberVO.resultVOList;
				let languageVOList = memberVO.languageVOList;
				let awardsVOList = memberVO.awardsVOList;
				let comCodeInfoVOList = memberVO.comCodeInfoVOList;
				let comDetCodeInfoVOList = memberVO.comDetCodeInfoVOList;

				//		    	console.log("resumeVOList[0].resumeSkill : " ,resumeVOList[0].resumeSkill);

				//		    	console.log("comCodeInfoVOList 1122zz : " ,comCodeInfoVOList);
				//		    	console.log("comDetCodeInfoVOList 1122zz : " ,comDetCodeInfoVOList);

				//		    	console.log("memberVO : ", memberVO.memberVO);
				//		    	console.log("resumeVOList : ", resumeVOList);
				//		    	console.log("academicCareerVOList : ", academicCareerVOList);
				//		    	console.log("careerVOList : ", careerVOList);
				//		    	console.log("resultVOList : ", resultVOList);
				//		    	console.log("languageVOList : ", languageVOList);
				//		    	console.log("awardsVOList : ", awardsVOList);

				let strTemp = '<div class="mypage-body-con">';
				strTemp += '<div class="body-sub-con">';
				strTemp += '<div class="page-main-box">';
				strTemp += '<p class="main-h1" style="color:white;">이력서 상세</p>';
				strTemp += '<div class="inner-box">';
				strTemp += '<div class="rsm_hgroup rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">';
				strTemp += '<span class="rsm_ttl__valid">*</span>기본 정보';
				strTemp += '</h3>';
				strTemp += '</div>';
				strTemp += '<hr />';
				strTemp += '<div class="rsm_section">';
				strTemp += '<div class="photo_use_row">';
				strTemp += '<div class="input_resume_basic photo_use_basic">';
				strTemp += '<div class="set1">';
				strTemp += '<input type="text" class="input_resume_name_kr" placeholder="이름" maxlength="15" value="'+memberVO.memberVO.memNm+'">';
				strTemp += '</div>';
				strTemp += '<div class="set2">';
				strTemp += '<div class="with_icon">';
				strTemp += '<i class="fa-regular fa-envelope"></i> <input type="text" class="input_resume_email" placeholder="이메일" maxlength="50" value="'+memberVO.memberVO.memEmail+'">';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="set2">';
				strTemp += '<div class="with_icon">';
				strTemp += '<i class="fa-solid fa-mobile-screen"></i> <input type="text" class="input_resume_phone" placeholder="전화번호" minlength="10" maxlength="11" value="'+memberVO.memberVO.memTel+'">';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="set2">';
				strTemp += '<div class="with_icon">';
				strTemp += '<i class="fa-solid fa-person-half-dress"></i>';
				
				if (memberVO.memberVO.memGen == '1') {
					strTemp += '<input type="text" class="input_resume_gender" value="남자" readonly>';
				} else if (memberVO.memberVO.memGen == '0') {
					strTemp += '<input type="text" class="input_resume_gender" value="여자" readonly>';
				}
				
				strTemp += '<i class="fa-regular fa-calendar-days"></i>';
				strTemp += '<div style="width: 300px;">';
				strTemp += '<input type="date" value="'+memberVO.memberVO.memBirth+'" readonly/>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="resume_addphoto" for="resume_addphoto_id">';
				strTemp += '<div class="resume_addphoto__no-image">';
				strTemp += '<i class="jp-image">사진불러올거임</i>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="rsm_default_cont">';
				strTemp += '<div class="rsm_cont_bd">';
				strTemp += '<div class="rsm_section">';
				strTemp += '<div class="rsm_hgroup">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">';
				strTemp += '<span class="rsm_ttl__valid">*</span>주소';
				strTemp += '</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr />';
				strTemp += '<div class="rsm_body">';
				strTemp += '<div class="rsm_half_cell" style="margin: 10px;">';
				strTemp += '<label class="cssel_ty1"><a class="btn_sel false">'+ memberVO.memberVO.memAddr+ ', '+ memberVO.memberVO.memAddr2+ '</a> </label>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="rsm_section">';
				strTemp += '<div class="rsm_hgroup">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">';
				strTemp += '<span class="rsm_ttl__valid">*</span>소개글';
				strTemp += '</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr />';
				strTemp += '<div class="rsm_body">';
				strTemp += '<div class="rsm_half_cell" style="margin: 10px;">';
				strTemp += '<label class="cssel_ty1"><a class="btn_sel false">'+ memberVO.memberVO.memIntrcn+ '</a>';
				strTemp += '</label>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="inner-box">';
				strTemp += '<div>';
				strTemp += '이력서 제목 : <input type="text" value="'+resumeVOList[0].resumeTitle+'" readonly>';
				strTemp += '</div>';
				strTemp += '<div class="rsm_hgroup">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">';
				strTemp += '<span class="rsm_ttl__valid">*</span>직종';
				strTemp += '</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr />';
				strTemp += '<div style="margin-bottom: 80px;">';
				strTemp += '<select name="resumeOccp" style="margin: 10px;">';

				// 공통코드 직군
				comCodeInfoVOList.forEach(function(elements) {

					if (elements.comcd == resumeVOList[0].resumeOccp) {
						strTemp += '<option name="" class="select-comCode" selected value="'+elements.comCd+'">'
								+ elements.comCdNm
								+ '</option>';
					} else {
						strTemp += '<option name="" class="select-comCode" value="'+elements.comCd+'">'
								+ elements.comCdNm
								+ '</option>';
					}

					//		    		console.log("elements : ", elements);
					//		    		console.log("elements[index].comcd : ", elements[index].comcd);
					//		    		console.log("resumeVOList[0].resumeOccp : ", resumeVOList[0].resumeOccp);
				});
				strTemp += '</select>';
				strTemp += '<select name="resumeJob" id="comDetCdJob">';

				// 공통코드 직업
				comDetCodeInfoVOList.forEach(function(elements) {
					if (elements.comDetCd == resumeVOList[0].resumeJob) {
						//		    			strTemp += '<option class="select-comCode" selected value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option>';
						strTemp += '<option class="select-comCode" selected value="'+elements.comDetCd+'">'
								+ elements.comDetCdNm
								+ '</option>';
					} else {
						//		    			strTemp += '<option class="select-comCode" value="${comDetCodeInfoVOList.comDetCd}">${comDetCodeInfoVOList.comDetCdNm}</option>';
						strTemp += '<option class="select-comCode" value="'+elements.comDetCd+'">'
								+ elements.comDetCdNm
								+ '</option>';
					}
				});
				strTemp += '</select> ';
				strTemp += '</div>';
				strTemp += '<div style="margin-bottom: 40px;">';
				strTemp += '<div class="rsm_hgroup">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">내 업무 및 스킬</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr />';
				strTemp += '<div class="rsm_body" style="margin-top: 20px;">';
				strTemp += '<div class="tagging_wrap">';

				let tempSkills = resumeVOList[0].resumeSkill;
				if (tempSkills != null) {
					let skills = tempSkills.split(',');

				skills.forEach(function(elements) {
						// 		    		console.log("skills", skills);
						strTemp += '<div class="skills-box">'
								+ elements
								+ '</div>';
					});
				}

				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<div class="rsm_hgroup">';
				strTemp += '<div class="rsm-vertical-center"">';
				strTemp += '<h3 class="rsm_ttl">경력(인턴 포함)</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr />';

				//				console.log("memberVO.memberVO.memBirth", memberVO.memberVO.memBirth);

				// 경력
				careerVOList.forEach(function(elements) {

					//					let tempEntDate = Number(elements.companyEntranceDt) + 86400000;
					//					let entDate = new Date(tempEntDate);
					//					let dateEntString = entDate.toISOString().slice(0, 10);

					//					let tempLeaDate = Number(elements.companyLeaveDt) + 86400000;
					//					let LeaDate = new Date(tempLeaDate);
					//					let dateLeaString = LeaDate.toISOString().slice(0, 10);

					strTemp += '<div class="career-div-career" style="margin-top: 20px;">';
					strTemp += '<div class="flex">';
					strTemp += '<div class="career-left-div">';
					strTemp += '<div class="group-date">';
					strTemp += '<input type="date" value="'+elements.companyEntranceDt+'" readonly/>';
					strTemp += '<span>~</span>';
					strTemp += '<input type="date" value="'+elements.companyLeaveDt+'" readonly/>';
					strTemp += '</div>';
					strTemp += '<div class="group_check__box">';
					strTemp += '<label class="btn_check">';
					strTemp += '<input name="check_new" class="cscheck" type="checkbox">';
					strTemp += '<span class="check_txt">재직중</span>';
					strTemp += '</label>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="career-right-div" >';
					strTemp += '<div class="enterprise-name">';
					strTemp += '<input class="input_resume_text1" type="text" value="'+elements.companyNm+'">';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-dept-position">';
					strTemp += '<div class="enterprise-dept">';
					strTemp += '<input class="input_ent_dept" placeholder="부서" type="text" value="'+elements.companyDept+'">';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-position">';
					strTemp += '<input class="input_ent_position" type="text" value="'+elements.companyPosition+'">';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-job-sal">';
					strTemp += '<div>';
					strTemp += '<input class="input_ent_job" type="text" value="'+elements.companyJob+'">';
					strTemp += '</div>';
					strTemp += '<div>';
					strTemp += '<input class="input_ent_salary" type="text" value="'+elements.companySalary+'">';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="flexible_textarea">';
					strTemp += '<textarea class="medit">'+ elements.companyDetCareer+ '</textarea>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';

				});

				strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">학력</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr style="margin-bottom: 30px;"/>';

				// 학력
				academicCareerVOList.forEach(function(elements) {

					//					console.log("elements acsddd : ", elements);
	
					strTemp += '<div class="acd-career-div">';
					strTemp += '<div class="flex">';
					strTemp += '<div class="acd-career-left-div">';
					strTemp += '<div class="group-date">';
					strTemp += '<input type="date" value="'+elements.acdmcrEntranceDt+'" readonly/>';
					strTemp += '<span>~</span>';
					strTemp += '<input type="date" value="'+elements.acdmcrGrdtnDt+'" readonly/>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="acd-career-right-div">';
					strTemp += '<div class="enterprise-name">';
					strTemp += '<input class="input_resume_text1" placeholder="학교명" type="text" value="'+elements.acdmcrNm+'">';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-dept-position">';
					strTemp += '<div class="enterprise-dept">';
					strTemp += '<input class="input_ent_dept" placeholder="전공" type="text" value="'+elements.acdmcrMajor+'">';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-position">';
					strTemp += '<input class="input_ent_position" placeholder="학위" type="text" value="'+elements.acdmcrDegree+'">';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-job-sal">';
					strTemp += '<div>';
					strTemp += '<input class="input_acd-score" type="text" value="'+elements.acdmcrPoint+'" style="text-align: center;">점';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
				});

				strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">성과</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr style="margin-bottom: 30px;" />';

				// 성과
				resultVOList.forEach(function(resultVO,index) {

					//					console.log("resultVO : ", resultVO);
	
					strTemp += '<div class="certi-career-div">';
					strTemp += '<div class="flex">';
					strTemp += '<div class="certi-career-left-div">';
					strTemp += '<div class="group-date">';
					strTemp += '<input type="date" value="'+resultVO.resultStdt+'" readonly/>';
					strTemp += '<span>~</span>';
					strTemp += '<input type="date" value="'+resultVO.resultEddt+'" readonly/>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="certi-career-right-div">';
					strTemp += '<div class="enterprise-name">';
					strTemp += '<input type="text" class="input_resume_text1" value="'+resultVO.resultTitle+'">';
					strTemp += '</div>';
					strTemp += '<div class="flexible_textarea">';
					strTemp += '<textarea class="medit">'
							+ resultVO.resultCntnt
							+ '</textarea>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
	
				});

				strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">활동 및 수상</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr style="margin-bottom: 30px;" />';

				// 활동 및 수상
				awardsVOList.forEach(function(awardsVO) {

					strTemp += '<div class="awards-career-div">';
					strTemp += '<div class="flex">';
					strTemp += '<div class="awards-career-left-div">';
					strTemp += '<div class="group-date">';
					strTemp += '<input type="date" value="'+awardsVO.awdDt+'" readonly/>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '<div class="awards-career-right-div">';
					strTemp += '<div class="enterprise-name">';
					strTemp += '<input class="input_resume_text1" value="'+awardsVO.awdNm+'">';
					strTemp += '</div>';
					strTemp += '<div class="flexible_textarea">';
					strTemp += '<textarea class="medit">'+awardsVO.awdCntnt+'</textarea>';
					strTemp += '</div>';
					strTemp += '<div class="enterprise-name">';
					strTemp += '<input type="text" class="input_resume_text1" value="'+awardsVO.awdOrg+'">';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';

				});

				strTemp += '<div class="rsm_hgroup" style="margin-top: 80px;">';
				strTemp += '<div class="rsm-vertical-center">';
				strTemp += '<h3 class="rsm_ttl">어학 및 어학 상세정보</h3>';
				strTemp += '</div>';
				strTemp += '</div>';
				strTemp += '<hr style="margin-bottom: 30px;" />';

				// 어학
				languageVOList.forEach(function(languageVO, index) {

					strTemp += '<div class="lang-career-div">';
					strTemp += '<div class="flex">';
					strTemp += '<div class="lang-career-left-div">';
					strTemp += '<div class="lang-select-div">';

					let langKind = languageVO.langKind;

					strTemp += '<select class="lang-select">';

					if (langKind == '한국어') {
						strTemp += '<option value="한국어" selected>한국어</option>';
					} else if (langKind == '영어') {
						strTemp += '<option value="영어" selected>영어</option>';
					} else if (langKind == '일본어') {
						strTemp += '<option value="일본어" selected>일본어</option>';
					} else if (langKind == '중국어') {
						strTemp += '<option value="중국어" selected>중국어</option>';
					} else if (langKind == '프랑스어') {
						strTemp += '<option value="프랑스어" selected>프랑스어</option>';
					} else if (langKind == '스페인어') {
						strTemp += '<option value="스페인어" selected>스페인어</option>';
					} else if (langKind == '아랍어') {
						strTemp += '<option value="아랍어" selected>아랍어</option>';
					} else if (langKind == '러시아어') {
						strTemp += '<option value="러시아어" selected>러시아어</option>';
					} else if (langKind == '기타') {
						strTemp += '<option value="기타" selected>러시아어</기타>';
					}

					strTemp += '</select>';

					let langLevel = languageVO.langLevel
					strTemp += '<select class="lang-select">';
					if (langLevel == '상') {
						strTemp += '<option value="상" selected>상</option>';
					} else if (langLevel == '중') {
						strTemp += '<option value="중" selected>중</option>';
					} else if (langLevel == '하') {
						strTemp += '<option value="하" selected>하</option>';
					}

					strTemp += '</select>';
					strTemp += '</div>';
					strTemp += '</div>';

					//					console.log("languageVO : ", languageVO);

					let languageDTVOList = languageVO.languageDTVOList;
					//					console.log("languageDTVOListzzz : ", languageDTVOList);

					strTemp += '<div class="lang-career-right-div">';

					// 어학 상세
					languageDTVOList.forEach(function(languageDTVO) {

						strTemp += '<div class="flex">';
						strTemp += '<div class="lang-det-left-div">';
						strTemp += '<div class="group-date">';
						strTemp += '<label>취득일자</label> <label>~</label> <label>만료일자</label>';
						strTemp += '</div>';
						strTemp += '<div class="group-date">';
						strTemp += '<input type="date" value="'+languageDTVO.langDetailAcqDt+'" readonly/>';
						strTemp += '<span>~</span>';
						strTemp += '<input type="date" value="'+languageDTVO.langDetailExpDt+'" readonly/>';
						strTemp += '</div>';
						strTemp += '</div>';
						strTemp += '<div class="lang-det-right-div">';
						strTemp += '<div class="enterprise-name">';
						strTemp += '<input type="text" class="input_resume_text1" value="'+languageDTVO.langDetailScore+'">';
						strTemp += '</div>';
						strTemp += '<div class="flexible_textarea">';
						strTemp += '<textarea class="medit">'
								+ languageDTVO.langDetailName
								+ '</textarea>';
						strTemp += '</div>';
						strTemp += '</div>';
						strTemp += '</div>';
					});

					strTemp += '</div>';
					strTemp += '</div>';
					strTemp += '</div>';

					strTemp += '<hr style="margin-bottom: 30px;"/>';
				});
				strTemp += '</div>';
				strTemp += '</div>';

				openModal(strTemp);
			}
		});
	});

	// 모달 열기
	function openModal(content) {
		document.getElementById('myModal').style.display = 'block';
		document.getElementById('modalContent').innerHTML = content;
	}

	// 모달 닫기
	function closeModal() {
		document.getElementById('myModal').style.display = 'none';
	}

	// 	"모달 닫기" 버튼 또는 모달 외부 클릭 시 모달 닫기
	document.getElementsByClassName('close')[0].addEventListener('click', closeModal);
	
	window.addEventListener('click', function(event) {
		if (event.target == document.getElementById('myModal')) {
			closeModal();
		}
	});
	
	
</script>
