package cn.library.mapper;

import cn.library.entity.Books;
import cn.library.model.BooksModel;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * <p>
 * 图书信息表 Mapper 接口
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
public interface BooksMapper {

    @Insert("insert into books(book_id, book_name, book_author, press, publication_time, " +
            "book_brief, type_id, create_time, price)\n " +
            "VALUE (#{bookId},#{bookName},#{bookAuthor},#{press},#{publicationTime}," +
            "#{bookBrief},#{typeId},#{createTime},#{price})")
    int addBook(Books books);

    @Select("select count(*)bsd from books where book_id=#{bookId}")
    int bookIdRepeat(@Param("bookId") String bookId);

    // int deleteBook(int bookId);

    @Update("update books\n" +
            "set book_name=#{bookName}," +
            "book_author=#{bookAuthor},\n" +
            "    book_brief=#{bookBrief},\n" +
            "    press=#{press},\n" +
            "    publication_time=#{publicationTime},\n" +
            "    type_id=#{typeId},\n" +
            "    price=#{price}\n" +
            "where book_id = #{bookId}")
    int updateBook(Books books);

    @Delete("delete from books where book_id=#{bookId}")
    int deleteBook(@Param("bookId") String bookId);

    @Select("select * from books left join book_type bt on books.type_id = bt.type_id where book_id =#{bookId}")
    BooksModel bookById(String bookId);

    @Select("select * from books left join book_type bt on books.type_id = bt.type_id where state=0 order by create_time")
    List<BooksModel> list();

    @Select("select * from books left join book_type bt on books.type_id = bt.type_id  order by create_time")
    List<BooksModel> listAdmin();


    @Update("update books set state=#{state} where book_id=#{bookId}")
    int bookState(@Param("state") int state, @Param("bookId") String bookId);


}
