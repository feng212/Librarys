package cn.library.mapper;

import cn.library.entity.User;
import org.apache.ibatis.annotations.Param;

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
}
