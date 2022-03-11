<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>电影院订票管理系统-系统公告</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<!--轮播图 start-->
<jsp:include page="banner.jsp"/>
<!--轮播图 end-->


<div class="layui-container layadmin-cmdlist-fluid">

    <form class="layui-form" action="${ctx}/infoList" method="post">
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-inline">
                <div class="layui-input-inline" style="">
                    <input type="text" class="layui-input dateIcon" name="keyword" id="keyword"
                           value="${keyword}"
                           placeholder="请输入搜索关键词"
                           style="width: 240px;">
                </div>
                <%--<div class="layui-input-inline">
                    <select name="type" id="type" class="layui-select">
                        <option value="值1" ${type=='值1'?'selected':''}>值1</option>
                        <option value="值2" ${type=='值2'?'selected':''}>值2</option>
                    </select>
                </div>--%>
                <div class="layui-input-inline">
                    <button type="submit" class="layui-btn layui-btn-blue"><i
                            class="layui-icon layui-icon-search"></i> 搜索
                    </button>
                </div>
            </div>
        </div>

    </form>


    <div class="layui-row layui-col-space30" style="margin-top: 50px;">

        <div class="layui-collapse">

            <c:forEach items="${noticeinfoList}" var="v" varStatus="ss">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">${v.noticetitle} <i class="layui-icon layui-colla-icon"></i></h2>
                    <div class="layui-colla-content layui-show">${v.noticecontent}</div>
                </div>

                <div style="border-bottom: 2px solid #eee;margin-bottom: 30px;"></div>
            </c:forEach>
        </div>

        <div class="layui-col-md12 layui-col-sm12">
            <div id="demo0"></div>
        </div>


    </div>

</div>

<jsp:include page="foot.jsp"/>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>
</body>
</html>
