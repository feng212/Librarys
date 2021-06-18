package cn.library.controller;

import java.util.Date;


import cn.library.entity.BookDamage;
import cn.library.entity.Books;
import cn.library.model.BooksModel;
import cn.library.service.BookDamageService;
import cn.library.service.BooksService;
import cn.library.service.BorrowService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 报损信息表 前端控制器
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-18
 */
@Controller
@RequestMapping("/book-damage")
public class BookDamageController {

    @Autowired
    private BookDamageService service;

    @Autowired
    private BorrowService borrowService;

    @Autowired
    private BooksService booksService;

    @GetMapping("bookDamageIndex")
    public String bookDamageIndex() {

        return "redirect:damagePage";
    }

    @GetMapping("damagePage")
    public ModelAndView damagePage(@RequestParam(defaultValue = "1") int pageIndex,
                                   @RequestParam(defaultValue = "5") int pageSize) {

        ModelAndView modelAndView = new ModelAndView();
        PageInfo<BookDamage> pageInfo = service.damageList(pageIndex, pageSize);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("damage/damageIndex");
        return modelAndView;
    }

    @PostMapping("damageAdd")
    public ModelAndView damageAdd(String bookId, String damageReason, String damageResults, Double price) {

        ModelAndView modelAndView = new ModelAndView();
        BooksModel books = booksService.bookById(bookId);

        if (books==null){
            modelAndView.addObject("result", "no");
        }else {
            if (0 == books.getState()) {
                booksService.deleteBook(bookId);
            }
            BookDamage damage = new BookDamage();

            damage.setBookId(bookId);
            damage.setDamageTime(new Date());
            damage.setBookName(books.getBookName());
            damage.setDamageReason(damageReason);
            damage.setDamageResults(damageResults);
            damage.setNumber(1);
            damage.setPrice(price);
            service.damageAdd(damage);
            modelAndView.addObject("result", "success");
        }
        PageInfo<BookDamage> pageInfo = service.damageList(1, 5);
        modelAndView.addObject("pageInfo", pageInfo);

        modelAndView.setViewName("damage/damageIndex");
        return modelAndView;
    }

}
