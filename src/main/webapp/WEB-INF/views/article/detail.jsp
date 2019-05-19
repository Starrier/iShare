<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="/assert/css/index/mystyle.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="/assert/css/bootstrap/fonts/font-awesome.min.css">
    <script src="/assert/js/iconfont.js"></script>
    <style type="text/css">
        #detail {

            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .panel {
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid rgba(0, 0, 0, .05);
            box-shadow: 0px 0px 0px 10px rgba(0, 0, 0, 0.03);
            background: #FFFFFF;
        }

        .panel-body {
            padding: 15px;
        }

        .c_titile {
            font-size: 22px;
            margin: 20px 0;
            text-align: center;
            color: #333;
            font-weight: bold;
        }

        .box_c {
            border: #ccc 1px dashed;
            text-align: center;
            padding: 5px 0;
            margin-right: 30px;
            color: #999;
        }

        .box_c span {
            margin: 0 10px;
        }

        ul.infos {
            overflow: hidden;
            margin: 20px 30px 20px 0;
            line-height: 28px;
            font-size: 14px;
            text-indent: 2em;
            color: #666;
        }

        ul {
            list-style: none;
        }

        .panel-body {
            padding: 15px;
        }

        .pinglun textarea {
            padding: 10px 15px;
            width: 100%;
            height: 80px;
            font-size: 13px;
            border: 1px solid #dcdcdc;
            border-radius: 4px;
            background-color: hsla(0, 0%, 71%, .1);
            resize: none;
            display: inline-block;
            vertical-align: top;
            outline-style: none;
        }

        .icon {
            /* 通过设置 font-size 来改变图标大小 */
            width: 3em;
            height: 1.5em;
            /* 图标和文字相邻时，垂直对齐 */
            vertical-align: -0.15em;
            /* 通过设置 color 来改变 SVG 的颜色/fill */
            fill: currentColor;
            /* path 和 stroke 溢出 viewBox 部分在 IE 下会显示
               normalize.css 中也包含这行 */
            overflow: hidden;
        }

        .tool-group {
            font-size: 14px;
            color: #969696;
        }
    </style>
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
            <a>
                <form class="search" action="search" method="post">
                    <input class="sinput" placeholder="搜索标签"/>
                    <span class="sspan"></span>
                </form>
            </a>
            <a href="/write">写文章</a>
            <a href="/personal?value=${sessionScope.user.username}">${sessionScope.user.username}</a>
            <a href="outLogin">退出</a>
        </div>
    </div>
</header>
<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

<!-- content -->
<div id="detail">
    <div class="col-lg-9 col-md-9 w_main_left">
        <div class="panel panel-default">
            <div class="panel-body">
                <h2 class="c_titile"> ${article.title}</h2>
                <p class="box_c"><span class="d_time">发布时间：${article.date}</span><span>作者：<a
                        href="mailto:wfyv@qq.com">${article.author}</a></span><span>阅读（88646）</span></p>
                <ul class="infos">
                    ${article.content}
                </ul>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div>
                    <form class="pinglun" action="comment" method="post">
                        <div style="width: 60px; height: 60px; float:left; border-radius: 50%; border: 3px solid #eee; overflow: hidden;">
                            <img src="/assert/images/life.png" width="80" height="80"/>
                        </div>
                        <div style=" height:60px;  line-height:60px; overflow:hidden;">
                            &nbsp;&nbsp;${sessionScope.user.username}
                        </div>
                        <div>
                            <input type="hidden" name="articleId" value="${article.id}">
                        </div>
                        <textarea name="content" placeholder="写下你的评论..."></textarea>
                        <div style="float: right;height: 50px; margin: 10px;">
                            <input type="submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="pingluncontent" style="margin: 20px;">
                    <div>
                        <div>
                            <div style="padding-bottom: 20px; font-size: 17px; font-weight: 700; border-bottom: 1px solid #f0f0f0;">
                                <span>评论</span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <c:forEach var="comtent" items="${comments}" begin="0" step="1">
                                <div class="author" style="margin: 0px 0px 10px 0px;">
                                    <div style="width: 60px; height: 60px; float:left; border-radius: 50%; border: 3px solid #eee; overflow: hidden;">
                                        <img src="/assert/images/life.png" width="80" height="80"/>
                                    </div>
                                    <div style=" height:60px;  line-height:60px; overflow:hidden;">
                                        &nbsp;&nbsp;${sessionScope.user.username}
                                    </div>
                                </div>
                                <div class="content1" style="margin: 0px 0px 0px 20px;">
                                    <div>
                                            ${comtent.comment}
                                    </div>
                                    <div>
                                            ${comtent.date}
                                    </div>
                                    <hr>
                                </div>
                            </c:forEach>

                        </div>

                    </div>
                </div>
            </div>
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
