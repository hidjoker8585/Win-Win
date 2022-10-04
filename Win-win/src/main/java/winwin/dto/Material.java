package winwin.dto;

import java.util.Date;

public class Material {

	private int fileNo;
	private String userId;
	private int adminCode;
	private int noticeNo;
	private int portfolioId;
	private String originName;
	private String storedName;
	private Date writedate;
	private long filesize;
	
	@Override
	public String toString() {
		return "Material [fileNo=" + fileNo + ", userId=" + userId + ", adminCode=" + adminCode + ", noticeNo=" + noticeNo
				+ ", portfolioId=" + portfolioId + ", originName=" + originName + ", storedName=" + storedName
				+ ", date=" + writedate + ", size=" + filesize + "]";
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getPortfolioId() {
		return portfolioId;
	}
	public void setPortfolioId(int portfolioId) {
		this.portfolioId = portfolioId;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date date) {
		this.writedate = date;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long size) {
		this.filesize = size;
	}
}
