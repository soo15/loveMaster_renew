package com.common.service.impl;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.common.service.MailService;

@Service
public class MailServiceImpl implements MailService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private JavaMailSenderImpl mailSender;

	@Override
	public void sendMail(Map<String, String> paramMap) {
		String[] mailSize = paramMap.get("to").split(",") ;
		for( String mails : mailSize ) {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
	    		@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
	    			final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	    			helper.setFrom("webmaster@chest.or.kr"); 
	    			helper.setTo( mails.trim() ); 
	    			helper.setSubject(paramMap.get("title")); 
	    			helper.setText( paramMap.get("content") , true);
	    		} 
	    	};
	    	mailSender.send(preparator);
		}
	}
    
}




