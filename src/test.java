


import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class test {
	public void sendAdminPass(String email,String username,String password) throws Exception, MessagingException
	{
		
	try {
	       final String user = "electroproject84@gmail.com";
	          final String pass = "electrotest123";
			  
			  
				Properties props = System.getProperties();  
				props.setProperty("proxySet", "true");
				//props.setProperty("SocksProxyHost", "192.168.155.1");
				//props.setProperty("SocksProxyPort", "25");
				props.setProperty("mail.smtp.host","smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				//props.setProperty("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.socketFactory.fallback", "false");
				//props.put("mail.smtp.port", "465");
				props.put("mail.smtp.auth", "true");  
			
			
			  Session session = Session.getDefaultInstance(props, new
			  javax.mail.Authenticator() { protected PasswordAuthentication
			  getPasswordAuthentication() { return new PasswordAuthentication(user,pass); }
			  });
			 
			 
		String sm="Registration complete ElectroGalaxy.in";		
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(user));
		message.setRecipients(RecipientType.TO,email);
		message.setSubject(sm);
		BodyPart messageBodyPart1 = new MimeBodyPart();    	        
		messageBodyPart1.setContent( "<table><tr><td>Hi&nbsp;"+username+",</td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'><font color='red'>Congratulations!!!</font><br><br></td></tr>" ,"text/html; charset=utf-8" );
		Multipart multipart = new MimeMultipart();  
		multipart.addBodyPart(messageBodyPart1);  
		System.out.println("Inside Mail");
		BodyPart messageBodyPart2 = new MimeBodyPart();    	        
		messageBodyPart2.setContent( "<table><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'> You have an account with username = "+email+"   & password ="+password+" <br><br></td></tr>" ,"text/html; charset=utf-8" );
		multipart.addBodyPart(messageBodyPart2);  
		
		message.setContent(multipart );           			    
		Transport.send(message);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	public void sendConfirmation(String email,String username) {

		
		try {
		       final String user = "electroproject84@gmail.com";
		          final String pass = "electrotest123";
				  
				  
					Properties props = System.getProperties();  
					props.setProperty("proxySet", "true");
					//props.setProperty("SocksProxyHost", "192.168.155.1");
					//props.setProperty("SocksProxyPort", "25");
					props.setProperty("mail.smtp.host","smtp.gmail.com");
					props.put("mail.smtp.socketFactory.port", "465");
					//props.setProperty("mail.smtp.starttls.enable", "true");
					props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					props.put("mail.smtp.socketFactory.fallback", "false");
					//props.put("mail.smtp.port", "465");
					props.put("mail.smtp.auth", "true");  
				
				
				  Session session = Session.getDefaultInstance(props, new
				  javax.mail.Authenticator() { protected PasswordAuthentication
				  getPasswordAuthentication() { return new PasswordAuthentication(user,pass); }
				  });
				 
				 
			String sm="	Complete your registration with ElectroGalaxy";		
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.setRecipients(RecipientType.TO,email);
			message.setSubject(sm);
			BodyPart messageBodyPart1 = new MimeBodyPart();    	        
			messageBodyPart1.setContent( "<table><tr><td>Hi&nbsp;"+username+",</td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'><font color='red'>Congratulations!!!</font><br><br></td></tr>" ,"text/html; charset=utf-8" );
			Multipart multipart = new MimeMultipart();  
			multipart.addBodyPart(messageBodyPart1);  
			System.out.println("Inside Mail");
			BodyPart messageBodyPart2 = new MimeBodyPart();    	        
			messageBodyPart2.setContent( "<table><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'>Thank you for registering with www.electro.com. You have an account with username = "+username+". In order to complete your registration, visit the following URL <br><br></td></tr>" ,"text/html; charset=utf-8" );
			multipart.addBodyPart(messageBodyPart2);  
			BodyPart messageBodyPart3 = new MimeBodyPart();    	        
			//messageBodyPart3.setContent( "<table><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'><a href='http://localhost:25697/USPS_Shipping_Label_08-01-2014/confirm.jsp?email="+email+"'> http://localhost:25697/USPS_Shipping_Label_08-01-2014/confirm.jsp?email="+email+"</a><br><br></td></tr><tr><td colspan='2'>Thanking You</td></tr>" ,"text/html; charset=utf-8" );
			messageBodyPart3.setContent( "<table><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td colspan='2'><a href='http://electrogalaxy.in/electroGalaxy/otp.jsp?email="+email+"'>http://electrogalaxy.in/electroGalaxy/otp.jsp?email="+email+"</a><br><br></td></tr><tr><td colspan='2'>Thanking You</td></tr>" ,"text/html; charset=utf-8" );
			multipart.addBodyPart(messageBodyPart3);  
			message.setContent(multipart );           			    
			Transport.send(message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
	}
	/*
	 * public static void main(String[] args) throws MessagingException, Exception {
	 * // TODO Auto-generated method stub String ToEmail="sajimon5joseph@gmail.com";
	 * // to email addrerss String ToUserName="Electro"; // to username new
	 * test().sendConfirmation(ToEmail, ToUserName);
	 * 
	 * }
	 */
	

}
