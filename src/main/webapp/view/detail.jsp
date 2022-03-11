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
    <title>电影院订票管理系统-详情显示</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/admin.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/layui/style/template.css" media="all">
    <script src="${ctx}/static/layui/layui.js"></script>
    <link rel="shortcut icon" href="${ctx}/static/favicon.png" type="image/x-icon"/>
    <link rel="icon" href="${ctx}/static/favicon.png" type="image/gif">
</head>
<body>
<!--导航条 start-->
<jsp:include page="head.jsp"/>

<!--导航条 end-->

<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title site-title" style="text-align: center;margin: 30px">
        <legend><a name="compatibility">${datainfo.name} 《${datainfo.adduser}》</a></legend>
    </fieldset>

    <div class="layui-row" style="background: #fff;">
        <div style="height: 10px;"></div>
        <div class="layui-elem-quote" style="margin: 20px;">
            <p style="font-size: 18px; ">主演：${datainfo.adduser}</p>
        </div>


        <div class="layui-col-md12" style="text-align: center">
            <div class="contentshow">${datainfo.content}</div>
            <style>
                .contentshow {
                    font-size: 20px;
                    line-height: 2em;
                    text-indent: 2em;
                }
            </style>
        </div>
        <div class="layui-col-md12" style="text-align: center;margin-top: 50px;">
            <img src="${datainfo.picurl}" style="width: 60%;border: 1px solid #cecece;padding: 20px;">
        </div>


        <div class="layui-col-md12">
            <div class="layui-elem-quote" style="margin: 20px;">
                <p style="font-size: 18px; ">请选择购票电影放映时间</p>
            </div>
            <div class="layui-row" style="margin: 0px auto;margin-bottom: 20px;">
                <c:forEach items="${movieinfoList}" var="item" varStatus="ss">
                    <div style="border: 1px solid #ccc;margin:8px;padding: 0px;width:20%;display: inline-block;">
                        <div class="layui-btn layui-btn-lg selectMovie"
                             style="width: 100%;text-align: center;font-size: 30px;"
                             movieid="${item.id}">${item.movietime}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div style="height: 20px;"></div>
        <div class="layui-col-md12" style="border: 2px solid #01AAED;text-align: center;padding: 20px;">
            <h1>电影票座位选择</h1>
            <div id="siteDIV">
                <%--<button movieid="aaa" class="layui-btn">bbb</button>
                <button movieid="aaa" class="layui-btn layui-btn-disabled">bbb</button>--%>
            </div>
            <style>
                #siteDIV button {
                    display: inline-block;
                    margin: 20px;
                    width: 150px;
                }
            </style>
            <div style="text-align: center;">
                <button class="layui-btn layui-btn-lg layui-btn-normal " id="sureBtn">
                    <i class="layui-icon layui-icon-ok"></i>
                    确定选择这个座位
                </button>
            </div>
        </div>


        <div class="layui-col-md12">

            <div class="layui-row">
                <div class="layui-col-md12" style="background: #eee;border-radius:20px; ">
                    <form class="layui-form layui-form-pane" action="${ctx}/commentinfoSubmit" method="post">
                        <input type="hidden" name="tid" value="${datainfo.id}">
                        <input type="hidden" name="username" value="${sessionScope.loginUserinfo.name}">
                        <input type="hidden" name="addtime" value="${nowTime}">
                        <input type="hidden" name="picurl" value="${sessionScope.loginUserinfo.picurl}">
                        <input type="hidden" name="likenum" value="0">
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label" id="commentShow">评论信息显示</label>
                            <div class="layui-input-block">
                                <textarea name="content" placeholder="请输入评论内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <c:if test="${sessionScope.loginUserinfo==null}">
                            <span class="layui-btn layui-btn-fluid">登录以后才可以发布评论</span>
                        </c:if>
                        <c:if test="${sessionScope.loginUserinfo!=null}">
                            <button class="layui-btn layui-btn-fluid layui-btn-danger">点我发布评论内容</button>
                        </c:if>
                    </form>
                </div>


                <div style="margin-top: 30px;">
                    <div class="site-title"
                         style="text-align: center;font-size: 20px;border-left:0px;border-right:0px;border-bottom:0px;   ">
                        <fieldset>
                            <legend>评论内容显示区域</legend>

                            <c:forEach items="${commentinfoList}" var="v">
                                <div class='comment'>
                                    <img src='${v.picurl2}' alt='head pic'/>
                                    <a class="name" href="">${v.username}</a>
                                    <p>${v.content}</p>
                                    <span>${v.addtime}</span>
                                    <a class='up dianzan' href="javascript:void(0);" dataid="${v.id}"><i
                                            class="layui-icon layui-icon-praise"></i> <b
                                            style="font-size: 18px;color: green;">${v.likenum}</b></a>
                                </div>
                            </c:forEach>

                        </fieldset>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<div style="height: 50px;"></div>
<jsp:include page="foot.jsp"/>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    var movieid = ""; //电影编号
    var siteid = ""; //座位编号
    var userid = "${sessionScope.loginUserinfo.id}"; //用户编号
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

        //绑定详情点击事件
        $(".dianzan").click(function () {
            if (userid == "") {
                layer.alert("用户登陆以后才可以点赞");
                return false;
            }
            var dataid = $(this).attr("dataid");
            var likenum = $(this).find("b").text();
            $(this).find("b").text(parseInt(likenum) + 1);
            $.post("${ctx}/commentinfoDianzan", {"id": dataid}, function (result) {
                layer.msg("评论点赞成功");
            });
        })

        //绑定详情点击事件
        $(".selectMovie").click(function () {
            $(".selectMovie").removeClass("layui-btn-danger");
            $(this).addClass("layui-btn-danger");

            movieid = $(this).attr("movieid");
            $("#siteDIV").empty();
            $.post("${ctx}/getMovieSiteListJSON", {"id": movieid}, function (result) {
                var data = result.data;
                for (let i = 0; i < data.length; i++) {
                    var obj = data[i];
                    var str = "";
                    if (obj.sitestate == "0") {
                        str = '<button siteid="aaa" class="layui-btn selectSite">bbb</button>'.replace("aaa", obj.id).replace("bbb", obj.sitename);
                    } else {
                        str = '<button siteid="aaa" class="layui-btn layui-btn-disabled">bbb</button>'.replace("aaa", obj.id).replace("bbb", obj.sitename);
                    }
                    $("#siteDIV").append(str);
                }
            });
        })


        $(document).on('click', '#siteDIV button', function () {
            siteid = $(this).attr("siteid");
            $("#siteDIV button").removeClass("layui-btn-danger");
            $(this).addClass("layui-btn-danger");
            console.log(siteid);
        });


        //绑定详情点击事件
        $("#sureBtn").click(function () {
            if (userid == "") {
                layer.alert("用户登陆以后才可以购票");
                return false;
            }
            if (siteid == "") {
                layer.alert("请选择购票座位");
                return false;
            }
            var path = "${ctx}/sure?movieid=" + movieid + "&siteid=" + siteid;
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

        //…
    });
</script>

<style>
    .comment {
        margin-top: 4%;
        margin-left: 14%;
        padding: 2%;
        width: 68%;
        background-color: #ececec;
        border: 1px dashed #888;
        border-radius: 1em;
        position: relative;
        display: block;
        text-align: left;
    }

    .comment:hover img {
        border-radius: 1em;
        border: 2px solid #888;
    }

    .comment:hover {
        background-color: #eee;
    }

    .comment img {
        position: absolute;
        top: -1%;
        left: -10%;
        border-radius: 2em;
        border: 2px solid #888;
        width: 60px;
        height: 60px;
    }

    .comment p {
        text-indent: 2em;
        margin-top: 0.4%;
    }

    .comment span {
        position: absolute;
        top: 10%;
        right: 4%;
        font-size: 0.9em;
        font-weight: bold;
        color: #444
    }

    .comment .name {
        color: black;
        font-weight: bold;
        text-decoration: none;
    }

    .comment .name:hover {
        text-decoration: underline;
    }

    .comment .up {
        color: #555;
        text-decoration: none;
        position: absolute;
        bottom: 4%;
        right: 8%;
    }

    .comment .up:hover {
        color: #000;
    }
</style>
</body>
</html>
