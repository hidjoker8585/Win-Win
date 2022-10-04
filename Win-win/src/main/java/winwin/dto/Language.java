package winwin.dto;

public class Language {

	private int languageNo;
	private String userId;
	private int jobopenNo;
	private String lName;
	private String grade;
	private String testName;
	private String score;
	private String lDate;
	private String lOrgan;
	
	@Override
	public String toString() {
		return "Language [languageNo=" + languageNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", lName="
				+ lName + ", grade=" + grade + ", testName=" + testName + ", score=" + score + ", lDate=" + lDate
				+ ", lOrgan=" + lOrgan + "]";
	}

	public int getLanguageNo() {
		return languageNo;
	}

	public void setLanguageNo(int languageNo) {
		this.languageNo = languageNo;
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

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getgrade() {
		return grade;
	}

	public void setgrade(String grade) {
		this.grade = grade;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getlDate() {
		return lDate;
	}

	public void setlDate(String lDate) {
		this.lDate = lDate;
	}

	public String getlOrgan() {
		return lOrgan;
	}

	public void setlOrgan(String lOrgan) {
		this.lOrgan = lOrgan;
	}
	
}
