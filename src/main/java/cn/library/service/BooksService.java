package cn.library.service;

import cn.library.entity.BookType;
import cn.library.entity.Books;
import cn.library.model.BooksModel;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 图书信息表 服务类
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
public interface BooksService {
    int addBook(Books books);
    int bookIdRepeat(@Param("bookId") String bookId);
    int updateBook(Books books);
    BooksModel bookById(String bookId);
    PageInfo<BooksModel> bookList(int pageIndex, int PageSize);
    PageInfo<BooksModel> bookListAdmin(int pageIndex, int PageSize);
    List<BookType> typeList();
    int bookState(int state,String bookId);
    int deleteBook(@Param("bookId") String bookId);
}
