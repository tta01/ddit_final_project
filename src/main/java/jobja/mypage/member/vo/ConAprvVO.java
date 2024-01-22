package jobja.mypage.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ConAprvVO {
   
   private String memId;
   private String resumeNo;
   private String ptflNo;
   
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
   private Date conAprvDt;
   
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
   private Date conAprvUpdt;

   private String memYn;
   private String memCd;
   
   private String gubun;
}