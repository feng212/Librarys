package cn.library.mapper;

import cn.library.entity.BookDamage;
import cn.library.entity.Books;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 报损信息表 Mapper 接口
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-18
 */
public interface BookDamageMapper  {

    @Select("select * from book_damage order by damage_time")
    List<BookDamage> damageList();

    @Insert("insert into book_damage(book_id, damage_time, damage_reason, damage_results, price,book_name)\n" +
            " VALUE (#{bookId},#{damageTime},#{damageReason},#{damageResults},#{price},#{bookName})")
    int damageAdd(BookDamage damage);

    @Select("select * from books where book_id=#{bookId}")
    Books getByBookId(String bookId);

}
