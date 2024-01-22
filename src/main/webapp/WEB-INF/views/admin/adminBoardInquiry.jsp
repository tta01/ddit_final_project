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

.goodsList {
    position: relative;
}

.goodsList h2 {
    margin: 0 0 7px;
    font-weight: bold;
    font-size: 19px;
    line-height: 1.2;
    letter-spacing: -0.1em;
    color: #000;
}
.goodsList p.listCount {
	margin-bottom:0;
}
.goodsList .selectArea .listType {
    position: absolute;
    left: 0;
    top: 14px;
    display: block;
    width: auto;
    line-height: 14px;
    background: none;
}
.goodsList .selectArea {
    position: relative;
    padding: 7px 0;
    text-align: right;
    border-top: 2px solid #7b7b7b;
}

.goodsList .selectArea .listType a.on {
    padding-left: 15px;
    color: #000;
    background-position: -1366px -963px;
}
.goodsList .selectArea .listType a {
    display: inline-block;
    width: auto;
    height: 14px;
    padding: 0 0 0 12px;
    line-height: 14px;
    color: #959595;
    background: url(//image.alba.kr/e/goods/201505/goodsJob.png) no-repeat -1366px -982px;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.goodsList table tr th {
    padding: 10px 0;
    line-height: 1;
    color: #666a5b;
    background-color: #f2f2f2;
    border-bottom: 1px solid #b5b5b5;
}
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

.goodsList .selectArea {
    position: relative;
    padding: 7px 0;
    text-align: right;
    border-top: 2px solid #7b7b7b;
}
table {
    border-collapse: separate;
    text-indent: initial;
}

.goodsList table tr td.local {
    line-height: 1.4;
    word-break: keep-all;
    width: 330px;
}

.goodsList table tr td {
    padding: 12px 0;
    line-height: 1;
    text-align: center;
    color: #474747;
    border-bottom: 1px solid #e4e4e4;
}

.goodsList table tr td.title {
    width: auto;
    text-align: left;
}

.goodsList table tr td.title a span.company {
    display: block;
    height: auto;
    padding: 2px 0 6px !important;
    font-size: 13px;
    background: none !important;
    color: #0075ab;
}

.goodsList .title a span {
    position: relative;
    overflow: hidden;
    display: inline-block;
    height: 20px;
    padding-right: 1px;
    line-height: 20px;
    vertical-align: top;
    cursor: pointer;
}

.goodsList table tr td.title span.funcBtn {
    position: relative;
    display: inline-block;
}
.goodsList .title a span {
    position: relative;
    overflow: hidden;
    display: inline-block;
    height: 20px;
    padding-right: 1px;
    line-height: 20px;
    vertical-align: top;
    cursor: pointer;
}

#NormalInfo table tr td.title {
	margin-top : 100px;
    width: auto;
}
.goodsList table tr td.title a.applBtn {
    display: inline-block;
    width: auto;
    height: 16px;
    margin: 0;
    padding: 4px 15px 0 20px;
    font-size: 11px;
    letter-spacing: -1px;
    vertical-align: top;
    color: #888;
   }
.goodsList table tr td.title a {
    overflow: hidden;
    display: block;
    margin: 0 0 6px;
}
.goodsList .title a {
    text-decoration: none;
}
.funcBtn{
	height: 30px;
}
#quickView {
    width: 100%;
    margin: 0;
    padding: 0;
}
#quickView .previewInfo {
    overflow: hidden;
    padding: 20px;
}
#quickView .previewInfo .tableInfo {
    float: left;
    width: 57%;
}
#quickView .previewInfo .tableInfo table {
    table-layout: fixed;
    width: 100%;
    border-top: 1px solid #e0e0e0;
    border-left: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
}
.rightInfo{
	margin-top: 60px;
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
.card-tools{
	width: 100%;
	font-size: 20px;
}
.serchbox {
    display: flex;
    align-items: center;
}
.fontcolor{
	color:black !important;
}
.last{
	text-align: left;
}
.insert{
	margin-left: 85%;
	color: #777e8c !important;
	
}

th {
	text-align:center;
}

button {
	border:none!important;
}
</style>
<div class="body-sub-con">
				<h1 class="admin-h1">1:1 문의</h1>
			
				<div class="card-tools" style="display: flex; justify-content: space-between;">
                    <span></span>
<!-- 			<div class="serchbox"> -->
<!--                 <input class="search-input" placeholder="ID를 검색해주세요." type="text" name="memId" id="entNmInput" value="" style="margin-left: auto;"> -->
<!-- 				<a id="btnSearch" href="#" class="btn btn-sm btn-secondary search">검색</a> -->
<!--             </div> -->
				</div>
	<div id="NormalInfo" class="goodsList goodsJob">
	<div class="flex">
			<p class="listCount">
				<span></span> 총 <strong>${totalInquiry}</strong> 건
			</p>
	    <span class="listType ml-auto">
            <a href="/admin/adminBoardInquiry" id="registration">등록일순</a>
            <a href="/admin/adminBoardInquiry?sort=wait" id="wait">답변대기</a>
            <a href="/admin/adminBoardInquiry?sort=posible"  id="posible">답변완료</a>
        </span>	
	</div>
		<div class="one">
	<table class="table1" summary="일반 채용정보에 등록한 회사의 근무지, 업무내용, 회사명, 성별, 근무시간, 급여, 등록일 정보입니다.">
		<thead>
			<tr>
					<th style="width: 12%;">게시물ID</th>
					<th style="width: 20%;">게시물 제목</th>
					<th style="width: 11%;">게시물 내용</th>
					<th style="width: 11%;">작성자ID</th>
					<th style="width: 11%;">작성일시</th>
					<th style="width: 11%;">수정일시</th>
					<th style="width: 11%;">답변여부</th>
					<th style="width: auto;">비고</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="boardInquiryVO" items="${boardInquiryVOList}" varStatus="stat">

			<tr class="firstLine ">
				<td class="local first " scope="row">
					<div class="L_MyAd_maximumfitness"></div>
					${boardInquiryVO.boardId}
				</td>
				
				<td class="title">
				  ${boardInquiryVO.boardTitle}   
				</td>
				
				<c:choose>
					<c:when test="${boardInquiryVO.boardCntnt != null}">
						<td><a href="/boardInquiry/detail?boardId=${boardInquiryVO.boardId}">내용보기</a></td>
					</c:when>
				</c:choose>
				<td>
					${boardInquiryVO.memId}  
				</td>
				<td class="regDate last"><fmt:formatDate pattern="yyyy년  MM월 dd일"
											value="${boardInquiryVO.wirtDt}" /></td>
				<td class="regDate last"><fmt:formatDate pattern="yyyy년  MM월 dd일"
											value="${boardInquiryVO.boardUpdtDt}" /></td>
				
				<c:choose>
					<c:when test="${boardInquiryVO.boardAdminAnswer != null}">
						<td style="color: green;">답변완료</td>
							<td class="buttons"style="white-space: nowrap;">
								<button type="button" class="inpBtn btn bg-sig btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target=".modalrewrite">수정</button>
								<input type="hidden" class="boardIdd" value="${boardInquiryVO.boardId}">
								<button type="button" class="deleteGO btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#modalDelete">삭제</button>
							</td>
					</c:when>
					
					<c:when test="${boardInquiryVO.boardAdminAnswer == null}">
						<td>
							<a href="#" class="" style="color: red;" data-bs-toggle="modal" data-bs-target=".modalDialogScrollable">
								답변작성하기
							</a>
							<input type="hidden" class="boardIdd" value="${boardInquiryVO.boardId}">
						</td>
						<td></td>
					</c:when>
				</c:choose>
			</tr>

		</c:forEach>
		</tbody>
	</table>
</div>
		<div class="pagez">${info.getPagingArea()}</div>
</div>

<div class="card">
	    <!-- 모달 시작 -->
	    <div class="modal fade modalDialogScrollable" id="modal" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-dialog-scrollable">
	            <div class="modal-content">
	             <div class="modal-header">
                      <h5 class="modal-title"><strong>답변을 작성해주세요</strong></h5>
                     
                    </div>
	               <div class="modal-body">
					    <div class="warning-icon">
					        <textarea class="textareaa" rows="20" cols="60"></textarea>
					    </div>
					    
					</div>
	                <div class="modal-footer">
	                	<input type="hidden" name="boardId" class="hiddenInp" value="" >
	                    <button id="confirmDelete" type="button" class="btn btn-success dd"  data-bs-dismiss="modal">
	                        등록
	                    </button>
	                    <button id="closeModal" type="button" class="btn btn-secondary aa" data-bs-dismiss="modal">
	                        닫기
	                    </button>
	                    <button id="insertzz" type="button" class="btn btn-secondary ">
	                        자동완성
	                    </button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="card">
	    <!-- 모달 시작 -->
	    <div class="modal fade modalrewrite" id="modal" tabindex="-1" aria-hidden="true" style="display: none;">
	        <div class="modal-dialog modal-dialog-scrollable">
	            <div class="modal-content">
	             <div class="modal-header">
                      <h5 class="modal-title"><strong>수정할 답변을 작성해주세요</strong></h5>
                     
                    </div>
	               <div class="modal-body">
					    <div class="warning-icon">
					        <textarea class="textareaaa" rows="20" cols="60"></textarea>
					    </div>
					    
					</div>
	                <div class="modal-footer">
	                	<input type="hidden" name="boardId" class="hiddenInp" value="" >
	                    <button id="confirmDelete" type="button" class="btn btn-success ddd"  data-bs-dismiss="modal">
	                        등록
	                    </button>
	                    <button id="closeModal" type="button" class="btn btn-secondary aa" data-bs-dismiss="modal">
	                        닫기
	                    </button>
	                </div>
	            </div>
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
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- Template Main JS File -->
	<script src="/resources/js/main.js"></script>

	<script src="/resources/js/admin.js"></script>
<script type="text/javascript">


function handleAndAnother(sortType){
	 handleSort(sortType);
}



function handleSort(sortType) {
	console.log(sortType);

	
    if (sortType === 'wait') {
        window.location.href = '/admin/waitList?sort=wait';
    } else if (sortType === 'posible') {
        window.location.href = '/admin/posibleList?sort=posible';
    }else{
    	console.log(encodeURIComponent(sortType));
    	 window.location.href = '/admin/adminBoardInquiry';
    }
}

document.addEventListener('DOMContentLoaded', function() {
  
	$(".deleteGO").on('click',function(e){
		let boardId = e.target.previousElementSibling.value; 
		console.log("삭제",boardId);
		
		data={
			"boardId":boardId
		}
		 $.ajax({
			 url: "/admin/deleteBoardInquiry",
             contentType: "application/json;charset=utf-8",
             data: JSON.stringify(data),
             type: "post",
             dataType: "json",
             beforeSend: function(xhr) {
                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
             success: function(result) {
            	 
             }
		 });
	});
    
    $('#btnSearch').on('click', function(){
    	let keyword = $('.search-input').val();
    	
    	window.location.href = '/admin/adminBoardInquiry?keyword='+keyword;
    });
    
    $('.dd').on("click",function(e){
    	let boardAnswer = $('.textareaa').val();
    	let boardId = e.target.previousElementSibling.value;
    	
    	console.log("boardAnswer",boardAnswer);
    	console.log("boardId",boardId);
    	
    	data ={
    		"boardId":boardId,
    		"boardAdminAnswer":boardAnswer
    	}
    	
    	  $.ajax({
    		  url: "/admin/updateBoardInquiry",
              contentType: "application/json;charset=utf-8",
              data: JSON.stringify(data),
              type: "post",
              dataType: "json",
              beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(result) {
            	  window.location.href="/admin/adminBoardInquiry";
              }
    	  });
    });
    
    $('.ddd').on("click", function(e) {
        let boardAnswer = $('.textareaaa').val();
        let boardId = e.target.previousElementSibling.value;

        console.log("boardAnswer", boardAnswer);
        console.log("boardId", boardId);

        data = {
            "boardId": boardId,
            "boardAdminAnswer": boardAnswer
        }

        $.ajax({
            url: "/admin/updateBoardInquiry",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data),
            type: "post",
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(result) {
                Swal.fire({
                    title: '성공적으로 변경했습니다',
                    text: '',
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#0ABAB5',
                    cancelButtonColor: '#FF4040',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소',
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "/admin/adminBoardInquiry";
                    }
                });
            }
        });
    });
    });
$(document).on("click", $(".inpBtn"), function(e){
	console.log(e.target);
	let boardId =e.target.nextElementSibling.value;
	
	console.log("boardIdzzz",boardId);
	
	$(".hiddenInp").val(boardId);
	
});

$("#insertzz").on("click", function () {
	$(".textareaa").text("안녕하세요. 회원 가입 및 홈페이지 이용에 감사드립니다. 귀하의 관심에 감사드리며, 아래는 귀사의 홈페이지 관련 문의에 대한 답변입니다.\n" +
		    "검색 기능의 정확도 향상: 현재 우리의 주력은 검색 기능을 지속적으로 개선하고 있습니다. 사용자들의 피드백을 수집하고 분석하여 검색 알고리즘과 정확도를 개선하는 작업을 진행 중입니다. 더 나은 검색 결과를 제공하기 위한 업데이트는 계속되고 있으며, 사용자들이 원하는 정보에 빠르게 접근할 수 있도록 노력하고 있습니다.\n" +
		    "모바일 앱 지원 여부: 현재로서는 모바일 앱 제공에 대한 구체적인 계획은 없지만, 향후 서비스 향상을 위해 모바일 플랫폼에 대한 고려는 진행 중입니다. 사용자들에게 더 나은 이용 경험을 제공하기 위해 다양한 옵션을 고려하고 있으며, 모바일 앱 제공 여부에 대한 업데이트는 정기적으로 공지될 예정입니다.");
	});
</script>