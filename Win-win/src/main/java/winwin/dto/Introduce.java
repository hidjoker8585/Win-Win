package winwin.dto;

public class Introduce {

	private int introduceNo;
	private String userId;
	private int jobopenNo;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String content5;
	
	@Override
	public String toString() {
		return "Introduce [introduceNo=" + introduceNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo
				+ ", content1=" + content1 + ", content2=" + content2 + ", content3=" + content3 + ", content4="
				+ content4 + ", content5=" + content5 + "]";
	}
	
	public int getIntroduceNo() {
		return introduceNo;
	}
	public void setIntroduceNo(int introduceNo) {
		this.introduceNo = introduceNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getJobopenNo() {
		return jobopenNo;
	}
	public void setJobopenNo(int jobopenNo) {
		this.jobopenNo = jobopenNo;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getContent4() {
		return content4;
	}
	public void setContent4(String content4) {
		this.content4 = content4;
	}
	public String getContent5() {
		return content5;
	}
	public void setContent5(String content5) {
		this.content5 = content5;
	}
	
}
