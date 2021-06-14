package cn.library.service;

import cn.library.entity.User;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
public interface UserService  {
    User findByUserName(String userName, String passWord);
}
