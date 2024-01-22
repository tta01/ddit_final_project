<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" href="/resources/css/admin.css">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<!-- <link href="https://fonts.gstatic.com" rel="preconnect"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" -->
<!-- 	rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<style>
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
    border-bottom: 3px solid;
    height: 80px;
    font-weight: bold;
}
 .sub-title-area {
    display: flex;
    align-items: center;
    width: fit-content;
    margin: 20px 50px -16px 50px;
}

  .body-sub-title {
    font-size: 20px;
    display: flex;
    align-items: center;
    padding-inline-start: 32px;
    gap: 16px;
}

.card-title {
    font-size: 24px;
 }
 
.counsel {
  	table-layout: fixed;
    border-collapse: collapse;
    width: 1070px;
    margin-top: 16px;
    margin-left: 300px;
    margin-bottom: 10px;
}
.biz-tab {
    display: flex;
/*     justify-content: flex-end; /* 우측 정렬을 위해 flex-end 값을 사용합니다 */ 
	margin-left: 300px;
    margin-bottom: 24px;
    margin-bottom: 24px;
    position: relative; /* 부모 요소를 relative로 설정합니다 */
    align-items: center;
   
}
.biz-tab::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0; /* 좌측 여백 크기 */
    right: 445px; /* 우측 여백 크기 */
    border-bottom: 1px solid #50C785;
}


a.biz-tab__item {
    display: inline-block;
    box-sizing: border-box;
    width: 253px;
    height: 48px;
    border-radius: 6px 6px 0 0;
    border: 1px solid #d3dae6;
    border-bottom: 0;
    background-color: #fff;
    font-family: 'HGSoftGGothicssi60g';
    font-size: 16px;
    text-align: center;
    line-height: 47px;
    letter-spacing: 0;
    color: #777e8c;
    }
.mypage-aside-con{font-family: 'Noto Sans KR', sans-serif;}
.aside-name{padding-top:34px;}\
.mem-ul{display:flex; align-items:center;}
table .modaltable {
	border-collapse: collapse;
}

.thth ,.tdtd {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.thth{
	background-color: #f2f2f2;
	
}

.modal-content {
	padding: 20px;
	
}

.infomation {
    font-weight: bold; /* 진하게 */
    font-size: 20px; /* 크기 조절 */
}
/* 원 모양 프로필 사진 스타일 */
.rounded-circle {
    border-radius: 50% !important;
}

.border-2 {
    border-width: 2px !important;
}

.border-primary {
   --bs-border-opacity: 1; 
    border-color: rgba(var(--bs-primary-rgb), var(--bs-border-opacity)) !important;
}

.modaltable {
    margin-top: 20px; /* .modaltable 위쪽 여백 추가 */
}

#closeModal{
	margin-top: 7px;
}
.modal-body{
	text-align: center;
}
.warning-icon {
    text-align: center;
    display: flex; /* Flexbox를 사용하여 수직, 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    justify-content: center; /* 수평 가운데 정렬 */
    background-color: mistyrose;
    border-radius: 50%;
    width: 40px; /* 원의 지름으로 크기 조정 */
    height: 40px; /* 원의 지름으로 크기 조정 */
    margin-left: 45%;
}

.warning-icon i {
    color: red;
    font-size: 20px;
    margin-top: -3px; /* 아이콘 위치 조정 */
}

.card-tools{
	width: 100%;
	font-size: 20px;
}

.serchbox {
    display: flex;
    align-items: center;
}

.serch-input {
    margin-right: 10px; /* 원하는 간격으로 조절 */
}

.serch button {
    margin-left: auto; /* 나머지 공간을 모두 차지하여 오른쪽에 정렬 */
    height: 35px;
    border-radius: 15px; /* 버튼을 더 둥글게 만들기 */
}

.sub-title-area {
    display: flex;
    align-items: center;
    width: fit-content;
    margin: 20px 50px -16px 50px;
}

.body-sub-title {
    font-size: 20px;
    display: flex;
    align-items: center;
    padding-inline-start: 32px;
    gap: 16px;
}

.card-title {
    font-size: 24px;
}

.headdd{
	padding-top: 1rem;
}

.list-counting__applicants-btn{
	background-color: white;
}

tbody {
    
    margin: 20px;
    padding: 20px;
    margin-bottom: 20px; 
    padding-bottom: 20px;
}

.u_u{
	height: 100px;
	border-bottom: 1px solid #d2d2d2;
}

.uu_uu{
	padding-bottom: 20px;
}

.naesajin {
  max-width: 150px;
  max-height: 150px;
  display: block;
  margin: 0 auto; /* 수평 가운데 정렬을 위해 추가 */
}

.pagination {
    display: flex;
    list-style: none;
    padding-left: 30%;
}

.pagez {
	display: flex;
    justify-content: center;
    margin: 32px 0px;
}

.pagez  li.is_active{
  font-weight: bold;
  border-bottom: 3px solid #2ecc71;
}
.pagez .pagination a{
  display: inline-block;
  color: #222;
}
.pagez .pagination ul{
  margin: 0;
  padding: 0;
  list-style-type: none;
  display:flex;
  justify-content: center;
}
.pagez.pagination{
  padding: 30px 0;
}

.pagez .paginate_button {
   margin:0 15px;
}

.pagez  .disabled {
    pointer-events : none;
    cursor:default;
}

.disabled>.page-link {
	background-color: transparent !important;
	border-color: transparent !important;
}

.page-link {
	border-color: transparent !important;
}

</style>
<div class="mypage-body-con">
	<div class="sub-title-area alert alert-success alert-dismissible fade sho alert alert-success alert-dismissible fade show">
		<div class="body-sub-title card-title">기업 회원 관리 →
			<h3 class="card-title"
					>승인 요청</h3>
		<hr class="title-hr" /></div>
	</div>

	
	<div class="body-sub-con">
		<div class="card">
<form:form modelAttribute="memberVO" action="/admin/adminEnterProposal" method="post">
			<div class="card-header border-0">
			
				<div class="card-tools" style="display: flex; justify-content: space-between;">
                    <span>전체회원수 ${totalOfferEnter} 명</span>
			<div class="serchbox">
                <input class="serch-input" placeholder="이름을 검색해주세요." type="text" name="memNm" id="" value="" style="margin-left: auto;"><button type="submit" class="btn btn-secondary serch">검색</button>
            </div>
				</div>
			</div>
</form:form>
	<div class="biz-tab">
                    <a class="biz-tab__item biz-tab__item--active" href="/admin/adminEnterProposal">전체 <span class="biz-tab__number"> ${totalOfferEnter}</span></a>
                    <a class="biz-tab__item " href="/admin/adminEnterSuccess?sort=success">승인 <span class="biz-tab__number">${totalEnter}</span></a>
                    <a class="biz-tab__item " href="/admin/adminEnterWaiting?sort=waiting">승인 대기<span class="biz-tab__number">${enterWaitCount}</span></a>
                    <a class="biz-tab__item " href="/admin/adminEnterFalse?sort=false">승인 취소<span class="biz-tab__number">${enterFalseCount}</span></a>
     </div>
			<table class="counsel">
     			<colgroup>
		           <col style="width:10%">
		           <col style="width:10%">
		           <col style="width:14%">
		           <col style="width:15%">
		           <col style="width:15%">
		           <col style="width:12%">
		       </colgroup>
			       <thead>
			           <tr class="uu_uu">
			               <th scope="col" class="headdd">이름</th>
			               <th scope="col" class="headdd">아이디</th>
			               <th scope="col" class="headdd">지원 분야</th>
			               <th scope="col" class="headdd">전화번호</th>
			               <th scope="col" class="headdd">가입일</th>
			               <th scope="col" class="headdd">신청 상태</th>
			           </tr>
			       </thead>
				       <tbody>
			       <c:forEach var="memberVO" items="${waitingEnterVOList}" varStatus="stat">
				           <tr class="u_u">		
				           		<td class="num" scope="row">${memberVO.memNm}</td>
				           		<td class="goods">${memberVO.memId}</td>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01000'}">
				           				<td class="term">개발 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01001'}">
				           				<td class="term">경영 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01002'}">
				           				<td class="term">마케팅/광고 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01003'}">
				           				<td class="term">디자인 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01004'}">
				           				<td class="term">영업 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01005'}">
				           				<td class="term">고객 서비스 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01006'}">
				           				<td class="term">미디어 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01007'}">
				           				<td class="term">엔지니어링 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.memWishJobCate == 'MWJ01008'}">
				           				<td class="term">HR 직군<br></td>	
				           			</c:when>
				           		</c:choose>
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01009'}">
				           				<td class="term">게임/제작 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01010'}">
				           				<td class="term">금융 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01011'}">
				           				<td class="term">제조/생산 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01012'}">
				           				<td class="term">의료/제약/바이오 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01013'}">
				           				<td class="term">교육 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01014'}">
				           				<td class="term">물류/무역 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01015'}">
				           				<td class="term">법률/법집행 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01016'}">
				           				<td class="term">식/음료 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01017'}">
				           				<td class="term">건설/시설 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<c:choose>
				           			<c:when test="${memberVO.entSector == 'MWJ01018'}">
				           				<td class="term">공공/복지 직군<br></td>	
				           			</c:when>
				           		</c:choose>	
				           		<td class="phoneNumber"><c:out value="${memberVO.memTel}"/></td>	
				           		<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${memberVO.memRegDt}" /></td>
				           		<c:choose>
				           			<c:when test="${memberVO.memYn =='AYN01001'}">
				           				<td class="cert cert-approved">승인완료</td>
				           			</c:when>
				           			<c:when test="${memberVO.memYn == 'AYN01002'}">
				           				<td class="cert cert-waiting">승인대기</td>
				           			</c:when>
				           			<c:otherwise>
				           				<td class="cert cert-cancelled">승인취소</td>
				           			</c:otherwise>
				           		</c:choose>		
				           		
					            <td colspan="6"> <!-- 셀 병합을 통해 전체 너비를 차지하도록 설정합니다 -->
				           		<input type="hidden" class="memberId" value="${memberVO.memId}" />
								<input type="hidden" class="ComCodeInfoVO" value="${memberVO.memWishJobCate}" />
								<input type="hidden" class="ComDetInfoVO" value="${memberVO.memWishJob}" />
								<input type="hidden" class="ComDetInfoVO2" value="${memberVO.memIntWord}" />
					                <a id="SendToExcel" class="list-counting__applicants-btn" href="#" onclick="return false;"><span></span>이력서 보기</a>
					                <button type="button" class="list-counting__applicants-btn detailGo" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">상세보기</button>
					            </td>
					        </tr>
				   </c:forEach>
				       </tbody>
		   		</table>
		   		<div class="pagez">${info.getPagingArea5()}</div>
        	</div>  
      	</div>
   	</div>
   	<div class="card">

		<!-- 모달시작 -->
		<div class="modal fade" id="modalDialogScrollable" tabindex="-1"
			aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="infomation">
					
					</div>
					<img class="naesajin rounded-circle border-2 border-primary" src="/resources/images/default-profile.png" alt="회원 사진">
					<table class="modaltable">
						<tr>
							
							<th class="thth">회원 ID</th>
							<td class="tdtd" id="memId"></td>
						</tr>
						<tr>
							<th class="thth">회원 이름</th>
							<td class="tdtd" id="memName"></td>
						</tr>
						<tr>
							<th class="thth">주소</th>
							<td class="tdtd" id="memAddr"></td>
						</tr>
						<tr>
							<th class="thth">전화번호</th>
							<td class="tdtd" id="memTel"></td>
						</tr>
						<tr>
							<th class="thth">가입일</th>
							<td class="tdtd" id="memRegDt"></td>
						</tr>
						<tr>
							<th class="thth">회원분류</th>
							<td class="tdtd" id="memStateCd"></td>
						</tr>
						<tr>
							<th class="thth">생년월일</th>
							<td class="tdtd" id="memBirth"></td>
						</tr>
						<!-- 나머지 항목도 같은 형식으로 추가 -->
						<tr>
							<th class="thth">성별</th>
							<td class="tdtd" id="memGen"></td>
						</tr>
						<!-- 나머지 항목도 같은 형식으로 추가 -->
						<tr>
							<th class="thth">이메일</th>
							<td class="tdtd" id="memEmail"></td>
						</tr>
						<!-- 나머지 항목도 같은 형식으로 추가 -->
						<tr>
							<th class="thth">닉네임</th>
							<td class="tdtd" id="memNcnm"></td>
						</tr>
						<tr>
							<th class="thth">소개글</th>
							<td class="tdtd" id="memIntrcn"></td>
						</tr>
						<tr>
							<th class="thth">희망직군</th>
							<td class="tdtd" id="memWishJobCate"></td>
						</tr>
						<!-- 나머지 항목도 같은 형식으로 추가 -->
						<tr>
							<th class="thth">관심키워드</th>
							<td class="tdtd" id="memIntWord"></td>
						</tr>
						<tr>
							<th class="thth">신청 상태</th>
							<td class="tdtd" id="memYn"></td>	
						</tr>
						
						<!-- 나머지 항목도 같은 형식으로 추가 -->
					</table>
					
					<button id="closeModal" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>

	</div>
                  
	<!-- Vendor JS Files -->
	<script src="/resources/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/vendor/chart.js/chart.umd.js"></script>
	<script src="/resources/vendor/echarts/echarts.min.js"></script>
	<script src="/resources/vendor/quill/quill.min.js"></script>
	<script src="/resources/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/resources/vendor/tinymce/tinymce.min.js"></script>
	<script src="/resources/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/js/main.js"></script>

	<script src="/resources/js/admin.js"></script>
	
<script>

function formatPhoneNumber(phoneNumberTd) {
    const phoneNumber = phoneNumberTd.textContent;
    const cleaned = ('' + phoneNumber).replace(/\D/g, '');
    const regex = /^(\d{3})(\d{4})(\d{4})$/;
    const result = cleaned.replace(regex, '$1-$2-$3');
    console.log(result);
    phoneNumberTd.textContent = result;
    return result;
}

window.onload = function () {
    const phoneNumberElements = document.getElementsByClassName('phoneNumber');
    Array.from(phoneNumberElements).forEach(phoneNumberTd => {
        formatPhoneNumber(phoneNumberTd);
    });
};

document.addEventListener("DOMContentLoaded", function() {
	
	const detailButtons = document.querySelectorAll('.detailGo');
	
	
	detailButtons.forEach(button =>{
		button.addEventListener("click",function(){
			  const hiddenInput = button.previousElementSibling; // 이전 형제 요소(hidden input) 가져오기
			  if (hiddenInput) {
	                const cate = hiddenInput.previousElementSibling;

	                const memberIdInput = button.parentElement.querySelector('.memberId'); // 해당 버튼의 부모 내에서 memberId를 찾습니다.

	                const memberIdValue = memberIdInput.value; // memberId의 값
	                const memIntWordValue = cate.value; // 두 번째 숨겨진 입력 요소의 값

	                const thirdHiddenInput = cate.previousElementSibling;

	                if (thirdHiddenInput) {
	                    const memWishJobValue = thirdHiddenInput.value;

	                    const fourthHiddenInput = thirdHiddenInput.previousElementSibling;

	                    if (fourthHiddenInput) {
	                        const memWishJobCateValue = fourthHiddenInput.value;

	                        var data = {
	                            "memId": memberIdValue,
	                            "memWishJobCate": memWishJobCateValue,
	                            "memWishJob": memWishJobValue,
	                            "memIntWord": memIntWordValue
	                        }

	                        // memWishJobCateValue에는 ComCodeInfoVO 클래스의 값이, memberIdValue에는 memberId 클래스의 값이 저장됩니다.
	                        console.log(memWishJobCateValue);
	                        console.log(memberIdValue);
	                        console.log(memWishJobValue);
	                        console.log(memIntWordValue);
	                    }
	                }
	            }
	           
	           $.ajax({
	        	   url: "/admin/selectEnterrAjax",
	                contentType: "application/json;charset=utf-8",
	                data: JSON.stringify(data), // JSON.stringify 오타 수정
	                type: "post",
	                dataType: "json",
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
 					success: function(result) {
	                	
	                	console.log(result);
	                	
	                    // 받아온 정보를 이용하여 모달에 동적으로 표시하는 작업
	                    // 예시: 모달 내 특정 요소에 받아온 데이터 추가
	                    const memId = document.getElementById("memId");
	                    
	                    const infomation = document.querySelector(".infomation"); // 해당 div를 가져옵니다.

		                 // result.memId를 해당 div 안에 삽입합니다.
		                 infomation.innerHTML = '<strong>'+ result.memId +'님의 상세정보 </strong>';
	                	
	                	memId.innerHTML = result.memId; // 예시로 받아온 데이터의 일부를 모달에 표시
	                	
	                	
	                    
	                    const memName = document.getElementById("memName");
	                    
	                	memName.innerHTML = result.memNm;
	                    
	                	const memAddr = document.getElementById("memAddr");
	                    
	                	memAddr.innerHTML = result.memAddr + result.memAddr2;
	                	
	                	const memTel = document.getElementById("memTel");
	                    
	                	memTel.innerHTML = result.memTel;
	                	
	                	const memRegDt = document.getElementById("memRegDt");
	                    
	                	memRegDt.innerHTML = result.memRegDt;
	                	
	                	const memStateCd = document.getElementById("memStateCd");
	                    
	                	if(result.memStateCd=='MSC01000'){
	                		memStateCd.innerHTML = '탈퇴 회원';
	                	}else if(result.memStateCd == 'MSC01001'){
	                		memStateCd.innerHTML = '정상 회원';
	                	}else{
	                		memStateCd.innerHTML = '블랙리스트 회원';
	                	}
	                	
	                	const memBirth = document.getElementById("memBirth");
	                	
	                	memBirth.innerHTML = result.memBirth;
	                	
	                	const memGen = document.getElementById("memGen");
	                	
	                	if(result.memGen == 1){
	                		memGen.innerHTML = '남성';
	                	}else{
	                		memGen.innerHTML = '여성';
	                	}
	                	
						const memEmail = document.getElementById("memEmail");
	                    
						memEmail.innerHTML = result.memEmail;
						
						const memNcnm = document.getElementById("memNcnm");
	                    
						memNcnm.innerHTML = result.memNcnm;
						
						const memIntrcn = document.getElementById("memIntrcn");
	                    
						memIntrcn.innerHTML = result.entIntrcn;
						
						const memWishJobCate = document.getElementById("memWishJobCate");
	                    
						memWishJobCate.innerHTML = result.entSector;
						if(result.entSector == 'MWJ01001'){
							
							memWishJobCate.innerHTML = '경영/비즈니스';
						
						}else if(result.entSector == 'MWJ01002'){
							
							memWishJobCate.innerHTML = '마케팅/광고';
						
						}else if(result.entSector == 'MWJ01003'){
							
							memWishJobCate.innerHTML = '디자인';
						
						}else if(result.entSector == 'MWJ01004'){
							
							memWishJobCate.innerHTML = '영업직';

						}else if(result.entSector == 'MWJ01005'){
							
							memWishJobCate.innerHTML = '고객서비스/리테일';

						}else if(result.entSector == 'MWJ01006'){
							
							memWishJobCate.innerHTML = '미디어';

						}else if(result.entSector == 'MWJ01007'){
							
							memWishJobCate.innerHTML = '엔지니어링/설계';

						}else if(result.entSector == 'MWJ01008'){
							
							memWishJobCate.innerHTML = 'HR';

						}else if(result.entSector == 'MWJ01009'){
							
							memWishJobCate.innerHTML = '게임/제작';

						}else if(result.entSector == 'MWJ01010'){
							
							memWishJobCate.innerHTML = '금융업';

						}else if(result.entSector == 'MWJ01011'){
							
							memWishJobCate.innerHTML = '제조/생산';

						}else if(result.entSector == 'MWJ01012'){
							
							memWishJobCate.innerHTML = '의료/제약/바이오';

						}else if(result.entSector == 'MWJ01013'){
							
							memWishJobCate.innerHTML = '교육직';

						}else if(result.entSector == 'MWJ01014'){
							
							memWishJobCate.innerHTML = '물류/무역';

						}else if(result.entSector == 'MWJ01015'){
							
							memWishJobCate.innerHTML = '법률/법집행기관';

						}else if(result.entSector == 'MWJ01016'){
							
							memWishJobCate.innerHTML = '식/음료';

						}else if(result.entSector == 'MWJ01017'){
							
							memWishJobCate.innerHTML = '건설/시설';

						}else if(result.entSector == 'MWJ01018'){
							
							memWishJobCate.innerHTML = '공공/복지';
						}
						
						const memIntWord = document.getElementById("memIntWord");
						
						if(result.entIntWord == 'IKW01001'){
							
							memIntWord.innerHTML = '높은연봉';
						
						}else if(result.entIntWord =='IKW01002'){
							
							memIntWord.innerHTML = '자기계발지원'
						
						}else if(result.entIntWord =='IKW01003'){
							
							memIntWord.innerHTML = '워라벨';

						}else if(result.entIntWord == 'IKW01004'){
							
							memIntWord.innerHTML = '사내문화';
						
						}else if(result.entIntWord == 'IKW01005'){
							
							memIntWord.innerHTML = '좋은동료';
						
						}else if(result.entIntWord == 'IKW01006'){
							
							memIntWord.innerHTML = '30';
						
						}else if(result.entIntWord == 'IKW01007'){
							
							memIntWord.innerHTML = '넉넉한 상여금';
						
						}else if(result.entIntWord == 'IKW01008'){
							
							memIntWord.innerHTML = '주 4.5일 근무';
						
						}else if(result.entIntWord == 'IKW01009'){
							
							memIntWord.innerHTML = '수평적인 문화';
						
						}else if(result.entIntWord == 'IKW01010'){
							
							memIntWord.innerHTML = '탄탄한 회사';
						
						}else if(result.entIntWord == 'IKW01011'){
							
							memIntWord.innerHTML = '자율 출퇴근';
						
						}else{
							
							memIntWord.innerHTML = '관심키워드없음';
						}
						
						const memYn = document.getElementById("memYn");
	                    console.log(result.memYn);
	                    let ynText = '';
	                    let ynColor = '';
	                    
						if(result.memYn =='AYN01001'){
						
							memYn.innerHTML = '승인완료'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>';
							 memYn.style.color = 'green';
						}else if(result.memYn == 'AYN01002'){
							
							memYn.innerHTML = '승인대기'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
							 memYn.style.color = 'black';
						}else{
							
							memYn.innerHTML = '승인취소'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
							 memYn.style.color = 'red';
						}
						const currentText = memYn.textContent.trim(); // 현재 텍스트 내용을 가져옵니다.

						function changeToSelect() {
							const selectElement = document.createElement("select");
						    const options = [
						        { value: "AYN01001", label: "승인완료" },
						        { value: "AYN01002", label: "승인대기" },
						        { value: "AYN01003", label: "승인취소" }
						    ];

						    options.forEach(option => {
						        const optionElement = document.createElement("option");
						        optionElement.value = option.value;
						        optionElement.textContent = option.label;
						        selectElement.appendChild(optionElement);
						    });

						    // 저장 버튼
						    const saveButton = document.createElement('button');
						    saveButton.textContent = '저장';
						    saveButton.classList.add('save-button');
						    console.log(memId);
						    saveButton.addEventListener('click', function() {
						        const selectedValue = selectElement.value;
						        data = {
						        		"memYn" : selectedValue,
						        		"memId" : result.memId
						        }
						        
						           $.ajax({
						        	   url: "/admin/updateEnterAjax",
						                contentType: "application/json;charset=utf-8",
						                data: JSON.stringify(data), // JSON.stringify 오타 수정
						                type: "post",
						                dataType: "json",
						                beforeSend: function(xhr) {
						                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						                },
					 					success: function(result) {
					 						console.log(result);
					 						alert("성공적으로 저장되었습니다");
					 						const memYn = document.getElementById("memYn");
					 						const value = selectedValue;
					 						
					 						if(value =='AYN01001'){
					 							
												memYn.innerHTML = '승인완료'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>';
												 memYn.style.color = 'green';
											}else if(value == 'AYN01002'){
												
												memYn.innerHTML = '승인대기'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
												 memYn.style.color = 'black';
											}else{
												
												memYn.innerHTML = '승인취소'+'<input type="button" class="Yncondition detailGo list-counting__applicants-btn"  value="상태 변경"/>';
												 memYn.style.color = 'red';
											}
					 						
					 						 // 상태 변경 버튼 재표시
// 									        memYn.insertAdjacentHTML('beforeend', '<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>');
									        
									        // 상태 변경 버튼 클릭 이벤트 다시 연결
									        const changeStatusButton = document.querySelector('.Yncondition');
									        changeStatusButton.addEventListener('click', function() {
									            changeToSelect();
									        });
					 					}
						          });
						    });

						    // 취소 버튼
						    const cancelButton = document.createElement('button');
						    cancelButton.textContent = '취소';
						    cancelButton.classList.add('cancel-button');
						    cancelButton.addEventListener('click', function() {
						        console.log('취소');
						    });

						    memYn.innerHTML = '';
						    memYn.appendChild(selectElement);
						    memYn.appendChild(saveButton);
						    memYn.appendChild(cancelButton);
						}

						// 상태 변경 버튼 클릭 이벤트 처리
						const changeStatusButton = document.querySelector('.Yncondition');
						changeStatusButton.addEventListener('click', function() {
						    changeToSelect();
						});

						// 취소 버튼 처리
						document.addEventListener('click', function(event) {
							  const cancelButton = event.target.closest('.cancel-button');
							    if (cancelButton) {
							        const memYn = document.getElementById("memYn");
							        memYn.innerHTML = currentText;

							        // 상태 변경 버튼 재표시
							        memYn.insertAdjacentHTML('beforeend', '<input type="button" class="Yncondition detailGo list-counting__applicants-btn" value="상태 변경"/>');
							        
							        // 상태 변경 버튼 클릭 이벤트 다시 연결
							        const changeStatusButton = document.querySelector('.Yncondition');
							        changeStatusButton.addEventListener('click', function() {
							            changeToSelect();
							        });
							    }
							});
						}
	           });
	           
	            const modal = document.getElementById("closeModal");
	            modal.style.display = "block";
	            document.body.style.overflow = "hidden";
	            
	            function closeModal() {
	                // 모달을 닫는 코드 작성
	                modal.style.display = "none";
	                document.body.style.overflow = "auto"; // 기존 스크롤 상태로 변경

	                // 페이지 이동
	                window.location.href = "/admin/adminEnterWaiting?sort=waiting";
	            }

	            // 모달 닫기 버튼에 이벤트 리스너를 추가합니다.
	            const closeButton = document.getElementById("closeModal"); // 닫기 버튼 ID로 가져와야 합니다.
	            closeButton.addEventListener('click', closeModal);
	        });
	    });
	});
	
	
</script>