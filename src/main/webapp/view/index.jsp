<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>电影院订票管理系统-系统首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <script>
        var ctx = '${ctx}/';
    </script>
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<!--轮播图 start-->
<jsp:include page="banner.jsp"/>
<!--轮播图 end-->


<div class="layui-container layadmin-cmdlist-fluid">

    <form class="layui-form" action="${ctx}/index" method="post">
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-inline">
                <div class="layui-input-inline" style="">
                    <input type="text" class="layui-input dateIcon" name="keyword" id="keyword"
                           value="${keyword}"
                           placeholder="请输入搜索关键词"
                           style="width: 240px;">
                </div>
                <div class="layui-input-inline">
                    <select name="sorttype" id="sorttype" class="layui-select">
                        <option value="">请选择分类</option>
                        <c:forEach items="${sorttypeList}" var="item">
                            <option value="${item.sortname}" ${item.sortname==sorttype?'selected':''}>${item.sortname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <button type="submit" class="layui-btn layui-btn-blue"><i
                            class="layui-icon layui-icon-search"></i> 搜索
                    </button>
                </div>
            </div>
        </div>

    </form>


    <div class="layui-row layui-col-space30 content">

        <div class="cont w1000">
            <fieldset class="layui-elem-field layui-field-title site-title" style="text-align: center;margin: 10px">
                <legend style="font-size: 30px;">首页信息-展示</legend>
            </fieldset>

            <div class="list-item">
                <c:forEach items="${datainfoList}" var="v">
                    <div class="item" style="border-bottom: 2px dashed #ccc;padding-bottom: 20px;">
                        <div class="layui-fluid">
                            <div class="layui-row">
                                <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                                    <div class="img" style="padding:0px 80px;">
                                        <img style="width: 80%;height: 230px;text-align: center"
                                             src="${v.picurl}" alt="">
                                    </div>
                                </div>
                                <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                                    <div class="item-cont">
                                        <h3 style="margin: 10px;"> ${v.name}
                                            <button class="layui-btn layui-btn-danger new-icon">${v.nums}</button>
                                        </h3>
                                        <h5 style="font-size: 15px;margin: 10px;">发布时间:${v.addtime}</h5>
                                        <p>
                                                ${v.content}
                                        </p>
                                        <a href="${ctx}/detail?id=${v.id}"
                                           class="layui-btn layui-btn-normal"
                                           style="display: inline-block;margin-top: 20px;"><i
                                                class="layui-icon layui-icon-release"></i> 点我查看
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>
        </div>


        <div class="layui-col-md12 layui-col-sm12">
            <div id="demo0"></div>
        </div>
        <%--引入分页代码--%>
        <jsp:include page="sortPage.jsp"></jsp:include>
    </div>


    <style>
        /*鼠标为手型*/
        .tqm-page a, .tqm-page span {
            cursor: pointer;
            padding: 8px 20px;
            font-size: 20px;
        }
    </style>


</div>


<!--底部区域 start-->
<jsp:include page="foot.jsp"/>
<!--底部区域 end-->

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>

<style>
    .content .cont .title {
        margin-bottom: 60px;
    }

    .content .cont .title a {
        font-size: 16px;
        color: #000 !important;
    }

    .content .cont .title .layui-breadcrumb span {
        position: relative;
        top: -1px;
        margin: 0 16px;
    }

    .content .cont .title a.active, .content .cont .title a:hover {
        color: #ff7f21 !important;
    }

    .content .cont .list-item .layui-fluid {
        padding: 0;
    }

    .content .cont .list-item .item {
        margin-bottom: 80px;
        overflow: hidden;
    }

    .content .cont .list-item .item .img img {
        width: 100%;
    }

    .content .cont .list-item .item .item-cont {
        padding-left: 100px;
    }

    .content .cont .list-item .item .item-cont .go-icon {
        width: 33px;
        height: 11px;
        display: block;
        padding: 10px 0;
        margin-top: 16px;
    }

    .content .cont .list-item .item .item-cont h3 {
        font-size: 24px;
        margin: 20px 0;
    }

    .content .cont .list-item .item .item-cont h3 .new-icon {
        width: 36px;
        height: 18px;
        line-height: 18px;
        text-align: center;
        padding: 0;
        margin: -3px 0 0 10px;
    }

    .content .cont .list-item .item .item-cont h5 {
        font-size: 12px;
        color: #ff7f21;
        margin-bottom: 32px;
    }

    .content .cont .list-item .item .item-cont p {
        line-height: 37px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        /* autoprefixer: off */
        -webkit-box-orient: vertical;
        /* autoprefixer: on */
    }
</style>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    var $;
    var layer;
    var element;
    var form;
    layui.use(['element', 'layer', 'jquery', 'form', 'laydate', 'layedit'], function () {
        element = layui.element;
        layer = layui.layer;
        $ = layui.jquery;
        form = layui.form;
        var laydate = layui.laydate;
        $(".showDetail").click(function () {
            var path = $(this).attr("path");
            layer.open({
                offset: '100px', //设置弹出窗口的位置 上边距100px
                type: 2,  //弹出类型
                skin: 'layui-layer-molv', //样式类名
                title: '信息详情查看',
                anim: 2,    //弹出窗口使用的动画
                area: ['800px', '620px'],  //设置弹出窗口的大小 宽度,高度
                shadeClose: true, //开启遮罩关闭
                content: path  //加载内容路径
            });
        })


        //…
    });
</script>
</body>
</html>
