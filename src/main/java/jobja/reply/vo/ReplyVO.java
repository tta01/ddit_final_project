package jobja.reply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private String replyNo;
	private String parentReplyNo;
	private String boardId;
	private String memId;
	private String replyCntnt;
	private Date replyWritingDt;
	private String delYn;
	private String passedTime;
	
}
