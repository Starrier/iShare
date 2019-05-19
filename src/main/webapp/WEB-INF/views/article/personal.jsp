<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人主页</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/assert/css/personal/personal.css"/>
    <link href="/assert/css/bootstrap/fonts/font-awesome.min.css">

    <script src="/assert/js/jquery.min.js"></script>
    <script src="/assert/js/skel.min.js"></script>
    <script src="/assert/js/util.js"></script>
    <script src="/assert/js/main.js"></script>
    <script src="/assert/js/personal/modernizr.js"></script>
</head>
<body style="background: rgba(0,0,0,.03) url(/assert/images/bg01.png) repeat;">
<!-- Header -->
<header id="header">
    <div class="inner">
        <a href="home" class="logo">i Share</a>
        <div id="nav">
            <a href="home">首页</a>
            <a href="label">标签</a>
            <a href="elements.html">专栏</a>

            <a href="/write">写文章</a>
            <a href="#">${sessionScope.user.username}</a>
            <a href="outLogin">退出</a>
        </div>
    </div>
</header>
<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

<div class="mainContent">
    <aside>
        <div class="avatar">
            <a href="#"
               style="background-image:url(/assert/images/profile/photo.jpg)"><span>${sessionScope.user.username}</span></a>
        </div>
        <section class="topspaceinfo">
            <h1>执子之手，与子偕老</h1>
            <p>于千万人之中，我遇见了我所遇见的人....</p>
        </section>
        <div class="userinfo">
            <p class="q-fans"> 粉丝：<a href="#">167</a></p>
            <p class="btns"><a href="#">私信</a><a href="#">相册</a><a href="#">存档</a></p>
        </div>
        <section>
            <div class="newpic">
                <h2>最新照片</h2>
                <ul>
                    <li><a href="#"><img src="/assert/images/profile/01.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/02.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/03.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/04.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/05.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/06.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/07.jpg"></a></li>
                    <li><a href="#"><img src="/assert/images/profile/08.jpg"></a></li>
                </ul>
            </div>
        </section>
        <section>
            <div class="taglist">
                <h2>全部标签</h2>
                <ul>
                    <li><a href="#">IT互联网</a></li>
                    <li><a href="#">旅游</a></li>
                    <li><a href="#">美妆</a></li>
                    <li><a href="#">摄影</a></li>
                </ul>
            </div>
        </section>
    </aside>
    <div class="blogitem">
        <c:forEach var="article" items="${articles}" begin="0" step="1">
            <article>
                <h2 class="title"><a href="#">${article.title}</a></h2>
                <ul class="text">
                    <div style="line-height: 1.7;font-size: 16px;">
                            ${article.content}
                    </div>
                </ul>
                <div class="textfoot">
                    <a href="#">阅读全文</a><a href="#">评论</a><a href="#">转载</a>
                </div>
            </article>
        </c:forEach>

        <div class="pages"><span>1</span><a href="#" hidefocus="">2</a><a href="#" hidefocus="">3</a><a href="#"
                                                                                                        class="next">下一页&gt;&gt;</a>
        </div>
    </div>
</div>
<!-- Footer -->
<div id="footer">
    <div class="f">
        <a href="#">关于我们</a>&nbsp;&nbsp;&nbsp; &nbsp;
        <a href="#">加入我们</a>&nbsp;&nbsp;&nbsp; &nbsp;
        <a href="#">联系我们</a>
    </div>
    <p>Copyright @ 2018 <a href="#">i Share </a> 当前呈现版本</p>
</div>
</body>
</html>
