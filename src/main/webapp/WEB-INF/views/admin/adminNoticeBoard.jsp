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
    font-weight: bold;
    font-size: 19px;
    line-height: 1.2;
    letter-spacing: -0.1em;
    color: #000;
}
.goodsList p.listCount {
	margin-bottom:0;
} 
h2 {
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
    padding-left: 15px;
    padding-right: 10px;
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
.goodsList table tr td.title a.applBtn.scrap {
    background-position: -1300px -797px;
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
			<h1 class="admin-h1">공지사항</h1>
<!-- 			<div class="serchbox"> -->
<!--                 <input class="search-input" placeholder="제목을 검색해주세요." type="text" name="boardTitle" id="entNmInput" value="" style="margin-left: auto;"> -->
<!-- 				<a id="btnSearch" href="#" class="btn btn-sm btn-secondary search">검색</a> -->
<!--             </div> -->
			<div id="NormalInfo" class="goodsList goodsJob ">
			<div class="flex align-center mb-9 mt-7">
				<p class="listCount">
					총 <strong>${totalNotice}</strong> 건
				<div class="insert ml-auto">
				    <a href="/noticeBoard/create">작성하기</a><i class="fa-regular fa-file-lines"></i>
				</div>
			</div>
				<div class="one">
			<table class="table1" cellspacing="0" summary="일반 채용정보에 등록한 회사의 근무지, 업무내용, 회사명, 성별, 근무시간, 급여, 등록일 정보입니다.">
				<colgroup>
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
				</colgroup>
				<thead>
					<tr>
							<th>게시물ID</th>
							<th>게시물 제목</th>
							<th>게시물 내용</th>
							<th>작성일시</th>
							<th>수정일시</th>
							<th>비고</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="noticeBoardVO" items="${noticeBoardVOList}" varStatus="stat">
				<input type="hidden" value="${noticeBoardVO.boardId}">
				<input type="hidden" value="${noticeBoardVO.boardTitle}">
					<tr class="firstLine ">
						<td class="local first talign-center" scope="row">
							<div class="L_MyAd_maximumfitness"></div>
							${noticeBoardVO.boardId}
						</td>
						<td class="title">
						  ${noticeBoardVO.boardTitle}    
						</td>
						<c:choose>
							<c:when test="${noticeBoardVO.boardCntnt != null}">
								<td class="talign-center"><a href="/noticeBoard/detail?boardId=${noticeBoardVO.boardId}">내용보기</a></td>
							</c:when>
						</c:choose>
						<td class="regDate last talign-center"><fmt:formatDate pattern="yyyy년  MM월 dd일"
													value="${noticeBoardVO.boardWritingDt}" /></td>
						<td class="regDate last talign-center"><fmt:formatDate pattern="yyyy년  MM월 dd일"
													value="${noticeBoardVO.boardUpdtDt}" /></td>
						<td>
							<a href="/noticeBoard/detailUpdate?boardId=${noticeBoardVO.boardId}"><button type="button" class="detailGo btn bg-sig btn-sm btn-secondary btn-free" id="btn-free">수정</button></a>
							<input type="hidden" name="boardId" value="${noticeBoardVO.boardId}">
							<button type="button" class="detailGo btn btn-sm btn-danger btn-free" id="btn-free">삭제</button>
						</td>							
					</tr>
		
				</c:forEach>
				</tbody>
			</table>
		</div>
				<div class="pagez">${info.getPagingArea()}</div>
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
	
    	console.log(encodeURIComponent(sortType));
    	 window.location.href = '/admin/adminNoticeBoard';
    }


document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.thumbView').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            const summaryView = this.closest('.firstLine').nextElementSibling; // 요약 정보의 다음 요소(상세 정보) 가져오기

         // 현재 클릭된 요약보기만 보이게 처리
            if (summaryView.style.display === 'none') {
                document.querySelectorAll('.summaryView').forEach(view => {
                    view.style.display = 'none'; // 모든 요약보기 숨김
                });
                document.querySelectorAll('.border-highlight').forEach(border => {
                    border.classList.remove('border-highlight'); // 모든 요약보기 테두리 스타일 제거
                });
                
                summaryView.style.display = 'table-row'; // 클릭된 요약보기 보이게 설정
                this.closest('.firstLine').classList.add('border-highlight'); // 클릭된 요약보기에 테두리 스타일 추가
            } else {
                summaryView.style.display = 'none'; // 클릭된 요약보기 숨김 처리
                this.closest('.firstLine').classList.remove('border-highlight'); // 클릭된 요약보기의 테두리 스타일 제거
            }

            const a = $(this).data('recruitott');
            const b = $(this).data('recruitjob');

            console.log(a); // 데이터 확인용 콘솔 출력
            console.log(b); // 데이터 확인용 콘솔 출력

            var data = {
                "recruitOtt": a,
                "recruitJob": b
            };

            $.ajax({
            	 	url: "/admin/selectEnterAnnounAjax",
	                contentType: "application/json;charset=utf-8",
	                data: JSON.stringify(data), // JSON.stringify 오타 수정
	                type: "post",
	                dataType: "json",
	                beforeSend: function(xhr) {
	                	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
	                success: function(result) {
	                	const comCdNm = result.comCdNm;
	                    const comDetCdNm = result.comDetCodeInfoVO2.comDetCdNm;

	                    // 업/직종 span에 값 삽입
	                    $('th:contains("업/직종")').next().find('span').text(comCdNm + ' / ' + comDetCdNm);

	                }
            });
        
        });
});
    
    $('.btn-danger').on("click",function(e){
    	var boardId = e.target.previousElementSibling.value; 
        	
        	console.log("boardId",boardId);
            
        	Swal.fire({
                title: '공지사항을 삭제하시겠습니까?',
                text:  '삭제하면 복구할수 없습니다',
                icon: 'question',
                showCancelButton: true, // cancel버튼 보이기
                confirmButtonColor: '#0ABAB5',
                cancelButtonColor: '#FF4040',
                confirmButtonText: '확인',
                cancelButtonText: '취소',
            }).then(result => {
               // 확인
                if (result.isConfirmed) { 
                	 Swal.fire({
                         title: '삭제가 완료되었습니다',
                         icon: 'success',
                         confirmButtonColor: '#0ABAB5',
                         confirmButtonText: '확인'
                      }).then(result => {
                         let data = {
                               "boardId" : boardId,
                         };
                       		
                         $.ajax({
                             url:"/admin/deleteNotice",
                             contentType:"application/json;charset=utf-8",
                             data: JSON.stringify(data),
                             type:"post",
                             dataType:"json",
                             beforeSend:function(xhr){
                            	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                             },
                             success: function(result) {
                            	 console.log(result);
                            	 window.location.href = "/admin/adminBoardNotice";
                             }
               			});
                }); 
                
            }else if (result.isDismissed) {
                $("#createSchModal").modal("hide"); 
            }
          
        });	
        });
    
    $('#btnSearch').on('click', function(){
    	let keyword = $('.search-input').val();
    	
    	window.location.href = '/admin/adminNoticeBoard?keyword='+keyword;
    });
});
</script>