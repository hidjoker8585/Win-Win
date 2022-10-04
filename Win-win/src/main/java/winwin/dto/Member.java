package winwin.dto;

public class Member {

	private String userid;
	private String username;
	private String phone;
	private String pwd;
	private String pwConfirm;
	
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", phone=" + phone + ", pwd=" + pwd
				+ ", pwConfirm=" + pwConfirm + "]";
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwConfirm() {
		return pwConfirm;
	}

	public void setPwConfirm(String pwConfirm) {
		this.pwConfirm = pwConfirm;
	}
	
	
}
