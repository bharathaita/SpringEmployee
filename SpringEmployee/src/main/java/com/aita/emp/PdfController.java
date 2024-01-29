package com.aita.emp;

import java.io.ByteArrayOutputStream;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

class PageEventHandler extends PdfPageEventHelper 
{
	private Image logoImage;
	
    public PageEventHandler() 
    {
        try 
        { 
            URL imageUrl = new URL("https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1509672558/gxofuafmm4xexagb5hqw.png");
            logoImage = Image.getInstance(imageUrl);
            logoImage.scaleToFit(100, 120);
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
    }

    public void onEndPage(PdfWriter writer, Document document) 
    {
        int pageNumber = writer.getPageNumber();
        Rectangle pageSize = document.getPageSize();
        PdfContentByte canvas = writer.getDirectContent();       
        
        Phrase pagePhrase = new Phrase("Page " + pageNumber, new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL));
        ColumnText.showTextAligned(canvas, Element.ALIGN_CENTER, pagePhrase, pageSize.getRight(100), pageSize.getBottom(30), pageNumber);

        try 
        {
            logoImage.setAbsolutePosition(60, pageSize.getHeight() -100);
            canvas.addImage(logoImage);
            
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        if(pageNumber>1)
        {
        	logoImage.setPaddingTop(-70);
        }
    }
}

@RestController
public class PdfController 
{
	
	private final JavaMailSender mailSender;
    private HttpSession session;

    @Autowired
    private EmpService empService;
    public PdfController(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
	
	
	@PostMapping("/sendPdfData")
    public RedirectView sendPdfData(@RequestParam String emailId,HttpSession session)
    { 
    	System.out.println("Send Pdf email Called");
    	this.session = session;
    	try
    	{
    		session.setAttribute("emailId", emailId);
    		String redirectUrl = "/SpringEmployee/Mail.jsp";
    		sendEmail();
    		return new RedirectView(redirectUrl);
    	}
    	catch(Exception e)
    	{
    		String redirectUrl = "/SpringEmployee/Login.jsp";
    		return new RedirectView(redirectUrl);
    	}
    }
    
    public void sendEmail()
    {
    	System.out.println("Send email Called");
    	String emailId =(String) session.getAttribute("emailId");
    	
    	try
    	{
    		List<Employee> employee = empService.getAllEmployee();
    		
    		Document doc = new Document(PageSize.A4);
    		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    		PdfWriter writer = PdfWriter.getInstance(doc, outputStream);
    		
    		PageEventHandler eventHandler = new PageEventHandler();
            writer.setPageEvent(eventHandler);
    		doc.open();
    		
    		
//    		Paragraph heading = new Paragraph("Employee Data", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18));
//    		heading.setAlignment(Element.ALIGN_CENTER);
//    		doc.add(heading);

    		
    		
    		PdfPTable table = new PdfPTable(3);
    		
    		table.setWidthPercentage(100);
    		table.setSpacingBefore(50f);
    		table.setSpacingAfter(0f);
    		table.setPaddingTop(15f);
    		
    		PdfPCell emptyCell = new PdfPCell();
    	    emptyCell.setFixedHeight(50f); 
    	    emptyCell.setBorder(Rectangle.NO_BORDER);
    	    emptyCell.setColspan(3);
    	    emptyCell.setPaddingTop(50f);
    	    table.addCell(emptyCell);
    	    
    		Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.WHITE);
    		PdfPCell headerCell1 = new PdfPCell(new Phrase("Full Name", headerFont));
    		headerCell1.setHorizontalAlignment(Element.ALIGN_CENTER);
    		PdfPCell headerCell2 = new PdfPCell(new Phrase("Email Id", headerFont));
    		headerCell2.setHorizontalAlignment(Element.ALIGN_CENTER);
    		PdfPCell headerCell3 = new PdfPCell(new Phrase("Emp Id", headerFont));
    		headerCell3.setHorizontalAlignment(Element.ALIGN_CENTER);
//    		PdfPCell headerCell4 = new PdfPCell(new Phrase("Password", headerFont));
//    		headerCell3.setHorizontalAlignment(Element.ALIGN_CENTER);

    		headerCell1.setBackgroundColor(BaseColor.BLUE);
    		headerCell2.setBackgroundColor(BaseColor.BLUE);
    		headerCell3.setBackgroundColor(BaseColor.BLUE);
//    		headerCell4.setBackgroundColor(BaseColor.BLUE);

    		headerCell1.setPadding(12);
    		headerCell2.setPadding(12);
    		headerCell3.setPadding(12);
//    		headerCell4.setPadding(8);

    		table.addCell(headerCell1);
    		table.addCell(headerCell2);
    		table.addCell(headerCell3);
//    		table.addCell(headerCell4);

    		
    		
    		for(Employee emp : employee)
    		{
    			PdfPCell fullNameCell = new PdfPCell(new Phrase(emp.getFullName()));
    		    fullNameCell.setPadding(15);  
    		    fullNameCell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		    
    		    PdfPCell emailCell = new PdfPCell(new Phrase(emp.getEmailId()));
    		    emailCell.setPadding(15);  
    		    emailCell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		    
    		    PdfPCell empIdCell = new PdfPCell(new Phrase(emp.getEmpId()));
    		    empIdCell.setPadding(15);  
    		    empIdCell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		    
//    		    PdfPCell passwordCell = new PdfPCell(new Phrase(emp.getPassword()));
//    		    passwordCell.setPadding(10);  
//    		    passwordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
    		    
    			
    			table.addCell(fullNameCell);
    			table.addCell(emailCell);
    			table.addCell(empIdCell);
//    			table.addCell(passwordCell);
    			
    		}
    		
    		doc.add(table);
    		
    		
    		doc.close();
    		
    		writer.close();
    		
    		//create emailmsg
    		
    		MimeMessage msg = mailSender.createMimeMessage();
    		MimeMessageHelper helper = new MimeMessageHelper(msg,true);
    		helper.setTo(emailId);
    		helper.setSubject("All Employee Data");
    		
    		ByteArrayDataSource dataSrc = new ByteArrayDataSource(outputStream.toByteArray(), "application/pdf");
    		helper.addAttachment("Employee_Data.pdf", dataSrc);
    		helper.setText("Dear "+emailId+", \n\n Please find all Employee Data in the Below PDF format",false);
    		
    		mailSender.send(msg);
    		
    		LocalDateTime currentTime = LocalDateTime.now();
    		System.out.println("Mail will be sent to "+emailId);
    	}
    	catch(Exception e)
    	{
    		System.out.println("Failed to send mail to "+emailId);
    	}
    	
    	
    }

}
