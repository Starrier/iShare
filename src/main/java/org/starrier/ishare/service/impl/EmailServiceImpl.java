package org.starrier.ishare.service.impl;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.starrier.ishare.service.EmailService;

import static org.starrier.ishare.constant.EmailConstant.FROM;
import static org.starrier.ishare.constant.EmailConstant.HAVE_A_REST;
import static org.starrier.ishare.constant.EmailConstant.HAVE_A_REST_CONTENT;
import static org.starrier.ishare.constant.EmailConstant.HEALTH;
import static org.starrier.ishare.constant.EmailConstant.HEALTH_CONTENT;
import static org.starrier.ishare.constant.EmailConstant.SICK;
import static org.starrier.ishare.constant.EmailConstant.SICK_CONTENT;

/**
 * @author Starrier
 * @date 2019/4/28
 */
@Service
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender javaMailSender;

    public EmailServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    /**
     * @param toEmail 收件人的邮箱地址
     */
    @Override
    public void sendHaveRestMessage(String toEmail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(FROM);
        message.setTo(toEmail);
        message.setSubject(HAVE_A_REST);
        message.setText(HAVE_A_REST_CONTENT);
        javaMailSender.send(message);
    }

    @Override
    public void sendHealthMessage(String toEmail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(FROM);
        message.setTo(toEmail);
        message.setSubject(HEALTH);
        message.setText(HEALTH_CONTENT);
        javaMailSender.send(message);
    }

    @Override
    public void sendSickMessage(String toEmail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(FROM);
        message.setTo(toEmail);
        message.setSubject(SICK);
        message.setText(SICK_CONTENT);
        javaMailSender.send(message);
    }
}
