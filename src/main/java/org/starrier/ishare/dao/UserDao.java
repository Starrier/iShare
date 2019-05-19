package org.starrier.ishare.dao;

import org.apache.ibatis.annotations.Param;
import org.starrier.ishare.model.entity.User;

import java.util.List;

/**
 * UserDao.
 *
 * @author Starrier
 * @date 2019/4/11.
 */
public interface UserDao {
    /**
     * Get username and password
     *
     * @param username 登录用户名
     * @return {@link User}
     */
    User findByUsername(@Param("username") String username);

    /**
     * Sign up.
     *
     * @param username username
     * @param password password
     */
    void registerByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * Show users.
     *
     * @return List of {@link User}
     */
    List<User> showUser();

    /**
     * Delete by is.
     *
     * @param id id.
     */
    void delete(int id);

    /**
     * Get user by username.
     *
     * @param username {@link User#getUsername()}
     * @return List of {@link User}
     */
    List<User> getUserByUsername(@Param("username") String username);

    /**
     * Add user.
     *
     * @param user {@link User}
     */
    void addUser(User user);

    /**
     * updateUser.
     *
     * @param user {@link User}
     */
    void updateUser(User user);
}
