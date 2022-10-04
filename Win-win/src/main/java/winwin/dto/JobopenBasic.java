package winwin.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class JobopenBasic {
	private int jobopenNo; // idx
	private String title; // 공고제목
	private String offer; // 신입 or 경력
	private String form; //고용 형태 (정규직, 인턴...)
	private int startPay; //최저 급여
	private int endPay; // 최고 급여
	private String rulePay; // 회사내규에 따름
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate; // 채용 시작일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate; // 채용 마감일
	private String allOpen; // 상시채용
	private String academic; // 학력제한 - 없을경우 "없음" 삽입
	private String score; // 학점제한 - 없을경우 "없음" 삽입
	private String lang; // 어학능력 - 없을경우 "없음" 삽입
	private String etcQual; // 기타자격
	private String etc; // 기타사항
	private Date writeDate; // 공고 작성날짜
	private int hit; // 조회수
	private int display; // 출력 유무
	private String status; // 공고 진행 상태
	
	

	private int applicantCnt; // 지원자 수 

	@Override
	public String toString() {
		return "JobopenBasic [jobopenNo=" + jobopenNo + ", title=" + title + ", offer=" + offer + ", form=" + form
				+ ", startPay=" + startPay + ", endPay=" + endPay + ", rulePay=" + rulePay + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", allOpen=" + allOpen + ", academic=" + academic + ", score=" + score
				+ ", lang=" + lang + ", etcQual=" + etcQual + ", etc=" + etc + ", writeDate=" + writeDate + ", hit="
				+ hit + ", display=" + display + ", status=" + status + ", applicantCnt=" + applicantCnt + "]";
	}

	
	public int getJobopenNo() {
		return jobopenNo;
	}

	public void setJobopenNo(int jobopenNo) {
		this.jobopenNo = jobopenNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOffer() {
		return offer;
	}

	public void setOffer(String offer) {
		this.offer = offer;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public int getStartPay() {
		return startPay;
	}

	public void setStartPay(int startPay) {
		this.startPay = startPay;
	}

	public int getEndPay() {
		return endPay;
	}

	public void setEndPay(int endPay) {
		this.endPay = endPay;
	}

	public String getRulePay() {
		return rulePay;
	}

	public void setRulePay(String rulePay) {
		this.rulePay = rulePay;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getAllOpen() {
		return allOpen;
	}

	public void setAllOpen(String allOpen) {
		this.allOpen = allOpen;
	}

	public String getAcademic() {
		return academic;
	}

	public void setAcademic(String academic) {
		this.academic = academic;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getEtcQual() {
		return etcQual;
	}

	public void setEtcQual(String etcQual) {
		this.etcQual = etcQual;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getApplicantCnt() {
		return applicantCnt;
	}

	public void setApplicantCnt(int applicantCnt) {
		this.applicantCnt = applicantCnt;
	}
	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
