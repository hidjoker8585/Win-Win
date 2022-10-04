package winwin.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author MoonJaeHwan
 *
 */
public class SupportBoard {

   private int passNo;
   private int jobOpenNo;
   private String title;
   private String task;
   @JsonFormat(pattern="yy.MM.dd")
   private Date supportDate;
   private String username;
   private String userId;
   private String emailSend;
   private String status;
   private String pass;
   private String score;
   
   public int getJobOpenNo() {
      return jobOpenNo;
   }
   public void setJobOpenNo(int jobOpenNo) {
      this.jobOpenNo = jobOpenNo;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getTask() {
      return task;
   }
   public void setTask(String task) {
      this.task = task;
   }
   public Date getSupportDate() {
      return supportDate;
   }
   public void setSupportDate(Date supportDate) {
      this.supportDate = supportDate;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getEmailSend() {
      return emailSend;
   }
   public void setEmailSend(String emailSend) {
      this.emailSend = emailSend;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   public String getPass() {
      return pass;
   }
   public void setPass(String pass) {
      this.pass = pass;
   }
   public String getScore() {
      return score;
   }
   public void setScore(String score) {
      this.score = score;
   }
   public int getPassNo() {
		return passNo;
	}
	public void setPassNo(int passNo) {
		this.passNo = passNo;
	}
   
   @Override
public String toString() {
	return "SupportBoard [passNo=" + passNo + ", jobOpenNo=" + jobOpenNo + ", title=" + title + ", task=" + task
			+ ", supportDate=" + supportDate + ", username=" + username + ", userId=" + userId + ", emailSend="
			+ emailSend + ", status=" + status + ", pass=" + pass + ", score=" + score + "]";
}
   
}