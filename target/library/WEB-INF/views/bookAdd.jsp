<%--
  Created by IntelliJ IDEA.
  User: feng
  Date: 2021/6/13
  Time: 下午5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 水平表单</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-sm-11 column">
            <ol class="breadcrumb">
                <li class="active"><a href="/books/bookIndex">返回</a>
                </li>
                <li class="active">大屏信息
                </li>
            </ol>
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
<script>
    if ("ok".equals(${success})) {
        alert("添加成功")
    }
</script>
</body>
</html>