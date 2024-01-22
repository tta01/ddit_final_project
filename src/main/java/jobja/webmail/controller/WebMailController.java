package jobja.webmail.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jobja.webmail.service.WebMailService;
import jobja.webmail.vo.WebMailVO;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequestMapping("/webMail")
@Controller
public class WebMailController {

    @Autowired
    WebMailService webMailService;

    @GetMapping("/simpleMail")
    public String getSimpleMail(){
        return "simpleMail";
    }

    @PostMapping("/simpleMail")
    public String PostSimpleMail(WebMailVO webMailVO){

        webMailService.sendSimpleMail(webMailVO);

        return "deliverySuccess";
    }

    @GetMapping("/fullMail")
    public String getFullMail(){
        return "fullMail";
    }

    @PostMapping("/fullMail")
    public String PostFullMail(WebMailVO webMailVO) throws MessagingException, IOException {
        webMailService.sendFullMail(webMailVO);
        return "deliverySuccess";
    }

    /**
     * <p>회원 가입등의 상황에서 인증 코드를 메일로 발송하고 검증을 위해 세션에 저장하기 위한 메서드</p>
     * <p>상세 메일 내용등은 service에서 정의 한다.</p>
     * @param mailMap ajax를 통해 전달받은 메일주소
     */
    @ResponseBody
    @PostMapping("/sendCode")
    public Map<String, String> sendCode(@RequestBody Map<String, String> mailMap
                            , HttpServletRequest request) throws MessagingException {
        String code = webMailService.sendAuthenticationCode(mailMap.get("mailAddress"));

        //인증코드를 저장할 세션 생성
        HttpSession session = request.getSession();
        session.setAttribute("authCode", code); //인증코드 세션에 저장
        session.setMaxInactiveInterval(180);  //세션의 만료시간을 3분으로 지정

        Map<String, String> result = new HashMap<>();
        result.put("result", "발송 완료");

        return result;
    }

    /**
     * <p>사용자가 입력한 코드와 세션에 저장된 코드가 일치하는지 확인하기 위한 메서드</p>
     * @param codeMap 사용자가 입력한 코드가 담긴 맵 객체
     * @return 일치하면 ok를 일치하지 않으면 fail을 전달 함
     */
    @ResponseBody
    @PostMapping("/checkCode")
    public Map<String, String> checkCode(@RequestBody Map<String, String> codeMap
                            ,HttpServletRequest request){

        HttpSession session = request.getSession();

        String sessionCode = (String) session.getAttribute("authCode");
        String inputCode = codeMap.get("code");

        Map<String, String> result = new HashMap<>();

        if (inputCode.equals(sessionCode)){
            result.put("result", "ok");
        }else {
            result.put("result", "fail");
        }

        return result;
    }

    @GetMapping("/mailCode")
    public String mailCode(){
        return "mailCodeTest";
    }

    @GetMapping("/codeSuccess")
    public String codeSuccess(){
        return "codeCheckSuccess";
    }
}