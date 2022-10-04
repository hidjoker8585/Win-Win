package winwin.dto;

public class UserDetail {

	private int userdetailNo;
	private String userId;
	private int jobopenNo;
	private String eName;
	private String birth;
	private int zipCode;
	private String address;
	private String addressDetail;
	private String phoneNum;
	private String veteran;
	private String disable;
	private String interest;
	private String task;
	
	
	@Override
	public String toString() {
		return "UserDetail [userdetailNo=" + userdetailNo + ", userId=" + userId + ", jobopenNo=" + jobopenNo
				+ ", eName=" + eName + ", birth=" + birth + ", zipCode=" + zipCode + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", phoneNum=" + phoneNum + ", veteran=" + veteran + ", disable="
				+ disable + ", interest=" + interest + ", task=" + task + "]";
	}


	public int getUserdetailNo() {
		return userdetailNo;
	}


	public void setUserdetailNo(int userdetailNo) {
		this.userdetailNo = userdetailNo;
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


	public String geteName() {
		return eName;
	}


	public void seteName(String eName) {
		this.eName = eName;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public int getZipCode() {
		return zipCode;
	}


	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressDetail() {
		return addressDetail;
	}


	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	public String getVeteran() {
		return veteran;
	}


	public void setVeteran(String veteran) {
		this.veteran = veteran;
	}


	public String getDisable() {
		return disable;
	}


	public void setDisable(String disable) {
		this.disable = disable;
	}


	public String getInterest() {
		return interest;
	}


	public void setInterest(String interest) {
		this.interest = interest;
	}


	public String getTask() {
		return task;
	}


	public void setTask(String task) {
		this.task = task;
	}
	
	
}
