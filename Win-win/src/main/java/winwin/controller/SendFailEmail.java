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

public class SendFailEmail {
	
	public boolean sendMail(Mail mail) {
		
		
		String host = "smtp.gmail.com";
		final String user = "popiui0051@gmail.com";
		final String password = "qwe123Q!";
		
		String sender = mail.getSender();
		String content = mail.getContent();
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
			message.setText(new StringBuffer().append("안녕하세요. WIN-WIN입니다. <br>")
					.append(content)
					.append(" 금년 본사 공개채용에 지원해 주셔서 감사합니다. <br><br>")
					.append("우선 좋은 소식을 전해드리지 못해 대단히 죄송합니다. <br>")
					.append("날이 갈수록 뛰어난 역량을 가진 분들이 늘고 있기에, 채용에 있어서의 책임감 또한 깊어지고 있습니다. <br><br>")
					.append("비록 이번 채용에서는 지원자분과 좋은 인연을 이어가지 못하게 되었습니다. <br>")
					.append("그러나 이것은 지원자께서 지닌 역량과 가능성이 부족함을 의미하는 것이 아닙니다. <br><br>")
					.append("부디 이번 채용 결과에 너무 상심하지 않으셨으면 합니다. <br>")
					.append("이후 더욱 성장하신 모습으로 뵐 수 있기를 진심으로 기원합니다. <br><br>")
					.append("또한 저희 WIN-WIN에 보여주신 열정이라면 <br>")
					.append("앞으로 어떤 일에 임하셔도 건승하실 것이라 믿습니다. <br><br>")
					.append("저희 WIN-WIN에 많은 관심 가져주셔서 감사드리며 <br>")
					.append("지원자분의 앞날에 햇살만 가득하시길 바랍니다. <br><br>")
					.append("<P><a href='http://localhost:8088/applyMenu/passfail'> 결과"
							+ "확인하기</a> 링크를 통해서 "
							+ "결과를 확인해주시기 바랍니다.</P>").toString());
			
			// 이메일 해더
			message.setHeader("content-Type","text/html");
	
			//메세지 보내기
			Transport.send(message);
//			System.out.println("메세지 전송 완료");
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
