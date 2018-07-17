package com.ss.star.mail.model;

public interface MailService {

	boolean send(String subject, String text, String from, String to);

}
