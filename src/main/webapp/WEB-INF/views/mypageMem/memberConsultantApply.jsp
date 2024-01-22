<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>



<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">계정</div>
		<ul>
			<li><a href="/memberAccount/profile">프로필 설정</a></li>
			<li><a href="/memberAccount/changePw">비밀번호 변경</a></li>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<li class="active"><a href="/memberAccount/consultantApply">상담사 신청하기</a></li>
			</sec:authorize>
		</ul>
	</div>
<div class="mypage-body-con">
   <div class="sub-title-area">
      <div class="body-sub-title">
         상담사 지원하기
      </div>
   </div>
      
   <div class="body-sub-con">
      <div class="con-inner-body" >
         <div class="recruit-body mb-35">
            <div class="sub-my-title">
              	이력서
            </div>
            <div class="in-height recruit-con">
               <div class="recruit-in-con">
                  <div class="recruit-left">
                     <span>제출할 이력서를 선택해주세요.</span>
                  </div>
                  <div class="recruit-right">
                     <span class="recruit-date"></span>
                  </div>
               </div><!-- end  recruit-in-con-->   
            </div>
         </div><!-- end recruit-body -->
         
         
         <div class="self-body">
            <div class="sub-my-title">
               자기소개서
            </div>
            
            <div class="in-height poto-con">
               <div class="recruit-in-con">
                  <div class="recruit-left">
                     <span>제출할 자기소개서를 선택해주세요.</span>
                  </div>
                  <div class="recruit-right">
                     <span class="recruit-date"></span>
                  </div>
               </div><!-- end  recruit-in-con-->   
            </div>
         </div>
         <div class="btn-parent">   
            <button type="button" class=" btn-sm btn-write btn" id="con-btn" style="margin-right: 6px;">이력서 & 자소서 선택</button>
            <button type="button" class=" btn-sm btn-write btn" id="con-submit">제출</button>
         </div>
      </div><!-- end con-inner-body -->
   </div> <!-- end body-sub-con -->
</div> <!-- end mypage-body-con -->



 <div id="modal-custom">
<!--         <button data-izimodal-close="" class="icon-close"></button> -->
        <p class="modal-title">상담사 지원하기</p>
          <div class="modal-con">
          
             <div class="modal-recruit-in">
                <p class="modal-in-title">이력서 선택</p>
                <div class="modal-in-box" style="border: 1px solid #efefef;">
                 <c:forEach var="resumeVO" items="${resumeVOList}" varStatus="stat">
                      <input type="radio" id="option${stat.index + 1}" name="resumeNo" value="${resumeVO.resumeNo}">
                     <label for="option${stat.index + 1}">${resumeVO.resumeTitle}</label><br>
                 </c:forEach>
                </div>
             </div>
             
             <div class="modal-con-in">
                <p class="modal-in-title">자기소개서 선택</p>
                <div class="modal-in-box" style="border: 1px solid #efefef;">
                   <c:forEach var="portfolioVO" items="${portfolioVOList}" varStatus="stat">
                      <input type="radio" id="option${stat.index + 1}" name="ptflNo" value="${portfolioVO.ptflNo}">
                     <label for="option${stat.index + 1}">${portfolioVO.ptflTitle}</label><br>
                </c:forEach>
                </div>
             </div>
          </div><!-- end modal-con -->
      
        <div class="btn-parent">
           <button  class="btn-sm btn-write btn" id="modal-cek-btn" style="margin-right: 6px;">추가</button>
           <button  class="btn-sm btn-write btn" id="modal-cen-btn">취소</button>
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
      
      
      
      //추가버튼 클릭 후 모달 열기 
      $("#con-btn").on("click",function(){
         
         $('#modal-custom').iziModal('open');
         
         //모달추가버튼 클릭 후 && 이전에 할당된 클릭 이벤트 해제
         $('#modal-cek-btn').off("click").on("click", function(){
            
            let resumeNoval = $("input[name='resumeNo']:checked").val();
            
            let ptflNoval = $("input[name='ptflNo']:checked").val();
            
            let resumeNo = {"resumeNo" : resumeNoval};
            
            let ptflNo = {"ptflNo" : ptflNoval};
            
               $.ajax({
                  url : "/member/ajaxgetMyResume",
                  contentType:"application/json;charset-utf-8",
                  data:JSON.stringify(resumeNo),
                  type:"post",
                  dataType:"json",
                  beforeSend:function(xhr){
                     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                  },
                  success:function(rst){
                     
                     console.log('가져온 이력서 : ' ,rst);
                     console.log(rst.resumeTitle);
                     
                     let cont = `
                        <div class="recruit-in-con">
                           <div class="recruit-left">
                              <span>\${rst.resumeTitle}</span>
                              <input type="hidden" name="resumeNo" value="\${rst.resumeNo}" id="mychekresumeNo">
                           </div>
                           <div class="recruit-right">
                              <span class="recruit-date">2023/12/22</span>
                              <span><i class="fa-regular fa-trash-can resume-can-icon" style="color: #7c828d;"></i></span>
                           </div>
                        </div><!-- end  recruit-in-con-->   
                     `;
                     
                     $('.recruit-con').html(cont);
                     
                  },
                  error: function(xhr, status, error){
                     console.log('Error:', xhr, status, error);
                  }
                  
               });//end ajaxMyResume
               
               
               $.ajax({
                  url : "/member/ajaxgetMyportfolio",
                  contentType:"application/json;charset-utf-8",
                  data:JSON.stringify(ptflNo),
                  type:"post",
                  dataType:"json",
                  beforeSend:function(xhr){
                     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                  },
                  success:function(rst){
                     
                     console.log('가져온 자소서 제목 : ',rst);
                     console.log(rst.ptflTitle);
                     
                     // 날짜 포맷 변환
                      let date = new Date(rst.ptflWritingDt);
                      let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
                     
                     let cont = `
                        <div class="recruit-in-con">
                           <div class="recruit-left">
                              <span>\${rst.ptflTitle}</span>
                              <input type="hidden" name="ptflNo" value="\${rst.ptflNo}" id="mychekptflNo">
                           </div>
                           <div class="recruit-right">
                              <span class="recruit-date">\${formattedDate}</span>
                              <span><i class="fa-regular fa-trash-can ptfl-can-icon" style="color: #7c828d;"></i></span>
                           </div>
                        </div><!-- end  recruit-in-con-->   
                     `;
                     
                     
                     
                     $('.poto-con').html(cont);
                  },
                  error: function(xhr, status, error){
                     console.log('Error:', xhr, status, error);
                  }
                  
               });//end ajaxMyPortfolio
               
               //모달 닫기.
               $('#modal-custom').iziModal('close');
               
               //기존에 check 되어있던 radio버튼 초기화
               $("input[name='resumeNo']").prop('checked', false);
               $("input[name='ptflNo']").prop('checked', false);
                 
         });//end modal-cek-btn
         
         
         //모달 취소버튼 클릭 후 모달 닫기 && 이전에 할당된 클릭 이벤트 해제
         $("#modal-cen-btn").off("click").on("click", function(){
            
            $('#modal-custom').iziModal('close');
            
            //기존에 check 되어있던 radio버튼 초기화
            $("input[name='resumeNo']").prop('checked', false);
              $("input[name='ptflNo']").prop('checked', false);
              
         });//end modal-cen-btn
         
         
      });//end con-btn
      
      $(document).on('click', '.resume-can-icon', function(){
         
         let cont = `
               <div class="recruit-in-con">
                  <div class="recruit-left">
                     <span>제출할 이력서를 선택해주세요.</span>
                  </div>
                  <div class="recruit-right">
                     <span class="recruit-date"></span>
                  </div>
               </div><!-- end  recruit-in-con-->   
         `;
         
         $('.recruit-con').html(cont);
         
      });//end resume-cal-icon
      
      $(document).on('click', '.ptfl-can-icon', function(){
         
         let cont = `
            <div class="recruit-in-con">
               <div class="recruit-left">
                  <span>제출할 자기소개서를 선택해주세요.</span>
               </div>
               <div class="recruit-right">
                  <span class="recruit-date"></span>
               </div>
            </div><!-- end  recruit-in-con-->
         `;
         
         $('.poto-con').html(cont);
         
      });//end ptfl-cal-icon'
      
      $(document).on('click','#con-submit',function(){
    	  
    	  let resumeNoSend = $("#mychekresumeNo").val();
          
          let ptflNoSend = $("#mychekptflNo").val();
          
          console.log("resumeNoSend " + resumeNoSend);
          
          console.log("ptflNoSend " + ptflNoSend);
			
          if(!resumeNoSend && !ptflNoSend){
        	  
        	  alert("이력서와 자기소개서를 선택해주세요.");
          
          }else if(!resumeNoSend){
        	      alert("이력서를 선택해주세요.")
          }else if(!ptflNoSend){
				  alert("자기소개서를 선택해주세요.")
          }else{
        	  
        	  let data = {
        		  "resumeNo" : resumeNoSend,
        		  "ptflNo" : ptflNoSend
        	  }
        	  
        	  $.ajax({
        		  url:"/member/ajaxApplyCon",
        		  contentType:"application/json;charset=utf-8",
                  data:JSON.stringify(data),
                  type:"post",
                  dataType:"json",
                  beforeSend:function(xhr){
                     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                  },
                  success:function(rst){
                	  
                	  if(rst === 2){
                		  alert("상담사 신청이 완료되었습니다.\n 관리자 승인 후 상담 활동이 가능합니다.")
                	  }
                      
                  },
                  error: function(xhr, status, error){
                     console.log('Error:', xhr, status, error);
                  }
        		  
        	  });
          
          }
          
          
    	  
      });//end #con-submit
      
      
      

});//end read function



</script>