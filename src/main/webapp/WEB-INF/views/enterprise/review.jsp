<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">
<Style>
.display-none{
	display: none;
}
</Style>
<div class="bg-white">
   <div class="cen">
      
      <!-- 신고 대상자 아이디 -->
      <input type="hidden" value="" id="repSubId">
      <!-- 신고 게시판아이디 -->
      <input type="hidden" value="" id="repBoardId">
      <!-- 신고 사유 -->
<!--       <input type="hidden" value="" id="repReason"> -->
      
      
      
      
      <div class="ent-logo-box">
         <c:choose>
            <c:when test="${enterpriseVO.entLogo != null}">
               <img alt="" src="/resources/upload/${enterpriseVO.entLogo }">
            </c:when>
            <c:otherwise>
               <img alt="" src="/resources/images/ent-logo.png">            
            </c:otherwise>      
         </c:choose>
      </div>
      <p class="bold p-30 mt-20 mb-9">
         ${enterpriseVO.entNm }
      </p>
      <div class="about-company">
         <img alt="" src="/resources/images/star.svg">
         <p class="avg-rate">
            <fmt:formatNumber value="${enterpriseVO.entAvgRate }" pattern="0.0"/>
         </p>
         <div class="info">
            <span>
               <c:choose>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01000'}">개발</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01001'}">경영/비즈니스</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01002'}">마케팅/광고</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01003'}">디자인</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01004'}">영업</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01005'}">고객 서비스</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01006'}">미디어 콘텐츠</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01007'}">엔지니어링/설계</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01008'}">HR</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01009'}">게임/제작</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01010'}">금융</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01011'}">제조/생산</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01012'}">의료/제약/바이오</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01013'}">교육</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01014'}">물류/무역</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01015'}">법률/법집행</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01016'}">식/음료</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01017'}">건설/시설</c:when>
                  <c:when test="${enterpriseVO.entSector == 'MWJ01018'}">공공/복지</c:when>
                  <c:otherwise>
                     ${enterpriseVO.entSector}
                  </c:otherwise>
               </c:choose>
            </span>
            <span class="dot">·</span>
            <a class="link-to" href="http://${enterpriseVO.entUrl }">${enterpriseVO.entUrl }</a>
         </div>
      </div>
      
   </div>
   <div class="ent-menu-wrap">
      <div class="cen" style="padding:0">
         <ul class="ent-menu">
            <li><a href="/enterprise/${enterpriseVO.entNo }/info">기업 정보</a></li>
            <li class="active"><a href="/enterprise/${enterpriseVO.entNo }/review">리뷰 <span class="list-length">${totalReviewCount }</span></a></li>
            <li><a href="/enterprise/${enterpriseVO.entNo }/recruit">채용 공고 <span class="list-length">${fn:length(recruitVOList) }</span></a></li>
            
            <div class="ml-auto flex align-center
           		<sec:authorize access="hasRole('ROLE_ENTERPRISE')">
	           			display-none
           		</sec:authorize>
            ">
               <button class="btn btn-sm bg-sig" onclick="window.location.href='/compare/index?entNo=${enterpriseVO.entNo}'">
                  <i class="fa-solid fa-building" style="color: #ffffff; font-size:15px;"></i>
                  <span class="color-white bold p-15 ml-7">기업 비교</span>
               </button>
               <button class="btn btn-sm ml-7 p-15 bold
                     <c:if test='${fn:contains(interestEntVOList, enterpriseVO.entNo)}'>
                        active
                     </c:if>
               " id="interest-ent">
                  관심기업
               </button>
            </div>
         </ul>
      </div>
   </div>
   
</div>

<div class="cen">
   
   <div class="statistics">
      
      <p class="stat-tit">
         <span class="txt-sig">전체 리뷰</span> 통계 (${totalReviewCount}명)
      </p>
      
      <div class="stat-wrap">
         <div class="stat-left">
         
            <div class="rate-point">
               <p class="tot-avg-rate">
                  <fmt:formatNumber value="${enterpriseVO.entAvgRate }" pattern="0.0"/>
               </p>
               <div class="flex align-center justify-center ml-9">
                  <span class="star star-sm"> ★★★★★ 
                     <span style="width: 20%;">★★★★★</span> 
                  </span> 
               </div>
            </div>
            
            <div class="sep-rate">
               <div class="welfare">
                  <p class="sep-tit">복지 및 급여</p>
                  <div class="sep-rate-sec">
                     <div class="bar-rate">
                        <span class="bar-rate-val"></span>
                     </div>
                     <span class="sep-rate-point"><fmt:formatNumber value="${enterpriseVO.sumEntRevWelfare }" pattern="0.0"/></span>
                  </div>
               </div>
               <div class="welfare">
                  <p class="sep-tit">업무와 삶의 균형</p>
                  <div class="sep-rate-sec">
                     <div class="bar-rate">
                        <span class="bar-rate-val"></span>
                     </div>
                     <span class="sep-rate-point"><fmt:formatNumber value="${enterpriseVO.sumEntRevBalance }" pattern="0.0"/></span>
                  </div>
               </div>
               <div class="welfare">
                  <p class="sep-tit">사내문화</p>
                  <div class="sep-rate-sec">
                     <div class="bar-rate">
                        <span class="bar-rate-val"></span>
                     </div>
                     <span class="sep-rate-point"><fmt:formatNumber value="${enterpriseVO.sumEntRevCulture }" pattern="0.0"/></span>
                  </div>
               </div>
               <div class="welfare">
                  <p class="sep-tit">승진 기회 및 가능성</p>
                  <div class="sep-rate-sec">
                     <div class="bar-rate">
                        <span class="bar-rate-val"></span>
                     </div>
                     <span class="sep-rate-point"><fmt:formatNumber value="${enterpriseVO.sumEntRevChances }" pattern="0.0"/></span>
                  </div>
               </div>
               <div class="welfare">
                  <p class="sep-tit">경영진</p>
                  <div class="sep-rate-sec">
                     <div class="bar-rate">
                        <span class="bar-rate-val"></span>
                     </div>
                     <span class="sep-rate-point"><fmt:formatNumber value="${enterpriseVO.sumEntRevManager }" pattern="0.0"/></span>
                  </div>
               </div>
            </div>
         
         </div>
         <div class="stat-right">
            <div class=''>
               <div class="chart-box">
                  <div class="chart chart-recomm">
                     <span class="center"><fmt:parseNumber value="${enterpriseVO.sumEntRevRecomendYn *100 }" integerOnly="true" />%</span>
                  </div>
                  <p class="p-14 bold ml-12">기업 추천율</p>
               </div>
               <div class="chart-box">
                  <div class="chart chart-ceo">
                     <span class="center"><fmt:parseNumber value="${enterpriseVO.sumEntRevCeoView *100 }" integerOnly="true" />%</span>
                  </div>
                  <p class="p-14 bold ml-12">CEO 지지율</p>
               </div>
               <div class="chart-box">
                  <div class="chart chart-poten">
                     <span class="center"><fmt:parseNumber value="${enterpriseVO.sumEntRevPotential *50 }" integerOnly="true" />%</span>
                  </div>
                  <p class="p-14 bold ml-12">성장 가능성</p>
               </div>
            </div>
         </div>
      </div>
      
   </div>
   
   <div class="review-sector">
      
      <div class="review-sector-top">
         <form action="/boardEntReview/create">
            <div class="ml-auto" style="display: flex;">
                <p class="bold p-14 mb-20">모아보기</p>
                    <input type="hidden" name="entNo" value="${enterpriseVO.entNo}">
                    	<sec:authorize access="hasRole('ROLE_CONSULTANT')">
			                <button class="btn btn-sm bg-sig ml-auto" type="submit">
			                    <span class="color-white bold p-15 ml-7 ml-auto">리뷰 작성</span>
			                </button>
			            </sec:authorize>
                    	<sec:authorize access="hasRole('ROLE_MEMBER')">
			                <button class="btn btn-sm bg-sig ml-auto" type="submit">
			                    <span class="color-white bold p-15 ml-7 ml-auto">리뷰 작성</span>
			                </button>
			            </sec:authorize>
            </div>
         </form>
         <div class="review-filter">
            <form name="filter" action="/enterprise/${enterpriseVO.entNo}/review" method="get">
               <input type="hidden" name="scrollY" value="">
               <select name="sort" class="input01 input-sm">
                  <option <c:if test="${param.sort=='newest' }">selected</c:if> value="newest">최신 순</option>
                  <option <c:if test="${param.sort=='oldest' }">selected</c:if> value="oldest">오래된 순</option>
                  <option <c:if test="${param.sort=='pointDesc' }">selected</c:if> value="pointDesc">만족도 높은 순</option>
                  <option <c:if test="${param.sort=='pointAsc' }">selected</c:if> value="pointAsc">만족도 낮은 순</option>
               </select>
            </form>
         </div>
         
         <p class="p-13 mt-25">
            총 <span class="txt-sig">${totalReviewCount }</span>개의 기업리뷰
         </p>
      </div>
      
      <div class="review-list">
      <c:if test="${totalReviewCount == 0}">
         <p class="empty-tit">아직 리뷰가 없습니다. 첫 리뷰의 주인공이 되어보세요.</p>
      </c:if>
         <c:forEach var="entReviewVO" items="${entReviewVOList }">
            <div class="review-item">
               <div class="review-top">
                  <div class="review-profile">
                     <img alt="" src="/resources/images/review-profile.png">
                  </div>
                  <div class="flex align-center ml-15">
                     <p class="reviewer-info">${entReviewVO.comCodeVO.comCdNm }</p>
                     <div class="v-div-line"></div>
                     <p class="reviewer-info">
                        <c:if test="${entReviewVO.entRevWorkYn == 'Y' }">현직원</c:if>
                        <c:if test="${entReviewVO.entRevWorkYn == 'N' }">전직원</c:if>
                     </p>
                     <div class="v-div-line"></div>
                     <p class="reviewer-info">
                        ${entReviewVO.entRevWorkLoc }
                     </p>
                     <div class="v-div-line"></div>
                     <p class="reviewer-info">
                        <fmt:formatDate value="${entReviewVO.regDate }" pattern="yyyy.MM"/>
                     </p>
                  </div>
               </div>
               <div class="review-cont">
                  <div class="review-cont-left">
                     <div class="mt-20">
                        <input type="hidden" class="rev-avg-rate" value="${(entReviewVO.entRevChances + entReviewVO.entRevWelfare + entReviewVO.entRevBalance + entReviewVO.entRevCulture + entReviewVO.entRevManager) / 5 }">
                        <span class="star star-ssm review-star"> ★★★★★ 
                           <span style="width: 20%;">★★★★★</span> 
                        </span> 
                     </div>
                     <div class="mt-20">
                        <div class="welfare">
                           <p class="sep-tit">복지 및 급여</p>
                           <div class="sep-rate-sec">
                              <div class="bar-rate">
                                 <span class="bar-rate-val"></span>
                              </div>
                              <span class="sep-rate-point">${entReviewVO.entRevWelfare }</span>
                           </div>
                        </div>
                        <div class="welfare">
                           <p class="sep-tit">업무와 삶의 균형</p>
                           <div class="sep-rate-sec">
                              <div class="bar-rate">
                                 <span class="bar-rate-val"></span>
                              </div>
                              <span class="sep-rate-point">${entReviewVO.entRevBalance }</span>
                           </div>
                        </div>
                        <div class="welfare">
                           <p class="sep-tit">사내문화</p>
                           <div class="sep-rate-sec">
                              <div class="bar-rate">
                                 <span class="bar-rate-val"></span>
                              </div>
                              <span class="sep-rate-point">${entReviewVO.entRevCulture }</span>
                           </div>
                        </div>
                        <div class="welfare">
                           <p class="sep-tit">승진 기회 및 가능성</p>
                           <div class="sep-rate-sec">
                              <div class="bar-rate">
                                 <span class="bar-rate-val"></span>
                              </div>
                              <span class="sep-rate-point">${entReviewVO.entRevChances }</span>
                           </div>
                        </div>
                        <div class="welfare">
                           <p class="sep-tit">경영진</p>
                           <div class="sep-rate-sec">
                              <div class="bar-rate">
                                 <span class="bar-rate-val"></span>
                              </div>
                              <span class="sep-rate-point">${entReviewVO.entRevManager }</span>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="review-cont-right">
                     <p class="short-review">"${entReviewVO.entRevShortReview }"</p>
                     
                     <p class="txt-sig p-15 bold mt-20">장점</p>
                     <p class="rev-cont">
                        ${entReviewVO.entRevPros }
                     </p>
                     
                     <p class="txt-red p-15 bold mt-20">단점</p>
                     <p class="rev-cont">
                        ${entReviewVO.entRevCons }
                     </p>
                     
                     <p class="bold p-15 mt-20">경영진에게 바라는 점</p>
                     <p class="rev-cont">
                        ${entReviewVO.entRevWishes }
                     </p>
                     
                     <p class="p-13 mt-20 rev-cont">
                        이 기업은 1년 후 
                        <span class="bold">
                           <c:if test="${entReviewVO.entRevPotential == 2 }">성장할 </c:if>   
                           <c:if test="${entReviewVO.entRevPotential == 1 }">그대로일 </c:if>   
                           <c:if test="${entReviewVO.entRevPotential == 0 }">하락할 </c:if>
                        </span>
                        것이다.   
                     </p>
                     <p class="p-13 mt-5 rev-cont">
                        이 기업을 
                        <c:if test="${entReviewVO.entRevRecomendYn == 1 }">추천합니다.</c:if>
                        <c:if test="${entReviewVO.entRevRecomendYn == 0 }">추천하지 않습니다.</c:if>
                     </p>
                  </div>
               </div>
               <div class="rev-btn-area">
                  <button type="button" class="btn btn-sm btn-thumbs-up ml-auto
                     <c:if test="${(not empty getCurrentLoginVO.memId) and fn:contains(entReviewVO.likeVOList, getCurrentLoginVO.memId)}">active</c:if>
                     ">도움이 돼요 
                     <span class="bold ml-5">
                        ${fn:length(entReviewVO.likeVOList) }
                     </span>
                  </button>
                  <button type="button" class="btn btn-sm btn-report ml-7">신고하기</button>
                  <input type="hidden" name="entRevNo" value="${entReviewVO.entRevNo }">
                  <input type="hidden" name="repSubId" value="${entReviewVO.memId }">
               </div>
            </div>
         </c:forEach>
      </div>
      
      <div id="endList"></div>
      <!-- Modal structure -->
      <div id="modal-custom"> <!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
          <section>
             <button data-izimodal-close="" class="icon-close"></button>
            <p class="bold p-13">신고 사유를 선택해 주세요</p>
                <fieldset class="mt-20">
                   <div class="flex align-center mb-7">
                       <label class="flex align-center">
                           <input type="radio" name="repType" value="RCC01001" checked />
                           <span class="ml-7">스팸 및 홍보글</span>
                       </label>
                   </div>
                   <div class="flex align-center mb-7">
                       <label class="flex align-center">
                           <input type="radio" name="repType" value="RCC01002" />
                           <span class="ml-7">음란성이 포함된 글</span>
                       </label>
                   </div>
                   <div class="flex align-center mb-7">
                       <label class="flex align-center">
                           <input type="radio" name="repType" value="RCC01003" />
                           <span class="ml-7">욕설 및 혐오발언이 포함된 글</span>
                       </label>
                   </div>
                   <div class="flex align-center mb-7">
                       <label class="flex align-center">
                           <input type="radio" name="repType" value="RCC01004" />
                           <span class="ml-7">분란을 조장하는 글</span>
                       </label>
                   </div>
                   <div class="flex align-center mb-7">
                       <label class="flex align-center">
                           <input type="radio" name="repType" value="RCC01005" />
                           <span class="ml-7">사실과 무관한 거짓 글</span>
                       </label>
                   </div>
                </fieldset>
                <textarea id="repReason" class="input01 w-100 ph-cont resize-none inp-transparent" style="height: 150px;" placeholder="신고 내용을 입력해 주세요"></textarea>
                <div class="mt-20 talign-center">
                    <button class="btn btn-sm" data-izimodal-close="" data-izimodal-transitionout="comingOut">취소</button>
                    <button class="btn btn-sm bg-red color-white submit" data-izimodal-close="" data-izimodal-transitionout="bounceOutDown">신고</button>
                </div>
             </section>
      </div>
      <!-- Modal structure -->
      <div id="modal-alert"> <!-- data-iziModal-fullscreen="true"  data-iziModal-title="Welcome"  data-iziModal-subtitle="Subtitle"  data-iziModal-icon="icon-home" -->
          <section>
            <p class="alert bold"></p>
           </section>
      </div>
   </div>
   
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
<script type="text/javascript">
   let interestEntBtn = document.querySelector("#interest-ent");
   let entNo = "${enterpriseVO.entNo }";
   let memId = "${getCurrentLoginVO.memId}";
   console.log(interestEntBtn);
   console.log(entNo);
   console.log(memId);
   
   console.log("${interestRecruitVOList}");
   
   interestEntBtn.addEventListener("click", function(){
      if(${getCurrentLoginVO == null}){
         alert("로그인 한 회원만 관심기업을 등록할 수 있습니다.");
         return;
      };
      
      interestEntBtn.classList.toggle("active");
      
      data = {
         "entNo" : "${enterpriseVO.entNo }",
         "memId" : "${getCurrentLoginVO.memId}"
      }
      console.log(data);
      $.ajax({
         url : "/enterprise/ajaxInterestEnt",
         data : JSON.stringify(data),
         type : "post",
         contentType : "application/json;charset=utf-8",
         dataType:"json",
         beforeSend : function(xhr) {
            xhr.setRequestHeader(header, token);
         },
         success : function(res) {
            console.log("res", res);

            if(res == 1){
               $(".alert").text("관심기업에 추가되었습니다.");
               $("#modal-alert").iziModal('open');               
            }else{
               $(".alert").text("관심기업에서 제거되었습니다.");
               $("#modal-alert").iziModal('open');   
            }
            
         }
   
      })
      
   })


   function drawRate(){      
      let rate = document.querySelector(".tot-avg-rate");
//       console.log(rate.nextElementSibling.children[0].children[0]);
      let star = rate.nextElementSibling.children[0].children[0];
      star.style.width = rate.innerText * 20 +'%'; 
      
      let barRate = document.querySelectorAll(".sep-rate-point");
      
//       console.dir(barRate[0].previousElementSibling.children[0]);
      for(let i = 0; i < barRate.length; i++){
         let bar = barRate[i].previousElementSibling.children[0];
         bar.style.width = barRate[i].innerText * 20 + '%'
      }
      
      let revRate = document.querySelectorAll(".rev-avg-rate");
      for(let i = 0; i < revRate.length; i++){
         let star = revRate[i].nextElementSibling.children[0];
         star.style.width = revRate[i].value * 20 +'%'; 
      }
   }
   
   drawRate();

   
   const chartRecomm = document.querySelector('.chart-recomm');
   const chartCeo = document.querySelector('.chart-ceo');
   const chartPoten = document.querySelector('.chart-poten');

   let recVal = chartRecomm.children[0].innerText.replace(/[^0-9]/g,'');
   let ceoVal = chartCeo.children[0].innerText.replace(/[^0-9]/g,'');
   let potenVal = chartPoten.children[0].innerText.replace(/[^0-9]/g,'');
   console.log(recVal);
   console.log(ceoVal);
   console.log(potenVal);
   
   const makeChart = (percent, classname, color) => {
     let i = 1;
     let chartFn = setInterval(function() {
       if (i <= percent) { // < 에서 <=로 수정
         colorFn(i, classname, color);
         i++;
       } else {
         clearInterval(chartFn);
       }
     }, 10);
   }

   const colorFn = (i, classname, color) => { //js로 css 적용
     classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
   }

   const replay = () => {
     makeChart(recVal, chartRecomm, '#374D9A');
     makeChart(ceoVal, chartCeo, '#374D9A');
     makeChart(potenVal, chartPoten, '#374D9A');
   }

   makeChart(recVal, chartRecomm, '#374D9A');
   makeChart(ceoVal, chartCeo, '#374D9A');
   makeChart(potenVal, chartPoten, '#374D9A');
   
   /// 좋아요 버튼 기능
   $(document).on("click",".btn-thumbs-up", function(e) {
      
      if("${getCurrentLoginVO.memId}" == "" || "getCurrentLoginVO.memId" == null){
         alert("좋아요는 로그인 후 가능합니다.");
         return
      }
      
      let likeBtn = e.target;
      
      console.log(likeBtn);
      
      likeBtn.classList.toggle("active");
      let data = {
            entRevNo : likeBtn.nextElementSibling.nextElementSibling.value,
            memId : "${getCurrentLoginVO.memId }"
      };
      console.log(data);
      $.ajax({
         url:"/boardEntReview/ajaxLike",
         contentType : "application/json; charset=UTF-8",
         dataType:"json",
         data : JSON.stringify(data),
         type : "post",
         beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(res) {
            console.log(res);
            console.log(typeof likeBtn.innerHTML);
            if(likeBtn.classList.contains("active")){
               likeBtn.children[0].innerText = parseInt(likeBtn.children[0].innerText) + 1;            
            }else{
               likeBtn.children[0].innerText = parseInt(likeBtn.children[0].innerText) - 1;
            }
         }
      })
   })
   
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
   });
   
   // 신고대상자 아이디
   let repSubId = document.querySelector("#repSubId");
   // 신고 게시글 번호
   let repBoardId = document.querySelector("#repBoardId");
   // 신고접수자 아이디
   let reporterId = "${getCurrentLoginVO.memId}";
   // 신고사유
   let repReason = document.querySelector("#repReason");
   
   // 신고버튼 기능
   $(document).on("click",".btn-report", function(e) {

      event.preventDefault();
      console.log(reporterId == '');
      if(reporterId =='' || reporterId == null){
         alert("로그인 한 회원만 신고기능을 이용하실 수 있습니다.");
         return;
      }
            
      console.log(e.target.nextElementSibling);
      console.log(e.target.nextElementSibling.nextElementSibling);
      
      repSubId.value = e.target.nextElementSibling.nextElementSibling.value;
      repBoardId.value = e.target.nextElementSibling.value;
      
      $('#modal-custom').iziModal('open');
   })
   console.log(document.querySelectorAll("input[name=repType]"));
   $(document).on("click",".submit", function(e) {
      event.preventDefault();
      
//       repReason.value = ;
      // 신고유형 코드
      let repTypeCd = document.querySelector("input[name=repType]:checked").value;
      console.log(repSubId.value);
      console.log(repBoardId.value);
      console.log(repReason.value);
      console.log(reporterId);
      console.log(repTypeCd);
      
      data = {
         "repSubId" : repSubId.value,
         "repReason" : repReason.value,
         "repBoardId" : repBoardId.value,
         "reporterId" : reporterId,
         "repTypeCd" : repTypeCd
      }
      console.log(data);
      $.ajax({
         url : "/report/ajaxReport",
         contentType : "application/json; charset=UTF-8",
         data : JSON.stringify(data),
         dataType : "json",
         type : "post",
         beforeSend : function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
         },
         success : function(res) {
            console.log(res);

            if(res == 1){
               alert("신고가 정상적으로 접수되었습니다.");
               document.querySelectorAll("input[name=repType]")[0].checked = true;
               document.querySelector("#repReason").value = '';
            }else{
               alert("신고 접수에 실패하였습니다.");
               document.querySelectorAll("input[name=repType]")[0].checked = true;
               document.querySelector("#repReason").value = '';
            };

         }
      })
   })
   
   
   let selects = document.querySelector("select[name=sort]");
   console.log(selects);
   
   selects.addEventListener("change", function(e){
      let scrollY = document.querySelector("input[name=scrollY]");
      scrollY.value = window.pageYOffset -10;
      console.log(scrollY)
      console.log(e.target.value);
      console.log(document.forms["filter"]);
      document.forms["filter"].submit();
   })
   
   console.log(window.pageYOffset);
   
   window.scrollTo(0, ${scrollY});
   
   
   /////////////////// 무한스크롤 이게 맞나? /////////////////////
   // javascript
   const listEnd = document.querySelector("#endList"); // 관찰할 대상(요소)
   const option = {
       root: null,                  // 뷰포트 기준으로 타겟의 가시성 검사
       rootMargin: "0px 0px 0px 0px",   // 확장 또는 축소 x
       thredhold: 0,               // 타켓의 가시성이 0%일 때 옵저버 실행
   }

   // 현재 페이지
   let currentPage = 1;
   
   // ajax로 보낼 데이터 목록
   let data = {                                                                                                                                                                                                                                                
         "currentPage" : currentPage,                                                                                                                                                                                                                        
         "sortBy" : "${param.sort}",                                                                                                                                                                                                                         
         "entNo" : "${enterpriseVO.entNo}"                                                                                                                                                                                                                   
   }                                                                                                                                                                                                                                                           
   const onIntersect = (entries, observer) => {                                                                                                                                                                                                                
       // entries는 IntersectionObserverEntry 객체의 리스트로 배열 형식을 반환합니다.                                                                                                                                                                          
       entries.forEach(entry => {                                                                                                                                                                                                                              
           if(entry.isIntersecting){     
              // ajax로 응답받을 페이지++ (1페이지일때 밑으로 내리면 2페이지를 받기 위함)
              // 기본적으로 페이지네이션이랑 동일하되, 페이지네이션을 보여주지 않고 응답받은 결과를 밑에 생성
            currentPage++;                                                                                                                                                                                                                                    
            data = {                                                                                                                                                                                                                                        
                  "currentPage" : currentPage,                                                                                                                                                                                                            
                  "sortBy" : "${param.sort}",                                                                                                                                                                                                             
                  "entNo" : "${enterpriseVO.entNo}"                                                                                                                                                                                                       
            }    
            console.log(data);
              $.ajax({                                                                                                                                                                                                                                        
                url : "/enterprise/${enterpriseVO.entNo}/ajaxReview",                                                                                                                                                                                       
                contentType : "application/json; charset=UTF-8",                                                                                                                                                                                            
                data : JSON.stringify(data),                                                                                                                                                                                                                
                dataType : "json",                                                                                                                                                                                                                          
                type : "post",                                                                                                                                                                                                                              
                beforeSend : function(xhr) {                                                                                                                                                                                                                
                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");                                                                                                                                                                          
                },                                                                                                                                                                                                                                          
                success : function(res) {                                                                                                                                                                                                                   
                   console.log(res);                                                                                                                                                                                                                       
                                      
                   // ajax로 가져온 결과가 없으면 무한스크롤 종료
                   if(res.length < 1){                                                                                                                                                                                                                     
                      observer.unobserve(listEnd);                                                                                                                                                                                                        
                      return;                                                                                                                                                                                                                             
                   }                                                                                                                                                                                                                                       
                     const reviewList = document.querySelector(".review-list");                                                                                                                                                                              
                            
                     // 날짜가 7월이면 07 이런식으로 표현하기 위함
                     function CF_leftPad(value){
                        if (Number(value) >= 10) {
                           return value;
                        }
                        return "0" + value;
                     }
                     for(let i = 0; i < res.length; i++){    
                        let str = "";
                      str +=   '<div class="review-item">  ';
                      str += ''+res[i].entRevNo+'';
                     str +=   '   <div class="review-top"> ';
                     str +=   '      <div class="review-profile">';
                     str +=   '         <img alt="" src="/resources/images/review-profile.png">';
                     str +=   '      </div>';
                     str +=   '      <div class="flex align-center ml-15">';
                     str +=   '         <p class="reviewer-info">'+res[i].comCodeVO.comCdNm+'</p>';
                     str +=   '         <div class="v-div-line"></div>';
                     str +=   '         <p class="reviewer-info">';
                     if(res[i].entRevWorkYn == 'Y'){
                        str +=   '현직원';                        
                     }else{
                        str +=   '전직원';                        
                     }
                     str +=   '         </p>';
                     str +=   '         <div class="v-div-line"></div>';
                     str +=   '         <p class="reviewer-info">';
                     str +=   '            '+res[i].entRevWorkLoc+'';
                     str +=   '         </p>';
                     str +=   '         <div class="v-div-line"></div>';
                     str +=   '         <p class="reviewer-info">';
                     let date = new Date(res[i].regDate);
                     let year = date.getFullYear();
                     let month = CF_leftPad(date.getMonth() + 1);
                     str += year+'.'+month;
                     str +=   '         </p>';
                     str +=   '      </div>';
                     str +=   '   </div>';
                     str +=   '   <div class="review-cont">';
                     str +=   '      <div class="review-cont-left">';
                     str +=   '         <div class="mt-20">';
                     str +=   '            <input type="hidden" class="rev-avg-rate" value="'+(parseInt(res[i].entRevBalance)+parseInt(res[i].entRevChances)+parseInt(res[i].entRevCulture)+parseInt(res[i].entRevWelfare)+parseInt(res[i].entRevManager))/5+'">';
                     str +=   '            <span class="star star-ssm review-star"> ★★★★★                                                                                                                                                         ';
                     str +=   '               <span style="width: 20%;">★★★★★</span>';
                     str +=   '            </span>';
                     str +=   '         </div>';
                     str +=   '         <div class="mt-20">';
                     str +=   '            <div class="welfare">';
                     str +=   '               <p class="sep-tit">복지 및 급여</p>';
                     str +=   '               <div class="sep-rate-sec">';
                     str +=   '                  <div class="bar-rate">';
                     str +=   '                     <span class="bar-rate-val"></span>';
                     str +=   '                  </div>';
                     str +=   '                  <span class="sep-rate-point">'+res[i].entRevWelfare +'</span>';
                     str +=   '               </div>';
                     str +=   '            </div>';
                     str +=   '            <div class="welfare">';
                     str +=   '               <p class="sep-tit">업무와 삶의 균형</p>';
                     str +=   '               <div class="sep-rate-sec">';
                     str +=   '                  <div class="bar-rate">';
                     str +=   '                     <span class="bar-rate-val"></span>';
                     str +=   '                  </div>';
                     str +=   '                  <span class="sep-rate-point">'+res[i].entRevBalance+'</span>';
                     str +=   '               </div>';
                     str +=   '            </div>';
                     str +=   '            <div class="welfare">';
                     str +=   '               <p class="sep-tit">사내문화</p>';
                     str +=   '               <div class="sep-rate-sec">';
                     str +=   '                  <div class="bar-rate">                                                                                                                                                                              ';
                     str +=   '                     <span class="bar-rate-val"></span>                                                                                                                                                              ';
                     str +=   '                  </div>                                                                                                                                                                                              ';
                     str +=   '                  <span class="sep-rate-point">'+res[i].entRevCulture+'</span>                                                                                                                                   ';
                     str +=   '               </div>                                                                                                                                                                                                  ';
                     str +=   '            </div>                                                                                                                                                                                                      ';
                     str +=   '            <div class="welfare">                                                                                                                                                                                       ';
                     str +=   '               <p class="sep-tit">승진 기회 및 가능성</p>                                                                                                                                                              ';
                     str +=   '               <div class="sep-rate-sec">                                                                                                                                                                              ';
                     str +=   '                  <div class="bar-rate">                                                                                                                                                                              ';
                     str +=   '                     <span class="bar-rate-val"></span>                                                                                                                                                              ';
                     str +=   '                  </div>                                                                                                                                                                                              ';
                     str +=   '                  <span class="sep-rate-point">'+res[i].entRevChances +'</span>                                                                                                                                   ';
                     str +=   '               </div>                                                                                                                                                                                                  ';
                     str +=   '            </div>                                                                                                                                                                                                      ';
                     str +=   '            <div class="welfare">                                                                                                                                                                                       ';
                     str +=   '               <p class="sep-tit">경영진</p>                                                                                                                                                                           ';
                     str +=   '               <div class="sep-rate-sec">                                                                                                                                                                              ';
                     str +=   '                  <div class="bar-rate">                                                                                                                                                                              ';
                     str +=   '                     <span class="bar-rate-val"></span>                                                                                                                                                              ';
                     str +=   '                  </div>                                                                                                                                                                                              ';
                     str +=   '                  <span class="sep-rate-point">'+res[i].entRevManager +'</span>                                                                                                                                   ';
                     str +=   '               </div>                                                                                                                                                                                                  ';
                     str +=   '            </div>                                                                                                                                                                                                      ';
                     str +=   '         </div>                                                                                                                                                                                                          ';
                     str +=   '      </div>';
                     str +=   '      <div class="review-cont-right">';
                     str +=   '         <p class="short-review">"'+res[i].entRevShortReview +'"</p>';
                     str +=   '      ';
                     str +=   '         <p class="txt-sig p-15 bold mt-20">장점</p>';
                     str +=   '         <p class="rev-cont">';
                     str +=   '            '+res[i].entRevPros +'';
                     str +=   '         </p>';
                     str +=   '';
                     str +=   '         <p class="txt-red p-15 bold mt-20">단점</p>';
                     str +=   '         <p class="rev-cont">';
                     str +=   '            '+res[i].entRevCons +'';
                     str +=   '         </p>';
                     str +=   '';
                     str +=   '         <p class="bold p-15 mt-20">경영진에게 바라는 점</p>';
                     str +=   '         <p class="rev-cont">';
                     str +=   '            '+res[i].entRevWishes +'';
                     str +=   '         </p>';
                     str +=   '         <p class="p-13 mt-20 rev-cont">';
                     str +=   '            이 기업은 1년 후 ';
                     str +=   '            <span class="bold">';
                     if(res[i].entRevPotential == '2'){
                        str += '성장할';
                     }else if(res[i].entRevPotential == '1'){
                        str += '그대로일';
                     }else{
                        str += '하락할';
                     }
                     str +=   '            </span>';
                     str +=   '            것이다.';
                     str +=   '         </p>';
                     str +=   '         <p class="p-13 mt-5 rev-cont">';
                     str +=   '            이 기업을 ';
                     if(res[i].entRevRecomendYn == '1'){
                        str += '추천합니다.';
                     }else{
                        str += '추천하지 않습니다.';
                     }
                     str +=   '         </p>';
                     str +=   '      </div>';
                     str +=   '   </div>';
                     str +=   '   <div class="rev-btn-area">';
                     str +=   '      <button type="button" class="btn btn-sm btn-thumbs-up ml-auto ';
                     res[i].likeVOList.forEach((cur, idx, array) => {
                        if(cur.memId == "${getCurrentLoginVO.memId}"){
                           str += ' active';                           
                        }
                     })
                     str +=   '         ">도움이 돼요';
                     str +=   '         <span class="bold ml-5">';
                     str +=   '            '+res[i].likeVOList.length+'';
                     str +=   '         </span>';
                     str +=   '      </button>';
                     str +=   '      <button type="button" class="btn btn-sm btn-report ml-7">신고하기</button>';
                     str +=   '      <input type="hidden" name="entRevNo" value="'+res[i].entRevNo+'">';
                     str +=   '      <input type="hidden" name="repSubId" value="'+res[i].memId+'">';
                     str +=   '   </div>';
                     str +=   '</div>';
                     reviewList.insertAdjacentHTML("beforeend", str);
                     drawRate();
                     }
                     
                }

             })

           }
       });
   };

   const observer = new IntersectionObserver(onIntersect, option); // 관찰자 초기화
   observer.observe(listEnd);   // 관찰할 대상(요소) 등록
</script>
<script type="text/javascript" src="/resources/js/enterprise.js"></script>