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
.goodsList .selectArea {
    position: relative;
    padding: 7px 0;
}

.goodsList .selectArea .listType a.on {
    padding-left: 15px;
    color: #000;
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
}
table {
    border-collapse: separate;
    text-indent: initial;
    width: 1100px;
}

.goodsList table tr td.local {
    padding-left: 15px;
    padding-right: 10px;
    line-height: 1.4;
    text-align: left;
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
	margin-top:10px;
	display:flex!important;
	align-items:center;
	gap:10px;
}
.funcBtn a{
	margin-right:15px;
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
.pagez{
	margin-left: 280px;
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
tr th {
	text-align:center!important;
}
p {
margin-bottom:0;
}
</style>
	<div class="body-sub-con">
		<h1 class="admin-h1">채용공고</h1>
			<div class="card-tools" style="display: flex; justify-content: space-between; align-items:flex-end">
				<div class="serchbox ml-auto">
	                <input class="search-input" placeholder="회사명을 검색해주세요." type="text" name="entNm" id="entNmInput" value="" style="margin-left: auto;">
					<a id="btnSearch" href="#" class="btn btn-sm btn-secondary search">검색</a>
	            </div>
			</div>
	<div id="NormalInfo" class="goodsList goodsJob">
	<div class="flex">
		<h2>채용공고</h2>
		<p class="listCount ml-12">
			<strong>(${totalRecruit})</strong>
		</p>
		<p class="selectArea ml-auto">
	    <span class="listType">
	            <a href="/admin/adminEnterpriseAnnouncement"  id="registration" >등록일순</a>
	            <a href="/admin/adminEnterpriseAnnouncement?sort=deadline" id="deadline">마감임박</a>
	            <a href="/admin/adminEnterpriseAnnouncement?sort=money"  id="money" >연봉순</a>
	        </span>
		</p>
	</div>


	
		<div class="one">
		<table class="table1" cellspacing="0" summary="일반 채용정보에 등록한 회사의 근무지, 업무내용, 회사명, 성별, 근무시간, 급여, 등록일 정보입니다.">
			<colgroup>
				<col width="29%">
				<col width="29%">
				<col width="12%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
						<th class="local">근무지</th>
						<th class="title">회사명/공고제목</th>
						<th class="">경력조건</th>
						<th class="pay">연봉</th>
						<th class="regDate">등록일</th>
						<th class="regDate">비고</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="recruitVO" items="${recruitVOList}" varStatus="stat">
			<input type="hidden" value="${recruitVO.recruitOtt}">
			<input type="hidden" value="${recruitVO.recruitJob}">
				<tr class="firstLine ">
					<td class="local first " scope="row">
						<div class="L_MyAd_maximumfitness"></div>
						${recruitVO.recruitLocation}
					</td>
					<td class="title">
					    <a href="/enterprise/${recruitVO.entNo}/info" class="">
					    	<span class="company">${recruitVO.entNm}</span>
					    </a>	
					    	<span class="title">${recruitVO.recruitTitle}</span>
					    	<br>
					    	<span class="funcBtn">
								<a data-recruitOtt="${recruitVO.recruitOtt}" data-recruitJob="${recruitVO.recruitJob}" data-recruitWorkType="${recruitVO.recruitWorkType}" href="#" class="applBtn thumbView" id="JobFreeListTd126706447"><i class="fa-solid fa-plus"></i>  요약보기</a>
								<a href="/recruit/${recruitVO.recruitNo}/detail"  class="applBtn blankView"><i class="fa-solid fa-magnifying-glass"></i>  공고보기</a>
							</span>    
					</td>
					<td class="">${recruitVO.recruitCareer}</td>
					<td class="pay">
						<span class="number">${recruitVO.recruitSalary}</span></td>
					<td class="regDate last"><fmt:formatDate pattern="yyyy년  MM월 dd일"
												value="${recruitVO.recruitStdt}" />
					<br><br><span>${recruitVO.passedTime}</span></td>
					<td><button type="button" class="btn btn-sm btn-danger" data-recruitNo = "${recruitVO.recruitNo}">삭제</button></td>
				</tr>
	
				<tr class="summaryView" style="display:none;">
					<td colspan="5">
						<div id="quickView">
							<div class="previewInfo">
								<div class="tableInfo">
									<table cellpadding="0" cellspacing="0" border="0" summary="해당공고의 내용들을 간략하게 보여줍니다.">
										<tbody>
											<tr>
												<th>업/직종</th>
												<td><span></span></td>
											</tr>
											<tr>
												<th>근무지</th>
												<td><span>${recruitVO.recruitLocation}</span></td>
											</tr>
											<tr>
												<th>인원수</th>
												<td><span>${recruitVO.recruitCount}명</span></td>
											</tr>
											<tr>
												<th>구인파트</th>
												<td><span>${recruitVO.recruitPart}</span></td>
		
											</tr>
										</tbody>
									</table>
								</div>
								<div class="rightInfo">
									<ul>
										
										<li class="end">
											<span>※마감일</span>
											<fmt:formatDate pattern="yyyy년  MM월 dd일"
												value="${recruitVO.recruitEddt}" />
										</li>
									</ul>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
			<div class="pagez">${info.getPagingArea()}</div>
	</div>
	
</div>

<script src="/resources/js/func.js"></script>
<script type="text/javascript">

function handleAndAnother(sortType){
	 handleSort(sortType);
}



function handleSort(sortType) {
	console.log(sortType);

	
    if (sortType === 'deadline') {
        window.location.href = '/admin/adminEnterpriseAnnouncement?sort=deadline';
    } else if (sortType === 'money') {
        window.location.href = '/admin/adminEnterpriseAnnouncement?sort=money';
    }else{
    	console.log(encodeURIComponent(sortType));
    	 window.location.href = '/admin/adminEnterAnnouncement?sort=registration';
    }
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
    
    document.querySelectorAll('.btn-danger').forEach(button => {
    	button.addEventListener('click', function(event) {
    		const recruitNo = this.dataset.recruitno
    		
    		console.log(recruitNo);
    		const confirmation = confirm("정말 삭제하시겠습니까?");
    		if(confirmation){
    		var data = {
    				"recruitNo" : recruitNo
    		};
    		
    		$.ajax({
    			url: "/admin/deleteRecruitAjax",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(data), // JSON.stringify 오타 수정
                type: "post",
                dataType: "json",
                beforeSend: function(xhr){
                	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(result){
                	 alert("성공적으로 삭제했습니다")
                	 window.location.href = "/admin/adminEnterAnnouncement";
                }
    		});
    		}
    	});
    });
  
    
    $('#btnSearch').on('click', function(){
    	let keyword = $('.search-input').val();
    	
    	window.location.href = '/admin/adminEnterAnnouncement?keyword='+keyword;
    });
});

let sal = document.querySelectorAll(".number");

for(let i = 0; i < sal.length; i++){
	
	sal[i].innerText = formatNumber(sal[i].innerText) + "원";
	
}

</script>