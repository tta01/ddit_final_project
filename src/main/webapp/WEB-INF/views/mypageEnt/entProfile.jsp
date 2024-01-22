<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/mypage.css"></link>

<style>


.pro-img-inner{
	display: none;
}
.profile-box{
	height: 160px;
	text-align: center;
}
.pro-img-box{
	width: 160px;
	height:160px;
 	object-fit: cover;
}
.pro-label{
	font-size: 14px;

}
.pro-input-text{
	height: 48px;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 12px 20px; 
}
.birth-tell{
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.mem-tell-input{
}
.pro-select-box{
    display: grid;
    grid-template-columns:1fr 1fr;
    align-items: center;

}
.pro-btn-box{
	margin-top: 24px;
    text-align: right;
}
.pro-memIntrcn{
}

.labelgroup{
	display: flex;
	justify-content: space-between;
	gap:7px;
	width:100%;
}

.pro-input-text {
	padding: 12px 12px;
	border-radius: 10px;
	border: 1px solid #ccc;
	width: 100%;
    margin-bottom: 10px;
}

.ent-pro-sel {
	display: flex;
    flex-direction: row;
    margin-right: 50%;
    margin-bottom: 20px;
}

.input_width{
	width:100%;
}

.input01 {
	padding: 10px 15px;
}
.pro-btn{
	font-size: 14px;
	display:inline-flex;
	justify-content:center;
	align-items:center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    height: 36px;
    cursor: pointer;
    padding: 0 13px;
}

.pro-btn:hover{
	opacity: 0.8; 
	background-color: #00c362;
	color: white;
}
.ent-profile {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 20px;
}

#privateBtn.active, #enterBtn.active {
    background-color: #00c362;
    color: white;
}
fieldset{
	display:flex;
}

fieldset label{
	gap:5px;
}

.labelnum {
	margin-top:15px;
}

</style>

<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">계정</div>
		<ul>
			<li class="active"><a href="/entAccount/entmypage">프로필 설정</a></li>
			<li><a href="/entAccount/changePw">비밀번호 변경</a></li>
			
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<li><a href="/memberAccount/consultantApply">상담사 신청하기</a></li>
			</sec:authorize>
		</ul>
	</div>
	
	<div class="mypage-body-con">
		
		<div class="sub-title-area flex">
			<div class="body-sub-title">개인 프로필</div>
			
			<button type="button" id="privateBtn" class="pro-btn ml-auto" >개인프로필</button>
			<button type="button" id="enterBtn" class="pro-btn ml-7" >기업프로필</button>
		</div>
			<div class="body-sub-con">
			
				<!-- 기업 : 개인 프로필 -->
				<form id="frm" action="/entAccount/updatePost" method="post" enctype="multipart/form-data" >
					<sec:csrfInput />
					
					<input type="hidden" name="memId" value="${memberVO.memId}">
					
					<div id="private-profile">
	
					<div class="profile-box">
						<label for="profile" class="pro-img-label">
							<c:if test="${memberVO.memAfId==null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/images/default_profile.png">
							</c:if>
							<c:if test="${memberVO.memAfId!=null}">
								<img class="pro-img-box" alt="프로필 사진" src="/resources/upload/${memberVO.memAfId}">
							</c:if>
						</label>
			            <input type="file" id="profile" name="uploadFile" class="pro-img-inner" />
					</div>
					
					<div class="labelgroup">
						<div class="labelnum" style="flex:1;">
							<p class="name-label required">이름</p>
							<input type="text" name="memNm" value="${memberVO.memNm}" class="pro-input-text input_width" />
						</div>
					</div>
					
					<p class="name-label required mt-15">주소</p>
	
						<div style="display: flex;">
							<input class="pro-input-text pro-input-text" type="text" name="memPostno" id="postcode" value="${memberVO.memPostno}" />
							<input class="btn" type="button" onclick="execDaumPostcode(this)" value="우편번호 찾기" style="margin-left: 10px;">
						</div>
		
						<input class="pro-input-text pro-input-text" type="text" name="memAddr" id="address" value="${memberVO.memAddr}" />
						<input class="pro-input-text pro-input-text" type="text" name="memAddr2" id="detailAddress" value="${memberVO.memAddr2}" />
			
						<div class="labelgroup">
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">생년월일</p>
								<input type="date" name="memBirth" value="<fmt:formatDate value="${memberVO.memBirth}" pattern="yyyy-MM-dd" />"
									class="pro-input-text input_width" />
							</div>
							
							<div class="labelnum" style="flex:1;">
								<p class="name-label">연락처</p>
								<input type="text" name="memTel" class="pro-input-text noSpecial input_width" value="${memberVO.memTel}" />
							</div>
						</div>
						
						<div class="labelnum" style="flex:1;">
							<p class="name-label mt-15">이메일</p>
							<input type="text" name="memEmail" class="pro-input-text input_width" value="${memberVO.memEmail}" />
						</div>
						
						<div class="pro-select-box" style="flex:1;">
						<div class="labelnum" >
							<div class="name-label">
								<span class="name-label required" required>닉네임</span>
								<span class="p-info"> 닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다. </span>
							</div>
							<p><input type="text" name="memNcnm" class="pro-input-text" value="${memberVO.memNcnm}" /></p>
						</div>
		
						<div class="labelnum">
			                <p class="name-label required">성별</p>
				                <fieldset>
				                    <label>
				                        <input type="radio" name="memGen" value="0" <c:if test="${memberVO.memGen==0}">checked</c:if> />
				                        <span>남자</span>
				                    </label>
				                    <label>
				                        <input type="radio" name="memGen" value="1" <c:if test="${memberVO.memGen==1}">checked</c:if> />
				                        <span>여자</span>
				                    </label>
				                </fieldset>
							</div>
						</div>
								
					<div class="labelgroup">
					    <div class="labelnum" style="flex:1;">
					        <p class="name-label required">직급선택</p>
					        <select name="memMgPosition" class="input01 input_width">
					            <c:forEach var="comDetCodeInfoVOList" items="${comDetCodeInfoVOList1}">
					                <option value="${comDetCodeInfoVOList.comDetCd}" <c:if test="${comDetCodeInfoVOList.comDetCd eq getCurrentLoginVO.memMgPosition}">selected</c:if>>${comDetCodeInfoVOList.comDetCdNm}</option>
					            </c:forEach>
					        </select>
					    </div>
					</div>
				
					<div class="pro-btn-box">
						<button type="submit" class="btn btn-write">프로필 저장</button>
					</div>
				</div>
				
	
		</form>
		</div>
	</div>
</div>



<script type="text/javascript">
$(function(){
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
	});

	$(document).on("change", "#profile2", function(e) {
		let files = e.target.files;
		console.log("files : " + files);
		
		let filesArr = Array.prototype.slice.call(files);
		//파일객체배열->파일객체(f)
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
	            alert("이미지 확장자만 가능합니다.");
	            $("#profile2").val('');
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
	});

	$(document).on("change", "#profile3", function(e) {
		let files = e.target.files;
		console.log("files : " + files);
		let filesArr = Array.prototype.slice.call(files);
		//파일객체배열->파일객체(f)
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
	            alert("이미지 확장자만 가능합니다.");
	            $("#profile3").val('');
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
	});
});

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
		
$(function(){
	
	$("#privateBtn").on("click",function(){
		console.log("개인프로필");
		
		let tit = document.querySelector(".body-sub-title");
		tit.innerText = "개인 프로필"
		
		$.ajax({
			url:"/entAccount/detail",
			type:"GET",
			dataType:"json",
			success:function(result){
				console.log("result : ", result);
				
				var htmlStr = `
					<div class="profile-box">
					<label for="profile2" class="pro-img-label">`;
						if(result.memAfId == null) {
							htmlStr +=` <img class="pro-img-box" alt="프로필 사진" src="/resources/images/default_profile.png">`;
						} else {
							htmlStr +=` <img class="pro-img-box" alt="프로필 사진" src="/resources/upload/\${result.memAfId}">`;
						}
					htmlStr +=` </label>
			            <input type="file" id="profile2" name="uploadFile" class="pro-img-inner" />
					</div>
					
					<div class="labelgroup">
						<div class="labelnum" style="flex:1;">
							<p class="name-label required">이름</p>
							<input type="text" name="memNm" value="\${result.memNm}" class="pro-input-text input_width" />
						</div>
					</div>
					
						<p class="name-label required mt-15">주소</p>

						<div style="display: flex;">
							<input class="pro-input-text pro-input-text" type="text" name="memPostno" id="postcode" value="${memberVO.memPostno}" />
							<input class="btn" type="button" onclick="execDaumPostcode(this)" value="우편번호 찾기" style="margin-left: 10px;">
						</div>

						<input class="pro-input-text pro-input-text" type="text" name="memAddr" id="address" value="${memberVO.memAddr}" />
						<input class="pro-input-text pro-input-text" type="text" name="memAddr2" id="detailAddress" value="${memberVO.memAddr2}" />

						<div class="labelgroup">
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">생년월일</p>
								<input type="date" class="pro-input-text input_width" name="memBirth" value="\${result.memBirth}" />
							</div>
							
							<div class="labelnum" style="flex:1;">
								<p class="name-label">연락처</p>
								<input type="text" name="memTel" class="pro-input-text noSpecial input_width" value="\${result.memTel}" />
							</div>
						</div>
						
						<div class="labelnum" style="flex:1;">
							<p class="name-label mt-15">이메일</p>
							<input type="text" name="memEmail" class="pro-input-text input_width" value="\${result.memEmail}" />
						</div>
						
						<div class="pro-select-box">
						<div class="labelnum" style="flex:1;">
							<div class="name-label">
								<span class="name-label required" required>닉네임</span>
								<span class="p-info"> 닉네임은 취업 Q&A 게시판에서 사용될 명칭입니다. </span>
							</div>
							<p><input type="text" name="memNcnm" class="pro-input-text" value="\${result.memNcnm}" /></p>
						</div>
		
						<div class="labelnum">
			                <p class="name-label required">성별</p>
				                <fieldset>
				                    <label>
				                        <input type="radio" name="memGen" value="0"`;
				                        if(result.memGen==0){
				                        	htmlStr += `checked`;
				                        }
				                        htmlStr +=`/>
				                        <span>남자</span>
				                    </label>
				                    
				                    <label>
				                        <input type="radio" name="memGen" value="1"`;
			                        	if(result.memGen==1){
				                        	htmlStr += `checked`;
				                        }
				              			htmlStr +=`/>
				                        <span>여자</span>
				                    </label>
				                </fieldset>
							</div>
						</div>
								
					<div class="labelgroup">
					    <div class="labelnum" style="flex:1;">
					        <p class="name-label required">직급선택</p>
					        <select name="memMgPosition" class="input01 input_width">`;
					        	result.comDetCodeInfoVOList.forEach(function(comDetCode){
					        		if(comDetCode.comDetCd == result.memMgPosition) {
										htmlStr+= `<option value="\${comDetCode.comDetCd}"selected>\${comDetCode.comDetCdNm}</option>`;
					        		} else {
					        			htmlStr+= `<option value="\${comDetCode.comDetCd}">\${comDetCode.comDetCdNm}</option>`;
					        		}
					        	});

								htmlStr+=`
					        </select>
					    </div>
					</div>	

					<div class="pro-btn-box">
						<button type="submit" id="savePrivatePro" class="btn btn-write">프로필 저장</button>
					</div>
					
				</div>
					`;		
					
					$("#private-profile").html(htmlStr);
			}, 
			error: function(xhr, status, error) {
	               // 오류 처리
	           	console.error("전송실패", status, error);
	        }
			});
		});
	
	$("#enterBtn").on("click", function() {
		console.log("기업프로필");
		
		let tit = document.querySelector(".body-sub-title");
		tit.innerText = "기업 프로필"
		
		$.ajax({
			url:"/entAccount/entDetail",
			type:"GET",
			dataType:"json",
			success:function(result){
				console.log("result : ", result);
				
				var htmlStr = `
				<input type="hidden" name="entNo" value="\${result.entNo}">

				<div class="profile-box">
					<label for="profile3" class="pro-img-label">`;
						if(result.entLogo == null) {
							htmlStr += `<img class="pro-img-box" alt="로고 사진" src="/resources/images/default_profile.png">`;
						} else {
							htmlStr += `<img class="pro-img-box" alt="로고 사진" src="/resources/upload/\${result.entLogo}">`;
						}
					htmlStr +=  ` </label>
					
					<input type="file" id="profile3" name="uploadFile" class="pro-img-inner input01" />
				</div> 
			     
				 	<div class="labelgroup">
						<div class="labelnum">
							<div class="flex align-base mb-7">
								<p class="name-label required mb-0">사업자등록번호</p>
								<span style="font-size: 14px"></span>
							</div>
								<input type="text" id="input-num" name="entNo" class="input01 noSpecial" value="\${result.entNo}" disabled />
						</div>
							
						<div class="labelnum">
							<p class="name-label required">기업명</p>
							<input type="text" id="input-num" name="entNm" class="input01" value="\${result.entNm}" disabled />
							</div>

						<div class="labelnum">
							<p class="name-label required">팩스번호</p>
							<input type="text" id="input-num" name="entFax" class="pro-input-text no noSpecial" value="\${result.entFax}" />
						</div>
					</div>

						<p class="name-label required mt-15">주소</p>

						<div style="display: flex;">
							<input class="pro-input-text pro-input-text" type="text" name="entPostno" id="postcode" value="\${result.entPostno}" />
							<input class="btn" type="button" onclick="execDaumPostcode(this)" value="우편번호 찾기" style="margin-left: 10px;">
						</div>

						<input class="pro-input-text pro-input-text" type="text" name="entAddr" id="address" value="\${result.entAddr}" />
						<input class="pro-input-text pro-input-text" type="text" name="entAddr2" id="detailAddress" value="\${result.entAddr2}" />
							

						<div class="labelgroup mt-15">
							<div style="width: 100%;">
								<p class="name-label">기업 소개</p>
								<textarea name="entIntrcn" style="height:250px" class="pro-input-text textarea01 input_width">\${result.entIntrcn}</textarea>
							</div>
						</div>

						<div class="labelgroup mt-15">
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">대표자명</p>
								<input type="text" name="entCeonm" class="pro-input-text input_width" value="\${result.entCeonm}" />
							</div>
							
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">기업 직원수</p>
								<input type="text" name="entEmpcnt" onkeyup="numberComma(this)"
									class="pro-input-text talign-right noSpecial input_width" value="\${result.entEmpcnt}" />
							</div>
						</div>

						<div class="labelgroup mt-15">
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">설립일자</p>
								<input type="date" class="pro-input-text input_width" name="entBday" value="\${result.entBday}" />
							</div>
							
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">기업 매출액</p>
								<input type="text" name="entSales" onkeyup="numberComma(this)"
									class="pro-input-text talign-right noSpecial input_width" value="\${result.entSales}" />
							</div>
						</div>
							
						<div class="labelgroup mt-15">
							<div class="labelnum" style="flex:1;">
								<p class="name-label">기업 사이트 주소</p>
								<input type="text" id="ent-site" name="entUrl" class="pro-input-text input_width" value="\${result.entUrl}" />
							</div>
						</div>			

						<div class="labelgroup">
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">기업 산업군</p>
								<select name="entSector" class="pro-input-text input_width" >
						`;
// 						$.each(result.content,function(idx,enterpriseVO){
// 							if(enterpriseVO.comCodeInfoVOList.comCd == enterpriseVO.entSector) {
// 							}
// 						});

						result.comCodeInfoVOList.forEach(function(comCode) {
							if (comCode.comCd == result.entSector) {
								htmlStr += `<option value="\${comCode.comCd}" selected>\${comCode.comCdNm}</option>`;
							} else {
								htmlStr += `<option value="\${comCode.comCd}">\${comCode.comCdNm}</option>`;
							}
						});

						htmlStr +=	`</select>
							</div>
							<div class="labelnum" style="flex:1;">
								<p class="name-label required">기업 관심키워드</p>
								<select name="entIntWord" class="input01 input_width" >
						`;

						result.comDetCodeInfoVOList.forEach(function(comDetCode) {
							if (comDetCode.comDetCd == result.entIntWord) {
								htmlStr+= `<option value="\${comDetCode.comDetCd}" selected>\${comDetCode.comDetCdNm}</option>`;
							} else {
								htmlStr+= `<option value="\${comDetCode.comDetCd}">\${comDetCode.comDetCdNm}</option>`;
							}

						});
						htmlStr +=`
								</select>
							</div>
						</div>

					<div class="pro-btn-box">
						<button type="submit" id="saveProfile" class="btn btn-write">프로필 저장</button>
					</div>
					
				</div>

				<sec:csrfInput />	
								          
				`;

			$("#private-profile").html(htmlStr);
		}, 
		error: function(xhr, status, error) {
               // 오류 처리
           	console.error("전송실패", status, error);
        }
		});
	});

    $(document).on("click","#saveProfile",function () {
        console.log("기업저장");

        $("#frm").attr("action", "/entAccount/entUpdatePost");
        $("#frm").submit();
	});

    $(document).on("click","#savePrivatePro",function () {
        console.log("개인저장");

        $("#frm").attr("action", "/entAccount/updatePost");
        $("#frm").submit();
	});

 // 개인, 기업 프로필 버튼 클릭시 해당 버튼에 색 설정
    $(document).ready(function () {
    	
        // 기본으로 '개인 프로필'에 색 설정
        $("#private-profile").show();
        $("#enter-profile").hide();
        $("#privateBtn").addClass("active");

        // Handle button clicks
        $("#privateBtn").on("click", function () {
            $(this).addClass("active");
            $("#enterBtn").removeClass("active");
        });

        $("#enterBtn").on("click", function () {
            $(this).addClass("active");
            $("#privateBtn").removeClass("active");
        });
    });




});



</script>
<!-- <script src="/resources/js/func.js"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
