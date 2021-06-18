package cn.library.service.impl;

import cn.library.entity.BookType;
import cn.library.mapper.BookTypeMapper;
import cn.library.service.BookTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 图书类别表 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
@Service
public class BookTypeServiceImpl implements BookTypeService {

    @Autowired
    private BookTypeMapper mapper;

    @Override
    public PageInfo<BookType> typeInfo(int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<BookType> types = mapper.typeList();
        return new PageInfo<>(types);
    }

    @Override
    public int typeInsert(BookType type) {
        return mapper.typeInsert(type);
    }
}
