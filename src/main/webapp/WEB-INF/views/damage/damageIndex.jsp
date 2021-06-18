<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
Created by IntelliJ IDEA.
User: feng
Date: 2021/6/9
Time: 下午10:45
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书资料管理系统</title>

    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body onload="func()">
<div class="alert"></div>
<div class="sidebar">
    <!-- sidebartop -->
    <div class="sidebar__top">
        <div class="top">
            <h2>管理面板</h2>
            <div class="humburger">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
        </div>
    </div>
    <!--sidebar navigation -->
    <div class="sidebar__nav">
        <h5>导航菜单</h5>
        <ul class="sidebar__menu">
            <c:choose>
                <c:when test="${sessionScope.user.isAdmin eq 1}">
                    <li class="sidebar__menu--item">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512.001 512.001">
                            <path d="M503.402 228.885L273.684 19.567c-10.083-9.189-25.288-9.188-35.367-.001L8.598 228.886c-8.077 7.36-10.745 18.7-6.799 28.889 3.947 10.189 13.557 16.772 24.484 16.772h36.69v209.721c0 8.315 6.742 15.057 15.057 15.057h125.914c8.315 0 15.057-6.741 15.057-15.057V356.932h74.002v127.337c0 8.315 6.742 15.057 15.057 15.057h125.908c8.315 0 15.057-6.741 15.057-15.057V274.547h36.697c10.926 0 20.537-6.584 24.484-16.772 3.941-10.19 1.273-21.529-6.804-28.89zM445.092 42.73H343.973l116.176 105.636v-90.58c0-8.315-6.741-15.056-15.057-15.056z"/>
                        </svg>
                        <span><a>主页</a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg height="512" viewBox="0 0 512.012 512.012" width="512" xmlns="http://www.w3.org/2000/svg">
                            <path d="M495.266 394.775c11.112-23.435 16.742-48.57 16.742-74.794 0-93.61-74.304-170.285-167.347-174.787-20.968-75.53-89.845-128.213-168.653-128.213-97.047 0-176 78.505-176 175 0 26.224 5.63 51.359 16.742 74.794L.299 349.04c-2.094 10.472 7.144 19.728 17.618 17.656l83.279-16.465c20.862 9.896 43.054 15.426 66.17 16.529 29.148 104.951 146.217 157.593 243.452 111.471 91.207 18.032 84.094 16.75 86.189 16.75 9.479 0 16.56-8.686 14.709-17.941zm-385.17-73.6a15 15 0 00-9.737-1.359l-66.24 13.097 13.049-65.25a14.993 14.993 0 00-1.354-9.77c-10.487-20.516-15.806-42.691-15.806-65.912 0-79.953 65.495-145 146-145 62.915 0 118.319 40.91 137.681 99.417-91.706 11.725-160.775 94.472-151.914 189.891-18.075-1.737-35.391-6.787-51.679-15.114zm354.753 74.488l13.049 65.25-66.24-13.097a15.005 15.005 0 00-9.737 1.359c-20.516 10.487-42.691 15.806-65.912 15.806-79.953 0-145-65.047-145-145s65.047-145 145-145c80.505 0 146 65.047 146 145 0 23.221-5.318 45.396-15.806 65.912a14.992 14.992 0 00-1.354 9.77z"/>
                        </svg>
                        <span><a href="/books/bookIndex">图书管理</a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                             width="512"
                             xmlns="http://www.w3.org/2000/svg">
                            <g>
                                <path d="m144 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m144 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m144 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m467 65h-36v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-130v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-130v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-36c-24.813 0-45 20.187-45 45v332c0 24.813 20.187 45 45 45h422c24.813 0 45-20.187 45-45 0-9.682 0-323.575 0-332 0-24.813-20.187-45-45-45zm-437 45c0-8.271 6.729-15 15-15h36v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h130v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h130v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h36c8.271 0 15 6.729 15 15v59h-452zm437 347h-422c-8.271 0-15-6.729-15-15v-243h452v243c0 8.271-6.729 15-15 15z"/>
                            </g>
                        </svg>
                        <span><a href="/borrow/borrowIndex">借阅管理 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg height="512pt" viewBox="0 0 512 512" width="512pt" xmlns="http://www.w3.org/2000/svg">
                            <path d="M512 256C512 114.512 397.504 0 256 0 114.512 0 0 114.496 0 256c0 140.234 113.54 256 256 256 141.875 0 256-115.121 256-256zM256 30c124.617 0 226 101.383 226 226 0 45.586-13.559 89.402-38.703 126.516-100.969-108.61-273.442-108.805-374.594 0C43.56 345.402 30 301.586 30 256 30 131.383 131.383 30 256 30zM87.414 406.5c89.773-100.695 247.422-100.672 337.168 0-90.074 100.773-247.055 100.805-337.168 0zm0 0"/>
                            <path d="M256 271c49.625 0 90-40.375 90-90v-30c0-49.625-40.375-90-90-90s-90 40.375-90 90v30c0 49.625 40.375 90 90 90zm-60-120c0-33.086 26.914-60 60-60s60 26.914 60 60v30c0 33.086-26.914 60-60 60s-60-26.914-60-60zm0 0"/>
                        </svg>
                        <span> <a href="/user/userList">用户管理 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg height="512pt" viewBox="0 0 512 512" width="512pt" xmlns="http://www.w3.org/2000/svg">
                            <path d="M512 256C512 114.512 397.504 0 256 0 114.512 0 0 114.496 0 256c0 140.234 113.54 256 256 256 141.875 0 256-115.121 256-256zM256 30c124.617 0 226 101.383 226 226 0 45.586-13.559 89.402-38.703 126.516-100.969-108.61-273.442-108.805-374.594 0C43.56 345.402 30 301.586 30 256 30 131.383 131.383 30 256 30zM87.414 406.5c89.773-100.695 247.422-100.672 337.168 0-90.074 100.773-247.055 100.805-337.168 0zm0 0"/>
                            <path d="M256 271c49.625 0 90-40.375 90-90v-30c0-49.625-40.375-90-90-90s-90 40.375-90 90v30c0 49.625 40.375 90 90 90zm-60-120c0-33.086 26.914-60 60-60s60 26.914 60 60v30c0 33.086-26.914 60-60 60s-60-26.914-60-60zm0 0"/>
                        </svg>
                        <span> <a href="/book-damage/bookDamageIndex">报损管理 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path d="M497 51H277.821a14.999 14.999 0 00-14.272 10.386L247.51 111H15c-8.284 0-15 6.716-15 15v320c0 8.284 6.716 15 15 15h482c8.284 0 15-6.716 15-15V66c0-8.284-6.716-15-15-15zM30 141h207.811l-9.698 30H30v-30zm452 290H30V201h209.028a15 15 0 0014.273-10.386L288.736 81H482v350z"/>
                        </svg>
                        <span>     <a href="/book-type/bookTypeIndex">图书类型 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                             width="512"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="m272.066 512h-32.133c-25.989 0-47.134-21.144-47.134-47.133v-10.871c-11.049-3.53-21.784-7.986-32.097-13.323l-7.704 7.704c-18.659 18.682-48.548 18.134-66.665-.007l-22.711-22.71c-18.149-18.129-18.671-48.008.006-66.665l7.698-7.698c-5.337-10.313-9.792-21.046-13.323-32.097h-10.87c-25.988 0-47.133-21.144-47.133-47.133v-32.134c0-25.989 21.145-47.133 47.134-47.133h10.87c3.531-11.05 7.986-21.784 13.323-32.097l-7.704-7.703c-18.666-18.646-18.151-48.528.006-66.665l22.713-22.712c18.159-18.184 48.041-18.638 66.664.006l7.697 7.697c10.313-5.336 21.048-9.792 32.097-13.323v-10.87c0-25.989 21.144-47.133 47.134-47.133h32.133c25.989 0 47.133 21.144 47.133 47.133v10.871c11.049 3.53 21.784 7.986 32.097 13.323l7.704-7.704c18.659-18.682 48.548-18.134 66.665.007l22.711 22.71c18.149 18.129 18.671 48.008-.006 66.665l-7.698 7.698c5.337 10.313 9.792 21.046 13.323 32.097h10.87c25.989 0 47.134 21.144 47.134 47.133v32.134c0 25.989-21.145 47.133-47.134 47.133h-10.87c-3.531 11.05-7.986 21.784-13.323 32.097l7.704 7.704c18.666 18.646 18.151 48.528-.006 66.665l-22.713 22.712c-18.159 18.184-48.041 18.638-66.664-.006l-7.697-7.697c-10.313 5.336-21.048 9.792-32.097 13.323v10.871c0 25.987-21.144 47.131-47.134 47.131zm-106.349-102.83c14.327 8.473 29.747 14.874 45.831 19.025 6.624 1.709 11.252 7.683 11.252 14.524v22.148c0 9.447 7.687 17.133 17.134 17.133h32.133c9.447 0 17.134-7.686 17.134-17.133v-22.148c0-6.841 4.628-12.815 11.252-14.524 16.084-4.151 31.504-10.552 45.831-19.025 5.895-3.486 13.4-2.538 18.243 2.305l15.688 15.689c6.764 6.772 17.626 6.615 24.224.007l22.727-22.726c6.582-6.574 6.802-17.438.006-24.225l-15.695-15.695c-4.842-4.842-5.79-12.348-2.305-18.242 8.473-14.326 14.873-29.746 19.024-45.831 1.71-6.624 7.684-11.251 14.524-11.251h22.147c9.447 0 17.134-7.686 17.134-17.133v-32.134c0-9.447-7.687-17.133-17.134-17.133h-22.147c-6.841 0-12.814-4.628-14.524-11.251-4.151-16.085-10.552-31.505-19.024-45.831-3.485-5.894-2.537-13.4 2.305-18.242l15.689-15.689c6.782-6.774 6.605-17.634.006-24.225l-22.725-22.725c-6.587-6.596-17.451-6.789-24.225-.006l-15.694 15.695c-4.842 4.843-12.35 5.791-18.243 2.305-14.327-8.473-29.747-14.874-45.831-19.025-6.624-1.709-11.252-7.683-11.252-14.524v-22.15c0-9.447-7.687-17.133-17.134-17.133h-32.133c-9.447 0-17.134 7.686-17.134 17.133v22.148c0 6.841-4.628 12.815-11.252 14.524-16.084 4.151-31.504 10.552-45.831 19.025-5.896 3.485-13.401 2.537-18.243-2.305l-15.688-15.689c-6.764-6.772-17.627-6.615-24.224-.007l-22.727 22.726c-6.582 6.574-6.802 17.437-.006 24.225l15.695 15.695c4.842 4.842 5.79 12.348 2.305 18.242-8.473 14.326-14.873 29.746-19.024 45.831-1.71 6.624-7.684 11.251-14.524 11.251h-22.148c-9.447.001-17.134 7.687-17.134 17.134v32.134c0 9.447 7.687 17.133 17.134 17.133h22.147c6.841 0 12.814 4.628 14.524 11.251 4.151 16.085 10.552 31.505 19.024 45.831 3.485 5.894 2.537 13.4-2.305 18.242l-15.689 15.689c-6.782 6.774-6.605 17.634-.006 24.225l22.725 22.725c6.587 6.596 17.451 6.789 24.225.006l15.694-15.695c3.568-3.567 10.991-6.594 18.244-2.304z"/>
                            <path d="m256 367.4c-61.427 0-111.4-49.974-111.4-111.4s49.973-111.4 111.4-111.4 111.4 49.974 111.4 111.4-49.973 111.4-111.4 111.4zm0-192.8c-44.885 0-81.4 36.516-81.4 81.4s36.516 81.4 81.4 81.4 81.4-36.516 81.4-81.4-36.515-81.4-81.4-81.4z"/>
                        </svg>
                        <span>
          设置
        </span>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="sidebar__menu--item">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512.001 512.001">
                            <path d="M503.402 228.885L273.684 19.567c-10.083-9.189-25.288-9.188-35.367-.001L8.598 228.886c-8.077 7.36-10.745 18.7-6.799 28.889 3.947 10.189 13.557 16.772 24.484 16.772h36.69v209.721c0 8.315 6.742 15.057 15.057 15.057h125.914c8.315 0 15.057-6.741 15.057-15.057V356.932h74.002v127.337c0 8.315 6.742 15.057 15.057 15.057h125.908c8.315 0 15.057-6.741 15.057-15.057V274.547h36.697c10.926 0 20.537-6.584 24.484-16.772 3.941-10.19 1.273-21.529-6.804-28.89zM445.092 42.73H343.973l116.176 105.636v-90.58c0-8.315-6.741-15.056-15.057-15.056z"/>
                        </svg>
                        <span><a>主页</a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg height="512" viewBox="0 0 512.012 512.012" width="512" xmlns="http://www.w3.org/2000/svg">
                            <path d="M495.266 394.775c11.112-23.435 16.742-48.57 16.742-74.794 0-93.61-74.304-170.285-167.347-174.787-20.968-75.53-89.845-128.213-168.653-128.213-97.047 0-176 78.505-176 175 0 26.224 5.63 51.359 16.742 74.794L.299 349.04c-2.094 10.472 7.144 19.728 17.618 17.656l83.279-16.465c20.862 9.896 43.054 15.426 66.17 16.529 29.148 104.951 146.217 157.593 243.452 111.471 91.207 18.032 84.094 16.75 86.189 16.75 9.479 0 16.56-8.686 14.709-17.941zm-385.17-73.6a15 15 0 00-9.737-1.359l-66.24 13.097 13.049-65.25a14.993 14.993 0 00-1.354-9.77c-10.487-20.516-15.806-42.691-15.806-65.912 0-79.953 65.495-145 146-145 62.915 0 118.319 40.91 137.681 99.417-91.706 11.725-160.775 94.472-151.914 189.891-18.075-1.737-35.391-6.787-51.679-15.114zm354.753 74.488l13.049 65.25-66.24-13.097a15.005 15.005 0 00-9.737 1.359c-20.516 10.487-42.691 15.806-65.912 15.806-79.953 0-145-65.047-145-145s65.047-145 145-145c80.505 0 146 65.047 146 145 0 23.221-5.318 45.396-15.806 65.912a14.992 14.992 0 00-1.354 9.77z"/>
                        </svg>
                        <span><a href="/books/bookIndex">图书管理</a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                             width="512"
                             xmlns="http://www.w3.org/2000/svg">
                            <g>
                                <path d="m144 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m144 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m144 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m272 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 249h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 313h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m400 377h-32c-8.284 0-15 6.716-15 15s6.716 15 15 15h32c8.284 0 15-6.716 15-15s-6.716-15-15-15z"/>
                                <path d="m467 65h-36v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-130v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-130v-25c0-8.284-6.716-15-15-15s-15 6.716-15 15v25h-36c-24.813 0-45 20.187-45 45v332c0 24.813 20.187 45 45 45h422c24.813 0 45-20.187 45-45 0-9.682 0-323.575 0-332 0-24.813-20.187-45-45-45zm-437 45c0-8.271 6.729-15 15-15h36v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h130v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h130v25c0 8.284 6.716 15 15 15s15-6.716 15-15v-25h36c8.271 0 15 6.729 15 15v59h-452zm437 347h-422c-8.271 0-15-6.729-15-15v-243h452v243c0 8.271-6.729 15-15 15z"/>
                            </g>
                        </svg>
                        <span><a href="/borrow/borrowIndex">借阅管理 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg height="512pt" viewBox="0 0 512 512" width="512pt" xmlns="http://www.w3.org/2000/svg">
                            <path d="M512 256C512 114.512 397.504 0 256 0 114.512 0 0 114.496 0 256c0 140.234 113.54 256 256 256 141.875 0 256-115.121 256-256zM256 30c124.617 0 226 101.383 226 226 0 45.586-13.559 89.402-38.703 126.516-100.969-108.61-273.442-108.805-374.594 0C43.56 345.402 30 301.586 30 256 30 131.383 131.383 30 256 30zM87.414 406.5c89.773-100.695 247.422-100.672 337.168 0-90.074 100.773-247.055 100.805-337.168 0zm0 0"/>
                            <path d="M256 271c49.625 0 90-40.375 90-90v-30c0-49.625-40.375-90-90-90s-90 40.375-90 90v30c0 49.625 40.375 90 90 90zm-60-120c0-33.086 26.914-60 60-60s60 26.914 60 60v30c0 33.086-26.914 60-60 60s-60-26.914-60-60zm0 0"/>
                        </svg>
                        <span> <a href="/user/userIndex">个人信息 </a></span>
                    </li>
                    <li class="sidebar__menu--item">
                        <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                             width="512"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="m272.066 512h-32.133c-25.989 0-47.134-21.144-47.134-47.133v-10.871c-11.049-3.53-21.784-7.986-32.097-13.323l-7.704 7.704c-18.659 18.682-48.548 18.134-66.665-.007l-22.711-22.71c-18.149-18.129-18.671-48.008.006-66.665l7.698-7.698c-5.337-10.313-9.792-21.046-13.323-32.097h-10.87c-25.988 0-47.133-21.144-47.133-47.133v-32.134c0-25.989 21.145-47.133 47.134-47.133h10.87c3.531-11.05 7.986-21.784 13.323-32.097l-7.704-7.703c-18.666-18.646-18.151-48.528.006-66.665l22.713-22.712c18.159-18.184 48.041-18.638 66.664.006l7.697 7.697c10.313-5.336 21.048-9.792 32.097-13.323v-10.87c0-25.989 21.144-47.133 47.134-47.133h32.133c25.989 0 47.133 21.144 47.133 47.133v10.871c11.049 3.53 21.784 7.986 32.097 13.323l7.704-7.704c18.659-18.682 48.548-18.134 66.665.007l22.711 22.71c18.149 18.129 18.671 48.008-.006 66.665l-7.698 7.698c5.337 10.313 9.792 21.046 13.323 32.097h10.87c25.989 0 47.134 21.144 47.134 47.133v32.134c0 25.989-21.145 47.133-47.134 47.133h-10.87c-3.531 11.05-7.986 21.784-13.323 32.097l7.704 7.704c18.666 18.646 18.151 48.528-.006 66.665l-22.713 22.712c-18.159 18.184-48.041 18.638-66.664-.006l-7.697-7.697c-10.313 5.336-21.048 9.792-32.097 13.323v10.871c0 25.987-21.144 47.131-47.134 47.131zm-106.349-102.83c14.327 8.473 29.747 14.874 45.831 19.025 6.624 1.709 11.252 7.683 11.252 14.524v22.148c0 9.447 7.687 17.133 17.134 17.133h32.133c9.447 0 17.134-7.686 17.134-17.133v-22.148c0-6.841 4.628-12.815 11.252-14.524 16.084-4.151 31.504-10.552 45.831-19.025 5.895-3.486 13.4-2.538 18.243 2.305l15.688 15.689c6.764 6.772 17.626 6.615 24.224.007l22.727-22.726c6.582-6.574 6.802-17.438.006-24.225l-15.695-15.695c-4.842-4.842-5.79-12.348-2.305-18.242 8.473-14.326 14.873-29.746 19.024-45.831 1.71-6.624 7.684-11.251 14.524-11.251h22.147c9.447 0 17.134-7.686 17.134-17.133v-32.134c0-9.447-7.687-17.133-17.134-17.133h-22.147c-6.841 0-12.814-4.628-14.524-11.251-4.151-16.085-10.552-31.505-19.024-45.831-3.485-5.894-2.537-13.4 2.305-18.242l15.689-15.689c6.782-6.774 6.605-17.634.006-24.225l-22.725-22.725c-6.587-6.596-17.451-6.789-24.225-.006l-15.694 15.695c-4.842 4.843-12.35 5.791-18.243 2.305-14.327-8.473-29.747-14.874-45.831-19.025-6.624-1.709-11.252-7.683-11.252-14.524v-22.15c0-9.447-7.687-17.133-17.134-17.133h-32.133c-9.447 0-17.134 7.686-17.134 17.133v22.148c0 6.841-4.628 12.815-11.252 14.524-16.084 4.151-31.504 10.552-45.831 19.025-5.896 3.485-13.401 2.537-18.243-2.305l-15.688-15.689c-6.764-6.772-17.627-6.615-24.224-.007l-22.727 22.726c-6.582 6.574-6.802 17.437-.006 24.225l15.695 15.695c4.842 4.842 5.79 12.348 2.305 18.242-8.473 14.326-14.873 29.746-19.024 45.831-1.71 6.624-7.684 11.251-14.524 11.251h-22.148c-9.447.001-17.134 7.687-17.134 17.134v32.134c0 9.447 7.687 17.133 17.134 17.133h22.147c6.841 0 12.814 4.628 14.524 11.251 4.151 16.085 10.552 31.505 19.024 45.831 3.485 5.894 2.537 13.4-2.305 18.242l-15.689 15.689c-6.782 6.774-6.605 17.634-.006 24.225l22.725 22.725c6.587 6.596 17.451 6.789 24.225.006l15.694-15.695c3.568-3.567 10.991-6.594 18.244-2.304z"/>
                            <path d="m256 367.4c-61.427 0-111.4-49.974-111.4-111.4s49.973-111.4 111.4-111.4 111.4 49.974 111.4 111.4-49.973 111.4-111.4 111.4zm0-192.8c-44.885 0-81.4 36.516-81.4 81.4s36.516 81.4 81.4 81.4 81.4-36.516 81.4-81.4-36.515-81.4-81.4-81.4z"/>
                        </svg>
                        <span>
          设置
        </span>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <!-- sidebar profile -->
    <div class="sidebar__profile">
        <div class="avatar">
            <img src="preview/1424582/2020-08-07/dh/img/1.jpg" alt="">
        </div>
        <div class="content">
            <strong>Hello</strong>
            <p>小七</p>
        </div>
        <div class="arrow">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 492.004 492.004">
                <path d="M382.678 226.804L163.73 7.86C158.666 2.792 151.906 0 144.698 0s-13.968 2.792-19.032 7.86l-16.124 16.12c-10.492 10.504-10.492 27.576 0 38.064L293.398 245.9l-184.06 184.06c-5.064 5.068-7.86 11.824-7.86 19.028 0 7.212 2.796 13.968 7.86 19.04l16.124 16.116c5.068 5.068 11.824 7.86 19.032 7.86s13.968-2.792 19.032-7.86L382.678 265c5.076-5.084 7.864-11.872 7.848-19.088.016-7.244-2.772-14.028-7.848-19.108z"/>
            </svg>
        </div>
    </div>
</div>


<div style="margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei'; ">

    <div class="container wids" style=" width: 1050px">


        <div class="panel panel-default wids " style="width: 1050px">
            <div class="panel-heading" style="width: 1050px">
                <div class="col-6">搜索</div>
                <div class="col-6" style="text-align: right">
                    <button type="button" class="btn btn-primary" id="addTypes">添加</button>
                </div>
                <div class="panel-body wids" style="width: 1050px">
                    <form role="form" class="form-inline">
                        <div class="form-group">
                            <label for="bookName">图书名</label>
                            <input type="text" class="form-control" id="bookName" name="bookName" placeholder="请输入姓名">
                        </div>
                        <div class="form-group">
                            <label for="bookName">作者名</label>
                            <input type="text" class="form-control" id="bookAuther" name="bookAuther"
                                   placeholder="请输入作者">
                        </div>
                        <div class="form-group">
                            <label for="bookName" id="borrowState">状态</label>
                            <select class="form-control">
                                <option value="0">正常</option>
                                <option value="1">借出</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default">开始搜索</button>
                        </div>
                    </form>
                </div>
            </div>
            <!--
                列表展示
            -->
            <div class="table-responsive wids" style="width: 1050px">
                <table class="table table-striped ">
                    <thead>
                    <tr>
                        <th>报损id</th>
                        <th>图书编号</th>
                        <th>图书名</th>
                        <th>报损原因</th>
                        <th>处理结果</th>
                        <th>单价</th>
                        <th>报损时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="list">
                        <tr>
                            <td>${list.damageId}</td>
                            <td>${list.bookId}</td>
                            <td>${list.bookName}</td>
                            <td>${list.damageReason}</td>
                            <td>${list.damageResults}</td>
                            <td>${list.price}</td>
                            <td>${list.time}</td>
                        </tr>

                    </c:forEach>
                    </tbody>

                </table>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6" style="line-height: 30px;">
                        当前第<span class="badge">${pageInfo.pageNum}</span>页，
                        共有<span class="badge">${pageInfo.pages}</span>页，
                        总记录数<span class="badge">${pageInfo.total}</span>条。
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation" class="pull-right">
                            <ul class="pagination pagination-sm" style="margin: 0px;">
                                <li>
                                    <a href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=1&pageSize">首页</a>
                                </li>
                                <%--第一页时不可点击上一页--%>
                                <c:if test="${pageInfo.pageNum==1}">
                                    <li class="disabled">
                                        <a href="#" aria-label="Previous" class="prePage">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum!=1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=${pageInfo.pageNum-1}&pageSize"
                                           aria-label="Previous" class="prePage">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>

                                <%--遍历页数--%>
                                <c:forEach items="${pageInfo.navigatepageNums}" step="1" var="itemPage">
                                    <%--当前页 激活--%>
                                    <c:if test="${pageInfo.pageNum == itemPage}">
                                        <li class="active">
                                            <a
                                                    href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=${itemPage}&pageSize">${itemPage}</a>
                                        </li>
                                    </c:if>
                                    <%--非当前页 不激活--%>
                                    <c:if test="${pageInfo.pageNum != itemPage}">
                                        <li>
                                            <a
                                                    href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=${itemPage}&pageSize">${itemPage}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <%--最后页时不可点击下一页--%>
                                <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                                    <li class="disabled" class="nextPage">
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=${pageInfo.pageNum+1}&pageSize"
                                           aria-label="Next" class="nextPage">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li><a
                                        href="${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=${pageInfo.pages}&pageSize">尾页</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<div class="popOutBg"></div>
<div class="popOut">
    <span title="关闭"> x </span>
    <form action="/book-damage/damageAdd" method="post">
        <table>
            <caption>添加报损信息</caption>

            <tr>
                <td width="120">图书编号：</td>
                <td><input type="text" class="inp" placeholder="图书编号" name="bookId"/></td>
            </tr>
            <tr>
                <td>报损原因：</td>
                <td><input type="text" class="inp" placeholder="报损原因" name="damageReason"/></td>
            </tr>
            <tr>
                <td>处理结果：</td>
                <td><input type="text" class="inp" placeholder="处理结果" name="damageResults"/></td>
            </tr>
            <tr>
                <td>单价：</td>
                <td><input type="text" class="inp" placeholder="单价" name="price"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="login" value="提交"/>
                </td>

            </tr>
        </table>
    </form>
</div>


</body>
<style type="text/css">

    a {
        text-decoration: none;
        color: white
    }

    .alert {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        min-width: 200px;
        margin-left: -100px;
        z-index: 99999;
        padding: 15px;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    .alert-success {
        color: #3c763d;
        background-color: #dff0d8;
        border-color: #d6e9c6;
    }

    .alert-info {
        color: #31708f;
        background-color: #d9edf7;
        border-color: #bce8f1;
    }

    .alert-warning {
        color: #8a6d3b;
        background-color: #fcf8e3;
        border-color: #faebcc;
    }

    .alert-danger {
        color: #a94442;
        background-color: #f2dede;
        border-color: #ebccd1;
    }

    * {
        margin: 0;
        padding: 0;
    }

    button, input {
        outline: none;
    }

    button, .login {
        width: 120px;
        height: 42px;
        background: #f40;
        color: #fff;
        border: none;
        border-radius: 6px;
        display: block;
        margin: 20px auto;
        cursor: pointer;
    }

    .popOutBg {
        width: 100%;
        height: 100%;
        position: fixed;
        left: 0;
        top: 0;
        background: rgba(0, 0, 0, .6);
        display: none;
    }

    .popOut {
        position: fixed;
        width: 600px;
        height: 400px;
        top: 50%;
        left: 50%;
        margin-top: -150px;
        margin-left: -300px;
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        display: none;
    }

    .popOut > span {
        position: absolute;
        right: 10px;
        top: 0;
        height: 42px;
        line-height: 42px;
        color: #000;
        font-size: 30px;
        cursor: pointer;
    }

    .popOut table {
        display: block;
        margin: 42px auto 0;
        width: 520px;
    }

    .popOut caption {
        width: 520px;
        text-align: center;
        color: #f40;
        font-size: 18px;
        line-height: 42px;
    }

    .popOut table tr td {
        color: #666;
        padding: 6px;
        font-size: 14px;
    }

    .popOut table tr td:first-child {
        text-align: right;
    }

    .inp {
        width: 280px;
        height: 30px;
        line-height: 30px;
        border: 1px solid #999;
        padding: 5px 10px;
        color: #000;
        font-size: 14px;
        border-radius: 6px;
    }

    .inp:focus {
        border-color: #f40;
    }

    @keyframes ani {
        from {
            transform: translateX(-100%) rotate(-60deg) scale(.5);
        }
        50% {
            transform: translateX(0) rotate(0) scale(1);
        }
        90% {
            transform: translateX(20px) rotate(0) scale(.8);
        }
        to {
            transform: translateX(0) rotate(0) scale(1);
        }
    }

    .ani {
        animation: ani .5s ease-in-out;
    }
</style>
<script src="js/script.js"></script>
<script>
    function $(param) {
        if (arguments[1] == true) {
            return document.querySelectorAll(param);
        } else {
            return document.querySelector(param);
        }
    }

    function ani() {
        $(".popOut").className = "popOut ani";
    }

    $("#addTypes").onclick = function () {
        $(".popOut").style.display = "block";
        ani();
        $(".popOutBg").style.display = "block";
    };
    $(".popOut > span").onclick = function () {
        $(".popOut").style.display = "none";
        $(".popOutBg").style.display = "none";
    };
    $(".popOutBg").onclick = function () {
        $(".popOut").style.display = "none";
        $(".popOutBg").style.display = "none";
    };

    $(function () {
        let url = '/books/bookPage';
        $.ajax(({
            type: 'get', url: url,

        }))

        var curPage = ${ pageInfo.pageNum }; //当前页
        var totalPages = ${ pageInfo.total };//总页数
        //上一页
        $(".prePage").click(function () {
            if (curPage > 1) {
                var pageNo = curPage - 1;
                $(this).attr("href", "${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=" + pageNo + "&pageSize");
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages) {
                var pageNo = curPage + 1;
                $(this).attr("href", "${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=" + pageNo + "&pageSize");
            }
        });
    })

</script>
<script>

    var results = "${result}";
    console.log(results)
    if (results === "no") {
        $('.alert').html('编号不存在').addClass('alert-success').show().delay(2500).fadeOut();
    }
    if (results === "success") {
        $('.alert').html('添加成功').addClass('alert-success').show().delay(2500).fadeOut();
    }
    if (results === "no") {
        $('.alert').html('删除失败').addClass('alert-success').show().delay(2500).fadeOut();
    }
    console.log(results)
    /*
    * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
    * （实现左侧菜单中的标签点击后变色的效果）
    */
    $(document).ready(function () {
        $('#menulist> a').click(function (e) {
            //e.preventDefault(); 加上这句则导航的<a>标签会失效
            $('#menulist> a').removeClass('active');
            $(this).addClass('active');
        });
    });

    $(function () {
        let url = '/books/bookPage';
        $.ajax(({
            type: 'get', url: url,

        }))

        var curPage = ${ pageInfo.pageNum }; //当前页
        var totalPages = ${ pageInfo.total };//总页数
        //上一页
        $(".prePage").click(function () {
            if (curPage > 1) {
                var pageNo = curPage - 1;
                $(this).attr("href", "${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=" + pageNo + "&pageSize");
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages) {
                var pageNo = curPage + 1;
                $(this).attr("href", "${pageContext.request.contextPath}/book-damage/damagePage?pageIndex=" + pageNo + "&pageSize");
            }
        });
    })
    //
    // $(function (){
    //     console.log("我来了")
    //     $.ajax({
    //         type: 'GET',
    //         url:'navigateList',
    //         dataType: 'json',
    //         contentType: "application/x-www-form-urlencoded", //必须这样写
    //         success: function( result ) {
    //             console.log(result.data);
    //             //orderList.lists = result.data.order_list;
    //         }
    //     });
    // })


    function loadPage(url) {
        $.get(url, function (data, status) {
            $("#right").html(data);
        });
    }
</script>
</html>
