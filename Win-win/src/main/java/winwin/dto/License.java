package winwin.dto;

public class License {

	private int licenseNo;
	private String userId;
	private int jobopenNo;
	private String liName;
	private String liDate;
	private String liOrgan;
	
	@Override
	public String toString() {
		return "License [licenseNo=" + licenseNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", liName="
				+ liName + ", liDate=" + liDate + ", liOrgan=" + liOrgan + "]";
	}

	public int getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(int licenseNo) {
		this.licenseNo = licenseNo;
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

	public String getLiName() {
		return liName;
	}

	public void setLiName(String liName) {
		this.liName = liName;
	}

	public String getLiDate() {
		return liDate;
	}

	public void setLiDate(String liDate) {
		this.liDate = liDate;
	}

	public String getLiOrgan() {
		return liOrgan;
	}

	public void setLiOrgan(String liOrgan) {
		this.liOrgan = liOrgan;
	}
	
}
