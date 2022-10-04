package winwin.dto;

public class JobopenDetail {
	
	private int jobopenNo; //공고 제목
	private String sector; // 모집부문
	private String task; // 담당업무
	private int volume; //모집인원
	private String location; //근무 지역
	private String special; //우대사항
	private String title;
	
	
	

	@Override
	public String toString() {
		return "JobopenDetail [jobopenNo=" + jobopenNo + ", sector=" + sector + ", task=" + task + ", volume=" + volume
				+ ", location=" + location + ", special=" + special + ", title=" + title + "]";
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getJobopenNo() {
		return jobopenNo;
	}
	public void setJobopenNo(int jobopenNo) {
		this.jobopenNo = jobopenNo;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	
	
}
