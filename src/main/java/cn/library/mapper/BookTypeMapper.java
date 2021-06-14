package cn.library.mapper;

import cn.library.entity.BookType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 图书类别表 Mapper 接口
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
public interface BookTypeMapper  {

    @Select("select * from book_type order by type_id")
    List<BookType> typeList();

}
