package org.starrier.ishare.service.impl;

import com.google.common.collect.Sets;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.starrier.ishare.dao.ArticleDao;
import org.starrier.ishare.model.entity.Article;
import org.starrier.ishare.model.entity.Comment;
import org.starrier.ishare.service.ArticleService;
import org.starrier.ishare.service.EmailService;
import org.starrier.ishare.util.SensitiveWordUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import static org.starrier.ishare.constant.EmailConstant.TEN;
import static org.starrier.ishare.constant.EmailConstant.TWENTY;
import static org.starrier.ishare.util.Constant.ARTICLE_ID;
import static org.starrier.ishare.util.Constant.AUTHOR;
import static org.starrier.ishare.util.Constant.CATEGORY;
import static org.starrier.ishare.util.Constant.CONTENT;
import static org.starrier.ishare.util.Constant.DATE;
import static org.starrier.ishare.util.Constant.DATE_FORMAT;
import static org.starrier.ishare.util.Constant.ID;
import static org.starrier.ishare.util.Constant.TITLE;

/**
 * @author Starrier
 * @date 2019/4/14
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    private final ArticleDao articleDao;

    private final EmailService emailService;

    private final SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DATE_FORMAT);

    public ArticleServiceImpl(ArticleDao articleDao, EmailService emailService) {
        this.articleDao = articleDao;
        this.emailService = emailService;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addArticle(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter(TITLE);
        String content = request.getParameter(CONTENT);
        int categoryId = Integer.parseInt(request.getParameter(CATEGORY));
        String author = request.getParameter(AUTHOR);
        Article article = Article.builder().title(title).content(content).date(simpleDateFormat.format(new Date()))
                .summary(content).categoryId(categoryId).author(author).build();
        articleDao.writeBlog(article);

        Set<String> sensitiveWordSet = Sets.newHashSetWithExpectedSize(7);
        sensitiveWordSet.add("太多");
        sensitiveWordSet.add("爱恋");
        sensitiveWordSet.add("静静");
        sensitiveWordSet.add("哈哈");
        sensitiveWordSet.add("啦啦");
        sensitiveWordSet.add("感动");
        sensitiveWordSet.add("发呆");
        //初始化敏感词库
        SensitiveWordUtil.init(sensitiveWordSet);
        Set<String> set = SensitiveWordUtil.getSensitiveWord(article.getContent());
        if (set.size() < TEN) {
            emailService.sendHealthMessage(author);
        } else if ((set.size() > TEN) && (set.size() < TWENTY)) {
            emailService.sendHaveRestMessage(author);
        } else {
            emailService.sendSickMessage(author);
        }
    }

    @Override
    public List<Article> findAllArticle() {
        return articleDao.findAllArticle();
    }

    @Override
    public List<Article> getArticlesByCategoryId(int id) {
        return articleDao.getArticlesByCategoryId(id);
    }

    @Override
    public List<Article> getArticlesByDate(String date) {
        return articleDao.getArticlesByDate(date);
    }

    @Override
    public List<Article> getArticlesByKeyword(String keyword) {
        return articleDao.getArticlesByKeyword(keyword);
    }

    @Override
    public Article getArticleById(int id) {
        return articleDao.getArticleById(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addComment(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter(CONTENT);
        int articleId = Integer.parseInt(request.getParameter(ARTICLE_ID));
        Comment comment = Comment.builder().articleId(articleId).comment(content).date(simpleDateFormat.format(new Date())).build();
        articleDao.addComment(comment);
    }

    @Override
    public List<Comment> showComment(int articleId) {
        return articleDao.showComment(articleId);
    }

    @Override
    public List<Article> getUserArticle(String value) {
        return articleDao.getUserArticle(value);
    }

    @Override
    public List<Article> getArticlesByAuthor(String author) {
        return articleDao.getArticlesByAuthor(author);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response) {

        String content = request.getParameter(CONTENT);
        int id = Integer.parseInt(request.getParameter(ID));
        String date = request.getParameter(DATE);
        Article article = Article.builder().content(content).id(id).date(date).build();
        articleDao.update(article);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByArticleId(int id) {
        articleDao.delete(id);
    }


}
