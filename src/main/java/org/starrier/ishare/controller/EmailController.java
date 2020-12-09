package org.starrier.ishare.controller;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.starrier.ishare.service.EmailService;

import static org.starrier.ishare.constant.EmailConstant.FROM;

@RestController
@RequestMapping("/email")
public class EmailController {

    private final JavaMailSender javaMailSender;

    private final EmailService emailService;

    public EmailController(JavaMailSender javaMailSender, EmailService emailService) {
        this.javaMailSender = javaMailSender;
        this.emailService = emailService;
    }

    @RequestMapping("/send")
    public void senMsg() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(FROM);
        String toEmail = "3241807181@qq.com";
        message.setTo(toEmail);
        message.setSubject("spring email test!!!!");
        message.setText("收到的邮件内容：spring email test ！！！");
        javaMailSender.send(message);
    }

    @RequestMapping("/result")
    public void sendResult(@RequestParam("username") String username) {
        emailService.sendHaveRestMessage(username);
    }
}
