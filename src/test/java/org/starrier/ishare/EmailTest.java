package org.starrier.ishare;

import org.junit.Test;
import org.starrier.ishare.service.impl.EmailServiceImpl;

import javax.annotation.Resource;

import static org.starrier.ishare.util.Constant.TEST_EMAIL_ADDRESS;
import static org.starrier.ishare.util.Constant.TEST_MAIL_CONTENT;

public class EmailTest {

    @Resource
    EmailServiceImpl emailService;

    @Test
    public void send(){

    }
}
