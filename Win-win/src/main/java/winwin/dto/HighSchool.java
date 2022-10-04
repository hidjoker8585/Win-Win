package winwin.dto;

public class HighSchool {
	
	private int hsNo;
	private String userId;
	private int jobopenNo;
	private String hsName;
	private String hsDay;
	private String hsMajor;
	private String hsEndDate;
	private String hsGraduate;
	private String hsRegion;
	
	
	@Override
	public String toString() {
		return "HighSchool [hsNo=" + hsNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", hsName=" + hsName
				+ ", hsDay=" + hsDay + ", hsMajor=" + hsMajor + ", hsEndDate=" + hsEndDate + ", hsGraduate="
				+ hsGraduate + ", hsRegion=" + hsRegion + "]";
	}


	public int getHsNo() {
		return hsNo;
	}


	public void setHsNo(int hsNo) {
		this.hsNo = hsNo;
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


	public String getHsName() {
		return hsName;
	}


	public void setHsName(String hsName) {
		this.hsName = hsName;
	}


	public String getHsDay() {
		return hsDay;
	}


	public void setHsDay(String hsDay) {
		this.hsDay = hsDay;
	}


	public String getHsMajor() {
		return hsMajor;
	}


	public void setHsMajor(String hsMajor) {
		this.hsMajor = hsMajor;
	}


	public String getHsEndDate() {
		return hsEndDate;
	}


	public void setHsEndDate(String hsEndDate) {
		this.hsEndDate = hsEndDate;
	}


	public String getHsGraduate() {
		return hsGraduate;
	}


	public void setHsGraduate(String hsGraduate) {
		this.hsGraduate = hsGraduate;
	}


	public String getHsRegion() {
		return hsRegion;
	}


	public void setHsRegion(String hsRegion) {
		this.hsRegion = hsRegion;
	}
	
	

}
