package com.employee.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmployeeEmailVerification {

	public static void sendOtpEmail(String toEmailId, int otp) {
	
		//sender details
		final String  fromEmailId = "hirenksolanki95@gmail.com"; 
		final String generatedPassword = "jgndgckdcyidnoff";
		
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, 
				new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmailId, generatedPassword);
				}
			});
	
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmailId));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmailId));
			message.setSubject("OTP for hibernate app");
			message.setText("Your one time OTP is"+" "+otp);
			Transport.send(message);
			System.out.println("Email sent");
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	}

}
