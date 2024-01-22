<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/resume.css">
<style>
/* 공통 스타일 */
.mypage-body-con {
  background-color: #fff;
  border-radius: 30px;
  padding: 24px;
}

.body-sub-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 8px;
}

.title-hr {
     border: 1px solid #ccc;
     margin-bottom: 8px;
    width: 100%;
}

.bold {
  font-size: 24px !important;
  font-weight: bold !important;
  margin-bottom: 16px !important;
}

#calendar {
  width: 1240px;
  height: 700px;
  margin:auto;
}

/* 모달 관련 스타일 */
#modal-custom {
  font-family: Arial, sans-serif;
  padding: 20px;
  border-radius: 10px;
  background-color: #f4f4f4;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  height:445px!important;
}

#modal-custom section { 
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}

#modal-custom .icon-close {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  position: absolute;
  top: 0;
  right: 0;
}

/* 일정 입력 필드 스타일 */
#modal-custom input[type="text"],
#modal-custom input[type="date"],
#modal-custom input[type="checkbox"],
#modal-custom button:not(.icon-close),
#modal-custom select {
  margin: 10px 0;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1rem;
  width: 80%;
}
/* 일정 시작 및 종료 시간 입력 필드 스타일 */
input[type="datetime-local"] {
  margin: 10px 0;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1rem;
  width:80%; /* 전체 너비에서 마진 값 제외한 크기로 조정 */
}

/* 마진 값 조정을 위한 클래스 추가 */
.input-with-margin {
  margin-right: 10px; /* 필요에 따라 왼쪽 또는 오른쪽 마진 조정 */
}

/* 체크박스와 라벨 가로 정렬 */
#allDayText {
  display: flex;
  align-items: center;
  font-size: 14px;
  color: #333;
  margin-top: 4px;
}

/* 체크박스 스타일 */
#allDay {
  margin-left: 8px;
}

/* 버튼 스타일 */
#addEventButton1 {
  background-color: #00c362;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin-top: 10px;
  padding: 8px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 1rem;
  width: 80%;
}

#addEventButton1:hover {
  background-color:
}
.fc-event {
  border: none; /* 또는 border: 0; */
}
.fc-icon {
	color: #fff !important;
}

body{
	background-color:#fff;
}

.cen.pt-25 {
	width:100%;
	text-align:center;
}
</style>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/css/iziModal.css">
	<script src="/resources/js/jquery-3.6.3.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.6.1/js/iziModal.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<div class="mypage-body-con pd-40">
   <div class="mypage-h1">
      	일정관리
   </div>
      
   <div class="body-sub-con">
      <div id="calendar"></div>
      
      
        <div id="modal-custom">
	    	<section>
		        <button data-izimodal-close="" class="icon-close"></button>
		        <p class="bold p-13">일정 추가</p>
		        <!-- 일정 추가에 필요한 필드들 -->
		        <input type="text" id="eventTitle" name="scheduleTitle" placeholder="일정 제목">
				<input type="datetime-local" id="start" name="scheduleStdt" placeholder="일정 시작" required>
				<input type="datetime-local" id="end" name="scheduleEddt" placeholder="일정 종료" required>
		        <select name="scheduleType" id="scheduleType">
		        	<option selected>일정종류를 선택하여주세요.</option>
		        	<option value="개인일정">개인일정</option>
		        	<option value="면접일정">면접일정</option>
		        	<option value="상담일정">상담일정</option>
		        </select>
		        <label for="allDay" id="allDayText">하루종일</label>
		        <input type="checkbox" id="allDay" name="schduleAllday"/>
		        <button id="addEventButton1">추가</button>
		    </section>
		</div>
   </div>
</div>

<script>

    let calendar = null;
    let localeCode = 'ko'; //달력 언어설정
	
    //모달 사용.
    $(document).ready(() => {
    	
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
    	   
			//처음 페이지 로딩시 등록되 있는 일정을 가져오는 코드
            let request = $.ajax({
                url: "${pageContext.request.contextPath}/memberCalendar/getEvents",
                type: "GET",
                dataType: "json"
            });
            
            /**
             * 캘린더 이벤트 수정을 위한 함수 사용되는 곳이 2곳 이상이므로
             * 코드의 중복을 피하기 위해 함수 분리
             * @param info 정보를 수정할 이벤트 객체
             */
            function event_update(info) {
                let jsondata;
                if (confirm(info.event.title + " 일정을 수정하시겠습니까?")) {
					
                	console.log(" update event : " , info.event)
                    let event = {};
                    event.scherduleId = info.event.id;
                    event.scheduleTitle = info.event.title;
                    event.scheduleStdt = info.event.start;

                    if (info.event.end !== null) {
                        event.scheduleEddt = info.event.end;
                    } else {
                        event.scheduleEddt = info.event.start;
                    }

                    if (info.event.allDay === true) {
                        event.schduleAllday = 1;
                    } else {
                        event.schduleAllday = 0;
                    }
					
                    jsondata = JSON.stringify(event);

                } else {
                    location.reload();
                }

                //일정 수정시 서버로 요청
        	    $.ajax({
        	    	url: "${pageContext.request.contextPath}/memberCalendar/updateEvent",
        	    	type: "post",
        	    	dataType: "json",
        	    	data: jsondata,
        	    	contentType: "application/json",
        	    	beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    				},
       	    		success: function(response) {
       	                alert('일정이 수정완료.');
           	    	},
       	            error: function(error) {
       	                console.error('요청이 실패했습니다:', error);
       	            }
        	    });
            }//end event_update
		
            //처음페이지 로딩시 가져온 데이터를 매칭 해주고 일정 추가, 수정, 삭제등 진행
            request.done((data) => {
               
               	const eventColor = {
            	   '개인일정': { backgroundColor: '#60f590', color: '#60f590' },
            	   '면접일정': { backgroundColor: '#B9E2FA', color: '#B9E2FA' },
            	   '상담일정': { backgroundColor: '#FFD2D7', color: '#FFD2D7' }
				};
               
               console.log("eventColor : ", eventColor)
               
               //풀캘린더에서 원하는 방식(json)으로 변환해줘야함.
                const transformedData = data.map(event => {
                	
				    const defaultColor = { backgroundColor: '#ccc', color: 'black' }; // 기본값 설정
				    const eventType = eventColor[event.scheduleType];
				    
				    console.log("eventType : " , eventType);
			    
				    return {
				        id: event.scherduleId,
				        title: event.scheduleTitle,
				        start: event.scheduleStdt,
				        end: event.scheduleEddt,
				        allDay: event.schduleAllday,
				        color: eventType ? eventType.color : defaultColor.color,
				        backgroundColor: eventType ? eventType.backgroundColor : defaultColor.backgroundColor,
				        textColor: eventType ? eventType.textColor  : defaultColor.textColor 
				    };
				});//end transformedData
               
               console.log("transformedData : ", transformedData)
               
               
                let caledarEl = document.querySelector("#calendar");
                calendar = new FullCalendar.Calendar(caledarEl, {
                    initialView: 'dayGridMonth',
                    locale: localeCode,
                    timeZone: 'Asia/Seoul',		//시간을 한국표준시로 맞춤.
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    navLinks: true,
                    editable: true,
                    selectable: true,
                    droppable: true,
                    events: transformedData, // <---데이터베이스에서 가져온 이벤트 정보가 들어가야하는 위치
                    eventColor: 'backgroundColor', // FullCalendar에서 일정 색상을 설정하는 부분
                    
                    //select 이벤트
                    select: function (arg) {
                    	
                    	//선택한 날짜 가져오기
                    	let selectedStartDate = arg.start;
                    	let selectedEndDate = arg.end;
                    	
                    	// 만약 날짜가 문자열이면 Date 객체로 변환
                        if (typeof selectedStartDate === 'string') {
                            selectedStartDate = new Date(selectedStartDate);
                        }

                        if (typeof selectedEndDate === 'string') {
                            selectedEndDate = new Date(selectedEndDate);
                        }

                        // toISOString() 사용하여 datetime-local 형식으로 변환
                        document.getElementById("start").value = selectedStartDate.toISOString().slice(0, 16);
                        document.getElementById("end").value = selectedEndDate.toISOString().slice(0, 16);
                    	
                    	//모달열기
                    	$('#modal-custom').iziModal('open');
                    	console.log("달력의 td를 클릭했어요");
                    	
                    	let flag = true;
                    	
                    	//'일정 추가'버튼 클릭 시 데이터를 서버로 보내는 함수
                    	$('#addEventButton1').on('click',function(){
                    		console.log("추가버튼을 클릭했어요");
                    		
                    		if(flag==false){
                    			return;
                    		}
                    		
                    		//입력된 값을 가져옴.
                    		let eventTitle = $('#eventTitle').val();
                    	    let startDateTime = $('#start').val();
                    	    let endDateTime = $('#end').val();
                    	    let allDay = $('#allDay').is(':checked');
                    	    let scheduleType = $('#scheduleType').val();
                    	    
                    	    //null처리
                    	    if(eventTitle && startDateTime && endDateTime !=null){
                    	    	// 데이터 객체 생성
                        	    let eventData = {
                        	    	scheduleTitle: eventTitle,
                        	    	scheduleStdt: new Date(startDateTime).toISOString(),
                        	    	scheduleEddt: new Date(endDateTime).toISOString(),
                        	    	schduleAllday: allDay ? 1 : 0,
                        	    	scheduleType: scheduleType
                        	    };
                    	    	console.log("eventData : " ,eventData);
                    	    	
                    	    	
                        	    //일정 추가 -> 서버로 요청
                        	    $.ajax({
                        	    	url: "${pageContext.request.contextPath}/memberCalendar/addEvent",
                        	    	type: "post",
                        	    	dataType: "json",
                        	    	data: JSON.stringify(eventData),
                        	    	contentType: "application/json",
                        	    	beforeSend:function(xhr){
                    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                    				},
                       	    		success: function(response) {
                       	    			if(response.stat=="duplicated"){
                       	    				alert("일정이 중복되었습니다.");
                       	    			}else{
	                       	                alert('일정이 등록되었습니다.');
	                       	                
	                       	             // 이벤트 종류에 따른 색상 설정
	                       	             let backgroundColor = '#ccc'; // 기본 색상
	                       	             let borderColor = '#ccc'; // 기본 색상

	                       	             switch (scheduleType) {
	                       	                 case '개인일정':
	                       	                     backgroundColor = '#60f590'; // 개인일정 컬러
	                       	                     borderColor = '#60f590'; // 개인일정 컬러
	                       	                     break;
	                       	                 case '면접일정':
	                       	                     backgroundColor = '#B9E2FA'; // 면접일정 컬러
	                       	                     borderColor = '#B9E2FA'; // 면접일정 컬러
	                       	                     break;
	                       	                 case '상담일정':
	                       	                     backgroundColor = '#FFD2D7'; // 상담일정 컬러
	                       	                     borderColor = '#FFD2D7'; // 상담일정 컬러
	                       	                     break;
	                       	                 default:
	                       	                     backgroundColor = '#ccc'; // 기본 색상
	                       	                     borderColor = '#ccc'; // 기본 색상
	                       	                     break;
	                       	             }

	                       	             console.log("backgroundColor: " + backgroundColor);
	                       	             console.log("borderColor: " + borderColor);

	                       	             calendar.addEvent({
	                       	                 title: eventTitle,
	                       	                 start: startDateTime,
	                       	                 end: endDateTime,
	                       	                 allDay: allDay, // 시간 단위로 하려면 allDay를 false로 적용.
	                       	                 backgroundColor: backgroundColor, // 배경색 지정
	                       	                 borderColor: borderColor // 테두리 색상 지정
	                       	             });

		                             	    
		                             	    
		                             	  //선택했던 것을 풀어주는 것.
		                                     calendar.unselect();
                       	    			}
                       	                flag = false;
                       	                
	                       	             // 모달 닫기 및 캘린더에서 선택 해제
	                       	             $('#modal-custom').iziModal('close');
	                       	    	},
                       	            error: function(error) {
                       	                console.error('요청이 실패했습니다:', error);
                       	            }
                        	    });
                    	    }else{
                    	    	alert('일정 제목과 시작일 및 종요일을 모두 입력해주세요.');
                    	    	return;
                    	    }
                    	});//end addEventButton
                    },
                    /**
                     * 캘린더의 이벤트를 드래그&드롭시 발생하는 이벤트
                     * 이벤트 수정기능을 구현함
                     * @param event 드래그&드롭으로 이동된 이벤트 객체
                     */
                    eventDrop: (event) => {
                        event_update(event);
                    },
                    /**
                     * 캘린더의 이벤트의 가장자리를 드래그하여 리사이징시 발생하는 이벤트
                     * 이벤트 수정기능을 구현함
                     * @param event 리사이징한 이벤트 객체
                     */
                    eventResize: (event) => {
                        event_update(event);
                    },
                    /**
                     * 캘린더의 이벤트를 클릭시 발생하는 이벤트
                     * 이벤트 삭제기능을 구현함
                     * @param event 클릭한 이벤트 객체
                     */
                    eventClick: (event) => {
                        if (confirm(event.event.title + " 일정을 삭제 하시겠습니까?")) {
                            event.event.remove();
                            
                            let data = JSON.stringify({scherduleId: event.event.id});
                            
                            console.log("data : " , data);

                            $.ajax({
                            	/* was 서버에 접근하는 contextPath */
                                url: "${pageContext.request.contextPath}/memberCalendar/deleteEvent",
                                type: "post",
                                data: data,
                                dataType: "json",
                                contentType: "application/json",
                                beforeSend:function(xhr){
                					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                				},
                   	    		success: function(response) {
                   	                alert('일정이 삭제되었습니다..');
                       	    	},
                   	            error: function(error) {
                   	                console.error('요청이 실패했습니다:', error);
                   	            }
                    	    });
                                
                        }
                    }
                });
                calendar.render();
            });//end request.done

    });//end document ready

</script>