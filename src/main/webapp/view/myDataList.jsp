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
    <title>电影院订票管理系统</title>
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
<jsp:include page="banner.jsp"/>


<div class="layui-container" style="min-height: 500px;">


    <table class="layui-table">
        <tbody>
        <tr class="layui-bg-blue">
            <th>编号</th>
            <th>电影名称</th>
            <th>电影场次</th>
            <th>座位名称</th>
            <th>座位状态</th>
            <th>购票时间</th>
            <th>操作</th>
        </tr>


        <c:forEach items="${datainfoList}" var="v">
            <tr>
                <td>${v.sid}</td>
                <td>${v.name}</td>
                <td>${v.movietime}</td>
                <td>${v.sitename}</td>
                <td>${v.sitestate}</td>
                <td>${v.createtime}</td>
                <td style="width: 180px;">
                    <c:if test="${v.sitestate=='待付款'}">
                        <button path="${ctx}/sure?movieid=${v.mid}&siteid=${v.sid}"
                                class="layui-btn layui-btn-danger layui-btn-sm sureBtn">付款
                        </button>
                    </c:if>
                        <%-- <c:if test="${v.sitestate=='已付款'}">--%>
                    <a href="${ctx}/quxiao?id=${v.sid}" class="layui-btn layui-btn-sm">取消</a>
                        <%-- </c:if>--%>
                    <button path="${ctx}/moviesite/detail?id=${v.sid}"
                            class="layui-btn layui-btn-normal layui-btn-sm showDetail">详情
                    </button>
                </td>
            </tr>
        </c:forEach>


        </tbody>
    </table>


</div>

<!--底部区域 start-->
<jsp:include page="foot.jsp"/>
<!--底部区域 end-->
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    //定义layui的变量
    var userid = "${sessionScope.loginUserinfo.id}"; //用户编号
    var $;
    var layer;
    var element;
    var form;
    layui.use(['element', 'layer', 'jquery', 'form'], function () {
        element = layui.element;
        layer = layui.layer;
        $ = layui.jquery;
        form = layui.form;
        //绑定详情点击事件
        $(".showDetail").click(function () {
            var path = $(this).attr("path");
            layer.open({
                offset: '100px', //设置弹出窗口的位置 上边距100px
                type: 2,  //弹出类型
                skin: 'layui-layer-molv', //样式类名
                title: '数据信息详情查看',
                anim: 2,    //弹出窗口使用的动画
                area: ['800px', '620px'],  //设置弹出窗口的大小 宽度,高度
                shadeClose: true, //开启遮罩关闭
                content: path  //加载内容路径
            });
        })

        //绑定详情点击事件
        $(".sureBtn").click(function () {
            var path = $(this).attr("path");
            layer.open({
                offset: '100px', //设置弹出窗口的位置 上边距100px
                type: 2,  //弹出类型
                skin: 'layui-layer-molv', //样式类名
                title: '购票支付页面',
                anim: 2,    //弹出窗口使用的动画
                area: ['400px', '500px'],  //设置弹出窗口的大小 宽度,高度
                shadeClose: true, //开启遮罩关闭
                content: path  //加载内容路径
            });
        })
    });
</script>

</body>
</html>
