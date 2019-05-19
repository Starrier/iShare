package org.starrier.ishare.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.starrier.ishare.dao.UserDao;
import org.starrier.ishare.model.entity.User;
import org.starrier.ishare.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.util.List;

import static org.starrier.ishare.util.Constant.ID;
import static org.starrier.ishare.util.Constant.PASSWORD;
import static org.starrier.ishare.util.Constant.POWER;
import static org.starrier.ishare.util.Constant.USERNAME;

/**
 * @author Starrier
 * @date 2019/4/11
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    /**
     * check login info.
     *
     * @param username username
     * @param password password
     * @return {@link User}
     */
    @Override
    public User checkLogin(String username, String password) {
        User user = userDao.findByUsername(username);
        return user != null && user.getPassword().equals(password) ? user : null;
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void register(User user) {
        userDao.registerByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public String isExist(String username) {
        User user = userDao.findByUsername(username);
        return null != user ? username : null;
    }

    @Override
    public List<User> findAllUser() {
        return userDao.showUser();
    }


    @Override
    @Transactional(rollbackOn = Exception.class)
    public void deleteUserById(int id) {
        userDao.delete(id);
    }

    @Override
    public List<User> findByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void addUser(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter(USERNAME);
        String password = request.getParameter(PASSWORD);
        String power = request.getParameter(POWER);
        User user = User.builder().username(username).password(password).power(power).build();
        userDao.addUser(user);
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter(ID).trim());
        String username = request.getParameter(USERNAME).trim();
        String password = request.getParameter(PASSWORD).trim();
        String power = request.getParameter(POWER).trim();
        User user = User.builder().id(id).username(username).password(password).power(power).build();
        userDao.updateUser(user);
    }


}
