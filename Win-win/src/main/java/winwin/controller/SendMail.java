package winwin.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import winwin.dto.Mail;

public class SendMail {
	
	public boolean sendMail(Mail mail) {
		
		
		String host = "smtp.gmail.com";
		final String user = "popiui0051@gmail.com";
		final String password = "qwe123Q!";
		
		String sender = mail.getSender();
		String pwd = mail.getContent();
		String title = mail.getTitle();
		
		//Get the session object
		Properties props= new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(user, password);
			}
		});
		
		// 메세지 작성
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(sender));

			//제목
			message.setSubject(title);
			
			//내용
			message.setText(new StringBuffer().append("회원님의 임시비밀번호는 <strong>")
					.append(pwd)
					.append("</strong>입니다.")
					.append("<P><a href='http://localhost:8088/user/pwchange'>비밀번호 "
							+ "변경하기</a> 링크를 통해서 "
							+ "비밀번호를 변경해주시기 바랍니다.</P>").toString());
			
			// 이메일 해더
			message.setHeader("content-Type","text/html");
	
			//메세지 보내기
			Transport.send(message);
			System.out.println("메세지 전송 완료");
			return true;
			
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
	}
}
