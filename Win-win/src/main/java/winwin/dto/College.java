package winwin.dto;

public class College {
	
	private int colNo;
	private String userId;
	private int jobopenNo;
	private String colName;
	private String colBranch;
	private String colDay;
	private String colMajor;
	private String colScore;
	private String colTotalScore;
	private String colStartDate;
	private String colEndDate;
	private String colTransfer;
	private String colGraduate;
	private String colRegion;
	
	@Override
	public String toString() {
		return "College [colNo=" + colNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", colName=" + colName
				+ ", colBranch=" + colBranch + ", colDay=" + colDay + ", colMajor=" + colMajor + ", colScore="
				+ colScore + ", colTotalScore=" + colTotalScore + ", colStartDate=" + colStartDate + ", colEndDate="
				+ colEndDate + ", colTransfer=" + colTransfer + ", colGruduate=" + colGraduate + ", colRegion="
				+ colRegion + "]";
	}


	public int getColNo() {
		return colNo;
	}

	public void setColNo(int colNo) {
		this.colNo = colNo;
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

	public String getColName() {
		return colName;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}

	public String getColBranch() {
		return colBranch;
	}

	public void setColBranch(String colBranch) {
		this.colBranch = colBranch;
	}

	public String getColDay() {
		return colDay;
	}

	public void setColDay(String colDay) {
		this.colDay = colDay;
	}

	public String getColMajor() {
		return colMajor;
	}

	public void setColMajor(String colMajor) {
		this.colMajor = colMajor;
	}

	public String getColScore() {
		return colScore;
	}

	public void setColScore(String colScore) {
		this.colScore = colScore;
	}

	public String getColTotalScore() {
		return colTotalScore;
	}

	public void setColTotalScore(String colTotalScore) {
		this.colTotalScore = colTotalScore;
	}

	public String getColStartDate() {
		return colStartDate;
	}

	public void setColStartDate(String colStartDate) {
		this.colStartDate = colStartDate;
	}

	public String getColEndDate() {
		return colEndDate;
	}

	public void setColEndDate(String colEndDate) {
		this.colEndDate = colEndDate;
	}

	public String getColTransfer() {
		return colTransfer;
	}

	public void setColTransfer(String colTransfer) {
		this.colTransfer = colTransfer;
	}

	public String getColGraduate() {
		return colGraduate;
	}

	public void setColGraduate(String colGraduate) {
		this.colGraduate = colGraduate;
	}

	public String getColRegion() {
		return colRegion;
	}

	public void setColRegion(String colRegion) {
		this.colRegion = colRegion;
	}
	
	
	
	

}
