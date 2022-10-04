package winwin.dto;

import java.util.Date;

public class QnaComment {

	private int commentNo;
	private int qnaNo;
	private String writer;
	private String id;
	private String content;
	private Date writedate;

	private boolean admin;
	
	@Override
	public String toString() {
		return "QnaComment [commentNo=" + commentNo + ", qnaNo=" + qnaNo + ", writer=" + writer + ", id=" + id
				+ ", content=" + content + ", date=" + writedate + "]";
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date date) {
		this.writedate = date;
	}
	
}
