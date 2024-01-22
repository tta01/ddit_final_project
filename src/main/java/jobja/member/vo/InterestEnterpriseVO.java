package jobja.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InterestEnterpriseVO {
	
	private String memId;
	private String entNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date intrstEntRegDt;
	private String entNm;
	private int countByEntNo;
	
}
