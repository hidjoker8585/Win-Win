package winwin.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBoard {

	private int noticeno;
	private String title;
	private int code;
	private String writer;
	private String content;
	private int hit;
	private Date writedate;
	private int filesCnt;
	private List<MultipartFile> files;	

	@Override
	public String toString() {
		return "NoticeBoard [noticeno=" + noticeno + ", title=" + title + ", code=" + code + ", writer=" + writer
				+ ", content=" + content + ", hit=" + hit + ", writedate=" + writedate + "]";
	}
	
	public int getFilesCnt() {
		return filesCnt;
	}
	public void setFilesCnt(int filesCnt) {
		this.filesCnt = filesCnt;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
