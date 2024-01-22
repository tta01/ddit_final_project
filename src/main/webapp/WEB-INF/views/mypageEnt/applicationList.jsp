<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">


<style>

.mypage-body-con {
   background-color: #fff;
   height: 800px;
   width:800px;
   margin:auto;
}

.body-sub-title {
   font-size: 24px;
   font-weight: bold;
   margin-bottom: 8px;
}

.title-hr {
   border: 1px solid #ccc;
   margin-bottom: 8px;
}

.recruit-li{
    font-size: 15px;
    font-weight: bold;
}

.empty-title{
   text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-top: 20%;
    color: tomato;
}

.highlight {
    color: #00c362; 
}

.not-search{
   display: flex;
    justify-content: flex-end;
}

.not-keyword {
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}

.not-search-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    padding:5px;
}

.not-keyword:focus {
    border: 1px solid green;
    outline: none;
}

.not-search-btn:hover {
   border: 1px solid green;
}

.not-keyword:hover {
    border: 1px solid green;
}

.date{
   border: 1px solid #c9c9c9;
}

.recruite-cen{
    margin: auto;
}

.rec-list{
   margin-top: 16px;
}

.span-list {
   padding: 0px 20px 0px 20px;
    display: grid;
    align-items: center;
    grid-template-columns: 1fr 1fr 1fr 1fr;
}

.rec-item {
   border: 1px solid #e5e6e9;
    border-radius: 12px;
}

.rec-part2 {
   color: #323438;
    line-height: 22px;
    font-size: 15px;
/*     font-weight: bold; */
    white-space: nowrap;
    margin: 16px 0 16px;
}

.select-form{
   border-color: gray;
    border-radius: 5px;
    width: 100px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    padding: 5px 5px;
}

.rec-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 6px;
    margin-right: 5px;
}

.rec-btn:hover{
   background-color: #00c362;
   color: white;
};

.ajax-rec-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 8px;
}

.ajax-rec-btn:hover{
   background-color: #00c362;
   color: white;
};

.appList {
   font-size: 14px;
   font-weight: bold;
   cursor: pointer;
   text-align: center;
}

.appList:hover {
   font-size: 18px;
   cursor: pointer;
}

.body-sub-con{
    height: 680px !important;
}

.not-search{
   display: flex;
    justify-content: flex-end;
}

.not-keyword {
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}

.not-search-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding:5px;
}

.not-keyword:focus {
    border: 1px solid green;
    outline: none;
}

.not-search-btn:hover {
   border: 1px solid green;
}

.not-keyword:hover {
    border: 1px solid green;
 }
 
 .app-btns {
 	display: flex;
 	justify-content: flex-end;
 }
 
.app-btn {
	display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 0 13px;
    height: 25px;
    transition: all 0.2s;
}

#modal-resume{
	padding: 50px 20px 50px 50px;
	height:800px!important;
	background:#fff!important;
	box-shadow:none;
}
.iziModal-wrap{
	height:720px!important;
}

.iziModal::after{
	
	background:#fff!important;
	box-shadow:none;
}

#modal-portfolioFree, #modal-portfolioBasic {
	padding: 30px 30px 30px 30px;
}

#modal-portfolioFree {
	height: 800px !important;
}

#modal-portfolioBasic {
	height: 800px !important;
}

.btn-sm {
	padding:5px 10px
}
</style>

<!-- 지원자 현황 페이지 -->
<div class="mypage-body-con">
   <div class="sub-title-area">
      <div class="body-sub-title">지원자 목록</div>
   </div>
      <div class="body-sub-con">
         <div class="recruite-cen">
         <div class="app-btns">
            <a href="/entApplicant/appRecruit" type="button" class="rec-btn btn btn-sm mb-9">목록</a>
            <button type="button" class="rec-btn btn btn-sm mb-9" id="excelDownBtn">EXCEL 다운로드</button>
            <input type="hidden" id="recruitNo" value="${applicationVO[0].recruitNo}">
         </div>
         
         <table class="table1">
            <colgroup>
               <col width="8%">
               <col width="25%">
               <col width="30%">
               <col width="12%">
               <col width="*">
            </colgroup>
            
            <thead>
               <tr>
                  <th>지원자번호</th>
                  <th>이력서</th>
                  <th>자기소개서</th>
                  <th>입사지원일</th>
                  <th>입사지원 상태</th>
               </tr>
            </thead>
            
         <tbody>
            <c:if test="${fn:length(applicationVO) == 0 }">
                   <tr><td colspan="5" > ※ 지원자가 없습니다 ※ </td></tr>
            </c:if>
<%--             <p>${applicationVO}</p> --%>
            <c:forEach var="appVO" items="${applicationVO}">
                  <tr>
                     <td>${appVO.rnum}</td>
					<td>
					    <button type="button" onclick="resumeView('${appVO.resumeNo}')" class="open-resume-modal app-btn resumebtn"
					            data-izimodal-close="" data-izimodal-transitionout="bounceOutDown">${appVO.resumeTitle}
					    </button>
					</td>

	                 <td>
	                 	<button type="button" onclick="protfolioView('${appVO.ptflNo}','${appVO.gubun}')" class="open-resume-modal app-btn protfoliobtn" 
	                 			data-izimodal-close="" data-izimodal-transitionout="bounceOutDown">${appVO.ptflTitle}
	                 	</button>
	                 </td>
	                 					
                     <td><fmt:formatDate value="${appVO.appApplyDt}" pattern="yyyy-MM-dd"/></td>
                     
                     <td>
                        <select name="appStateCd" class="select-form">
	                        <c:forEach var="comDetCdVO" items="${comDetCodeInfoVO}">
	                           <option value="${comDetCdVO.comDetCd}" <c:if test ="${comDetCdVO.comDetCd eq applicationVO[0].appStateCd}">selected="selected"</c:if> 
	                           >${comDetCdVO.comDetCdNm}</option>
	                        </c:forEach>
                    	</select>
                     
                     	<button type="submit" id="rec-save-btn" class="rec-btn" data-app-no="${appVO.appNo}">저장</button>
                     </td>
                  </tr>
            </c:forEach>
          	        
             </tbody>
          </table>

          <div class="pagez mt-30" style="">${data.getPagingArea7()}
      
      <div id="endList"></div>
      
      
   			</div>
		</div>
	</div>
</div>
      
	<!-- 이력서 모달 start -->
	<div id="modal-resume">
	   	<section>
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
	        
	    </section>
	</div>
	
	<!-- 이력서 모달 끝 -->
	
	
	<!-- 자소서 기본양식 모달 -->
	<div id="modal-portfolioBasic">
	   	<section>
	   	
	        <p class="bold p-20 mb-25">자기소개서</p>
			
	   	<div id="divBasic"></div>
		
	    </section>
	</div>
	<!-- 자소서 기본양식 모달 끝 -->
	

	<!-- 자소서 자유양식 모달 -->
	<div id="modal-portfolioFree">
	   	<section>
	        <p class="bold p-20 mb-25">자기소개서</p>
	        
			<div id="divFree"></div>
		
	    </section>
	</div>
	
	<!-- 자소서 자유양식모달 끝 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.js"></script>
<script type="text/javascript" src="/resources/js/func.js"></script>

<script type="text/javascript">


// 자소서 모달
function protfolioView(ptflNo,gubun) {
	
	console.log("자소서 ajax ptflNo : " + ptflNo + ", gubun : " + gubun);
	
          // 로직 추가
          if(gubun=="FREE"){// /appPortfolioFree
       		
          	 $.ajax({
          	        url: "/entApplicant/appPortfolioFree", 
          			contentType : "application/json; charset=utf-8",
          			data :  JSON.stringify({
          				ptflNo: ptflNo
          			}),
          	        type: "POST",
          	        dataType: "json",
	          	    beforeSend : function(xhr) {
	          			xhr.setRequestHeader(header, token);
	          		},
          	        success: function(res) {
          			
          	        	//res : List<PortfolioFreeVO>
          	        	console.log("res =>>>>> ",res);
          	        	
          	        	let ptflTitle = res[0].ptflTitle;
          	        	
          	        	let str = "";

          	        		str += "<div class='p-15 bold'>자기소개서 제목   <span style='font-weight:normal' class='ml-5 p-14'>" + ptflTitle + "</span></div>";
          	        	
          	        	$.each(res,function(idx,portfolioFreeVO){
          	        		
          	        		str += "<div class='ptfl-one-line mt-15'><p class='ptfl-tit'>"+portfolioFreeVO.ptflFreeq+"</p><pre class='ptfl-cntnt'>"+portfolioFreeVO.ptflFreea+"</pre></div>";
          	        		
          	        	});
          	        	
						$("#divFree").html(str);
          	        	
          				$("#modal-portfolioFree").iziModal('open');
          	
       	      },
               error: function(error) {
               	
                   // AJAX 요청이 실패한 경우의 처리
                   console.error("Error fetching data:", error);
               }
          	
          	}); // free ajax end
          	
          } else{            // /appPortfolioBasic
        	  
        	  $.ajax({
        	        url: "/entApplicant/appPortfolioBasic", 
        			contentType : "application/json; charset=utf-8",
        	        type: "POST",
        	        data :  JSON.stringify({
          				ptflNo: ptflNo
          			}),        	       
          			dataType: "json",
	          	    beforeSend : function(xhr) {
	          			xhr.setRequestHeader(header, token);
	          		},
        	        success: function(res) {
        			
        	        	console.log("res =>>>>> ",res);
        	        	
        	        	let str ="";
        	        	
        	        	str += "<div style='font-size:18px; margin-bottom: 20px;'>자기소개서 제목  : " + res.ptflTitle + "</div>";
        	        	str += "<div class='ptfl-one-line'><p class='ptfl-tit'>성장과정</p><pre class='ptfl-cntnt'>" + res.ptflGrowth + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>지원동기</p><pre class='ptfl-cntnt'>" + res.ptflMotive + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>성격 및 장단점</p><pre class='ptfl-cntnt'>" + res.ptflPersonality + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>관련 업무 경험 및 경력</p><pre class='ptfl-cntnt'>" + res.ptflJobExp + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>프로젝트 경험</p><pre class='ptfl-cntnt'>" + res.ptflProjExp + "</pre></div>";
        	            str += "<div class='ptfl-one-line'><p class='ptfl-tit'>입사 후 포부</p><pre class='ptfl-cntnt'>" + res.ptflAspirations + "</pre></div>";

        	        	
        				$("#divBasic").html(str);
        				
          			$("#modal-portfolioBasic").iziModal('open');
        	
     	      },
             error: function(error) {
             	
                 // AJAX 요청이 실패한 경우의 처리
                 console.error("Error fetching data:", error);
             }
        	
        	}); // basic ajax end

        }; // else end
	};	// function end
   		
// 이력서 모달
function resumeView(resumeNo) {
	
	let resumeView = document.querySelectorAll(".resumeView");
	
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
	
    console.log("여기까지 들어옴?");
    console.log("resumeNo : " , resumeNo);

    $.ajax({
		url : "/memberResume/ajaxMemberDetailResume",
		data :  JSON.stringify({
			resumeNo : resumeNo	
		}),
		type : "post",
		contentType : "application/json; charset=utf-8",
		dataType:"json",
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
   		success: function(res) {
   			
       // 가져온 이력서 내용을 모달 내용 부분에 삽입
       console.log("res ajax 갔다옴.: ",res);
       
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
		
		
		
		$("#modal-resume").iziModal('open');

		},
		

	    error: function(error) {
	        console.log('Ajax request failed. Status:', status, 'Error:', error);
	    }
}); //end ajax
    
	}; // end function
    


$(function(){
	
	//지원자 상태변경
   $(document).on("click","#rec-save-btn",function(){
   
      let appNo = $(this).data("appNo");
      console.log("appNo : " + appNo);
      let appStateCd = $(this).prev().val();
      console.log("appStateCd : " + appStateCd);
      
      let data = {
         "appNo":appNo,
         "appStateCd":appStateCd
      };
      
      console.log("data : ",data);
      
      $.ajax({
         url:"/entApplicant/appUpdate",
         contentType:"application/json; charset=utf-8",
         data:JSON.stringify(data),
         type:"post",
         dateType:'text',
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
           success: function(result) {
              
              console.log("result : "+result);
              
              if(result=="1"){
                 alert("변경이 완료되었습니다.");
              }
           }
      });
   });//end 지원자상태변경
   
   
 
   $(document).on('click','#excelDownBtn',function(){
      
      let recruitNo = $('#recruitNo').val();
      
      console.log("recruitNoㅇㅇㅇㅇ : " + recruitNo);
      
      location.href="/entApplicant/excell?recruitNo="+recruitNo;
      
   });
	


$("#modal-resume").iziModal({
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
    height:500,
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

$("#modal-portfolioBasic").iziModal({
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

$("#modal-portfolioFree").iziModal({
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


}); // function end

</script>