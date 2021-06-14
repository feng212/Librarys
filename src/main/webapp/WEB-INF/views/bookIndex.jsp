<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: feng
  Date: 2021/6/14
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="col-sm-12 column">
    <ol class="breadcrumb">
        <c:if test="${sessionScope.user.isAdmin eq 1}">
            <li class="active"><a href="/books/book">添加</a></li>
        </c:if>
    </ol>

    <div class="panel panel-default">
        <div class="panel-heading">
            搜索
        </div>
        <div class="panel-body">
            <form role="form" class="form-inline">
                <div class="form-group">
                    <label for="bookName">图书名</label>
                    <input type="text" class="form-control" id="bookName" name="bookName" placeholder="请输入姓名">
                </div>
                <div class="form-group">
                    <label for="bookName">作者名</label>
                    <input type="text" class="form-control" id="bookAuther" name="bookAuther" placeholder="请输入作者">
                </div>
                <div class="form-group">
                    <label for="bookName" id="borrowState">状态</label>
                    <select class="form-control">
                        <option value="0">正常</option>
                        <option value="1">借出</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bookName" id="typeId">状态</label>
                    <select class="form-control">
                        <c:forEach items="${bookTypeList}" var="bookType">
                            <option value=${bookType.value}>${bookType.name}</option>
                        </c:forEach>
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
    <div class="table-responsive">
        <table class="table table-striped ">
            <thead>
            <tr>
                <th>编号</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>类型</th>
                <th>单价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="list">
                <tr>
                    <td>${list.bookId}</td>
                    <td>${list.bookName}</td>
                    <td>${list.bookAuthor}</td>
                    <td>${list.press}</td>
                    <td>${list.typeName}</td>
                    <td>${list.price}</td>
                    <td>
                        <div class="btn-group">
                            <c:choose>
                                <c:when test="${sessionScope.user.isAdmin eq 0 }">
                                    <a href="/borrow/borrowInsert?bookId=${list.bookId}" class="btn btn-default">出借</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/books/bookUpIndex?bookId=${list.bookId}" class="btn btn-default">修改</a>
                                    <a href="" class="btn btn-danger">删除</a>
                                </c:otherwise>
                            </c:choose>

                        </div>

                    </td>
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
                        <li><a href="${pageContext.request.contextPath}/books/bookPage?pageIndex=1&pageSize">首页</a>
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
                                <a href="${pageContext.request.contextPath}/books/bookPage?pageIndex=${pageInfo.pageNum-1}&pageSize"
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
                                            href="${pageContext.request.contextPath}/books/bookPage?pageIndex=${itemPage}&pageSize">${itemPage}</a>
                                </li>
                            </c:if>
                            <%--非当前页 不激活--%>
                            <c:if test="${pageInfo.pageNum != itemPage}">
                                <li>
                                    <a
                                            href="${pageContext.request.contextPath}/books/bookPage?pageIndex=${itemPage}&pageSize">${itemPage}</a>
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
                                <a href="${pageContext.request.contextPath}/books/bookPage?pageIndex=${pageInfo.pageNum+1}&pageSize"
                                   aria-label="Next" class="nextPage">
                                    <span aria-hidden="true">下一页</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a
                                href="${pageContext.request.contextPath}/books/bookPage?pageIndex=${pageInfo.pages}&pageSize">尾页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</div>
</div>
</div>
<script>

    var borrowSuccess = "${borrowSuccess}"
    if (borrowSuccess === "borrowSuccess") {
        alert("出借成功")
    }
    $(function () {
        console.log("我来了")
        $.ajax({
            type: 'GET',
            url: 'navigateList',
            dataType: 'json',
            contentType: "application/x-www-form-urlencoded", //必须这样写
            success: function (result) {
                console.log(result.data);
                //orderList.lists = result.data.order_list;
            }
        });
    })
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
                $(this).attr("href", "${pageContext.request.contextPath}/books/bookPage?pageIndex=" + pageNo + "&pageSize");
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages) {
                var pageNo = curPage + 1;
                $(this).attr("href", "${pageContext.request.contextPath}/books/bookPage?pageIndex=" + pageNo + "&pageSize");
            }
        });
    })

</script>
</body>
</html>
