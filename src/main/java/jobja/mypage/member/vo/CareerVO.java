package jobja.mypage.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CareerVO {

	private String companyDetCareer;
	private String companySalary;
	private String companyDept;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date companyLeaveDt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date companyEntranceDt;
	
	private String companyNm;
	private String resumeNo;
	private String careerNo;
	private int careerSeq;
	private String companyJob;
	private String companyPosition;
	
	private String companyEmpStatus;
	
	private int workPeriod; // 근무 기간
}