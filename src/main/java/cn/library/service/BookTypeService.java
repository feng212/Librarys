package cn.library.service;

import cn.library.entity.BookType;
import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * <p>
 * 图书类别表 服务类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
public interface BookTypeService  {
    PageInfo<BookType> typeInfo(int pageIndex,int pageSize);
    int typeInsert(BookType type);
}
