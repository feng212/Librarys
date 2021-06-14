<%--
  Created by IntelliJ IDEA.
  User: feng
  Date: 2021/6/8
  Time: 下午6:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>


    <title>登录界面</title>
</head>


<body style=" background: url(http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg) no-repeat center center fixed; background-size: 100%;">

<div class="modal-dialog" style="margin-top: 10%;">
    <div class="modal-content">
        <form method="post" action="/user/toLogin">
        <div class="modal-header">

            <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
        </div>

        <div class="modal-body" id="model-body">
            <div class="form-group">

                <input id="userName" type="text" name="userName" class="form-control" placeholder="用户名" autocomplete="off">
            </div>
            <div class="form-group">

                <input id="passWord" type="text" name="passWord" class="form-control" placeholder="密码" autocomplete="off">
            </div>
        </div>
        <div class="modal-footer">
            <div class="form-group">
                <button type="submit" class="btn btn-primary form-control" onclick="login()">登录</button>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-default form-control">注册</button>
            </div>

        </div>
        </form>
    </div><!-- /.modal-content -->

</div><!-- /.modal -->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.15.0/umd/popper.min.js"
        integrity="sha384-L2pyEeut/H3mtgCBaUNw7KWzp5n9+4pDQiExs933/5QfaTh8YStYFFkOzSoXjlTb"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    function login() {
        //获取两个文本框中的内容
        // var a={
        //     "userName":document.getElementById("userName").value.toString(),
        //     "passWord":document.getElementById("passWord").value.toString()
        // }
        //
        // $.ajax({
        //     type: "POST",
        //     async:false,
        //     url: "user/toLogin",
        //     contentType: "application/x-www-form-urlencoded", //必须这样写
        //     //dataType: "json",
        //     data: {
        //         "userName": document.getElementById("userName").value,
        //         "passWord": document.getElementById("passWord").value
        //     },
        //     success: function (data) {
        //         console.log(data)
        //       // window.location.href="home.jsp"
        //         window.location.href="/user/home"
        //     }
        // })
    }
</script>
</body>
</html>
