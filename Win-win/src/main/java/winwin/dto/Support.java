package winwin.dto;

public class Support {

	private int passNo;
	private int jobopenNo;
	private String userId;
	private String supportDate;
	private String emailSend;
	private String status;
	private String pass;
	
	@Override
	public String toString() {
		return "Support [passNo=" + passNo + ", jobopenNo=" + jobopenNo + ", userId=" + userId + ", supportDate="
				+ supportDate + ", emailSend=" + emailSend + ", status=" + status + ", pass=" + pass + "]";
	}

	public int getPassNo() {
		return passNo;
	}

	public void setPassNo(int passNo) {
		this.passNo = passNo;
	}

	public int getJobopenNo() {
		return jobopenNo;
	}

	public void setJobopenNo(int jobopenNo) {
		this.jobopenNo = jobopenNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSupportDate() {
		return supportDate;
	}

	public void setSupportDate(String supportDate) {
		this.supportDate = supportDate;
	}

	public String getEmailSend() {
		return emailSend;
	}

	public void setEmailSend(String emailSend) {
		this.emailSend = emailSend;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
