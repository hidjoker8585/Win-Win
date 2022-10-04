package winwin.dto;

public class Experience {

	private int experienceNo;
	private String userId;
	private int jobopenNo;
	private String eOption;
	private String eOrgan;
	private String eStartDate;
	private String eEndDate;
	private String eContent;
	
	@Override
	public String toString() {
		return "Experience [experienceNo=" + experienceNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo
				+ ", eOption=" + eOption + ", eOrgan=" + eOrgan + ", eStartDate=" + eStartDate + ", eEndDate="
				+ eEndDate + ", eContent=" + eContent + "]";
	}

	public int getExperienceNo() {
		return experienceNo;
	}

	public void setExperienceNo(int experienceNo) {
		this.experienceNo = experienceNo;
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

	public String geteOption() {
		return eOption;
	}

	public void seteOption(String eOption) {
		this.eOption = eOption;
	}

	public String geteOrgan() {
		return eOrgan;
	}

	public void seteOrgan(String eOrgan) {
		this.eOrgan = eOrgan;
	}

	public String geteStartDate() {
		return eStartDate;
	}

	public void seteStartDate(String eStartDate) {
		this.eStartDate = eStartDate;
	}

	public String geteEndDate() {
		return eEndDate;
	}

	public void seteEndDate(String eEndDate) {
		this.eEndDate = eEndDate;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	
}
