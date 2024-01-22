<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>

<style>
.table-wrap{
	display: flex;
	justify-content: center;
}
.mypage-sub-title{
	font-size: 24px;
	margin-bottom: 24px;
}
.mypage-table {
    border-collapse: collapse;
    width: 100%;
/*     border-radius: 20px; */
    overflow: hidden;
}
.mypage-table th, .mypage-table td {
    padding: 16px;
    border-bottom: 1px solid #ddd;
}
.mypage-table thead {
    background-color: #f7f7f7;
}
.mypage-table thead tr td {
 	text-align: center;
}
.mypage-table tbody tr:nth-child(even) {
    background-color: #fbfbfb;
}
.mypage-table tbody tr:hover {
    background-color: #ddd;
}
.mypage-table td:first-child {
    text-align: center;
    width: 80px; 
}
.mypage-table th:nth-child(2),
.mypage-table td:nth-child(2) {
  	width: 400px;
}
.mypage-table th:nth-child(3),
.mypage-table td:nth-child(3) {
  	width: 160px; 
  	text-align: center;
}
.mypage-table th:nth-child(4),
.mypage-table td:nth-child(4) {
  	width: 160px; 
  	text-align: center;
}
/* .mypage-table tbody td:not(:nth-child(2)) { */
/*     text-align: center; */
/* } */
.modal-title{
   text-align: center;
   font-size: 24px;
   font-weight: 800;
}
#modal-custom{
	max-width: 640px !important;
}
.iziModal-wrap{
	width: 240px;
}
.modal-con{
	padding: 20px;
}
.modal-table{
/* 	width: 100%; */
}
.modal-table tr td{
	padding: 4px;
}
.entNumber{
	text-align: right;
}
.entNm{
	text-align: center;
}
.btn-parent{
	display: flex;
	justify-content: center;
}
.modal-table {
    width: 100%;
    border-collapse: collapse;
    border: 2px solid #ccc; /* 변경된 border 스타일과 색상 */
}

.modal-table tr td {
    padding: 12px 6px 12px 6px; /* padding 수정 */
    border: 1px solid #ccc; /* 변경된 border 스타일과 색상 */
}

.modal-table tr:nth-child(3) {
    height: 80px; /* collspan 6인 부분의 높이 수정 */
}
.btn{
	margin-bottom: 24px;
}

</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">지원관리</div>
		<ul>
			<li><a href="/memberApplication/myApplicationList">입사지원 관리</a></li>
			<li class="active"><a href="/memberApplication/myJobOffer">받은 입사제안</a></li>
		</ul>
	</div>
	

	
	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				제안 받은 기업
			</div>
		</div>
			
		<div class="body-sub-con">
			<div class="table-wrap">
					<table class="table1">
						<colgroup>
							<col width="15%"> 
							<col width="*"> 
							<col width="15%"> 
							<col width="15%"> 
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제안서 제목</th>
								<th>제안 기업</th>
								<th>제안 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="jobOfferVO" items="${jobOfferVOList}" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td><span class="myOffer-title">${jobOfferVO.offerTitle}</span><input type="hidden" class="clickEntNo" value="${jobOfferVO.entNo}"/></td>
									<td>${jobOfferVO.enterpriseVO.entNm}</td>
									<td><fmt:formatDate value="${jobOfferVO.offerDt}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="pagez">
            		 ${info.getPagingArea()}
          	    </div>
				
				
				
		</div>
	</div>
	<div id="modal-custom">
	        <button data-izimodal-close="" class="icon-close"></button>
	        <p class="modal-title">입사 제안</p>
	          <div class="modal-con">
	          
	          
	          </div><!-- end modal-con -->
	      
	        <div class="btn-parent">
	           <button  class="btn-sm btn-write btn" id="modal-cen-btn">닫기</button>
	        </div>
	</div>



</div>




<script type="text/javascript">
$(document).ready(function(){
	
	$("#modal-custom").iziModal({
        title: '',
        subtitle: '',
        headerColor: '#88A0B9',
        background: null,
        theme: '',  // light
        icon: null,
        iconText: null,
        iconColor: '',
        rtl: false,
        width: 400,
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
        bodyOverflow: false,
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
    });// end modal
	
	$('.myOffer-title').on('click',function(e){
		
		let entNo = e.target.nextElementSibling.value;
		console.log(entNo);
		
		let data = {
				"entNo" : entNo
				};

		console.log(data);
		
		$.ajax({
			url: '/memberInterest/ajaxgetJobOfferEnt',
			contentType: 'application/json;charset-utf-8',
			dataType: 'json',
			type: 'post',
			data: JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(rst){
				
			let cont = '';
		           cont += '<table class="modal-table" border="1">';
		           cont += '<tr>';
		           cont += '<td>기업이름</td>';
		           cont += '<td class="entNm">'+rst.entNm+'</td>';
		           cont += '<td>기업주소</td>';
		           cont += '<td colspan="3">'+ rst.entAddr+' '+rst.entAddr2+'</td>';
		           cont += '</tr>';
		           cont += '<tr>';
		           cont += '<td>기업매출액</td>';
		           cont += '<td class="entNumber">'+formatRevenue(rst.entSales)+'원</td>';
		           cont += '<td>기업직원수</td>';
		           cont += '<td class="entNumber">'+formatRevenue(rst.entEmpcnt)+'명</td>';
		           cont += '<td>기업설립일자</td>';
		           cont += '<td class="entNumber">'+formatDate(rst.entBday)+'</td>';
		           cont += '</tr>';
		           cont += '<tr>';
		           cont += '<td colspan="6"><p>email로 입사 제안서가 발송 되어 있습니다.</p></td>';
		           cont += '</tr>';
		           cont += '</table>';
				
				$('.modal-con').html(cont);
				
				$('#modal-custom').iziModal('open');
				
				
				$('#modal-cen-btn').on('click',function(){
					
					$('#modal-custom').iziModal('close');
				});
				
			},
			error:function(xhr,status,error){
				console.log('Error:', xhr, status, error);
			}
		});
		
		
		
	});//end myOffer-title on click
	
	//숫자 포맷
	function formatRevenue(revenue) {
	    return new Intl.NumberFormat().format(revenue);
	}
	
	//날짜 포맷
	function formatDate(dateString) {
	    let date = new Date(dateString);
	    let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
	    return formattedDate;
	}

	
	
});//end ready function



</script>

