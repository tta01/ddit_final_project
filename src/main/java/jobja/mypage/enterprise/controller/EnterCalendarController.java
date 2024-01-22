package jobja.mypage.enterprise.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jobja.mypage.member.service.MemFullCalendarService;
import jobja.mypage.member.vo.MemFullCalendarVO;
import jobja.util.ModelAttributeUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/entCalendar")
@Controller
public class EnterCalendarController {
   @Autowired
   MemFullCalendarService memFullCalendarService;
   
   @Autowired
   ModelAttributeUtil modelAttributeUtil;

	@GetMapping("/calendar")
	public String memCalendar() {
		return "mypageEnt/entCalendar";
	}
   
   
   //DB에 저장되어 있는 일정 가져오는 메소드.
   @GetMapping("/getEvents")
   @ResponseBody
   public  List<Map<String, Object>> getEvents(){
	   
	   String memId = this.modelAttributeUtil.getCurrentLoginName().getMemId();
	   
	   log.info("getEvents -> memId : " + memId);
	   
      //json형태로 리턴해줘야 하기 때문에 Map을 씀.
      List<Map<String, Object>> eventList = this.memFullCalendarService.getEvents(memId);
      
      log.info("ㅁㄴㅇㅁㅁㄴ getEvents :" + eventList);
      
      for (Map<String, Object> event : eventList) {
    	  	log.info("event : =>>>>????? " + event);
    	    Object scheduleAllDay = event.get("schduleAllday");
    	    if (scheduleAllDay instanceof String) {
    	        try {
    	            int value = Integer.parseInt((String) scheduleAllDay);
    	            
    	            log.info(" value : =>>>>" + value);
    	            event.put("schduleAllday", value == 1 ? true : false);
    	        } catch (NumberFormatException e) {
    	            event.put("schduleAllday", false); // 예외 발생 시 기본값 설정
    	        }
    	    } else {
    	        event.put("schduleAllday", false); // 다른 유형의 경우 기본값 설정
    	        log.info("??????????????????????? : " + eventList);
    	    }
    	}

      return eventList;
      
   }
   
   @PostMapping("/addEvent")
   @ResponseBody
   public String addEvent(@RequestBody MemFullCalendarVO event) {
      
      log.info("와유? addEvent : " + event);
      
      String memId = this.modelAttributeUtil.getCurrentLoginName().getMemId();
      
      event.setMemId(memId);
      
      log.info("아이디 드감? event : " +event);
      
      //일정 중복 체크
      int chk = this.memFullCalendarService.addEventCheck(event);
      
      if(chk>0) {//일정 중복 됨
    	  return "{\"stat\" :\"duplicated\"}";
      }else {//일정 중복 안 됨
	      int result = this.memFullCalendarService.addEvent(event);
	      
	      if(result > 0) {
	    	  return "{\"stat\" :\"ok\"}";
	      }else {
	          return "{\"stat\" :\"fail\"}";
	      }
      }
   }
   
   @PostMapping("/updateEvent")
   @ResponseBody
   public String updateEvent(@RequestBody MemFullCalendarVO event) {
	   log.info("와유? updateEvent : " + event);
	   
	   int result = this.memFullCalendarService.updateEvent(event);
	   log.info("두구두구 과연? : " + result);
	   
	   if(result > 0) {
	    	  return "{\"stat\" :\"ok\"}";
	      }else {
	          return "{\"stat\" :\"fail\"}";
	      }
	   
   }
   
   @PostMapping("/deleteEvent")
   @ResponseBody
   public String deleteEvent(@RequestBody MemFullCalendarVO event) {
	   log.info("삭 ㅈㅔ오냐????? : " + event);
	   
	   int result = this.memFullCalendarService.deleteEvent(event.getScherduleId());
	   
	   if (result > 0){
       	//  json형태
           return "{\"stat\" :\"ok\"}";
       }else {
           return "{\"stat\" :\"fail\"}";
       }
	   
   }
   
   
}
