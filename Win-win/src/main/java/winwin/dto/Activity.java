package winwin.dto;

public class Activity {
	
	private int activityNo;
	private String userId;
	private int jobopenNo;
	private String aName;
	private String aStartDate;
	private String aEndDate;
	private String aContent;
	
	@Override
	public String toString() {
		return "Activity [activityNo=" + activityNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", aName="
				+ aName + ", aStartDate=" + aStartDate + ", aEndDate=" + aEndDate + ", aContent=" + aContent + "]";
	}

	public int getactivityNo() {
		return activityNo;
	}

	public void setactivityNo(int activityNo) {
		this.activityNo = activityNo;
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

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaStartDate() {
		return aStartDate;
	}

	public void setaStartDate(String aStartDate) {
		this.aStartDate = aStartDate;
	}

	public String getaEndDate() {
		return aEndDate;
	}

	public void setaEndDate(String aEndDate) {
		this.aEndDate = aEndDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	
}
