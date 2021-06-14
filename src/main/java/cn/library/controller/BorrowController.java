package cn.library.controller;


import cn.library.entity.Borrow;
import cn.library.entity.User;
import cn.library.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
@Controller
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    private BorrowService service;

    /**
     * 借书管理界面
     * @return
     */
    @GetMapping("borrowIndex")
    public String borrowIndex() {
        return "borrowIndex";
    }


    /**
     * 添加 出借
     *
     * @param bookId
     * @return
     */
    @GetMapping("borrowInsert")
    public ModelAndView borrowInsert(String bookId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        User user = (User) session.getAttribute("user");
        Borrow borrow = new Borrow();

        borrow.setBookId(bookId);
        borrow.setUserId(user.getUserId());
        borrow.setBorrowTime(new Date());
        service.borrowInsert(borrow);//添加出借信息
        service.bookState(1, bookId);//更改图书状态为已出借
        modelAndView.addObject("borrowSuccess", "borrowSuccess");
        modelAndView.setViewName("bookIndex");
        return modelAndView;
    }

}
