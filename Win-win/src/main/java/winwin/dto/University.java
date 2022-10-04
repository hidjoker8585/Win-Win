package winwin.dto;

public class University {
	
	private int univNo;
	private String userId;
	private int jobopenNo;
	private String univName;
	private String univBranch;
	private String univDay;
	private String univMajor;
	private String univMinor;
	private String univScore;
	private String univTotalScore;
	private String univStartDate;
	private String univEndDate;
	private String univTransfer;
	private String univGraduate;
	private String univRegion;
	
	@Override
	public String toString() {
		return "University [univNo=" + univNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", univName="
				+ univName + ", univBranch=" + univBranch + ", univDay=" + univDay + ", univMajor=" + univMajor
				+ ", univMinor=" + univMinor + ", univScore=" + univScore + ", univTotalScore=" + univTotalScore
				+ ", univStartDate=" + univStartDate + ", univEndDate=" + univEndDate + ", univTransfer=" + univTransfer
				+ ", univGraduate=" + univGraduate + ", univRegion=" + univRegion + "]";
	}


	public int getUnivNo() {
		return univNo;
	}

	public void setUnivNo(int univNo) {
		this.univNo = univNo;
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

	public String getUnivName() {
		return univName;
	}

	public void setUnivName(String univName) {
		this.univName = univName;
	}

	public String getUnivBranch() {
		return univBranch;
	}

	public void setUnivBranch(String univBranch) {
		this.univBranch = univBranch;
	}

	public String getUnivDay() {
		return univDay;
	}

	public void setUnivDay(String univDay) {
		this.univDay = univDay;
	}

	public String getUnivMajor() {
		return univMajor;
	}

	public void setUnivMajor(String univMajor) {
		this.univMajor = univMajor;
	}

	public String getUnivMinor() {
		return univMinor;
	}

	public void setUnivMinor(String univMinor) {
		this.univMinor = univMinor;
	}

	public String getUnivScore() {
		return univScore;
	}

	public void setUnivScore(String univScore) {
		this.univScore = univScore;
	}

	public String getUnivTotalScore() {
		return univTotalScore;
	}

	public void setUnivTotalScore(String univTotalScore) {
		this.univTotalScore = univTotalScore;
	}

	public String getUnivStartDate() {
		return univStartDate;
	}

	public void setUnivStartDate(String univStartDate) {
		this.univStartDate = univStartDate;
	}

	public String getUnivEndDate() {
		return univEndDate;
	}

	public void setUnivEndDate(String univEndDate) {
		this.univEndDate = univEndDate;
	}

	public String getUnivTransfer() {
		return univTransfer;
	}

	public void setUnivTransfer(String univTransfer) {
		this.univTransfer = univTransfer;
	}

	public String getUnivGraduate() {
		return univGraduate;
	}

	public void setUnivGraduate(String univGraduate) {
		this.univGraduate = univGraduate;
	}

	public String getUnivRegion() {
		return univRegion;
	}

	public void setUnivRegion(String univRegion) {
		this.univRegion = univRegion;
	}
	
	

}
