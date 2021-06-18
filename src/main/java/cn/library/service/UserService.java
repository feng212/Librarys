package cn.library.service;

import cn.library.entity.User;
import cn.library.model.BooksModel;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import javax.jws.soap.SOAPBinding;

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
    PageInfo<User> userList(int pageIndex, int pageSize);
    User getById(@Param("userId") Integer userId);
    int update(@Param("userId") Integer userId, @Param("loginTime")String loginTime);
}
