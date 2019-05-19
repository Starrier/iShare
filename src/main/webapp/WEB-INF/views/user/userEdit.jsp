<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-3-17
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/assert/lib/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assert/lib/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assert/lib/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 13px;"><strong>文章管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/index" style="text-decoration: none;"><strong>首页</strong></a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/assert/lib/avatar.jpg" class="layui-nav-img">
                    <strong>${sessionScope.user.userName}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                    <dd><a href="" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                    <hr/>
                    <dd><a href="<%=basePath%>/admin/outLogin.do"
                           style="text-decoration: none"><strong>退出登录</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a style="text-decoration: none">
                    <span class="fa fa-github"></span>
                    <strong>Github</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a style="text-decoration: none"><strong>联系Leader</strong></a></dd>
                    <hr/>
                    <dd><a style="text-decoration: none"><strong>github地址</strong></a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="<%=basePath%>/outLogin"
                                          style="text-decoration: none;"><strong>退出</strong></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="/articleManage" style="text-decoration: none;"><strong><span
                        class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;文章管理</strong></a></li>
                <li class="layui-nav-item"><a href="/userManage" style="text-decoration: none;"><strong><span
                        class="fa fa-twitter fa-fw"></span>&nbsp;&nbsp;&nbsp;用户管理</strong></a></li>
                <li class="layui-nav-item"><a href="" style="text-decoration: none;"><strong><span
                        class="fa fa-send-o fa-fw"></span>&nbsp;&nbsp;&nbsp;联系我们</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="container">
            <div style="margin-top: 60px;">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;">
                        <strong>用户编辑</strong>
                    </legend>
                </fieldset>
            </div>
            <br/>

            <!-- 编辑器的表单 -->
            <div class="layui-form">
                <form action="<%=basePath%>/updateUser" method="post">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="username" id="username" class="layui-input" placeholder="用户名"/>
                        </div>

                        <div class="layui-input-inline">
                            <input type="text" name="password" id="password" class="layui-input" placeholder="密码"/>
                        </div>

                        <div class="layui-input-inline">
                            <input type="text" name="power" id="power" class="layui-input" placeholder="权限"/>
                        </div>

                        <div>
                            <input type="hidden" name="id" value=${id}>

                        </div>

                    </div>


                    <div class="layui-inline" style="margin-top: 20px;">

                        <button type="submit" id="publishBtn" class="layui-btn">发布</button>

                    </div>
                </form>
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            <strong>© 后台管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by iShare</strong>
            <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
        </div>
    </div>
</body>
<script src="<%=basePath%>/assert/lib/layui/layui.js"></script>
<script src="<%=basePath%>/assert/lib/bootstrap.min.js"></script>
<script src="<%=basePath%>/assert/lib/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/assert/lib/layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>


<script type="text/javascript">
    <!-- 初始化layui -->
    layui.use('element', function () {
        var element = layui.element;
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#r_date'
        });
    });
</script>

</html>