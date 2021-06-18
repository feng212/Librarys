package cn.library.controller;


import cn.library.entity.BookType;
import cn.library.entity.Books;
import cn.library.entity.User;
import cn.library.model.BooksModel;
import cn.library.service.BooksService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
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
        return "/book/bookAdd";
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
        return "/book/bookUpdate";
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
                            @RequestParam(defaultValue = "5") int pageSize) {
        return "redirect: bookPage";
    }

    @GetMapping("deleteBook")
    public ModelAndView deleteBook(String bookId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        try {
            BooksModel booksModel = service.bookById(bookId);
            if (1 == booksModel.getState()) {
                modelAndView.addObject("result", "no");
            } else {
                service.deleteBook(bookId);
                modelAndView.addObject("result", "deleteSuccess");
            }
        } catch (Exception e) {
            modelAndView.addObject("result", "no");
        }
        User user = (User) session.getAttribute("user");
        if (0 == user.getIsAdmin()) {
            PageInfo<BooksModel> bookList = service.bookList(1, 5);
            modelAndView.addObject("pageInfo", bookList);
        } else {
            PageInfo<BooksModel> bookList = service.bookListAdmin(1, 5);
            modelAndView.addObject("pageInfo", bookList);
        }

        modelAndView.setViewName("/book/bookIndex");
        return modelAndView;
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
        ModelAndView modelAndView = new ModelAndView();

        Books books = new Books(bookId, bookName, bookAuthor, press, publicationTime, bookBrief, typeIds, new Date(), price, 0);
        int bookIdRepeat = service.bookIdRepeat(bookId);
        List<BookType> list = service.typeList();
        modelAndView.addObject("bookTypeList", list);
        if (0 == bookIdRepeat) {
            service.addBook(books);

            modelAndView.addObject("result", "success");
        } else {
            modelAndView.addObject("result", "bookIdRepeat");
        }
        modelAndView.setViewName("/book/bookAdd");
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
                                   String publicationTime, String bookBrief, Integer typeIds, Double price, HttpSession session) {
        Books books = new Books(bookId, bookName, bookAuthor, press, publicationTime, bookBrief, typeIds, new Date(), price, 0);
        service.updateBook(books);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result", "success");
        User user = (User) session.getAttribute("user");
        if (0 == user.getIsAdmin()) {
            PageInfo<BooksModel> bookList = service.bookList(1, 5);
            modelAndView.addObject("pageInfo", bookList);
        } else {
            PageInfo<BooksModel> bookList = service.bookListAdmin(1, 5);
            modelAndView.addObject("pageInfo", bookList);
        }
        modelAndView.setViewName("/book/bookIndex");
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
                                 @RequestParam(defaultValue = "5") int pageSize, HttpSession session) {
        ModelAndView model = new ModelAndView();
        User user = (User) session.getAttribute("user");
        if (0 == user.getIsAdmin()) {
            PageInfo<BooksModel> bookList = service.bookList(pageIndex, pageSize);
            model.addObject("pageInfo", bookList);
        } else {
            PageInfo<BooksModel> bookList = service.bookListAdmin(pageIndex, pageSize);
            model.addObject("pageInfo", bookList);
        }

        model.setViewName("/book/bookIndex");
        return model;

    }

}
