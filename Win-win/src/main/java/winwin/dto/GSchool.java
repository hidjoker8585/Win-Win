package winwin.dto;

public class GSchool {
	
	private int gsNo;
	private String userId;
	private int jobopenNo;
	private String gsName;
	private String gsBranch;
	private String gsDay;
	private String gsMajor;
	private String gsScore;
	private String gsTotalScore;
	private String gsEndDate;
	private String gsGraduate;
	private String gsRegion;
	
	@Override
	public String toString() {
		return "GSchool [gsNo=" + gsNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", gsName=" + gsName
				+ ", gsBranch=" + gsBranch + ", gsDay=" + gsDay + ", gsMajor=" + gsMajor + ", gsScore=" + gsScore
				+ ", gsTotalScore=" + gsTotalScore + ", gsEndDate=" + gsEndDate + ", gsGraduate=" + gsGraduate
				+ ", gsRegion=" + gsRegion + "]";
	}

	
	public int getGsNo() {
		return gsNo;
	}

	public void setGsNo(int gsNo) {
		this.gsNo = gsNo;
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

	public String getGsName() {
		return gsName;
	}

	public void setGsName(String gsName) {
		this.gsName = gsName;
	}

	public String getGsBranch() {
		return gsBranch;
	}

	public void setGsBranch(String gsBranch) {
		this.gsBranch = gsBranch;
	}

	public String getGsDay() {
		return gsDay;
	}

	public void setGsDay(String gsDay) {
		this.gsDay = gsDay;
	}

	public String getGsMajor() {
		return gsMajor;
	}

	public void setGsMajor(String gsMajor) {
		this.gsMajor = gsMajor;
	}

	public String getGsScore() {
		return gsScore;
	}

	public void setGsScore(String gsScore) {
		this.gsScore = gsScore;
	}

	public String getGsTotalScore() {
		return gsTotalScore;
	}

	public void setGsTotalScore(String gsTotalScore) {
		this.gsTotalScore = gsTotalScore;
	}

	public String getGsEndDate() {
		return gsEndDate;
	}

	public void setGsEndDate(String gsEndDate) {
		this.gsEndDate = gsEndDate;
	}

	public String getGsGraduate() {
		return gsGraduate;
	}

	public void setGsGraduate(String gsGraduate) {
		this.gsGraduate = gsGraduate;
	}

	public String getGsRegion() {
		return gsRegion;
	}

	public void setGsRegion(String gsRegion) {
		this.gsRegion = gsRegion;
	}
	
	
	
	
	

}
