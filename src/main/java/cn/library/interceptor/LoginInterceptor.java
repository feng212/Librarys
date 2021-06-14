package cn.library.interceptor;

import cn.library.entity.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Author 秋水浮萍
 * @Title
 * @Description 登录拦截
 * @Date 2021/6/8下午6:08
 * @Version 1.1.0
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//
//        String uri = request.getRequestURI();
//        //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
//        if (uri.indexOf("/user/login") >= 0)
//            return true;
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
//        if (user != null)
//            return true;
//        request.setAttribute("msg", "您还没有登录，请登录");
//        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
//        return false;
//
//    }
}
