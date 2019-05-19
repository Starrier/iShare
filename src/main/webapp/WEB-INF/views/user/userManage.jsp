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
        <div class="layui-logo" style="font-size: 13px;"><strong>后台管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/home" style="text-decoration: none;"><strong>首页</strong></a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/assert/lib/avatar.jpg" class="layui-nav-img">
                    <strong>${sessionScope.user.username}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                    <dd><a href="" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                    <hr/>
                    <dd><a href="<%=basePath%>/outLogin" style="text-decoration: none"><strong>退出登录</strong></a></dd>
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
            <li class="layui-nav-item"><a href="<%=basePath%>/admin/outLogin.do" style="text-decoration: none;"><strong>退出</strong></a>
            </li>
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
        <div class="container" style="width: 90%;">
            <br/>
            <br/>
            <fieldset class="layui-elem-field layui-field-title">
                <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;">
                    <strong>用户信息列表</strong></legend>
            </fieldset>
            <br/>
            <h5 style="margin-top: -20px;">
                <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
                <span style="color: #299A74;"><strong>输入查询信息</strong></span>
            </h5>
            <hr style="margin-top: 0;"/>
            <div class="form table">
                <div>
                    <form class="layui-form form-inline" action="/findByUsername" role="form" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label"
                                   style="margin-left: -10px;padding-left:0;"><strong>用户名</strong></label>
                            <div class="layui-input-inline">
                                <input name="findByUsername" placeholder="请输入用户名查询" class="layui-input" type="text">
                            </div>

                            <div class="layui-input-inline" style="margin-left: 50px;">
                                <button class="layui-btn" type="submit">查询</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <h5>
                <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
                <span style="color: #299A74;"><strong>查询结果展示</strong></span>
            </h5>
            <hr style="margin-top: 0;"/>
            <div class="layui-inline">
                <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
                <a href="<%=basePath%>/add">
                    <button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button>
                </a>
            </div>

            <br/>
            <br/>
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="countTable">
                    <thead>
                    <tr>
                        <th style="text-align: center"><input type="checkbox" id="all"/></th>
                        <th style="text-align:center;">用户编码</th>
                        <th style="text-align: center">用户名</th>
                        <th style="text-align: center">密码</th>
                        <th style="text-align: center;">权限</th>

                    </tr>
                    </thead>
                    <tbody style="text-align: center">
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td><input name="id" value="${user.id}" type="checkbox"/></td>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.power}</td>
                            <td>

                                <a href="<%=basePath%>/edit?id=${user.id}">
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button>
                                </a>
                                <a href="<%=basePath%>/deleteUser?id=${user.id}">
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                            </td>


                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


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
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toArticleWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/articleMange\" width=\"100%\" height=\"100%\"></object>";
    }

    function toArticleManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/articleMange\" width=\"100%\" height=\"100%\"></object>";
    }

    function toArticleTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleTrash.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>