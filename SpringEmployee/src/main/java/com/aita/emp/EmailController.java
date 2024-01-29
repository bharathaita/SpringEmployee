package com.aita.emp;

import java.io.ByteArrayOutputStream;
import java.time.LocalDateTime;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


@RestController
public class EmailController 
{
	
	    private final JavaMailSender mailSender;
	    private HttpSession session;

	    @Autowired
	    private EmpService empService;
	    public EmailController(JavaMailSender mailSender) {
	        this.mailSender = mailSender;
	    }

//	    @PostMapping("/sendEmail")
//	    public RedirectView sendEmail(@RequestParam String emailId) {
//	    System.out.println("1st"+emailId);
//	        try {
//	            
//	            SimpleMailMessage message = new SimpleMailMessage();
//	            message.setTo(emailId);
//	            message.setSubject("Reset Password");
//	            String resetLink = "http://localhost:8080/SpringEmployee/ResetPwd.jsp?emailId="+emailId;
//	            message.setText("Click on the link to reset your password." + resetLink);
//	            System.out.println("2nd"+emailId);
//	            
//	            mailSender.send(message);
//
//	            return new RedirectView("/SpringEmployee/Mail.jsp");
//	        } catch (Exception e) {
//	        System.out.println("3rd"+emailId);
//	            return new RedirectView("/SpringEmployee/InvalidMail.jsp");
//	        }
//	    }
	    
	    @PostMapping("/sendEmail")
	    public RedirectView sendEmail(@RequestParam String emailId,HttpSession session)
	    {
	    	this.session = session;
	    	try
	    	{
	    		session.setAttribute("emailId", emailId);
	    		String redirectUrl = "/SpringEmployee/Mail.jsp";
	    		return new RedirectView(redirectUrl);
	    	}
	    	catch(Exception e)
	    	{
	    		String redirectUrl = "/SpringEmployee/Login.jsp";
	    		return new RedirectView(redirectUrl);
	    	}
	    }
	
	    //Reset Password at scheduled time
	    
	    @Scheduled(cron = "00 58 15 * * ?")
	    public void scheduleSendEmail()
	    {
	    	String emailId =(String) session.getAttribute("emailId");
	    	try
	    	{
	    		SimpleMailMessage msg = new SimpleMailMessage();
	    		msg.setTo(emailId);
	    		msg.setSubject("Reset Your Password");
	    		String resetLink = "http://localhost:8080/SpringEmployee/ResetPwd.jsp?emailId="+emailId;
	            msg.setText("Click on the link to reset your password." + resetLink);
	            
	            mailSender.send(msg);
	            LocalDateTime currentTime = LocalDateTime.now();
	            System.out.println("Scheduled mail sent to "+emailId+" at "+currentTime);
	    	}
	    	catch(Exception e)
	    	{
	    		System.out.println("Failed to send mail to "+emailId);
	    	}
	    }
	    
}











