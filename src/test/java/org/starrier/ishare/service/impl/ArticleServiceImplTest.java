package org.starrier.ishare.service.impl;

import org.junit.Before;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.support.membermodification.MemberModifier;
import org.powermock.core.classloader.annotations.PowerMockIgnore;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.powermock.modules.junit4.PowerMockRunnerDelegate;
import org.starrier.ishare.dao.ArticleDao;
import org.starrier.ishare.service.EmailService;

/**
 * @author starrier
 * @date 2020/12/9
 */
@RunWith(PowerMockRunner.class)
@PowerMockRunnerDelegate()
@PowerMockIgnore({"javax.management.*", "javax.net.ssl.*"})
@PrepareForTest({})
class ArticleServiceImplTest {

    @InjectMocks
    private ArticleServiceImpl articleService;

    @Mock
    private ArticleDao articleDao;

    @Mock
    private EmailService emailService;


    @Before
    public void before() throws Exception {
        MockitoAnnotations.initMocks(this);
        MemberModifier
                .field(ArticleDao.class, "articleDao")
                .set(articleService, articleDao);
        MemberModifier
                .field(EmailService.class, "emailService")
                .set(articleService, emailService);
    }


    @Test
    void addArticle() {
    }

    @Test
    void findAllArticle() {
    }

    @Test
    void getArticlesByCategoryId() {
    }

    @Test
    void getArticlesByDate() {
    }

    @Test
    void getArticlesByKeyword() {
    }

    @Test
    void getArticleById() {
    }

    @Test
    void addComment() {
    }

    @Test
    void showComment() {
    }

    @Test
    void getUserArticle() {
    }

    @Test
    void getArticlesByAuthor() {
    }

    @Test
    void update() {
    }

    @Test
    void deleteByArticleId() {
    }
}