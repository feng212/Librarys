package cn.library.mapper;

import cn.library.entity.Borrow;
import cn.library.model.BorrowModel;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

    @Insert("insert into borrow(book_id, user_id, borrow_time)" +
            " VALUE (#{bookId},#{userId},#{borrowTime})")
    int borrowInsert(Borrow borrow);

    @Select("select borrow.*, b.book_name,u.user_name\n" +
            "from borrow\n" +
            "         left join books b on b.book_id = borrow.book_id\n" +
            "        left join user u on u.user_id = borrow.user_id\n" +
            "where borrow.user_id =#{userId} order by return_time is null desc ,borrow_time desc")
    List<BorrowModel> borrowList(@Param("userId") int userId);

    @Select("select borrow.*, b.book_name,u.user_name\n" +
            "from borrow\n" +
            "         left join books b on b.book_id = borrow.book_id\n" +
            "        left join user u on u.user_id = borrow.user_id\n" +
            " order by return_time is null desc ,borrow_time desc")
    List<BorrowModel> borrowAdminList();

    @Update("update borrow set return_time=#{returnTime} where borrow_id=#{borrowId}")
    int borrowReturn(@Param("borrowId") int borrowId,@Param("returnTime") String returnTime);
}
