package cn.library.controller;


import cn.library.entity.Borrow;
import cn.library.entity.User;
import cn.library.model.BooksModel;
import cn.library.model.BorrowModel;
import cn.library.service.BooksService;
import cn.library.service.BorrowService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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

    @Autowired
    private BooksService booksService;

    /**
     * 借书管理界面
     *
     * @return
     */
    @GetMapping("borrowIndex")
    public String borrowIndex(Model model, @RequestParam(defaultValue = "1") int pageIndex,
                              @RequestParam(defaultValue = "5") int pageSize, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user.getIsAdmin() == 0) {
            PageInfo<BorrowModel> pageInfo = service.borrowList(user.getUserId(), pageIndex, pageSize);
            model.addAttribute("pageInfo", pageInfo);
        } else {
            PageInfo<BorrowModel> pageInfo = service.borrowAdminList(pageIndex, pageSize);
            model.addAttribute("pageInfo", pageInfo);
        }
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
        PageInfo<BooksModel> pageInfo = booksService.bookList(1, 5);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("bookIndex");
        return modelAndView;
    }

    /**
     * 归还
     *
     * @param bookId
     * @param session
     * @return
     */
    @GetMapping("borrowReturn")
    public ModelAndView borrowReturn(int borrowId, String bookId, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        User user = (User) session.getAttribute("user");
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String returnTime = dateFormat.format(date);
        service.borrowReturn(borrowId, returnTime);
        service.bookState(0, bookId);//更改图书状态为归还
        modelAndView.addObject("result", "returnSuccess");
        if (user.getIsAdmin() == 0) {
            PageInfo<BorrowModel> pageInfo = service.borrowList(user.getUserId(), 1, 5);
            modelAndView.addObject("pageInfo", pageInfo);
        } else {
            PageInfo<BorrowModel> pageInfo = service.borrowAdminList(1, 5);
            modelAndView.addObject("pageInfo", pageInfo);
        }
        modelAndView.setViewName("borrowIndex");
        return modelAndView;
    }




}
