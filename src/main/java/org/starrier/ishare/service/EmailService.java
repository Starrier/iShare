package org.starrier.ishare.service;

public interface EmailService {

    void sendHaveRestMessage(String toEmail);

    void sendHealthMessage(String toEmail );

    void sendSickMessage(String toEmail );
}
