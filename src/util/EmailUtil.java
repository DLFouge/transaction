package util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
//发送邮件所依赖的jar包，1.javamail.jar 2.activation.jar
public class EmailUtil
{
	public EmailUtil(){}
	
	//发送邮件
	public void sendEmail(String from,String password,String to,String subject,String messageText)
	{
	
		//String password = "vqeejbuqbavnnrbd";
		
		try
		{
			int n = from.indexOf("@");
			int m = from.length();
			String mailserver = "smtp." + from.substring(n+1,m);
			Properties pro = new Properties();
			pro.put("mail.smtp.host", mailserver);
			pro.put("mail.smtp.auth", true);
			Session sess = Session.getInstance(pro);
			
			MimeMessage message = new MimeMessage(sess);
			
			//设置发件人
			InternetAddress from_mail = new InternetAddress(from);
			System.out.print(from_mail);
			message.setFrom(from_mail);
			
			//设置收件人
			InternetAddress to_mail = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, to_mail);
			
			//设置主题
			message.setSubject(subject);
			
			//设置内容
			message.setContent(messageText,"text/html;charset=gb2312"); 
			
			message.setSentDate(new Date());
			
			message.saveChanges();
			
			//发送邮件
			Transport transport = sess.getTransport("smtp");
			transport.connect(mailserver,from,password);
			transport.sendMessage(message, message.getAllRecipients());
			
			transport.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
