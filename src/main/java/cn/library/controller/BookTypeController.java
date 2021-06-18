package cn.library.controller;


import cn.library.entity.BookType;
import cn.library.service.BookTypeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 图书类别表 前端控制器
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-14
 */
@Controller
@RequestMapping("/book-type")
public class BookTypeController {


    @Autowired
    private BookTypeService service;


    @GetMapping("bookTypeIndex")
    public String bookIndex() {
        return "redirect: bookInfo";
    }

    @GetMapping("bookInfo")
    public ModelAndView bookInfo(@RequestParam(defaultValue = "1") int pageIndex,
                                 @RequestParam(defaultValue = "5") int pageSize) {

        ModelAndView modelAndView = new ModelAndView();
        PageInfo<BookType> pageInfo = service.typeInfo(pageIndex, pageSize);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("/booktype/bookType");
        return modelAndView;
    }

    @PostMapping("typeAdd")
    public ModelAndView typeAdd(Integer typeId, String typeName) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            BookType type = new BookType();
            type.setTypeId(typeId);
            type.setTypeName(typeName);
            service.typeInsert(type);
            modelAndView.addObject("result", "ass");
            PageInfo<BookType> pageInfo = service.typeInfo(1, 5);
            modelAndView.addObject("pageInfo", pageInfo);

        } catch (Exception e) {
            modelAndView.addObject("result", "cunzai");
        }
        modelAndView.setViewName("/booktype/bookType");
        return modelAndView;
    }

    @PostMapping("typeUpdate")
    public ModelAndView typeUpdate(Integer typeId, String typeName) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            BookType type = new BookType();
            type.setTypeId(typeId);
            type.setTypeName(typeName);
            service.typeInsert(type);
            modelAndView.addObject("result", "ass");
            PageInfo<BookType> pageInfo = service.typeInfo(1, 5);
            modelAndView.addObject("pageInfo", pageInfo);

        } catch (Exception e) {
            modelAndView.addObject("result", "cunzai");
        }
        modelAndView.setViewName("/booktype/bookType");
        return modelAndView;
    }

    @GetMapping("typeDelete")
    public ModelAndView typeDelete(Integer typeId) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            BookType type = new BookType();
            type.setTypeId(typeId);

            service.typeInsert(type);
            modelAndView.addObject("result", "ass");
            PageInfo<BookType> pageInfo = service.typeInfo(1, 5);
            modelAndView.addObject("pageInfo", pageInfo);

        } catch (Exception e) {
            modelAndView.addObject("result", "cunzai");
        }
        modelAndView.setViewName("/booktype/bookType");
        return modelAndView;
    }


}
