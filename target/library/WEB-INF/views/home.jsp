<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: feng
  Date: 2021/6/9
  Time: 下午10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <!-- 必须的 meta 标签 -->
    <meta charset="utf-8">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a class="icon-bar" href="#">图书资料管理系统</a>
                </li>
                <li><a href="#">菜单1</a>
                </li>
                <li><a href="#">菜单2</a>
                </li>
                <li><a href="#">菜单3</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>${user.userName}</a>
                </li>
                <li><a href="#">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container-lg">
    <div class="row" >
        <div class="col-sm-2" id="menulist">
            <%--            <c:forEach items="${navigateList}" var="navigate">--%>
            <%--                <a href=${navigate.navigateId} class="list-group-item">--%>
            <%--                        ${navigate.navigateName} </a>--%>
            <%--            </c:forEach>--%>
            <c:choose>
                <c:when test="${sessionScope.user.isAdmin eq 0}">
                    <a href="#" class="list-group-item" onclick="loadPage('${pageContext.request.contextPath}/user/userIndex')">个人信息 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('${pageContext.request.contextPath}/books/bookIndex')">图书管理 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('${pageContext.request.contextPath}/borrow/borrowIndex')">借阅管理 </a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="list-group-item" onclick="loadPage('page2')">用户管理 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('${pageContext.request.contextPath}/books/bookIndex')">图书管理 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('${pageContext.request.contextPath}/borrow/borrowIndex')">借阅管理 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('WEB-INF/views/borrowIndex.jsp')">报损管理 </a>
                </c:otherwise>
            </c:choose>


        </div>
        <!--左边菜单栏-->
        <div class="col-sm-10" id="right">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-sm-11 column">
                        <ol class="breadcrumb">
                            <li class="active">菜单
                            </li>
                            <li class="active">大屏信息
                            </li>
                        </ol>
                        <div class="jumbotron">
                            <h1>
                                Hello, world!
                            </h1>
                            <p>
                                This is a template for a simple marketing or informational website. It includes a large callout
                                called the hero unit and three supporting pieces of content. Use it as a starting point to create
                                something more unique.
                            </p>
                            <p>
                                <a class="btn btn-primary btn-large" href="#">Learn more</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2019 &copy; mylastday.
    </p>
</div>
</body>
<script>




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
