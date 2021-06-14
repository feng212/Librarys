package cn.library.service.impl;

import cn.library.entity.User;
import cn.library.mapper.UserMapper;
import cn.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Service
public class UserServiceImpl  implements UserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public User findByUserName(String userName, String passWord) {
        return mapper.findByUserName(userName, passWord);
    }
}
