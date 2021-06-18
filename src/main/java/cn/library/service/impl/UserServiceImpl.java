package cn.library.service.impl;

import cn.library.entity.User;
import cn.library.mapper.UserMapper;
import cn.library.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public User findByUserName(String userName, String passWord) {
        return mapper.findByUserName(userName, passWord);
    }

    @Override
    public PageInfo<User> userList(int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<User> userList = mapper.list();
        return new PageInfo<>(userList);
    }

    @Override
    public User getById(Integer userId) {
        return mapper.getById(userId);
    }

    @Override
    public int update(Integer userId, String loginTime) {
        return mapper.update(userId, loginTime);
    }
}
