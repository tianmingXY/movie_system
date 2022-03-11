<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--项目绝对路径--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--获取当前时间--%>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
<html>
<head>
    <title>自习室座位修改页面</title>
    <!-- 引入css样式和js文件-->
    <meta charset="UTF-8">
    <base href="${ctx}/"/>
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css"/>
    <script type="text/javascript" src="${ctx}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script>
        var ctx = '${ctx}/';
    </script>
</head>
<body>
<div class="layui-container">


    <div style="width: 300px;text-align: center;margin: 20px auto;">
        <div>
            <img src="${ctx}/uploads/pay.png" style="width: 100%;"/>
        </div>

        <button type="submit" class="layui-btn layui-btn-fluid layui-btn-danger" lay-submit="demo1"
                lay-filter="demo1">
            我已完成支付 ${movieinfo.price} 元
        </button>
    </div>

</div>
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
            $.post("${ctx}/paySubmit?id=${moviesite.id}", data.field, function (result) {
                if (result.status == 200) {
                    layer.msg('恭喜你，付款成功', {
                        offset: '15px'
                        , icon: 1
                    }, function () {
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.location.reload();//刷新父页面，注意一定要在关闭当前iframe层之前执行刷新
                        parent.layer.close(index); //再执行关闭
                        parent.location.reload(); //刷新父亲对象（用于框架）
                    });
                } else {
                    layer.alert(result.msg);
                }
            }, "JSON");
            return false;
        });

    });
</script>

</body>
</html>
