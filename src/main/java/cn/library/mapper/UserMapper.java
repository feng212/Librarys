package cn.library.mapper;

import cn.library.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
public interface UserMapper {


    User findByUserName(@Param("userName") String userName, @Param("passWord") String passWord);

    @Select("select * from user where disabled=0 order by create_time desc")
    List<User> list();

    @Update("update user set login_time=#{loginTime} where user_id=#{userId}")
    int update(@Param("userId") Integer userId, @Param("loginTime") String loginTime);

    @Select("select * from user where user_id=#{userId}")
    User getById(@Param("userId") Integer userId);
}
