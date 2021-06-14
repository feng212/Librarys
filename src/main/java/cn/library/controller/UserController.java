package cn.library.controller;


import cn.library.entity.User;
import cn.library.model.Navigate;
import cn.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
     *  登录
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
//            List<Navigate> navigateList = new ArrayList<>();
//            if ("0".equals(user.getIsAdmin())) {
//
//                navigateList.add(new Navigate("个人信息", "self"));
//                navigateList.add(new Navigate("图书管理", "books"));
//                navigateList.add(new Navigate("借阅管理", "borrow"));
//            } else {
//                navigateList.add(new Navigate("图书管理", "books"));
//                navigateList.add(new Navigate("借阅管理", "borrow"));
//                navigateList.add(new Navigate("用户管理", "users"));
//                navigateList.add(new Navigate("报损管理", "damaged"));
//            }
//            model.addAttribute("navigateList", navigateList);

            return "/home";
        } else {
            //登录失败，设置失败信息，并调转到登录页面
            //model.addObject("msg", "账号或密码错误，请重新登录");
        }

        return "";
    }

    /**
     * 主页
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
//        List<Navigate> navigateList = new ArrayList<>();
//        if ("0".equals(user.getIsAdmin())) {
//
//            navigateList.add(new Navigate("个人信息", "self"));
//            navigateList.add(new Navigate("图书管理", "books"));
//            navigateList.add(new Navigate("借阅管理", "borrow"));
//        } else {
//            navigateList.add(new Navigate("图书管理", "books"));
//            navigateList.add(new Navigate("借阅管理", "borrow"));
//            navigateList.add(new Navigate("用户管理", "users"));
//            navigateList.add(new Navigate("报损管理", "damaged"));
//        }
//        model.addAttribute("navigateList", navigateList);
        return "home";
    }

    @GetMapping("navigateList")
    public String navigateList(Model model, int isAdmin) {

        List<Navigate> navigateList = new ArrayList<>();
        if ("0".equals(isAdmin)) {
            navigateList.add(new Navigate("个人信息", "self"));
            navigateList.add(new Navigate("图书管理", "books"));
            navigateList.add(new Navigate("借阅管理", "borrow"));
        } else {
            navigateList.add(new Navigate("图书管理", "books"));
            navigateList.add(new Navigate("借阅管理", "borrow"));
            navigateList.add(new Navigate("用户管理", "users"));
            navigateList.add(new Navigate("报损管理", "damaged"));
        }
         model.addAttribute("navigateList", navigateList);
        return "/home";
    }

    @GetMapping("userIndex")
    public String userIndex(){
        return "/userIndex";
    }
}
