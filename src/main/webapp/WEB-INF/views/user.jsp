<%--
  Created by IntelliJ IDEA.
  User: feng
  Date: 2021/6/14
  Time: 上午10:45
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
<div class="container-fluid">
    <div class="col-sm-12" id="right">
        <ol class="breadcrumb">
            <li class="active">菜单
            </li>
            <li class="active">用户管理
            </li>
        </ol>

        <div class="panel panel-default">
            <div class="panel-heading">
                搜索
            </div>
            <div class="panel-body">
                <form role="form" class="form-inline">
                    <div class="form-group">
                        <label for="name">姓名</label>
                        <input type="text" class="form-control" id="name" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                        <label for="name">状态</label>
                        <select class="form-control">
                            <option>正常</option>
                            <option>禁用</option>
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
                    <th>用户名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>邮箱</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>15</td>
                    <td>ZZZ</td>
                    <td>女</td>
                    <td>33</td>
                    <td>aaa@163.com</td>
                    <td>正常</td>
                    <td>
                        <div class="btn-group">
                            <a href="" class="btn btn-default">修改</a><a href="" class="btn btn-default">禁用</a><a href="" class="btn btn-danger">删除</a>
                        </div>

                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <ul class="pagination" style="float: right;">
            <li><a href="#">&laquo;</a>
            </li>
            <li class="active"><a href="#">1</a>
            </li>
            <li class="disabled"><a href="#">2</a>
            </li>
            <li><a href="#">3</a>
            </li>
            <li><a href="#">4</a>
            </li>
            <li><a href="#">5</a>
            </li>
            <li><a href="#">&raquo;</a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
