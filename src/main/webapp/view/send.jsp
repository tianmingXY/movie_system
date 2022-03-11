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

<div class="layui-container">

    <form class="layui-form  layui-form-pane" action="${ctx}/sendSubmit" method="post" style="margin: 50px auto;">

        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="name" value="" lay-verify autocomplete="off"
                       placeholder="请输入名称"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <input type="text" name="content" id="content" value="" lay-verify autocomplete="off"
                       placeholder="请输入内容"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item ">
            <label class="layui-form-label">图片地址</label>
            <div class="layui-input-block">
                <input id="myfile" type="file" name="myfile" style="display: none;"
                       onchange="uploadFileUtil('myfile','picurl')">
                <input type="text" id="picurl" name="picurl" value="" lay-verify="required"
                       placeholder="网路路径或者上传  如果是要上传，请点击后面的上传文件按钮"
                       value="" class="layui-input" style="width: 80%;display: inline-block;"/>
                <span onclick="uploadFileUtilClick('myfile')" class="layui-btn"><i
                        class="layui-icon layui-icon-upload"></i>上传文件</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">浏览量</label>
            <div class="layui-input-block">
                <input type="text" name="nums" id="nums" value="" lay-verify autocomplete="off"
                       placeholder="请输入浏览量"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">视频分类</label>
            <div class="layui-input-block">
                <select name="sorttype" id="sorttype" class="layui-select">
                    <option value="">请选择分类</option>
                    <c:forEach items="${sorttypeList}" var="item">
                        <option value="${item.sortname}">${item.sortname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">影片主演</label>
            <div class="layui-input-block">
                <input type="text" name="adduser" id="adduser" value="" lay-verify autocomplete="off"
                       placeholder="请输入影片主演"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="intro" id="intro" value="" lay-verify autocomplete="off"
                       placeholder="请输入备注"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">添加时间</label>
            <div class="layui-input-block">
                <input type="text" name="addtime" id="addtime" value="${nowTime}" lay-verify autocomplete="off"
                       placeholder="请输入添加时间"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="demo1" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

</div>

<!--底部区域 start-->
<jsp:include page="foot.jsp"/>
<!--底部区域 end-->
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    //定义layui的变量
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
        var layedit = layui.layedit;

        //监听提交
        form.on('submit(demo1)', function (data) {
            console.log(JSON.stringify(data.field));
            return true;
        });

    });
</script>

</body>
</html>
