package cn.library.controller;


import cn.library.entity.BookType;
import cn.library.entity.Books;
import cn.library.model.BooksModel;
import cn.library.service.BooksService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Path;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 图书信息表 前端控制器
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Controller
@RequestMapping("/books")
public class BooksController {

    @Autowired
    private BooksService service;

    /**
     * 跳转到  图书添加界面
     *
     * @return
     */
    @GetMapping("book")
    public String book(Model model) {
        List<BookType> list = service.typeList();
        model.addAttribute("bookTypeList", list);
        return "/bookAdd";
    }

    /**
     * 跳转到  更新图书信息界面
     *
     * @param model
     * @param bookId
     * @return
     */
    @GetMapping("bookUpIndex")
    public String bookUpIndex(Model model, String bookId) {
        List<BookType> list = service.typeList();
        BooksModel booksModel = service.bookById(bookId);
        model.addAttribute("books", booksModel);
        model.addAttribute("bookTypeList", list);
        return "/bookUpdate";
    }

    /**
     * 跳转到 图书管理界面
     *
     * @param model
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @GetMapping("bookIndex")
    public String bookIndex(Model model, @RequestParam(defaultValue = "1") int pageIndex,
                            @RequestParam(defaultValue = "10") int pageSize) {
        PageInfo<BooksModel> pageInfo = service.bookList(pageIndex, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "/bookIndex";
    }

    /**
     * 操作： 图书信息添加
     *
     * @param bookId
     * @param bookName
     * @param bookAuthor
     * @param press
     * @param publicationTime
     * @param bookBrief
     * @param typeIds
     * @param price
     * @return
     */
    @PostMapping("bookInsert")
    public ModelAndView bookInsert(String bookId, String bookName, String bookAuthor, String press,
                                   String publicationTime, String bookBrief, Integer typeIds, Double price) {
        Books books = new Books(bookId, bookName, bookAuthor, press, publicationTime, bookBrief, 1, new Date(), price, 0);
        service.addBook(books);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("success", "ok");
        modelAndView.setViewName("bookAdd");
        return modelAndView;
    }

    /**
     * 操作： 图书信息修改
     *
     * @param bookId
     * @param bookName
     * @param bookAuthor
     * @param press
     * @param publicationTime
     * @param bookBrief
     * @param typeIds
     * @param price
     * @return
     */
    @PostMapping("bookUpdate")
    public ModelAndView bookUpdate(String bookId, String bookName, String bookAuthor, String press,
                                   String publicationTime, String bookBrief, Integer typeIds, Double price) {
        Books books = new Books(bookId, bookName, bookAuthor, press, publicationTime, bookBrief, 1, new Date(), price, 0);
        service.updateBook(books);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("success", "ok");
        modelAndView.setViewName("bookUpdate");
        return modelAndView;
    }


    /**
     * 返回查询信息
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */

    @GetMapping("bookPage")
    public ModelAndView bookPage(@RequestParam(defaultValue = "1") int pageIndex,
                                 @RequestParam(defaultValue = "10") int pageSize) {
        ModelAndView model = new ModelAndView();
        PageInfo<BooksModel> bookList = service.bookList(pageIndex, pageSize);
        model.addObject("pageInfo", bookList);
        model.setViewName("bookIndex");
        return model;

    }

}
