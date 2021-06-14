package cn.library.service.impl;

import cn.library.entity.BookType;
import cn.library.entity.Books;
import cn.library.mapper.BookTypeMapper;
import cn.library.mapper.BooksMapper;
import cn.library.model.BooksModel;
import cn.library.service.BooksService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 图书信息表 服务实现类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Service
public class BooksServiceImpl implements BooksService {

    @Autowired
    private BooksMapper mapper;

    @Autowired
    private BookTypeMapper typeMapper;

    @Override
    public int addBook(Books books) {
        return mapper.addBook(books);
    }

    @Override
    public int updateBook(Books books) {
        return mapper.updateBook(books);
    }

    @Override
    public BooksModel bookById(String bookId) {
        return mapper.bookById(bookId);
    }

    @Override
    public PageInfo<BooksModel> bookList(int pageIndex, int PageSize) {
        PageHelper.startPage(pageIndex, PageSize);
        List<BooksModel> list = mapper.list();
        return new PageInfo<>(list);
    }

    @Override
    public List<BookType> typeList() {
        return typeMapper.typeList();
    }

    @Override
    public int bookState(int state, String bookId) {
        return mapper.bookState(state, bookId);
    }
}
