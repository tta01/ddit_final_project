<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/resources/css/mypage.css"></link>

<style>
.cursor-pointer{
	cursor:pointer;
}
</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">계정</div>
		<ul>
			<li class="active"><a href="/memberAccount/profile">프로필 설정</a></li>
			<li><a href="/memberAccount/changePw">비밀번호 변경</a></li>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<li><a href="/memberAccount/consultantApply">상담사 신청하기</a></li>
			</sec:authorize>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">
				<div>
					<span id="profile-title">프로필</span> 
				</div>
				<div class="cursor-pointer">
<!-- 					<i class="fa-regular fa-circle-check pro-list" style="color: #6e7581; font-size: 16px;"></i> -->
					<span class="pro-aca pro-list">학력등록</span>
				</div>
				<div class="cursor-pointer">
<!-- 					<i class="fa-regular fa-circle-check pro-insert" style="color: #6e7581; font-size: 16px;"></i> -->
					<span class="pro-aca pro-insert">학력목록</span>
				</div>
			</div>
		</div>
			
		<div class="body-sub-con">
			<div class="sub-container">
				<form action="/memberAccount/mypagePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memId" value="<sec:authentication property="principal.username"/>">
					<div class="profile-box">
						<label for="profile" class="pro-img-label">
							<c:if test="${memberVO.memAfId==null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/images/default_profile.png">
							</c:if>
							<c:if test="${memberVO.memAfId!=null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/upload/${memberVO.memAfId}">
							</c:if>
		<!-- 					<i class="fa-solid fa-image-portrait" style="color: #c2c2c7; font-size: 48px;""></i> -->
						</label>
			            <input type="file" id="profile" name="uploadFile" class="pro-img-inner" value="프로필사진" />
					</div>
					<div>
						<div class="one-line">
							<p class="name-label required">이름</p>
			                <input type="text" name="memNm" value="${memberVO.memNm }" class="pro-input-text" placeholder="이름 입력해 주세요." required="required">
						</div>
		                
		                
						<div class="one-line">
			                <p class="name-label required">주소</p>
			                <div style="display:flex; ">
			                    <input class="pro-input-text" type="text" name="memPostno" id="postcode" value="${memberVO.memPostno}" placeholder="우편번호">
			                    <input class="btn btn-m" type="button" onclick="execDaumPostcode(this)" value="우편번호 찾기" style="margin-left: 10px;"><br>
			                </div>
			                <input class="pro-input-text" type="text" name="memAddr" id="address" value="${memberVO.memAddr}" placeholder="주소"><br>
			                <input class="pro-input-text" type="text" name="memAddr2" id="detailAddress" value="${memberVO.memAddr2}" placeholder="상세주소"><br/>
		                </div>
		                
						<div class="one-line">
			                <div class="birth-tell">
			                	<div class="mem-birth">
					                <p class="name-label required">생년월일</p>
					                <input type="date" name="memBirth" 
					                	value="<fmt:formatDate value="${memberVO.memBirth}" pattern="yyyy-MM-dd" />"
					                	class="pro-input-text" style="width: 240px; display:inline-block;">
								</div>
								<div class="mem-tell">
					                <p class="name-label">연락처</p>
					                <input type="text" name="memTel" class="input01 noSpecial mem-tell-input" 
					                	value="${memberVO.memTel}" placeholder="-(하이픈)을 제외한 번호 입력 ex)01011112222">
					           </div>
							</div>
						</div>
						
						<div class="one-line">
			                <p class="name-label">이메일</p>
			                <input type="text" name="memEmail" class="pro-input-text" 
			                	value="${memberVO.memEmail }" placeholder="이메일 주소 입력">
		                </div>
		                
						<div class="one-line">
			                <div class="pro-select-box">
			                	<div>
				                <p class="name-label">관심키워드</p>
				                	<!--
				                	012 
				                	IKW
				                	123
				                	 -->
					                <select  name="memIntWord" class="input01" >
					                	<c:forEach var="comDet" items="${comDetCode}">
					                		<c:if test="${fn:substring(comDet.comDetCd,0,3)=='IKW'}">
					                			<option value="${comDet.comDetCd}"
					                				<c:if test="${comDet.comDetCd==memberVO.memIntWord}">selected</c:if>
					                			>${comDet.comDetCdNm}</option>
					                		</c:if>
					                	</c:forEach>
					                </select>
			                	</div>
			                	<div>
				                <p class="name-label required pl-30">성별</p>
					                <div class="gen-line">
					                    <label>
					                        <input type="radio" name="memGen" value="0" <c:if test="${memberVO.memGen==0}">checked</c:if> />
					                        <span>남자</span>
					                    </label>
					                    <label>
					                        <input type="radio" name="memGen" value="1" <c:if test="${memberVO.memGen==1}">checked</c:if> />
					                        <span>여자</span>
					                    </label>
					                </div>
								</div>
								<div>
					                <p class="name-label">희망 직군을 선택해주세요</p>
					                <select name="memWishJobCate" id="comCd" class="input01">
										<option  value="" selected>직군을 선택해주세요</option>
										<!-- MWJ -->
										<c:forEach var="comDet" items="${comDetCode}">
											<c:if test="${fn:substring(comDet.comDetCd,0,3)=='MWJ'}">
					                			<option value="${comDet.comDetCd}"
					                				<c:if test="${comDet.comDetCd==memberVO.memWishJobCate}">selected</c:if>
					                			>${comDet.comDetCdNm}</option>
					                		</c:if>
					                	</c:forEach>
									</select>
								</div>
							</div>
						</div>
						
						<div class="one-line">
			                <div class="name-label">
			                    <span class="name-label required" required="required">닉네임</span>
			                    <span class="p-info">
			                        	닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다.
			                    </span>
			                </div>
			                <input type="text" name="memNcnm" class="input01" value="${memberVO.memNcnm}">
		                </div>
		                
						<div class="one-line">
							<div class="name-label">
			                    <span class="name-label required" required="required">한 줄 소개</span>
			                    <span class="p-info">
			                        	본인을 한 줄로 소개해주세요!
			                    </span>
			                </div>
			                <input type="text" value="${memberVO.memIntrcn}" name="memIntrcn" class="pro-memIntrcn input01">
		                </div>
					</div>
					
					
					<div class="pro-btn-box">
						<button type="submit" class="btn btn-m btn-write">프로필 저장</button>
					</div>  
					<sec:csrfInput/>
				</form>
			</div><!-- end subcon -->
			
		</div><!-- end body-sub-con -->
	</div>
</div>


<script type="text/javascript">
$(function(){
	
	
	
	// 등록한 학력 없을시 학력등록 버튼 클릭 시
	$(document).on('click','.pro-list',function(){
		
		$('.pro-list').addClass('selected');
		
		$('.pro-insert').removeClass('selected');
		
		$('.body-sub-con').html('');
		
		addAca();
		
	});
	
	
	// 학력목록 클릭시
	$(document).on('click','.pro-insert',function(){
		
		$('.pro-insert').addClass('selected');
		
		$('.pro-list').removeClass('selected');
		
		$('.sub-container').html('');
		
		
		$.ajax({
			url: '/academic/ajaxgetmyAcademic',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(rst){
                
				if(rst.length == 0){
					let cont = `
						<div class= "aca-non-con">
							<div class= "aca-non-inner-con" style="font-size: 32px;">
								등록 하신 학력이 없습니다.
							</div>
						</div>
					`;
					
					$('.body-sub-con').html(cont);
					
				}else{
				
				let cont =  '';
				
				$.each(rst, function(index, academicVO){
					
					let acdmcrAttnd = academicVO.acdmcrAttnd;
					let acdmcrEducation = academicVO.acdmcrEducation;
					let acdmcrDegree = academicVO.acdmcrDegree;
					
					let acdmcrYn = academicVO.acdmcrYn;
					
					console.log(academicVO);
	
					cont += `
					<div class="sub-container">
					<div class="big-con">
					<div class="aca-con">
						
						<div class="aca-title-con">
				    		<div class="aca-title">학력</div>
				    		<div>
				    			<i class="fa-regular fa-trash-can" style="color: #7c828d;"></i>
								<input type ="hidden" class="acdmcrNo" value="\${academicVO.acdmcrNo}">
							</div>
						</div>
						
						<div class="aca-inner-con">
							<div class="aca-in-zero">
								<div>
							        <label for="acdmcrNm">학교 이름</label>
							        <input type="text" class="acdmcrNm" name="acdmcrNm" value="\${academicVO.acdmcrNm}" required><br>
						        </div>
						        <div>
								    <label for="acdmcrAttnd">재학 여부</label>
							        <select class="acdmcrAttnd" name="acdmcrAttnd">`;
							        
							if(acdmcrAttnd === null || acdmcrAttnd === ''){
								cont += '<option value="" selected>재학여부를 선택해주세요.</option>';
							}else{
// 								cont += '<option value="">재학여부를 선택해주세요.</option>';
							}
							
							if(acdmcrAttnd == 0){
								cont += '<option value="0" selected>재학중</option>';
							}else{
								cont += '<option value="">재학여부를 선택해주세요.</option>';
							}
							
							if(acdmcrAttnd == 1){
								cont += '<option value="1" selected>졸업</option>';
							}else{
								cont += '<option value="1">졸업</option>';
							}
							if(acdmcrAttnd == 2){
								cont += '<option value="2" selected>중퇴</option>';
							}else{
								cont += '<option value="2">중퇴</option>';
							}
							if(acdmcrAttnd == 3){
								cont += '<option value="3" selected>졸업예정</option>';
							}else{
								cont += '<option value="3">졸업예정</option>';
							}
							if(acdmcrAttnd == 4){
								cont += '<option value="4" selected>휴학</option>';
							} else {
								cont += '<option value="4">휴학</option>';
							}
						
						cont+=	`</select><br>
						        </div>
							</div>
							<div class="aca-in-first">
								<div>
									<label for= "acdmcrEducation">학력</label>
									<select class="acdmcrEducation" name="acdmcrEducation">`;
									
								if(acdmcrEducation === null || acdmcrEducation === ''){
									cont +=	'<option value="" selected>학력을 선택해주세요.</option>';
								}else{
									cont +=	'<option value="">학력을 선택해주세요.</option>';
								}
								if(acdmcrEducation == 0){
									cont +=	'<option value="0" selected>고등학교 졸업</option>';
								}else{
									cont +=	'<option value="0">고등학교 졸업</option>';
								}
								if(acdmcrEducation == 1){
									cont +=	'<option value="1" selected>대학졸업(2,3년)</option>';
								}else{
									cont +=	'<option value="1">대학졸업(2,3년)</option>';
								}
								if(acdmcrEducation == 2){
									cont +=	'<option value="2" selected>대학졸업(4년제)</option>';
								}else{
									cont +=	'<option value="2">대학졸업(4년제)</option>';
								}
								if(acdmcrEducation == 2){
									cont +=	'<option value="3" selected>대학원졸업</option>';
								}else{
									cont +=	'<option value="3">대학원졸업</option>';
								}
									
						cont +=`	</select>
								</div>
								
								<div>
									<label for="acdmcrDegree">학위</label>
							        <select class="acdmcrDegree" name="acdmcrDegree">`;
							        
							   if(acdmcrDegree === null || acdmcrDegree === ''){
							   	    cont+= 	'<option value="" selected>학위를 선택해주세요.</option>';
							   }else{
									cont += '<option value="">학위를 선택해주세요.</option>';
							   }
							   if(acdmcrDegree === "전문학사" ){
								   cont += '<option value="전문학사" selected>전문학사</option>';
							   }else{
								   cont += '<option value="전문학사">전문학사</option>';
								   
							   }
							   if(acdmcrDegree === "학사" ){
								   cont += '<option value="학사" selected>학사</option>';
							   }else{
								   cont += '<option value="학사">학사</option>';
								   
							   }
							   if(acdmcrDegree === "석사" ){
								   cont += '<option value="석사" selected>석사</option>';
							   }else{
								   cont += '<option value="석사">석사</option>';
								   
							   }
							   if(acdmcrDegree === "박사" ){
								   cont += '<option value="박사" selected>박사</option>';
							   }else{
								   cont += '<option value="박사">박사</option>';
								   
							   }
							   if(acdmcrDegree === "석박사" ){
								   cont += '<option value="석박사" selected>석박사</option>';
							   }else{
								   cont += '<option value="석박사">석박사</option>';
							   }
							   
							cont+= `    </select><br>
								</div>
								<div>
									<label for="acdmcrMajor">전공</label>
							        <input type="text" class="acdmcrMajor" name="acdmcrMajor" value="\${academicVO.acdmcrMajor}" /><br>
								</div>
							</div>
							
							<div class="aca-in-second">
								<div>
						        	<label for="acdmcrEntranceDt">입학 일자</label>
						       		<input type="date" class="acdmcrEntranceDt" name="acdmcrEntranceDt" placeholder="YYYY-MM-DD"
						       			value="\${academicVO.acdmcrEntranceDt}"
						       		><br>
							     </div>
							     
								<div>
							        <label for="acdmcrPoint">학점:</label>
							        <input type="text" class="acdmcrPoint" name="acdmcrPoint" value="\${academicVO.acdmcrPoint}"><br>   
						        </div>
								<div>
							        <label for="acdmcrGrdtnDt">졸업 일자</label>
							        <input type="date" class="acdmcrGrdtnDt" name="acdmcrGrdtnDt" placeholder="YYYY-MM-DD"
							        	value="\${academicVO.acdmcrGrdtnDt}"
							        ><br>
								</div>
					        </div>
							
							<div class="aca-in-last">
						        <label for="education_usage" style="display: inline-block;">학력 사용 여부</label>
						        <span>`;
						        
						    if(acdmcrYn == 1){
						   	 	cont+= '<input type="checkbox" class="acdmcrYn" name="acdmcrYn" checked><br></span>';
						    }else{
						    	cont+= '<input type="checkbox" class="acdmcrYn" name="acdmcrYn"><br></span>';
						    }
					        
						    
					cont+= `</div>
					        
						</div><!-- end aca-inner-con -->
						
					   </div><!-- end aca-con -->
					   
					</div> 
					
				</div><!-- end big-con -->
				
				`;
				
				});
				
					console.log(cont);
					$('.body-sub-con').html(cont);
					 disableElements(); // 비활성화 함수 호출
				 
				
					// 저장 버튼이 없으면 추가
				    if ($('.pro-btn-box button').length === 0) {
				        let saveBtn = `
				            <div class="pro-btn-box">
				        		<input type="button" class="aca-up-btn btn btn-write" value="수정" />
				            </div>
				        `;
						$('.body-sub-con').append(saveBtn);
				    }
				
				 
				}// end else
                
             },//end success
             error: function(xhr, status, error){
                console.log('Error:', xhr, status, error);
             }
			
		});//end ajax
		
	});
	
	//수정버튼 클릭시 disable 걸어준 거 풀고 수정 완료 버튼 추가.
	$(document).on('click','.aca-up-btn',function(){
		notdisableElements();
		
		let contBtn = `
			<input type="button" class="aca-btn-success btn btn-write" value="수정완료" />
		`;
		
		$('.pro-btn-box').html(contBtn);
		
		//수정 완료 버튼 클릭시
		$(document).on('click','.aca-btn-success',function(){
			
			const memId = "${getCurrentLoginVO.memId }";
			
			let bigCons = $('.big-con');
			
	 		let academiCareerVOList = [];
			
			$.each(bigCons, function(index, bigCon){
				let acdmcrNo = $(bigCon).find('.acdmcrNo').val();
				let acdmcrNm = $(bigCon).find('.acdmcrNm').val();
				let acdmcrAttnd = $(bigCon).find('.acdmcrAttnd').val();
				let acdmcrDegree = $(bigCon).find('.acdmcrDegree').val();
				let acdmcrEducation = $(bigCon).find('.acdmcrEducation').val();
				let acdmcrMajor = $(bigCon).find('.acdmcrMajor').val();
				let acdmcrEntranceDt = $(bigCon).find('.acdmcrEntranceDt').val();
				let acdmcrPoint = $(bigCon).find('.acdmcrPoint').val();
				let acdmcrGrdtnDt = $(bigCon).find('.acdmcrGrdtnDt').val();
				let acdmcrYn = $(bigCon).find('.acdmcrYn').prop('checked') ? 1 : 0;
				
				
				let academiCareerVO = {
					'acdmcrNo' : acdmcrNo,
					'acdmcrNm' : acdmcrNm,
					'acdmcrAttnd' : acdmcrAttnd,
					'acdmcrDegree' : acdmcrDegree,
					'acdmcrEducation' : acdmcrEducation,
					'acdmcrMajor' : acdmcrMajor,
					'acdmcrEntranceDt' : acdmcrEntranceDt,
					'acdmcrPoint' : acdmcrPoint,
					'acdmcrGrdtnDt' : acdmcrGrdtnDt,
					'acdmcrYn' : acdmcrYn,
					'memId' : memId
				};
				
				console.log(academiCareerVO);
				
				academiCareerVOList.push(academiCareerVO);
				
			}); //end each문
			
			
			$.ajax({
				url: '/academic/ajaxupdatemyAcademic',
				contentType:"application/json;charset-utf-8",
				data: JSON.stringify(academiCareerVOList),
				type: 'post',
				dataType: 'json',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
	                
					alert("수정이 완료 되었습니다.");
					
					disableElements();
					
					let contBtn = `
						<input type="button" class="aca-up-btn btn btn-write" value="수정" />
					`;
					
					$('.pro-btn-box').html(contBtn);
	                
	             },
	             error: function(xhr, status, error){
	                console.log('Error:', xhr, status, error);
	             }
				
			});//end ajax
			
			
		});// end 수정완료버튼  .aca-btn-success
		
		
	});// end 수정버튼 .aca-up-btn
	
	
	//목록볼때 disable걸어주기.
	function disableElements() {
		  $('.acdmcrNm, .acdmcrMajor, .acdmcrDegree, .acdmcrEntranceDt, .acdmcrGrdtnDt, .acdmcrAttnd, .acdmcrPoint, .acdmcrYn, .acdmcrEducation')
		    .prop('disabled', true);
	}
	
	//목록볼때 disable풀기.
	function notdisableElements() {
		  $('.acdmcrNm, .acdmcrMajor, .acdmcrDegree, .acdmcrEntranceDt, .acdmcrGrdtnDt, .acdmcrAttnd, .acdmcrPoint, .acdmcrYn, .acdmcrEducation')
		    .prop('disabled', false);
	}
	
	
	//학력삭제
	$(document).on('click','.fa-trash-can',function(e){
		
		if(confirm("선택한 학력을 삭제하시겠습니까?")){
		
		$(this).closest('.big-con').remove();
		
		let acdmcrNo = e.target.nextElementSibling.value;
		
		console.log(acdmcrNo);
		
		let data = {
			"acdmcrNo" : acdmcrNo
		};
		
		 $.ajax({
	        	url: '/academic/ajaxdeleteAcademic',
	        	contentType: "application/json;charset=utf-8",
	        	dataType: 'json',
				type: 'post',
				data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(rst){
					alert("삭제가 완료 되었습니다.")
				},
				error:function(xnr,status,error){
					console.log('Error:', xhr, status, error);
				}
	        });//end ajax
		
	        let bigCon = $(document).find('.big-con');
			
			console.log(bigCon);
		
			if(bigCon.length === 0) {
		        // 등록된 학력이 없음을 사용자에게 알림
		        
		        $('.aca-up-btn').remove();
		        
		        let cont = `
					<div class= "aca-non-con">
						<div class= "aca-non-inner-con" style="font-size: 32px;">
							등록 하신 학력이 없습니다.
						</div>
					</div>
				`;
				
				$('.body-sub-con').html(cont);
		        
		    }
		
		}
		
	});
	
	//플러스 버튼 클릭시 추가
	$(document).on('click','.fa-plus',function(){
		addAca();
	});
	
	//휴지통 버튼 클릭시 삭제.
	$(document).on('click','.fa-minus',function(){
		$(this).closest('.big-con').remove();
		
	});
	
	// 학력 추가시키는 함수
	function addAca(){
		
		let cont =`
		<div class="sub-container">
			<div class="big-con">
			<div class="aca-con">
			
				<div class="aca-title-con">
		    		<div class="aca-title">학력 정보 입력</div>
		    		<div>
 						<i class="fa-solid fa-plus" style="color: #7e8186; margin-right: 8px;" ></i> 
 						<i class="fa-solid fa-minus" style="color: #898d94;"></i>
					</div>
				</div>
				
				<div class="aca-inner-con">
					<div class="aca-in-zero">
						<div>
					        <label for="acdmcrNm">학교 이름</label>
					        <input type="text" class="acdmcrNm" name="acdmcrNm" required><br>
				        </div>
				        <div>
						    <label for="acdmcrAttnd">재학 여부</label>
					        <select class="acdmcrAttnd" name="acdmcrAttnd">
					        	<option value="">재학여부를 선택해주세요.</option>
					            <option value="0">재학중</option>
					            <option value="1">졸업</option>
					            <option value="2">중퇴</option>
					            <option value="3">졸업예정</option>
					            <option value="4">휴학</option>
					        </select><br>
				        </div>
					</div>
					<div class="aca-in-first">
						<div>
							<label for= "education-level">학력</label>
							<select class="acdmcrEducation" name="acdmcrEducation">
								<option selected="selected" >학력을 선택해주세요.</option>
								<option value="0">고등학교 졸업</option>
								<option value="1">대학졸업(2,3년)</option>
								<option value="2">대학졸업(4년제)</option>
								<option value="3">대학원졸업</option>
							</select>
						</div>
						
						<div>
							<label for="acdmcrDegree">학위</label>
					        <select class="acdmcrDegree" name="acdmcrDegree">
					        	<option value="">학위를 선택해주세요.</option>
					        	<option value="전문학사">전문학사</option>
					            <option value="학사">학사</option>
					            <option value="석사">석사</option>
					            <option value="박사">박사</option>
					            <option value="석박사">석박사</option>
					        </select><br>
						</div>
						<div>
							<label for="acdmcrMajor">전공</label>
					        <input type="text" class="acdmcrMajor" name="acdmcrMajor"><br>
						</div>
					</div>
					
					<div class="aca-in-second">
						<div>
				        	<label for="acdmcrEntranceDt">입학 일자</label>
				       		<input type="date" class="acdmcrEntranceDt" name="acdmcrEntranceDt" placeholder="YYYY-MM-DD"><br>
					     </div>
					     
						<div>
					        <label for="acdmcrPoint">학점:</label>
					        <input type="text" class="acdmcrPoint" name="acdmcrPoint"><br>   
				        </div>
						<div>
					        <label for="acdmcrGrdtnDt">졸업 일자</label>	
					        <input type="date" class="acdmcrGrdtnDt" name="acdmcrGrdtnDt" placeholder="YYYY-MM-DD"><br>
						</div>
			        </div>
					
					<div class="aca-in-last">
				        <label for="education_usage" style="display: inline-block;">학력 사용 여부</label>
				        <span><input type="checkbox" class="acdmcrYn" name="acdmcrYn"><br></span>
			        </div>
			        
				</div><!-- end aca-inner-con -->
				
			</div><!-- end aca-con -->
			
		</div><!-- end big-con -->
	</div>
		`;
		
	    $('.body-sub-con').append(cont);
	    
		// 저장 버튼이 없으면 추가
        let saveBtn = `
	            <div class="pro-btn-box">
	            	<button type="button" class="btn btn-write" id="ACD-complete">자동완성</button>
	                <button type="button" class="btn btn-write" id="save-btn">저장</button>
	            </div>
	        `;
    	$('.pro-btn-box').remove();
    	$('.body-sub-con').append(saveBtn)
	    
		
	}
	
	
	// 학력정보입력 추가 후 저장 버튼 누를시 이벤트
	$(document).on('click', '#save-btn', function(){
		
		const memId = "${getCurrentLoginVO.memId }";
		
		let bigCons = $('.big-con');
		
 		let academiCareerVOList = [];
		
		// big-con div 하나 하나를 VO로 보면, 일단 big-con들을 다 모아둔다음 그 하나하나의 big-con에대해 반복
		// 반복을 한다음 한번에 반복에서, big-con(index번재)안의 값을 모두 다 가져온다음 academiCareerVO 객체에 넣어주고 for문이 한번 끝나면 그 VO를 data에 넣어줌 data를 이제 controller에 넘겨주고 controller에선 @Requestbody List<AcademiCareerVO> 로 받아주면 됨
		$.each(bigCons, function(index, bigCon){
			let acdmcrNm = $(bigCon).find('.acdmcrNm').val();
			let acdmcrAttnd = $(bigCon).find('.acdmcrAttnd').val();
			let acdmcrDegree = $(bigCon).find('.acdmcrDegree').val();
			let acdmcrEducation = $(bigCon).find('.acdmcrEducation').val();
			let acdmcrMajor = $(bigCon).find('.acdmcrMajor').val();
			let acdmcrEntranceDt = $(bigCon).find('.acdmcrEntranceDt').val();
			let acdmcrPoint = $(bigCon).find('.acdmcrPoint').val();
			let acdmcrGrdtnDt = $(bigCon).find('.acdmcrGrdtnDt').val();
			let acdmcrYn = $(bigCon).find('.acdmcrYn').prop('checked') ? 1 : 0;
			
			let academiCareerVO = {
				'acdmcrNm' : acdmcrNm,
				'acdmcrAttnd' : acdmcrAttnd,
				'acdmcrDegree' : acdmcrDegree,
				'acdmcrEducation' : acdmcrEducation,
				'acdmcrMajor' : acdmcrMajor,
				'acdmcrEntranceDt' : acdmcrEntranceDt,
				'acdmcrPoint' : acdmcrPoint,
				'acdmcrGrdtnDt' : acdmcrGrdtnDt,
				'acdmcrYn' : acdmcrYn,
				'memId' : memId
			};
			
			academiCareerVOList.push(academiCareerVO);
		});
		
		$.ajax({
			url: '/academic/ajaxinsertmyAcademic',
			contentType:"application/json;charset-utf-8",
			data: JSON.stringify(academiCareerVOList),
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(rst){
                
				alert("학력이 등록되었습니다.");
                
             },
             error: function(xhr, status, error){
                console.log('Error:', xhr, status, error);
             }
			
		});//end ajax
		
	});//end click function
	
	
	$("#profile").on("change",function(e){
		let files = e.target.files;
		console.log("files : " + files);
		let filesArr = Array.prototype.slice.call(files);
		//파일객체배열->파일객체(f)
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
	            alert("이미지 확장자만 가능합니다.");
	            $("#profile").val('');
	            return;
	        }
			
			let reader = new FileReader();
	        //e : reader가 이미지 객체를 읽는 이벤트
	        reader.onload = function(e){
	            //요소.append : 누적, 요소.html : 새로고침, 요소.innerHTML : J/S에서 새로고침
	            $(".pro-img-box").attr("src",e.target.result);
	        }
	        reader.readAsDataURL(f);
		});
	});//end profile change
	
	//프로필 다시 클릭시 프로필 보여주기.
	$(document).on('click','#profile-title',function(){
		
		$('.pro-list').removeClass('selected');
		
		$('.pro-insert').removeClass('selected');
		
		
		let cont = `
				<div class="sub-container">
				<form action="/member/mypagePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memId" value="<sec:authentication property="principal.username"/>">
					<div class="profile-box">
						<label for="profile" class="pro-img-label">
							<c:if test="${memberVO.memAfId==null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/images/default_profile.png">
							</c:if>
							<c:if test="${memberVO.memAfId!=null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/upload/${memberVO.memAfId}">
							</c:if>
		<!-- 					<i class="fa-solid fa-image-portrait" style="color: #c2c2c7; font-size: 48px;""></i> -->
						</label>
			            <input type="file" id="profile" name="uploadFile" class="pro-img-inner" value="프로필사진" />
					</div>
					<div>
						<div class="one-line">
							<p class="name-label required">이름</p>
			                <input type="text" name="memNm" value="${memberVO.memNm }" class="pro-input-text" placeholder="이름 입력해 주세요." required="required">
			            </div>

						<div class="one-line">
			                <p class="name-label required">주소</p>
			                <div style="display:flex; ">
			                    <input class="pro-input-text" type="text" name="memPostno" id="postcode" value="${memberVO.memPostno}" placeholder="우편번호">
			                    <input class="btn" type="button" onclick="execDaumPostcode(this)" value="우편번호 찾기" style="margin-left: 10px;"><br>
			                </div>
			                <input class="pro-input-text" type="text" name="memAddr" id="address" value="${memberVO.memAddr}" placeholder="주소"><br>
			                <input class="pro-input-text" type="text" name="memAddr2" id="detailAddress" value="${memberVO.memAddr2}" placeholder="상세주소"><br/>
		                </div>

						<div class="one-line">
			                <div class="birth-tell">
			                	<div class="mem-birth">
					                <p class="name-label required">생년월일</p>
					                <input type="date" name="memBirth" 
					                	value="<fmt:formatDate value="${memberVO.memBirth}" pattern="yyyy-MM-dd" />"
					                	class="pro-input-text" style="width: 240px; display:inline-block;">
								</div>
								<div class="mem-tell">
					                <p class="name-label">연락처</p>
					                <input type="text" name="memTel" class="input01 noSpecial mem-tell-input" 
					                	value="${memberVO.memTel}" placeholder="-(하이픈)을 제외한 번호 입력 ex)01011112222">
					           </div>
							</div>
						</div>

						<div class="one-line">
			                <p class="name-label">이메일</p>
			                <input type="text" name="memEmail" class="pro-input-text" 
			                	value="${memberVO.memEmail }" placeholder="이메일 주소 입력">
		                </div>

						<div class="one-line">
			                <div class="pro-select-box">
			                	<div>
				                <p class="name-label">관심키워드</p>
				                	<!--
				                	012 
				                	IKW
				                	123
				                	 -->
					                <select  name="memIntWord" class="input01" >
					                	<c:forEach var="comDet" items="${comDetCode}">
					                		<c:if test="${fn:substring(comDet.comDetCd,0,3)=='IKW'}">
					                			<option value="${comDet.comDetCd}"
					                				<c:if test="${comDet.comDetCd==memberVO.memIntWord}">selected</c:if>
					                			>${comDet.comDetCdNm}</option>
					                		</c:if>
					                	</c:forEach>
					                </select>
			                	</div>
			                	<div>
				                <p class="name-label required pl-30">성별</p>
				                	<div class="gen-line">
					                    <label>
					                        <input type="radio" name="memGen" value="0" <c:if test="${memberVO.memGen==0}">checked</c:if> />
					                        <span>남자</span>
					                    </label>
					                    <label>
					                        <input type="radio" name="memGen" value="1" <c:if test="${memberVO.memGen==1}">checked</c:if> />
					                        <span>여자</span>
					                    </label>
									</div>
								</div>
								<div>
					                <p class="name-label">희망 직군을 선택해주세요</p>
					                <select name="memWishJobCate" id="comCd" class="input01">
										<option  value="" selected>직군을 선택해주세요</option>
										<!-- MWJ -->
										<c:forEach var="comDet" items="${comDetCode}">
											<c:if test="${fn:substring(comDet.comDetCd,0,3)=='MWJ'}">
					                			<option value="${comDet.comDetCd}"
					                				<c:if test="${comDet.comDetCd==memberVO.memWishJobCate}">selected</c:if>
					                			>${comDet.comDetCdNm}</option>
					                		</c:if>
					                	</c:forEach>
									</select>
								</div>
							</div>
						</div>
						
						<div class="one-line">
			                <div class="name-label">
			                    <span class="name-label required" required="required">닉네임</span>
			                    <span class="p-info">
			                        	닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다.
			                    </span>
			                </div>
			                <input type="text" name="memNcnm" class="input01" value="${memberVO.memNcnm}">
		                </div>

						<div class="one-line">
							<div class="name-label">
			                    <span class="name-label required" required="required">한 줄 소개</span>
			                    <span class="p-info">
			                        	본인을 한 줄로 소개해주세요!
			                    </span>
			                </div>
			                <input type="text" value="${memberVO.memIntrcn}" name="memIntrcn" class="pro-memIntrcn input01">
		                </div>
					</div>
					<div class="pro-btn-box">
						<button type="submit" class="btn btn-write">프로필 저장</button>
					</div>  
					<sec:csrfInput/>
				</form>
			</div><!-- end subcon -->		
		`;
		
		$('.body-sub-con').html(cont);
		
	});//end profile-title click
	
	
});//end document function

//다음 우편번호 api
function execDaumPostcode(e) {
 new daum.Postcode({
     oncomplete: function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }

		console.dir(e)
		
		let postcode = e.previousElementSibling;
		let address = e.parentElement.nextElementSibling;
		let detailAddress = e.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
	
		console.log(postcode);
		console.log(address);
		console.log(detailAddress);
		
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         postcode.value = data.zonecode;
         address.value = addr;
         // 커서를 상세주소 필드로 이동한다.
         detailAddress.focus();
     }
 }).open();
}

	
	
	
	$(document).on("click", "#ACD-complete", function() {
		
		$('input[name=acdmcrNm]').attr('value',"한남대학교");
		$('select[name=acdmcrAttnd]').val("1");
		$('select[name=acdmcrEducation]').val("2");
		$('select[name=acdmcrDegree]').val("학사");
		$('input[name=acdmcrMajor]').attr('value',"컴퓨터공학");
		$('input[name=acdmcrEntranceDt]').attr('value',"2011-03-01");
		$('input[name=acdmcrPoint]').attr('value',"4.0");
		$('input[name=acdmcrGrdtnDt]').attr('value',"2016-12-31");
		$('input[name=acdmcrYn]').attr('checked',true);

	});


</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

