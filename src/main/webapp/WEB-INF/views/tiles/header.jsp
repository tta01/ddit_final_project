<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
/* 채팅 384756 시작 */
.chatting-box{
	display:none;
}
/* 채팅 384756 끝 */
</style>

       
	<jsp:include page="chatting.jsp"></jsp:include>

   <header>
        <div class="header-top">
            <a class="header-top-logo logo" href="/">
            	날 JOB아줘
            </a>
            
            <div class="header-top-menu">
                <ul>
                    <li class="li-entRanking"><a href="/entRanking/list">기업 랭킹</a></li>
                    <li class="li-recruit"><a href="/recruit/list">채용</a></li>
                    <li class="li-boardQna"><a href="/boardQNA/list">취업Q&A</a></li>
                    <li class="li-devCarr" id="sub"><a href="/boardInterView/list">커리어성장</a>
	                    <ul class="sub-menu"> 
	                    	<li class="boardInterView"><a href="/boardInterView/list">현직자인터뷰</a></li>
	                    	<li class="boardClass"><a href="/boardClass/list">강의클래스</a></li>
	                    	<li class="news"><a href="/news/list">취업뉴스</a></li>
	                    	<li class="boardConsulting"><a href="/boardConsulting/list">취업상담</a></li>
	                    </ul>
                    </li>
                    <li class="li-compare" id="sub"><a href="/compare/index">기업 비교</a></li>
                </ul>
            </div>
		
            <div class="header-top-right">
            	
            	<sec:authorize access="isAnonymous()">
	                <a href="/login">로그인</a>
	                <a href="/member/create" class="ml-20">회원가입</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                	<!-- MemberVO memberVO = this.memberMapper.detail(username); -->
                	<sec:authentication property="principal.memberVO" var="memberVO"/>
                		<!-- 채팅 384756 시작 -->
<!--                 		채팅 384756 끝 -->
<!--                 		<span class="alarm"> -->
<!-- 	                		<a href="#" id="msgStack"> -->
<!-- 								<i class="fa-regular fa-bell"></i> -->
<!-- 							</a> -->
<!-- 						</span> -->
						<sec:authorize access="hasRole('ROLE_MEMBER')">
	                		<div class="gnb-write"  id="chatting">
		                		<span class="chat">
		                			<i class="fa-regular fa-comment-dots"></i>
		                		</span>
	                		</div>
							<div class="gnb-write">
								<span>
									<i class="fa-regular fa-pen-to-square"></i>
								</span>
								<div class="mypage-link">
									<ul>
										<li><a href="/boardEntReview/create">기업리뷰 작성</a></li>
										<li><a href="/memberPremium/consultantLog">상담리뷰 작성</a></li>
									</ul>
								</div>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_CONSULTANT')">
	                		<div class="gnb-write"  id="chattingCon">
		                		<span class="chat">
		                			<i class="fa-regular fa-comment-dots"></i>
		                		</span>
	                		</div>
							<div class="gnb-write">
								<span>
									<i class="fa-regular fa-pen-to-square"></i>
								</span>
								<div class="mypage-link">
									<ul>
										<li><a href="/boardEntReview/create">기업리뷰 작성</a></li>
										<li><a href="/memberPremium/consultantLog">상담리뷰 작성</a></li>
									</ul>
								</div>
							</div>
						</sec:authorize>
<%-- 						<sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
<!-- 							<span>관리자</span> -->
<%-- 						</sec:authorize> --%>
<%-- 						<sec:authorize access="hasRole('ROLE_MEMBER')"> --%>
<!-- 							<span>일반회원</span> -->
<%-- 						</sec:authorize> --%>
<%-- 						<sec:authorize access="hasRole('ROLE_ENTERPRISE')"> --%>
<!-- 							<span>기업회원</span> -->
<%-- 						</sec:authorize> --%>
						<div class="gnb_icon">
							<span class="profile-img">
								<sec:authorize access="hasRole('ROLE_MEMBER')">
									<a href="/memberAccount/profile">
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_CONSULTANT')">
									<a href="/memberAccount/profile">
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ENTERPRISE')">
									<a href="/entAccount/entmypage">
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="/admin/adminMemberMyPage">
								</sec:authorize>
									<c:choose>
										<c:when test="${memberVO.memAfId != null}">
											<img alt="" src="/resources/upload/${memberVO.memAfId }">
										</c:when>
										<c:otherwise>
											<img alt="" src="/resources/images/img_profilenodata.svg">
										</c:otherwise>
									</c:choose>
								</a>
							</span>
							<i class="fa-solid fa-chevron-down"></i>
							<div class="mypage-link">
								<sec:authorize access="hasRole('ROLE_MEMBER')">
									<ul>
										<li><a href="/memberAccount/profile">계정</a></li>
										<li><a href="/memberResume/resumeList">이력서</a></li>
										<li><a href="/memberPortfolio/portfolioList">자기소개서</a></li>
										<li><a href="/memberCalendar/calendar">일정</a></li>
										<li><a href="/memberInterest/myEnterpriseList">관심정보</a></li>
										<li><a href="/memberApplication/myApplicationList">지원관리</a></li>
										<li><a href="/memberPremium/consultantLog">프리미엄</a></li>
										<li class="gnb-logout">
											<form action="/logout" method="post"> 
						 	                			<button type="submit" style="border:none; background: none; cursor:pointer;">로그아웃</button>
							                		<sec:csrfInput/>
						                	</form> 
										</li>
									</ul>
								</sec:authorize>
								
								<sec:authorize access="hasRole('ROLE_CONSULTANT')">
									<ul>
										<li><a href="/memberAccount/profile">계정</a></li>
										<li><a href="/memberResume/resumeList">이력서</a></li>
										<li><a href="/memberPortfolio/portfolioList">자기소개서</a></li>
										<li><a href="/consultantMyPage/consultantLog">상담</a></li>
										<li><a href="/memberCalendar/calendar">일정</a></li>
										<li><a href="/memberInterest/myEnterpriseList">관심정보</a></li>
										<li><a href="/memberApplication/myApplicationList">지원관리</a></li>
										<li><a href="/memberPremium/consultantLog">프리미엄</a></li>
										<li class="gnb-logout">
											<form action="/logout" method="post"> 
						 	                			<button type="submit" style="border:none; background: none; cursor:pointer;">로그아웃</button>
							                		<sec:csrfInput/>
						                	</form> 
										</li>
									</ul>
								</sec:authorize>
								
									
								<sec:authorize access="hasRole('ROLE_ENTERPRISE')">
									<ul>
										<li><a href="/entAccount/entmypage">개인 프로필</a></li>
										<li><a href="/entRecruit/recruitList">공고 관리</a></li>
										<li><a href="/entApplicant/appRecruit">지원자 현황</a></li>
										<li><a href="/entCalendar/calendar">일정관리</a></li>
										<li><a href="/entOffer/offerList">맞춤 인재</a></li>
										<li><a href="/entReview/reviewList">리뷰 관리</a></li>
										<li><a href="/entApplication/offerEntList">신청 관리</a></li>
										<li class="gnb-logout">
											<form action="/logout" method="post"> 
						 	                			<button type="submit" style="border:none; background: none; cursor:pointer;">로그아웃</button>
							                		<sec:csrfInput/>
						                	</form> 
										</li>
									</ul>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<ul>
										<li><a href="/admin/adminMemberMyPage">일반회원 관리</a></li>
										<li><a href="/admin/adminCounselorMyPage">상담사회원 관리</a></li>
										<li><a href="/admin/adminEnterpriseMyPage">기업회원 관리</a></li>
										<li><a href="/admin/adminEnterItemsList">상품관리</a></li>
										<li><a href="/admin/adminEnterChart">통계</a></li>
										<li><a href="/admin/adminReport">신고관리</a></li>
										<li><a href="/admin/adminBoardNotice">게시판관리</a></li>
										<li class="gnb-logout">
											<form action="/logout" method="post"> 
						 	                			<button type="submit" style="border:none; background: none; cursor:pointer;">로그아웃</button>
							                		<sec:csrfInput/>
						                	</form> 
										</li>
									</ul>
								</sec:authorize>
							</div>
						</div>
<%--                 	<span>${memberVO.memNm}</span> --%>
                	
<!-- 	                	<form action="/logout" method="post"> -->
<!-- 	                			<button type="submit" style="border:none; background: none;">로그아웃</button> -->
<%-- 	                		<sec:csrfInput/> --%>
<!-- 	                	</form> -->
                </sec:authorize>
            </div>
        </div>

        <div class="header-bot">
            <div class="schbar">
                <input class="schbar-input" onkeyup="search(event)" placeholder="기업, 채용공고를 검색해보세요." type="text" name="" id="">
            </div>
        </div>
    </header>
        
    <header id="scroll-header">
        <a class="header-top-logo logo" href="/">
        	날 JOB아줘
        </a>
        <div class="schbar">
            <input class="schbar-input" onkeyup="search(event)" placeholder="기업, 채용공고를 검색해보세요." type="text" name="" id="">
        </div>
    </header>
    
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<!-- websocket -->
<script type="text/javascript">
var socket = null; // 소켓 전역변수 선언

$(document).ready(function() {
	<sec:authorize access="isAuthenticated()">
		connectWS();
	</sec:authorize>
});

// 웹소켓 연결 함수
function connectWS() {
	var ws = new SockJS("/echo"); // 소켓 객체 생성
	socket = ws;
	
	console.log("웹소켓: ", socket);
	
	ws.onopen = onOpen;
	ws.onmessage = onMessage;
	ws.onclose = onClose;
	ws.onerror = onError;
}

// 소켓 연결
function onOpen() {
	console.log("소켓 연결 (onopen)");
};

// 메시지 수신
function onMessage(evt) {
	console.log("onMessage 함수: ", evt.data);

};

// 소켓 종료
function onClose() {
	console.log("소켓 종료 (onclose)");
};

// 소켓 에러
function onError() {
	console.log("소켓 에러 (onerror)");
};

/* 채팅 384756 시작 */
$(document).on("click", "#chatting", function() {
	
	$.ajax({
		url : '/chatting/getConsultantList',
		contentType : "application/json;charset=utf-8",
		type : "post",
		dataType : "text",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(
					"${_csrf.headerName}",
					"${_csrf.token}");
		},
		success : function(result) {
			
			let memberVOList = JSON.parse(result);
			
			
			let tempStr = '';
			memberVOList.forEach(function(element) {
				
				console.log(element);
				tempStr += '<div class="consultant-list">';
				tempStr += '<div class="consultant-list-div-left">';
				if(element.memAfId != null && element.memAfId != '' ){
					tempStr += '<img class="picture-size-img" alt="" src="/resources/upload/'+element.memAfId+'">';
				} else {
					tempStr += '<img class="picture-size-img" src="/resources/images/noimages.png">';
				}
				
				tempStr += '</div>';
				tempStr += '<div class="consultant-list-div-right">';
				tempStr += '<p class="p-14 bold mb-7">'+element.memNm+'</p>';
				tempStr += '<p class="p-13">'+element.memEmail+'</p>';
				tempStr += '</div>';
				tempStr += '</div>';
			});
			
			$('.tab1').html(tempStr);
			
		}	
	});
	
	$(".chatting-box").toggle();
	
});
/* 채팅 384756 끝 */



$(document).on("click", "#chattingCon", function() {
	
	console.log("상담사가 일반회원 정보 부른다");
	
	$.ajax({
		url : '/chatting/getMemberList',
		contentType : "application/json;charset=utf-8",
		type : "post",
		dataType : "text",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(
					"${_csrf.headerName}",
					"${_csrf.token}");
		},
		success : function(result) {
			
			let memberVOList = JSON.parse(result);
			
			let tempStr = '';
			memberVOList.forEach(function(element) {
				tempStr += '<div class="consultant-list">';
				tempStr += '<div class="consultant-list-div-left">';
				if(element.memAfId != null && element.memAfId != '' ){
					tempStr += '<img class="picture-size-img" alt="" src="/resources/upload/'+element.memAfId+'">';
				} else {
					tempStr += '<img class="picture-size-img" src="/resources/images/noimages.png">';
				}
				console.log(element)
				tempStr += '</div>';
				tempStr += '<div class="consultant-list-div-right">';
				tempStr += '<p class="p-14 bold mb-7">'+element.memNm+'</p>';
				tempStr += '<p class="p-13">'+element.memEmail+'</p>';
				tempStr += '</div>';
				tempStr += '</div>';
			});
			
			$('.tab1').html(tempStr);
			
		}	
	});
	
	$(".chatting-box").toggle();
	
});

</script>