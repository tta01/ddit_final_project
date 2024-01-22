<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<link href="/resources/css/myPageaside.css" rel="stylesheet" >
<link href="/resources/css/recruitList.css" rel="stylesheet" >

<style>
.pagination {
	padding-left:0;
}
.relative{
	position:relative;
}
.btn-box{
	position:absolute;
	left:45%;
	transform:translateX(-50%);
}
</style>

<div class="mypage-body-con">
	<div class="sub-con-area mb-40">
		<div class="body-sub-title">맞춤인재 추천</div>
	</div>
		
	<p class="body-sub-con-tit p-15 mb-20">
		<span class="p-17 txt-sig bold">날 JOB아줘</span>
		가 추천하는 맞춤 인재!
	</p>
	<form action="/entOffer/offerList" method="get">
		<div class="flex filter-area mb-20">
			<div class="btn-wrapper">
				<button type="button" id="job-filter-btn"
					class="btn btn-sm btn-filter mr-7">직종</button>
				<div class="job-filter">
	
					<div class="filter-depth1">
	
						<ul>
							<c:forEach var="comCodeInfoVOList" items="${comCodeInfoVOList}"
								varStatus="stat">
								<li id="jobplaces" class="selectjobb"
									value="${comCodeInfoVOList.comCd}" style="cursor: pointer;">${comCodeInfoVOList.comCdNm}</li>
							</c:forEach>
	
						</ul>
	
					</div>
	
					<div class="filter-depth2">
						<div class="filter-depth2-wrapper">
							<div class="chkbox-sig-box" id="jobplace"></div>
						</div>
					</div>
					<div class="filter-footer" style="grid-column: 1/3">
						<span class="ml-auto">
							<button  type="submit" class="btn btn-sm bg-sig color-white">적용</button>
							<button class="btn btn-sm resetJob">초기화</button>
						</span>
					</div>
				</div>
			</div>
			<div class="btn-wrapper">
				<button type="button" id="loc-filter-btn"
					class="btn btn-sm btn-filter mr-7">거주 지역</button>
	
				<div class="loc-filter">
					<div class="loc-wrapper">
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='서울'}"> 
										<c:set var="sel1" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="서울" ${sel1} 
								value="서울"> <label for="서울"></label> 
								<span class="chkbox-txt p-16">서울</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='경기'}"> 
										<c:set var="sel2" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="경기" ${sel2} 
								value="경기"> <label for="경기"></label> <span
								class="chkbox-txt p-16">경기</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='인천'}"> 
										<c:set var="sel3" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="인천" ${sel3} 
								value="인천"> <label for="인천"></label> <span
								class="chkbox-txt p-16">인천</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='부산'}"> 
										<c:set var="sel4" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="부산" ${sel4} 
								value="부산"> <label for="부산"></label> <span
								class="chkbox-txt p-16">부산</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='대구'}"> 
										<c:set var="sel5" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="대구" ${sel5} 
								value="대구"> <label for="대구"></label> <span
								class="chkbox-txt p-16">대구</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='대전'}"> 
										<c:set var="sel6" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="대전" ${sel6} 
								value="대전"> <label for="대전"></label> <span
								class="chkbox-txt p-16">대전</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='광주'}"> 
										<c:set var="sel7" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="광주" ${sel7} 
								value="광주"> <label for="광주"></label> <span
								class="chkbox-txt p-16">광주</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='울산'}"> 
										<c:set var="sel8" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="울산" ${sel8} 
								value="울산"> <label for="울산"></label> <span
								class="chkbox-txt p-16">울산</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='세종'}"> 
										<c:set var="sel9" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="세종" ${sel9} 
								value="세종"> <label for="세종"></label> <span
								class="chkbox-txt p-16">세종</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='강원'}"> 
										<c:set var="sel10" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="강원" ${sel10} 
								value="강원"> <label for="강원"></label> <span
								class="chkbox-txt p-16">강원</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='경남'}"> 
										<c:set var="sel11" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="경남" ${sel11} 
								value="경남"> <label for="경남"></label> <span
								class="chkbox-txt p-16">경남</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='경북'}"> 
										<c:set var="sel12" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="경북" ${sel12} 
								value="경북"> <label for="경북"></label> <span
								class="chkbox-txt p-16">경북</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='전남'}"> 
										<c:set var="sel13" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="전남" ${sel13} 
								value="전남"> <label for="전남"></label> <span
								class="chkbox-txt p-16">전남</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='전북'}"> 
										<c:set var="sel14" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="전북" ${sel14} 
								value="전북"> <label for="전북"></label> <span
								class="chkbox-txt p-16">전북</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='충남'}"> 
										<c:set var="sel15" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="충남" ${sel15} 
								value="충남"> <label for="충남"></label> <span
								class="chkbox-txt p-16">충남</span>
						</div>
						<div class="loc">
						<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='충북'}"> 
										<c:set var="sel16" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="충북" ${sel16} 
								value="충북"> <label for="충북"></label> <span
								class="chkbox-txt p-16">충북</span>
						</div>
						<div class="loc">
						<c:set var="sel" value="" />
								<c:forEach var="location" items="${livingLocation}" varStatus="statj">
									<c:if test="${location =='제주'}"> 
										<c:set var="sel17" value="checked" />
									</c:if>
								</c:forEach>
							<input class="chkbox-sig check pfrst" type="checkbox" name="livingLocation" id="제주" ${sel17} 
								value="제주"> <label for="제주"></label> <span
								class="chkbox-txt p-16">제주</span>
						</div>
					</div>
					<div class="filter-footer" style="grid-column: 1/3">
						<span class="ml-auto">
							<button type="submit" class="btn btn-sm bg-sig color-white">적용</button>
							<button class="btn btn-sm resetLoc">초기화</button>
						</span>
					</div>
				</div>
			</div>
	
			<a href="/entOffer/offerList" type="button" class="btn btn-sm btn-reset perfectReset">
				<i class="fa-solid fa-rotate-right " style="color: #85878c;"></i> 
				초기화
			</a>
			
		</div>
	</form>

	
	<div class="rcmd-list">
		<c:forEach var="memberVO" items="${memberVOList }">
			<div class="rcmd-item">
				<div class="rcmd-item-img">
					<c:choose>
						<c:when test="${memberVO.memAfId != null}">
							<img alt="" src="/resources/upload/${memberVO.memAfId }">								
						</c:when>
						<c:otherwise>
							<img alt="" src="/resources/images/review-profile.png">								
						</c:otherwise>
					</c:choose>
				</div>
				<div class="rcmd-item-info">
					<div class="rcmd-item-top">
						<p class="bold p-16">${memberVO.memNm }</p>
						<input type="hidden" name="memEmail" value="${memberVO.memEmail}">
						<span class="txt-skyblue p-13 ml-auto preview">미리보기</span>
						<input type="hidden" name="memId" value="${memberVO.memId }">
						<input type="hidden" name="resumeNo" value="${memberVO.resumeVOList[0].resumeNo }">
					</div>
					<div>
						<p class="bold p-14 mb-7">
							<span class="workPeriod">
								<c:forEach var="resumeVO" items="${memberVO.resumeVOList }">
									<c:set var="total" value="0" />
									<c:forEach var="careerVO" items="${resumeVO.careerVOList }">
										<c:set var="total" value="${total + careerVO.workPeriod  }" />
									</c:forEach>
									<c:out value="${total}"/>
								</c:forEach>
							</span>
							경력, 총 
							<span class="workEntCount">
								<c:choose>
									<c:when test="${memberVO.resumeVOList[0].careerVOList[0].careerNo == null }">0</c:when> 
									<c:otherwise>
										${fn:length(memberVO.resumeVOList[0].careerVOList)}
									</c:otherwise>
								</c:choose>
							</span>개 회사 근무
						</p>
						<p class="txt-gray p-12 mb-3">
							최근회사: 
								<c:choose>
									<c:when test="${memberVO.resumeVOList[0].careerVOList[0].companyNm == null}">
										없음
									</c:when>
									<c:otherwise>
										${memberVO.resumeVOList[0].careerVOList[0].companyNm }(<span class="recentWorkPeriod">${memberVO.resumeVOList[0].careerVOList[0].workPeriod }</span>)
									</c:otherwise>
								</c:choose>
						</p>
						<p class="txt-gray p-12">
							최종학력: 
								<c:choose>
									<c:when test="${memberVO.academicCareerVOList[0].acdmcrNm == null}">
										없음
									</c:when>
									<c:otherwise>
										${memberVO.academicCareerVOList[0].acdmcrNm } ${memberVO.academicCareerVOList[0].acdmcrDegree }(${memberVO.academicCareerVOList[0].acdmcrMajor })
									</c:otherwise>
								</c:choose>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
	
	
	<div class="pagez mt-30">${data.getPagingArea6()}</div>

		
</div>


<div id="modal-preview">
   	<section>
        <button data-izimodal-close="" class="icon-close"></button>
        <p class="bold p-20 mb-25">회원 정보</p>

		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">이름</p>	 
			<p class="memNm"></p>
		</div>
		
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">연락처</p>	 
			<p class="memTel"></p>
		</div>
		
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">성별</p>	 
			<p class="memGen"></p>
		</div>
		
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">생년월일</p>	 
			<p class="memBirth"></p>
		</div>
		
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">주소</p>	 
			<p class="memAddr"></p>
		</div>
		
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">소개글</p>	 
			<p class="memIntrcn"></p>
		</div>
	
		<div class="h-div-line" style="width:95%; margin:35px 0;"></div>
		
        <p class="bold p-20 mb-25">대표 이력서</p>
        
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">이력서 제목</p>	 
			<p class="resumeTitle"></p>
		</div>
        
		<div class="mb-12 p-15 detail-one-line">
			<p class="bold">보유 기술</p>	 
			<p class="resumeSkill"></p>
		</div>
		
		<div class="mb-45 mt-15 ">
			<p class="bold mb-15">경력</p>	 
			<div class="p-14 detail-career">

			</div>
		</div>        
        
		<div class="mb-45 mt-15 ">
			<p class="bold mb-15">학력</p>	 
			<div class="p-14 detail-acdmcr">

			</div>
		</div>        
		
		<div class="mb-45 mt-15 ">
			<p class="bold mb-15">성과</p>	 
			<div class="p-14 detail-result">

			</div>
		</div>      
		
		<div class="mb-45 mt-15 ">
			<p class="bold mb-15">활동 및 수상</p>	 
			<div class="p-14 detail-awards">

			</div>
		</div>       
		
		<div class="mb-45 mt-15 ">
			<p class="bold mb-15">어학 및 어학 상세정보</p>	 
			<div class="p-14 detail-language">
				
				<div class="languages">
				</div>
				
			</div>
		</div>        
        
		<div class="relative">
			<div class="btn-box">
				<input type="hidden" id="memEmail" name="memEmail" value="">
				<button type="button"  id="offergo" class="custom-button btn btn-sm bg-sig txt-white" >
					<i class="fa-solid fa-paper-plane txt-white mr-9"></i> 
					입사제안서 보내기
				</button>
			</div>	
		</div>
    </section>
</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<script type="text/javascript" src="/resources/js/filter-area.js"></script>
<script type="text/javascript" src="/resources/js/func.js"></script>
<script type="text/javascript">

	$(".preview").on("click",function(e){
		
		var memEmail = e.target.previousElementSibling.value;
		
		console.log("memEmail",memEmail);
		$("#memEmail").val(memEmail);
	});
	console.log($("#offergo"))
	
	$(document).on("click","#offergo",function(e){
		console.log("여기까지오니");
		var memEmail2 = e.target.previousElementSibling.value;
		console.log("memEmail2",memEmail2);
		
		data ={
			"mailAddress":memEmail2	
		}
		 $.ajax({
			 url: "/webMail/sendCode",
             contentType: "application/json;charset=utf-8",
             data: JSON.stringify(data),
             type: "post",
             dataType: "json",
             beforeSend: function(xhr) {
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             success: function(result) {
         		alert("입사제안을 전송하였습니다.");
             }
		 });
		
	});

	let workPeriods = document.querySelectorAll(".workPeriod");
	for(let i = 0; i < workPeriods.length; i++){
		let workDays = workPeriods[i].innerText;
		console.log(workDays);
		workPeriods[i].innerText = daysToYearsMonthsDays(workDays).years + "년 ";
		workPeriods[i].insertAdjacentHTML('beforeend', daysToYearsMonthsDays(workDays).months + "개월"); 
		console.log(workPeriods[i].innerText);
	}
	
	let recentWorkPeriod = document.querySelectorAll(".recentWorkPeriod");
	for(let i = 0; i < recentWorkPeriod.length; i++){
		let workDays = recentWorkPeriod[i].innerText;
		console.log(workDays);
		recentWorkPeriod[i].innerText = daysToYearsMonthsDays(workDays).years + "년 ";
		recentWorkPeriod[i].insertAdjacentHTML('beforeend', daysToYearsMonthsDays(workDays).months + "개월"); 
		console.log(recentWorkPeriod[i].innerText);
	}
		

	let jobFilterBtn = document.querySelector("#job-filter-btn");

	$(".filter-area").on("click", ".btn-filter",function(e) {

		console.log(e.currentTarget);

		console.log(e.currentTarget.classList
				.contains("active"));
		let siblings = e.currentTarget.parentElement.parentElement.children;
		console.log(siblings);
		if (e.currentTarget.classList.contains("active")) {
			e.currentTarget.classList.remove("active");
		} else {
			for (let i = 0; i < siblings.length; i++) {
				siblings[i].children[0].classList
						.remove("active");
			}
			e.currentTarget.classList
					.add("active");
		}
	})

		$("#modal-preview").iziModal({
	    title: '',
	    subtitle: '',
	    headerColor: '#88A0B9',
	    background: null,
	    theme: '',  // light
	    icon: null,
	    iconText: null,
	    iconColor: '',
	    rtl: false,
	    width: 700,
	    height:1000,
	    top: null,
	    bottom: null,
	    borderBottom: true,
	    padding: 0,
	    radius: 3,
	    zindex: 999,
	    iframe: false,
	    iframeHeight: 400,
	    iframeURL: null,
	    focusInput: true,
	    group: '',
	    loop: false,
	    arrowKeys: true,
	    navigateCaption: true,
	    navigateArrows: true, // Boolean, 'closeToModal', 'closeScreenEdge'
	    history: false,
	    restoreDefaultContent: false,
	    autoOpen: 0, // Boolean, Number
	    bodyOverflow: true,
	    fullscreen: false,
	    openFullscreen: false,
	    closeOnEscape: true,
	    closeButton: true,
	    appendTo: 'body', // or false
	    appendToOverlay: 'body', // or false
	    overlay: true,
	    overlayClose: true,
	    overlayColor: 'rgba(0, 0, 0, 0.4)',
	    timeout: false,
	    timeoutProgressbar: false,
	    pauseOnHover: false,
	    timeoutProgressbarColor: 'rgba(255,255,255,0.5)',
	    transitionIn: 'comingIn',
	    transitionOut: 'comingOut',
	    transitionInOverlay: 'fadeIn',
	    transitionOutOverlay: 'fadeOut',
	    onFullscreen: function(){},
	    onResize: function(){},
	    onOpening: function(){},
	    onOpened: function(){},
	    onClosing: function(){},
	    onClosed: function(){},
	    afterRender: function(){}
	});
	
	
	let preview = document.querySelectorAll(".preview");
	
	let memNm = document.querySelector(".memNm");
	let memTel = document.querySelector(".memTel");
	let memGen = document.querySelector(".memGen");
	let memBirth = document.querySelector(".memBirth");
	let memAddr = document.querySelector(".memAddr");
	let memIntrcn = document.querySelector(".memIntrcn");

	let resumeTitle = document.querySelector(".resumeTitle");
	let resumeSkill = document.querySelector(".resumeTitle");

	let detailCareer = document.querySelector(".detail-career");
	let detailAcdmcr = document.querySelector(".detail-acdmcr");
	let detailResult = document.querySelector(".detail-result");
	let detailAwards = document.querySelector(".detail-awards");
	let detailLanguage = document.querySelector(".detail-language");
	
	for(let i = 0; i < preview.length; i++){
		preview[i].addEventListener("click", function(e){

			console.dir(e.target.nextElementSibling.value);
			console.dir(e.target.nextElementSibling.nextElementSibling.value);
			
			let memId = e.target.nextElementSibling.value;
			let resumeNo = e.target.nextElementSibling.nextElementSibling.value;
			
			data = {
				"memId" : memId,
				"resumeNo" : resumeNo
			}
			console.log(data);

			$.ajax({
				url : "/memberResume/ajaxMemberDetailResume",
				data : JSON.stringify(data),
				type : "post",
	    		contentType : "application/json;charset=utf-8",
	    		dataType:"json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(res) {
					console.log("res", res);

					memNm.innerText = res.memberVO.memNm;
					memTel.innerText = res.memberVO.memTel;
					if(res.memberVO.memGen == 0){
						memGen.innerText = "남자";					
					}else if(res.memberVO.memGen == 1){
						memGen.innerText = "여자";											
					}
					memBirth.innerText = res.memberVO.memBirth;
					memAddr.innerText = res.memberVO.memAddr;
					memIntrcn.innerText = res.memberVO.memIntrcn;

					resumeTitle.innerText = res.resumeVOList[0].resumeTitle;
					
					resumeSkill.innerText = res.resumeVOList[0].resumeSkill;

					let carrers = res.careerVOList;
					
					let str = '';
					
					for(let i = 0; i < carrers.length; i++ ){
						
						str+='<div class="career">';
						str+='	<div class="detail-left-area p-13">                                         ';
						str+='		<p class="companyEntranceDt">'+carrers[i].companyEntranceDt.split("-")[0]+"/"+carrers[i].companyEntranceDt.split("-")[1]+'</p>   ';
						str+='		<span class="ml-5 mr-5">~</span>                                                                  ';
						str+='		<p class="companyLeaveDt">'+carrers[i].companyLeaveDt.split("-")[0]+"/"+carrers[i].companyLeaveDt.split("-")[1]+'</p>         ';
						str+='	</div>                                                                 ';
						str+='	<div class="detail-right-area">                                        ';
						str+='		<div class=" p-16" style="grid-column: 1/3">                   ';
						str+='			<span class="bold">기업명</span>                                            ';
						str+='			<span class="companyNm p-15">'+carrers[i].companyNm+'</span>         ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">부서</span>                                 ';
						str+='			<span class="companyDept">'+carrers[i].companyDept+'</span>                              ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">직책</span>                                 ';
						str+='			<span class="companyPosition">'+carrers[i].companyPosition+'</span>                          ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">직무</span>                                 ';
						str+='			<span class="companyJob">'+carrers[i].companyJob+'</span>                               ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">연봉</span>                                 ';
						str+='			<span class="companySalary">'+insertNumCommas(carrers[i].companySalary)+'</span>                            ';
						str+='		</div>                                                             ';
						str+='	</div>                                                                 ';
						str+='</div>                                                                   ';
						
					}
					
					detailCareer.innerHTML = str;


					let acdmcrs = res.academicCareerVOList;
					str = '';
					for(let i = 0; i < acdmcrs.length; i++ ){
						if(acdmcrs[i].acdmcrNo == null || acdmcrs[i].acdmcrNo ==''){
							break;
						}
						str+='<div class="acdmcr">';
						str+='	<div class="detail-left-area p-13">                                         ';
						str+='		<p class="acdmcrEntranceDt">'+acdmcrs[i].acdmcrEntranceDt.split("-")[0]+"/"+acdmcrs[i].acdmcrEntranceDt.split("-")[1]+'</p>   ';
						str+='		<span class="ml-5 mr-5">~</span>                                                                  ';
						str+='		<p class="acdmcrGrdtnDt">'+acdmcrs[i].acdmcrGrdtnDt.split("-")[0]+"/"+acdmcrs[i].acdmcrGrdtnDt.split("-")[1]+'</p>         ';
						str+='	</div>                                                                 ';
						str+='	<div class="detail-right-area">                                        ';
						str+='		<div class=" p-16" style="grid-column: 1/3">                   ';
						str+='			<span class="bold">학교명</span>                                            ';
						str+='			<span class="acdmcrNm p-15">'+acdmcrs[i].acdmcrNm+'</span>         ';
						str+='		</div>                                                             ';
						str+='		<div class="" style="grid-column: 1/3">                                                     ';
						str+='			<span class="mr-7 bold"">전공</span>                                 ';
						str+='			<span class="companyDept">'+acdmcrs[i].acdmcrMajor+'</span>                              ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">학교구분</span>                                 ';
										if(acdmcrs[i].acdmcrDegree == '고졸'){
											str+='<span class="acdmcrDegree">고등학교 졸업</span>                          ';											
										}else if(acdmcrs[i].acdmcrDegree == '전문학사'){
											str+='<span class="acdmcrDegree">대학 졸업(2,3년)</span>                          ';																						
										}else if(acdmcrs[i].acdmcrDegree == '학사'){
											str+='<span class="acdmcrDegree">대학교 졸업(4년)</span>                          ';																						
										}else if(acdmcrs[i].acdmcrDegree == '석사' || acdmcrs[i].acdmcrDegree == '박사'){
											str+='<span class="acdmcrDegree">대학원 졸업</span>                          ';																						
										}
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold">학위</span>                                 ';
						str+='			<span class="companyJob">'+acdmcrs[i].acdmcrDegree+'</span>                               ';
						str+='		</div>                                                                  ';
						str+='	</div>                                                                 ';
						str+='</div>                                                                   ';
						
					}
					console.log("@@@@@@@@@@@", str)
					detailAcdmcr.innerHTML = str;
					

					let results = res.resultVOList;
					str = '';
					for(let i = 0; i < results.length; i++ ){
						
						str+='<div class="result">';
						str+='	<div class="detail-left-area p-13">                                         ';
						str+='		<p class="acdmcrEntranceDt">'+results[i].resultStdt.split("-")[0]+"/"+results[i].resultStdt.split("-")[1]+'</p>   ';
						str+='		<span class="ml-5 mr-5">~</span>                                                                  ';
						str+='		<p class="acdmcrGrdtnDt">'+results[i].resultEddt.split("-")[0]+"/"+results[i].resultEddt.split("-")[1]+'</p>         ';
						str+='	</div>                                                                 ';
						str+='	<div class="detail-right-area">                                        ';
						str+='		<div class=" p-16" style="grid-column: 1/3">                   ';
						str+='			<span class="bold">성과명</span>                                            ';
						str+='			<span class="acdmcrNm p-15">'+results[i].resultTitle+'</span>         ';
						str+='		</div>                                                             ';
						str+='		<div class="flex-start" style="grid-column: 1/3">                                                     ';
						str+='			<span class="mr-7 bold"">성과 내용</span>                                 ';
						str+='			<span class="companyDept" style="padding-right:90px;">'+results[i].resultCntnt+'</span>                              ';
						str+='		</div>                                                                      ';
						str+='	</div>                                                                 ';
						str+='</div>                                                                   ';
						
					}
					
					detailResult.innerHTML = str;

					

					let awards = res.awardsVOList;
					str = '';
					for(let i = 0; i < awards.length; i++ ){
						
						str+='<div class="awards">';
						str+='	<div class="detail-left-area p-13">                                         ';
						str+='		<p class="awdDt">'+awards[i].awdDt+'</p>   ';
						str+='	</div>                                                                 ';
						str+='	<div class="detail-right-area">                                        ';
						str+='		<div class="p-16">                   ';
						str+='			<span class="bold">수상명</span>                                            ';
						str+='			<span class="acdmcrNm p-15">'+awards[i].awdNm+'</span>         ';
						str+='		</div>                                                             ';
						str+='		<div class="">                                                     ';
						str+='			<span class="mr-7 bold"">수여기관</span>                                 ';
						str+='			<span class="companyDept">'+awards[i].awdOrg+'</span>                              ';
						str+='		</div>                                                           ';
						str+='		<div class="flex-start" style="grid-column:1/3">                                                     ';
						str+='			<span class="mr-7 bold">수상 내용</span>                                 ';
						str+='			<span class="companyDept" style="padding-right:90px;">'+awards[i].awdCntnt+'</span>                              ';
						str+='		</div>                                                                      ';
						str+='	</div>                                                                 ';
						str+='</div>                                                                   ';
						
					}
					detailAwards.innerHTML = str;
					

					let languages = res.languageVOList;
					str = '';
					for(let i = 0; i < languages.length; i++ ){

						str+='<div class="languages">                     ';
						str+='	<div class="p-13 language">               ';
						str+='		<span class="bold">언어</span>        ';                                   
						str+='		<span class="acdmcrNm">'+languages[i].langKind+'</span>  ';    
						str+='		<span class="bold">회화</span>        ';                                   
						str+='		<span class="acdmcrNm">'+languages[i].langLevel+'</span>      ';  
						str+='	</div>                                    ';
						str+='	<div class="language-area">             ';
						for(let j = 0; j < languages[i].languageDTVOList.length; j++){									
							str+='	<div class="language-detail">';
							str+='		<div class="language-one-col">        ';
							str+='			<span class="bold">시험 명</span> ';                               
							str+='			<span class="acdmcrNm">'+languages[i].languageDTVOList[j].langDetailName+'</span>';    
							str+='		</div>                                ';
							str+='		<div class="language-one-col">        ';
							str+='			<span class="bold">어학점수</span>';                                
							str+='			<span class="acdmcrNm">'+languages[i].languageDTVOList[j].langDetailScore+'</span> ';    
							str+='		</div>                                ';
							str+='		<div class="language-one-col">        ';
							str+='			<span class="bold">취득일자</span>';                                
							str+='			<span class="acdmcrNm">'+languages[i].languageDTVOList[j].langDetailAcqDt+'</span>';    
							str+='		</div>                                ';
							str+='		<div class="language-one-col">        ';
							str+='			<span class="bold">만료일자</span>';                                
							str+='			<span class="acdmcrNm">'+languages[i].languageDTVOList[j].langDetailExpDt+'</span> ';    
							str+='		</div>                                ';
							str+='	</div>                                ';
						}
						str+='	</div>                                    ';
						str+='</div>                                      ';                    
						                                                  
					}
					detailLanguage.innerHTML = str;
					
					
					
				}

			})
			
			
			$("#modal-preview").iziModal('open');			
			
		})
	}

    let recruitJob = []; // 선택된 값 추적을 위한 배열
 	let mm = "${wishJobs}";
    
    $(document).on("click", ".selectjobb", function(e) {
        let a = $(this).attr('value');
        let b = $("input[name='memId']").val();
        
        if (!recruitJob.includes(a)) {
            let data = {
                "recruitJob": a,
                "memId" : b
            };

            $.ajax({
                url: "/recruit/createAjax2",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(data),
                type: "post",
                dataType: "json",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(rslt) {
                    let palinfoContainer = $('<div class="palinfo-container"></div>');

                    $.each(rslt, function(index) {
                        let palinfo = "";
                        
                        let sel ='';
						console.log("rslt[index].comDetCd" ,rslt[index].comDetCd);
                       
						if(mm.includes(rslt[index].comDetCd)){
                        	sel = 'checked';
                        }
                        let checkboxId = 'zzz' + index;
						
                        
		     			palinfo += '<div><input class="chkbox-sig check2 pfrst" type="checkbox" name="wishJobs" id="' + checkboxId + '"  value="' + rslt[index].comDetCd +'" '+sel+'>' +
		                            '<label for="' + checkboxId + '"></label>'+
		                            '<span class="chkbox-txt p-16">'+rslt[index].comDetCdNm+'</span></div>';

                        let checkboxElement = $(palinfo);
                       
                        palinfoContainer.append(checkboxElement);
                    });

                    $('#jobplace').empty().append(palinfoContainer); // 이전 선택된 값들을 제거하고 새 값으로 교체
                    recruitJob.push(a); // 선택된 값 배열에 현재 값 추가
                    console.log(recruitJob);
                }
            });
        } else {
            // 이미 선택된 값이면 선택을 취소하고 배열에서 제거
            let index = recruitJob.indexOf(a);
            if (index > -1) {
            	recruitJob.splice(index, 1);
            }
        }
    });

	let wishJobs = ${wishJobsJson};
	if(wishJobs == null){
		wishJobs = [];
	}
	
// 	for(let i = 0; i < wishJobs.length; i++){
// 		let inp = '<input type="hidden" name="wishJobs" value="'+wishJobs[i]+'">';
// 		$(".filter-depth2").append(inp);
// 		console.log(inp);
// 	}
		
	let check2 = $(".check2");
	
// 	$(document).on("click", check2, function(e){

// 		let value = e.target.parentElement.children[0].value;
// 		if(!wishJobs.includes(value)){
// 			wishJobs.push(value);
// 			wishJobs = wishJobs.filter((el) => el != undefined && el != null && el != '');
// 		}else{
// 			wishJobs = wishJobs.filter((el) => el != value && el != undefined && el != null && el != '');
// 		}
		
// 		console.log(wishJobs);
		
// 	})
	

	$(".resetJob").on("click", function(e) {
			
   	 	$(".check2").attr('checked', false);
	});
		
	$(".resetLoc").on("click", function(e) {
		
   	 	$(".check").attr('checked', false);
	});
	$(".resetAcdm").on("click", function(e) {
		
   	 	$(".check3").attr('checked', false);
	});

	
	
	
	
	
	
	
</script>