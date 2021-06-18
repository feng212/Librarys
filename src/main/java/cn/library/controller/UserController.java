package cn.library.controller;


import cn.library.entity.User;
import cn.library.model.Navigate;
import cn.library.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author 秋水浮萍
 * @since 2021-06-11
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService service;

    /**
     * 向用户登录界面跳转
     *
     * @return
     */
    @GetMapping("/login")
    public String Login() {
        return "/login";
    }

    /**
     * 登录
     *
     * @param userName
     * @param passWord
     * @param model
     * @param session
     * @return
     */
    @PostMapping("/toLogin")
    public String toLogin(String userName, String passWord, Model model, HttpSession session) {
        //获取用户名密码
        User user = service.findByUserName(userName, passWord);
        if (user != null) {
            //登录成功，将user对象设置到HttpSession作用范围域中
            session.setAttribute("user", user);
            Date date = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            service.update(user.getUserId(), format.format(date));
            return "/home";
        } else {
            //登录失败，设置失败信息，并调转到登录页面
            model.addAttribute("result", "failure");
            return "redirect:login";
        }


    }

    /**
     * 主页
     *
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        return "home";
    }


    /**
     * 个人信息
     *
     * @return
     */
    @GetMapping("userIndex")
    public ModelAndView userIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User user1 = (User) session.getAttribute("user");
        User user = service.getById(user1.getUserId());
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/user/userIndex");
        return modelAndView;
    }

    @GetMapping("userList")
    public ModelAndView userList(@RequestParam(defaultValue = "1") int pageIndex,
                                 @RequestParam(defaultValue = "5") int pageSize) {
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<User> pageInfo = service.userList(pageIndex, pageSize);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("/user/userList");
        return modelAndView;
    }

    @PostMapping("passWord")
    public ModelAndView passWord(String oldWord,String newWord,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        User user1 = (User) session.getAttribute("user");
        if (oldWord.equals(user1.getPassWord())) {

        }else {
            modelAndView.addObject("result", "密码错误");
        }
        User user = service.getById(user1.getUserId());
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/user/userIndex");
        return modelAndView;
    }


}
