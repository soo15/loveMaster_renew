package com.common.service;

import java.util.Map;

public interface MailService {
	
	public void sendMail(Map<String, String> paramMap) throws Exception;	
}