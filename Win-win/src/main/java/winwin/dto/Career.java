package winwin.dto;

public class Career {

	private int careerNo;
	private String userId;
	private int jobopenNo;
	private String cStartDate;
	private String cEndDate;
	private String cName;
	private String position;
	private String task;
	private String salary;
	private String cContent;
	
	@Override
	public String toString() {
		return "Career [careerNo=" + careerNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo + ", cStartDate="
				+ cStartDate + ", cEndDate=" + cEndDate + ", cName=" + cName + ", position=" + position + ", task="
				+ task + ", salary=" + salary + ", cContent=" + cContent + "]";
	}

	public int getCareerNo() {
		return careerNo;
	}

	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
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

	public String getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(String cStartDate) {
		this.cStartDate = cStartDate;
	}

	public String getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	
}
