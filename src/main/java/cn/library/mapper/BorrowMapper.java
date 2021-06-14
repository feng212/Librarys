package cn.library.mapper;

import cn.library.entity.Borrow;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
public interface BorrowMapper  {


    @Select("select * from boorow")
    List<Borrow> list();

    @Insert("insert into borrow(book_id, user_id, borrow_time, return_time)" +
            " VALUE (#{bookId},#{userId},#{borrowTime},#{returnTime})")
    int borrowInsert(Borrow borrow);
}
