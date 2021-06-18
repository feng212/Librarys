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
                <li><a href="/user/login">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="container-lg">
    <div class="row">
        <div class="col-sm-2" id="menulist">
            <%--            <c:forEach items="${navigateList}" var="navigate">--%>
            <%--                <a href=${navigate.navigateId} class="list-group-item">--%>
            <%--                        ${navigate.navigateName} </a>--%>
            <%--            </c:forEach>--%>
            <c:choose>
                <c:when test="${sessionScope.user.isAdmin eq 0}">
                    <a href="#" class="list-group-item"
                       onclick="loadPage('${pageContext.request.contextPath}/user/userIndex')">个人信息 </a>
                    <a href="/books/bookIndex" class="list-group-item">图书管理 </a>
                    <a href="/borrow/borrowIndex" class="list-group-item"
                    >借阅管理 </a>
                </c:when>
                <c:otherwise>
                    <a href="#" class="list-group-item" onclick="loadPage('page2')">用户管理 </a>
                    <a href="/books/bookIndex" class="list-group-item">图书管理 </a>
                    <a href="/borrow/borrowIndex" class="list-group-item">借阅管理 </a>
                    <a href="/book-type/bookTypeIndex" class="list-group-item">图书类型 </a>
                    <a href="#" class="list-group-item" onclick="loadPage('WEB-INF/views/borrowIndex.jsp')">报损管理 </a>
                </c:otherwise>
            </c:choose>

        </div>
        <!--左边菜单栏-->
        <div class="col-sm-10" id="right">
            <div class="container">
                <div class="row clearfix">
                    <div class="jumbotron">
                        <form class="form-horizontal" role="form" action="/books/bookInsert" method="post">
                            <div class="form-group">
                                <label for="bookId" class="col-sm-2 control-label">图书编号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="bookId" name="bookId"
                                           placeholder="图书编号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookName" class="col-sm-2 control-label">图书名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="bookName" name="bookName"
                                           placeholder="图书名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookAuthor" class="col-sm-2 control-label">图书作者</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="bookAuthor" name="bookAuthor"
                                           placeholder="图书作者">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="press" class="col-sm-2 control-label">出版社</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="press" name="press"
                                           placeholder="出版社">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="publicationTime" class="col-sm-2 control-label">出版时间</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="publicationTime" name="publicationTime"
                                           placeholder="出版时间">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookBrief" class="col-sm-2 control-label">图书简介信息</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="bookBrief" name="bookBrief"
                                           placeholder="图书简介信息">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="typeIds" class="col-sm-2 control-label">图书类型</label>
                                <select class="form-control" id="typeIds" name="typeIds">
                                    <c:forEach items="${bookTypeList}" var="bookType">
                                        <option value="${bookType.typeId}">${bookType.typeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-sm-2 control-label">单价</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="price" name="price"
                                           placeholder="单价">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">添加</button>
                                </div>
                            </div>
                        </form>
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
